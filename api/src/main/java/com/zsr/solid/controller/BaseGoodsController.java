package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.BaseGoods;
import com.zsr.solid.service.BaseGoodsBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("base/goods")
public class BaseGoodsController {

    @Autowired
    private BaseGoodsBusiness baseGoodsBusinessImpl;

    @RequestMapping("querySupplierList")
    @ResponseBody
    public String querySupplierList(BaseGoods baseGoods){
        return JSON.toJSONString(baseGoodsBusinessImpl.querySupplierList(baseGoods));
    }

    @RequestMapping("operate")
    @ResponseBody
    public String operate(BaseGoods baseGoods) {
        return baseGoodsBusinessImpl.operate(baseGoods);
    }

    @RequestMapping("editSupplier")
    @ResponseBody
    public String editSupplier(BaseGoods baseGoods){
        return baseGoodsBusinessImpl.editSupplier(baseGoods);
    }

     @RequestMapping("delete")
     @ResponseBody
    public String delete(String password,String ids){
        return baseGoodsBusinessImpl.delete(password,ids);
    }

}
