package com.zsr.solid.service;

import com.zsr.solid.entity.Journal;
import com.zsr.solid.entity.ResponseTable;

public interface JournalBusiness {
    ResponseTable querySupplierList(Journal journal);     //查询
}
