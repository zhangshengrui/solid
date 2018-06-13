package com.zsr.solid.mapper;

import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.Journal;

import java.util.List;

public interface JournalDao {
    List<BaseSupplier> querySupplierList(Journal journal);        //查询
}
