package com.zsr.solid.mapper;

import com.zsr.solid.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminUserDao {
    List<User> querySupplierList(User user);                //查询
    Integer operate(User user);                             //更改状态
    Integer querySupplierListByName(String name);           //判断是否重复
    Integer addSupplier(User user);                         //新增供货商
    Integer editSupplier(User user);                        //修改供货商
    Integer delete(@Param("idstr") String idstr) ;          //批量删除
    Integer reset(String password,String id) ;              //重置密码
}
