package com.zsr.solid.service;

import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.ResponseTable;

public interface BaseSupplierBusiness {
    ResponseTable querySupplierList(BaseSupplier baseSupplier);     //查询
    String operate(BaseSupplier baseSupplier);                      //更改状态
    String editSupplier(BaseSupplier baseSupplier);                  //新增修改
}
