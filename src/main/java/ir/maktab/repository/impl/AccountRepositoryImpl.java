package ir.maktab.repository.impl;

import ir.maktab.domains.Account;
import ir.maktab.repository.base.BaseRepository;

import java.util.List;

public class AccountRepositoryImpl extends BaseRepository<Account, Long> {

    private static AccountRepositoryImpl accountRepository;

    public static AccountRepositoryImpl getInstance() {
        if (accountRepository == null) accountRepository = new AccountRepositoryImpl();
        return accountRepository;
    }

    public List<Account> getAccountByUsername(String username){
        return entityManager
                .createQuery("from Account where username=:username",getEntityClass())
                .setParameter("username",username)
                .getResultList();
    }

    public List<Account> getAccount(String username, String passeord) {
        return entityManager
                .createQuery("from Account where username=:username and password=:password", getEntityClass())
                .setParameter("username", username)
                .setParameter("password", passeord)
                .getResultList();
    }

    @Override
    protected Class<Account> getEntityClass() {
        return Account.class;
    }


    public Account save(Account account) {
        return super.save(account);
    }
}
