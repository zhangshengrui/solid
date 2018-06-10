package com.zsr.solid.service.impl;

import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.BaseSupplierDao;
import com.zsr.solid.service.BaseSupplierBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
            responseTable.setData(new ArrayList());
            responseTable.setRecordsFiltered(0);
            responseTable.setRecordsTotal(0);
            return responseTable;
        }
    }
}
