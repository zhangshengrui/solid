package com.zsr.solid.mapper;

import com.zsr.solid.entity.BaseReceiver;
import com.zsr.solid.entity.BaseSupplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseReceiverDao {
    List<BaseSupplier> querySupplierList(BaseReceiver baseReceiver);        //查询
    Integer operate(BaseReceiver baseReceiver);                             //更改状态
    Integer querySupplierListByName(String name);                           //判断是否重复
    Integer addSupplier(BaseReceiver baseReceiver);                         //新增供货商
    Integer editSupplier(BaseReceiver baseReceiver);                        //修改供货商
    Integer delete(@Param("idstr") String idstr) ;                           //批量删除
}
