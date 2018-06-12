package com.zsr.solid.service;

import com.zsr.solid.entity.Password;
import com.zsr.solid.entity.ResponseTable;

public interface PasswordBusiness {
    ResponseTable querySupplierList(Password password);     //查询
    String reset(String id);     //查询
}
