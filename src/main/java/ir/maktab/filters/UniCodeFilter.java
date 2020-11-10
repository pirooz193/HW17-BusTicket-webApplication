package ir.maktab.filters;

import javax.servlet.*;
import java.io.IOException;

public class UniCodeFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("inside filterConfig");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        System.out.println("inside doFilter");
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }
}
