package com.zsr.solid.service.impl;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.BaseFleet;
import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.BaseFleetDao;
import com.zsr.solid.service.BaseFleetBusiness;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BaseFleetBusinessImpl implements BaseFleetBusiness {
    @Autowired
    private BaseFleetDao baseFleetDao;

    @Override
    public ResponseTable querySupplierList(BaseFleet baseFleet) {
        ResponseTable responseTable = new ResponseTable();
        try {
            List<BaseSupplier> list = baseFleetDao.querySupplierList(baseFleet);
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
    public String operate(BaseFleet baseFleet) {
        String message = "false";
        try {
            if(baseFleet.getId() == null  || baseFleet.getStatus() == null ){
                return message;
            }
            Integer i = baseFleetDao.operate(baseFleet);
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
    public String editSupplier(BaseFleet baseFleet) {
        try {
            if(baseFleet.getId() == null){
                    return "false";
            }
            String result;
            if(baseFleet.getId() == -1){ //新增
               Integer count =  baseFleetDao.querySupplierListByName(baseFleet.getLicense()); //判断是否有重复的
               if(count> 0){
                   return "repeat";
               }
               baseFleet.setIndate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
               result = baseFleetDao.addSupplier(baseFleet)>0?"新增":"false";
            } else{//修改
               result = baseFleetDao.editSupplier(baseFleet)>0?"修改":"false";
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
            return baseFleetDao.delete(idstr)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

}
