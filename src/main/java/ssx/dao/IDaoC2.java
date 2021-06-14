package ssx.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import ssx.entity.UserSchema;

import java.util.List;
import java.util.Map;

@Repository
public interface IDaoC2 {

    @Select("select max(seq) from ssm_bei where user_email = #{where}")
    int queryMaxSeq(@Param("where") String where);

    @Select("select user_email userId,bei_info bei,seq from ssm_bei where user_email = #{where} order by seq desc  ")
    List<UserSchema> queryAll(@Param("where") String where);

//INSERT INTO `demo`.`ssm_bei`(`user_email`, `bei_info`, `seq`) VALUES ('1', 'sadfbdvfb', 1)
    @Insert("insert into ssm_bei(`user_email`, `bei_info`, `seq`)" +
            " values(#{userEmail},#{bei},#{seq} ) ")
    boolean addBei(@Param("userEmail") String userEmail, @Param("bei") String bei, @Param("seq") int seq);
}
