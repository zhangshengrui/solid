package com.zsr.solid.service.impl;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.BaseReceiver;
import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.BaseReceiverDao;
import com.zsr.solid.mapper.PasswordDao;
import com.zsr.solid.service.BaseReceiverBusiness;
import com.zsr.solid.util.MD5;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BaseReceiverBusinessImpl implements BaseReceiverBusiness{
    @Autowired
    private BaseReceiverDao baseReceiverDao;

    @Autowired
    private PasswordDao passwordDao;

    @Override
    public ResponseTable querySupplierList(BaseReceiver baseReceiver) {
        ResponseTable responseTable = new ResponseTable();
        try {
            List<BaseSupplier> list = baseReceiverDao.querySupplierList(baseReceiver);
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
    public String operate(BaseReceiver baseReceiver) {
        String message = "false";
        try {
            if(baseReceiver.getId() == null  || baseReceiver.getStatus() == null ){
                return message;
            }
            Integer i = baseReceiverDao.operate(baseReceiver);
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
    public String editSupplier(BaseReceiver baseReceiver) {
        try {
            if(baseReceiver.getId() == null){
                    return "false";
            }
            baseReceiver.setPrice(new Float(baseReceiver.getPrice()).toString());
            baseReceiver.setConversion(new Float(baseReceiver.getConversion()).toString());
            String result;
            if(baseReceiver.getId() == -1){ //新增
               Integer count =  baseReceiverDao.querySupplierListByName(baseReceiver.getSupplierName()); //判断是否有重复的
               if(count> 0){
                   return "repeat";
               }
               baseReceiver.setIndate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
               result = baseReceiverDao.addSupplier(baseReceiver)>0?"新增":"false";
            } else{//修改
               result = baseReceiverDao.editSupplier(baseReceiver)>0?"修改":"false";
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
            String pwd = passwordDao.queryPasswordById(4);//收货方
            if(!pwd.equals(MD5.stringToMD5(password))){
                return "wrong";
            }
            if(!ids.contains("[") && !ids.contains("]")){
                    ids = "[" + ids + "]";
            }
            List<Integer> list = JSON.parseObject(ids,new ArrayList().getClass());
            String idstr = "( "+StringUtils.join(list,",")+" )";
            return baseReceiverDao.delete(idstr)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

}
