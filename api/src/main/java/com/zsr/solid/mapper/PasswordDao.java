package com.zsr.solid.mapper;

import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.Password;

import java.util.List;

public interface PasswordDao {
    List<BaseSupplier> querySupplierList(Password password);        //查询
    Integer reset(String md5,String id);        //重置密码
}
