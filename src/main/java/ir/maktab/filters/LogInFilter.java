/*
package ir.maktab.filters;


import ir.maktab.domains.Account;
import ir.maktab.service.AccountService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

public class LogInFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountService accountService = new AccountService();
        Account account = accountService.getAccount(username,password).get(0);
        if (account != null){
            request.setAttribute("account",account);
            chain.doFilter(request,response);
        }
    }
}
*/
