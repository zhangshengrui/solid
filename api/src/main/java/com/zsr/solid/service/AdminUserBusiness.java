package com.zsr.solid.service;

import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.entity.User;

public interface AdminUserBusiness {
    ResponseTable querySupplierList(User user);     //查询
    String operate(User user);                      //更改状态
    String editSupplier(User user);                 //新增修改
    String delete(String password, String ids);      //删除ID
    String reset(String password, String ids);      //重置密码
    String changeOld(String old,String password,String userId);//修改密码
}
