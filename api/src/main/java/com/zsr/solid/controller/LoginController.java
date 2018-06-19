package com.zsr.solid.controller;

import com.zsr.solid.entity.User;
import com.zsr.solid.mapper.AdminUserDao;
import com.zsr.solid.util.CookieUtils;
import com.zsr.solid.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private AdminUserDao adminUserDao;

    public static final int COOKIE_TIME = 60*60*24;

    @RequestMapping("/index")
    public boolean login(HttpServletRequest request, HttpServletResponse response, User user) throws Exception{

        user.setPassword(MD5.stringToMD5(user.getPassword()));
        User realUser = this.adminUserDao.login(user);

        if (null != realUser) {
            HttpSession session = request.getSession();
            session.setAttribute("user", realUser);
            CookieUtils.setCookie(response, "userId", realUser.getId()+"", COOKIE_TIME);
            return true;
        }
        return false;
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
        return "redirect:/";
    }
}
