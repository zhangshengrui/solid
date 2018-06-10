package com.zsr.solid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Index {

    @RequestMapping("/login")
    public String home(){
        return "index";
    }
}
