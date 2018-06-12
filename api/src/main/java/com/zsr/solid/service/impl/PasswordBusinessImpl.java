package com.zsr.solid.service.impl;

import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.Password;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.PasswordDao;
import com.zsr.solid.service.PasswordBusiness;
import com.zsr.solid.util.MD5;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class PasswordBusinessImpl implements PasswordBusiness{
    @Autowired
    private PasswordDao passwordDao;

    @Override
    public ResponseTable querySupplierList(Password password) {
        ResponseTable responseTable = new ResponseTable();
        try {
            List<BaseSupplier> list = passwordDao.querySupplierList(password);
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
    public String reset(String ids) {
        try {
            if(StringUtils.isBlank(ids)){
                return  "id is null";
            }
            String md5 = MD5.stringToMD5("admin");
            return passwordDao.reset(md5,ids)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }


}
