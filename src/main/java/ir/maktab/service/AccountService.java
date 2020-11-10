package ir.maktab.service;

import ir.maktab.domains.Account;
import ir.maktab.repository.impl.AccountRepositoryImpl;

import java.util.List;

public class AccountService {

    AccountRepositoryImpl accountRepository = AccountRepositoryImpl.getInstance();

    public Account generateAccount(Account account) {
        return accountRepository.save(account);
    }

    public Account updateAccount(Account account){
       return accountRepository.update(account);
    }

    public List<Account> getAccount(String username, String password) {
        return accountRepository.getAccount(username, password);
    }

    public List<Account> getAccountByUsername(String username) {
        return accountRepository.getAccountByUsername(username);
    }


}
