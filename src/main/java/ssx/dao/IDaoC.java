package ssx.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface IDaoC {

    @Select("select user_name from ssm_user where user_email = #{where}")
    String queryOneuser(@Param("where")String where);

    @Select("select user_password from ssm_user where user_email = #{where}")
    String queryOnepw(@Param("where")String where);

    @Insert("insert into ssm_user(seq_no,user_name,user_password,user_email) values(4,#{name},#{emailpd},#{emailname} ) ")
    boolean addUser(@Param("name")String name,@Param("emailname")String emailname,@Param("emailpd")String emailpd);
}
