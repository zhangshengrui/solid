package com.zsr.solid.mapper;

import com.zsr.solid.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    List<Order> querySupplierList(Order order);        //查询
    Integer operate(Order order);                             //更改状态
    Integer querySupplierListByName(String name);                           //判断是否重复
    Integer addSupplier(Order order);                         //新增供货商
    Integer editSupplier(Order order);                        //修改供货商
    Integer delete(@Param("idstr") String idstr) ;                           //批量删除

    Integer queryCount(String startTime,String endTime);      //查询订单数
    List<Order> today(String startTime,String endTime);       //查询今日订单
}
