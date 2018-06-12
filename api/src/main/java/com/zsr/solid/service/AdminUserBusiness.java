package com.zsr.solid.service;

import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.entity.User;

public interface AdminUserBusiness {
    ResponseTable querySupplierList(User user);     //查询
    String operate(User user);                      //更改状态
    String editSupplier(User user);                 //新增修改
    String delete(String password, String ids);      //删除ID
}
