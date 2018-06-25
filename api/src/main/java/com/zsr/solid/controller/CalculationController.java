package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.Calculation;
import com.zsr.solid.service.CalculationBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("calculation")
public class CalculationController {

    @Autowired
    private CalculationBusiness calculationBusinessImpl;

    @RequestMapping("/index")
    public String index() {
        return "calculation";
    }

    @RequestMapping("queryCalculationList")
    @ResponseBody
    public String queryCalculationList(Calculation calculation){
        return JSON.toJSONString(calculationBusinessImpl.queryCalculationList(calculation));
    }

}
