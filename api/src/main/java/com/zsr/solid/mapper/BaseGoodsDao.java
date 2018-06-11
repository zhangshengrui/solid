package com.zsr.solid.mapper;

import com.zsr.solid.entity.BaseGoods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseGoodsDao {
    List<BaseGoods> querySupplierList(BaseGoods baseGoods);        //查询
    Integer operate(BaseGoods baseGoods);                             //更改状态
    Integer querySupplierListByName(String name);                           //判断是否重复
    Integer addSupplier(BaseGoods baseGoods);                         //新增供货商
    Integer editSupplier(BaseGoods baseGoods);                        //修改供货商
    Integer delete(@Param("idstr") String idstr) ;                           //批量删除
}
