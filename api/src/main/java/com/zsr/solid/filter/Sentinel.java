package com.zsr.solid.filter;


import org.springframework.stereotype.Component;

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

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String path = req.getContextPath();
        String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path;
        HttpSession session = req.getSession(true);
        String username = (String) session.getAttribute("username");
        //if (username == null || "".equals(username)) {
        //    resp.setHeader("Cache-Control", "no-store");
        //    resp.setDateHeader("Expires", 0);
        //    resp.setHeader("Prama", "no-cache");
        //    //此处设置了访问静态资源类
        //    resp.sendRedirect(basePath+"/index.html");
        //} else {
        //    // Filter 只是链式处理，请求依然转发到目的地址。
        //    filterChain.doFilter(req, resp);
        //}
        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {

    }
}
