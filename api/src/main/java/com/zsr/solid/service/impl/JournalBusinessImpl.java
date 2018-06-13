package com.zsr.solid.service.impl;

import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.Journal;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.JournalDao;
import com.zsr.solid.service.JournalBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class JournalBusinessImpl implements JournalBusiness{
    @Autowired
    private JournalDao journalDao;

    @Override
    public ResponseTable querySupplierList(Journal journal) {
        ResponseTable responseTable = new ResponseTable();
        try {
            List<BaseSupplier> list = journalDao.querySupplierList(journal);
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

}
