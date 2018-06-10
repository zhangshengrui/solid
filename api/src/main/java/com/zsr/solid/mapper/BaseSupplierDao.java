package com.zsr.solid.mapper;

import com.zsr.solid.entity.BaseSupplier;

import java.util.List;

public interface BaseSupplierDao {
    List<BaseSupplier> querySupplierList(BaseSupplier baseSupplier);
}
