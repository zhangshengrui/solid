package com.zsr.solid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("base")
public class BaseInfoController {

    @RequestMapping("base-supplier")
    public String supplier(){
        return "base-supplier";
    }

    @RequestMapping("base-goods")
    public String goods(){
        return "base-goods";
    }

    @RequestMapping("base-fleet")
    public String fleet(){
        return "base-fleet";
    }

    @RequestMapping("base-receive")
    public String receive(){
        return "base-receive";
    }
}
