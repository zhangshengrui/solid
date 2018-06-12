package com.zsr.solid.service.impl;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.BaseGoods;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.BaseGoodsDao;
import com.zsr.solid.service.BaseGoodsBusiness;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BaseGoodsBusinessImpl implements BaseGoodsBusiness{

    @Autowired
    private BaseGoodsDao baseGoodsDao;

    @Override
    public ResponseTable querySupplierList(BaseGoods baseGoods) {
        ResponseTable responseTable = new ResponseTable();
        try {
            List<BaseGoods> list = baseGoodsDao.querySupplierList(baseGoods);
            responseTable.setData(list);
            responseTable.setRecordsFiltered(list.size());
            responseTable.setRecordsTotal(list.size());
            return responseTable;
        }catch (Exception e){
            e.printStackTrace();
            responseTable.setData(new ArrayList());
            responseTable.setRecordsFiltered(0);
            responseTable.setRecordsTotal(0);
            return responseTable;
        }
    }

    @Override
    @Transactional
    public String operate(BaseGoods baseGoods) {
        String message = "false";
        try {
            if(baseGoods.getId() == null  || baseGoods.getStatus() == null ){
                return message;
            }
            Integer i = baseGoodsDao.operate(baseGoods);
            if(i > 0){
                message = "success";
            }
            return  message;
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

    @Override
    @Transactional
    public String editSupplier(BaseGoods baseGoods) {
        try {
            if(baseGoods.getId() == null){
                    return "false";
            }
            baseGoods.setPrice(new Float(baseGoods.getPrice()).toString());
            String result;
            if(baseGoods.getId() == -1){ //新增
               baseGoods.setIndate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
               result = baseGoodsDao.addSupplier(baseGoods)>0?"新增":"false";
            } else{//修改
               result = baseGoodsDao.editSupplier(baseGoods)>0?"修改":"false";
            }
            return result;
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

    @Override
    @Transactional
    public String delete(String password, String ids) {
        try {
            if(StringUtils.isBlank(password)||StringUtils.isBlank(ids)){
                return  "password or ids is null";
            }
            if(!"123456".equals(password)){
                return "wrong";
            }
            if(!ids.contains("[") && !ids.contains("]")){
                    ids = "[" + ids + "]";
            }
            List<Integer> list = JSON.parseObject(ids,new ArrayList().getClass());
            String idstr = "( "+StringUtils.join(list,",")+" )";
            return baseGoodsDao.delete(idstr)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }


}
