package com.zsr.solid.controller;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration
public class Hello {

    @RequestMapping("/")
    public String home(){
        return "hello world!!";
    }


}
