package ssx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssx.dao.IDaoC2;
import ssx.entity.UserSchema;

@Service
public class ServiceC2 {
    @Autowired
    IDaoC2 iDaoC2;

    public int queryMaxSeq(String where){
        int s = iDaoC2.queryMaxSeq(where);
        return s;
    }


    public boolean addBei(String userEmael,String bei,int seq){
        boolean b = iDaoC2.addBei(userEmael, bei, seq);
        return b;
    }

    public boolean addBei(UserSchema userSchema){
        boolean b = iDaoC2.addBei(userSchema.getUserId(), userSchema.getBei(), userSchema.getSeq());
        return b;
    }
}
