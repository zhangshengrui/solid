package com.zsr.solid.service;

import com.zsr.solid.entity.Order;
import com.zsr.solid.entity.ResponseTable;

public interface OrderBusiness {
    ResponseTable querySupplierList(Order order);     //查询
    String operate(Order order);                      //更改状态
    String editSupplier(String name,Order order);                 //新增修改
    String delete(String name,String password, String ids);                      //删除ID
}
