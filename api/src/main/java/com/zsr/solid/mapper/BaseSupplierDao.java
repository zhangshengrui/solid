package com.zsr.solid.mapper;

import com.zsr.solid.entity.BaseSupplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseSupplierDao {
    List<BaseSupplier> querySupplierList(BaseSupplier baseSupplier);        //查询
    Integer operate(BaseSupplier baseSupplier);                             //更改状态
    Integer querySupplierListByName(String name);                           //判断是否重复
    Integer addSupplier(BaseSupplier baseSupplier);                         //新增供货商
    Integer editSupplier(BaseSupplier baseSupplier);                        //修改供货商
    Integer delete(@Param("idstr")String idstr) ;                           //批量删除
}
