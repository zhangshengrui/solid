package com.zsr.solid.service;

import com.zsr.solid.entity.BaseGoods;
import com.zsr.solid.entity.ResponseTable;

public interface BaseGoodsBusiness {
    ResponseTable querySupplierList(BaseGoods baseGoods);     //查询
    String operate(BaseGoods baseGoods);                      //更改状态
    String editSupplier(BaseGoods baseGoods);                 //新增修改
    String delete(String password, String ids);                      //删除ID
}
