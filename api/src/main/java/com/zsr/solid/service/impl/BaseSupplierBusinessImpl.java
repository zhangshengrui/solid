package com.zsr.solid.service.impl;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.BaseSupplierDao;
import com.zsr.solid.mapper.PasswordDao;
import com.zsr.solid.service.BaseSupplierBusiness;
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
public class BaseSupplierBusinessImpl implements BaseSupplierBusiness{
    @Autowired
    private BaseSupplierDao baseSupplierDao;

    @Autowired
    private PasswordDao passwordDao;

    @Override
    public ResponseTable querySupplierList(BaseSupplier baseSupplier) {
        ResponseTable responseTable = new ResponseTable();
        try {
            List<BaseSupplier> list = baseSupplierDao.querySupplierList(baseSupplier);
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
    public String operate(BaseSupplier baseSupplier) {
        String message = "false";
        try {
            if(baseSupplier.getId() == null  || baseSupplier.getStatus() == null ){
                return message;
            }
            Integer i = baseSupplierDao.operate(baseSupplier);
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
    public String editSupplier(BaseSupplier baseSupplier) {
        try {
            if(baseSupplier.getId() == null){
                    return "false";
            }
            baseSupplier.setConversion(new Double(baseSupplier.getConversion()).toString());
            baseSupplier.setTonnage(new Double(baseSupplier.getTonnage()).toString());
            String result;
            if(baseSupplier.getId() == -1){ //新增
               Integer count =  baseSupplierDao.querySupplierListByName(baseSupplier.getSupplierName()); //判断是否有重复的
               if(count> 0){
                   return "repeat";
               }
               baseSupplier.setIndate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
               result = baseSupplierDao.addSupplier(baseSupplier)>0?"新增":"false";
            } else{//修改
               result = baseSupplierDao.editSupplier(baseSupplier)>0?"修改":"false";
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
            String pwd = passwordDao.queryPasswordById(1);//供货商
            if(!pwd.equals(MD5.stringToMD5(password))){
                return "wrong";
            }
            if(!ids.contains("[") && !ids.contains("]")){
                    ids = "[" + ids + "]";
            }
            List<Integer> list = JSON.parseObject(ids,new ArrayList().getClass());
            String idstr = "( "+StringUtils.join(list,",")+" )";
            return baseSupplierDao.delete(idstr)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

}
