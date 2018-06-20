package com.zsr.solid.filter;


import com.zsr.solid.entity.User;
import com.zsr.solid.mapper.AdminUserDao;
import com.zsr.solid.util.CookieUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.FilterConfig;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@Component
@WebFilter(urlPatterns = "/*",filterName = "loginFilter")
public class Sentinel  implements Filter {

    private AdminUserDao adminUserDao;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext servletContext = filterConfig.getServletContext();
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
        this.adminUserDao = (AdminUserDao) webApplicationContext.getBean("adminUserDao");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //类型转换
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        //获取全部路径
        String path = req.getContextPath();
        String uri = req.getRequestURI();
        String basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + path + "/";


        if(uri.equals("/")||uri.equals("hello")||uri.indexOf("login") >= 0||uri.indexOf("logout") >= 0||uri.indexOf("404") >=0){ //首页和hello
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        if(uri.endsWith(".css")||uri.endsWith(".js")||uri.endsWith("png")||uri.endsWith("ico")||uri.endsWith(".woff")||uri.endsWith("ttf")){
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        //记录session
        HttpSession session = req.getSession();
        session.setMaxInactiveInterval(60*60*5);

        User user = (User) session.getAttribute("user");
        if (user == null || "".equals(user)) {
            //如果session没有user,在cookie中查找用户
            String userId = CookieUtils.getCookie(req, "userId");
            if(StringUtils.isNotBlank(userId)){
                user = this.adminUserDao.queryUserByName(userId);
                if(user != null){
                    filterChain.doFilter(req, resp);
                    return;
                }
            }
            //没有登录 直接返回首页
            resp.sendRedirect("login.jsp");
            return;
        } else {
            filterChain.doFilter(req, resp);
            return;
        }
    }

    @Override
    public void destroy() {

    }
}
