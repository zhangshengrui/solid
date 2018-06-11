package com.zsr.solid.mapper;

import com.zsr.solid.entity.BaseFleet;
import com.zsr.solid.entity.BaseSupplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseFleetDao {
    List<BaseSupplier> querySupplierList(BaseFleet baseFleet);        //查询
    Integer operate(BaseFleet baseFleet);                             //更改状态
    Integer querySupplierListByName(String name);                           //判断是否重复
    Integer addSupplier(BaseFleet baseFleet);                         //新增供货商
    Integer editSupplier(BaseFleet baseFleet);                        //修改供货商
    Integer delete(@Param("idstr") String idstr) ;                           //批量删除
}
