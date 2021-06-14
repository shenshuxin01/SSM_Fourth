package ssx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssx.dao.IDaoC;

@Service
public class ServiceC {
    @Autowired
    IDaoC iDaoC;

    public String queryOneuser(String where,String result){
        String s = iDaoC.queryOneuser(where );
        return s;
    }
    public String queryOnepw(String where,String result){
        String s = iDaoC.queryOnepw(where );
        return s;
    }

    public boolean addUser(String name,String emailname,String emailpd){
        boolean b = iDaoC.addUser(name, emailname, emailpd);
        return b;
    }
}
