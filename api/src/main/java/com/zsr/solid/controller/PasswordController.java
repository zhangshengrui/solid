package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.Password;
import com.zsr.solid.service.PasswordBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("password")
public class PasswordController {
    @Autowired
    private PasswordBusiness passwordBusinessImpl;

    @RequestMapping("/index")
    public String index() {
        return "password";
    }


    @RequestMapping("querySupplierList")
    @ResponseBody
    public String querySupplierList(Password password){
        return JSON.toJSONString(passwordBusinessImpl.querySupplierList(password));
    }

    @RequestMapping("reset")
    @ResponseBody
    public String reset(String id) {
        return passwordBusinessImpl.reset(id);
    }

    @RequestMapping("update")
    @ResponseBody
    public String update(Password p) {
        return passwordBusinessImpl.update(p);
    }

}
