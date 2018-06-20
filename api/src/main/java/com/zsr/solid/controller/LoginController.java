package com.zsr.solid.controller;

import com.zsr.solid.entity.User;
import com.zsr.solid.mapper.AdminUserDao;
import com.zsr.solid.util.CookieUtils;
import com.zsr.solid.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private AdminUserDao adminUserDao;

    public static final int COOKIE_TIME = 60*60*24;

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, User user) throws Exception{
        try {

            user.setPassword(MD5.stringToMD5(user.getPassword()));
            User realUser = this.adminUserDao.login(user);
            HttpSession session = request.getSession();

            if (null != realUser) {
                session.setAttribute("auth","");
                session.setAttribute("user", realUser);

                String role;
                if(realUser.getRole() == 1){
                    role = "订单管理员";
                }else if(realUser.getRole() == 2){
                    role = "超级管理员";
                }else{
                    role = "基本信息管理员";
                }
                session.setAttribute("role",role);
                session.setAttribute("account",realUser.getAccount());
                session.setAttribute("name",realUser.getName());
                CookieUtils.setCookie(response, "userId", realUser.getId()+"", COOKIE_TIME);
                CookieUtils.setCookie(response, "role", role, COOKIE_TIME);
                CookieUtils.setCookie(response, "account", realUser.getAccount(), COOKIE_TIME);
                CookieUtils.setCookie(response, "name", realUser.getName(), COOKIE_TIME);

                if(realUser.getRole() == 1){
                    return "index2";
                }else if(realUser.getRole() == 2){
                    return "index";
                }else{
                    return "index1";
                }
            }

            session.setAttribute("auth","wrong");
            return "login";
        }catch (Exception e){
            e.printStackTrace();
            return "404";
        }

    }

    /**
     * 登出
     * @param request
     * @param response
     * @param user
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, User user) {
        //清session，清cookies
        request.getSession().invalidate();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setPath("/");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        return "login";
    }
}
