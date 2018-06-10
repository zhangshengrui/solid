package com.zsr.solid.service.impl;

import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.BaseSupplierDao;
import com.zsr.solid.service.BaseSupplierBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BaseSupplierBusinessImpl implements BaseSupplierBusiness{
    @Autowired
    private BaseSupplierDao baseSupplierDao;

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
    public String editSupplier(BaseSupplier baseSupplier) {
        try {
            if(baseSupplier.getId() == null){
                    return "false";
            }
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
}
