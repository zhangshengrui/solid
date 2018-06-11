package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.BaseFleet;
import com.zsr.solid.service.BaseFleetBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("base/fleet")
public class BaseFleetController {
    @Autowired
    private BaseFleetBusiness baseFleetBusiness;

    @RequestMapping("querySupplierList")
    public String querySupplierList(BaseFleet baseFleet){
        return JSON.toJSONString(baseFleetBusiness.querySupplierList(baseFleet));
    }

    @RequestMapping("operate")
    public String operate(BaseFleet baseFleet) {
        return baseFleetBusiness.operate(baseFleet);
    }

    @RequestMapping("editSupplier")
    public String editSupplier(BaseFleet baseFleet){
        return baseFleetBusiness.editSupplier(baseFleet);
    }

     @RequestMapping("delete")
    public String delete(String password,String ids){
        return baseFleetBusiness.delete(password,ids);
    }
}
