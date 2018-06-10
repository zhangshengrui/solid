package com.zsr.solid.service;

import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.ResponseTable;

public interface BaseSupplierBusiness {
    ResponseTable querySupplierList(BaseSupplier baseSupplier);
}
