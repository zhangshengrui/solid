package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.service.BaseSupplierBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("base")
public class BaseSupplierController {
    @Autowired
    private BaseSupplierBusiness baseSupplierBusinessImpl;

    @RequestMapping("querySupplierList")
    public String querySupplierList(BaseSupplier baseSupplier){
        return JSON.toJSONString(baseSupplierBusinessImpl.querySupplierList(baseSupplier));
    }

}
