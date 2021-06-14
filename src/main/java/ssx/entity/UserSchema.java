package ssx.entity;


import com.fasterxml.jackson.annotation.JsonProperty;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.beans.factory.annotation.Value;

import java.io.Serializable;


//{"message":"jj","nghideVar":true,"showVar":"","userId":"1"}
public class UserSchema implements Serializable {

    @JsonProperty("userId")
     private String userId;

    @JsonProperty("message")
     private String bei;

    @Value("999")
     private int seq;

    public UserSchema(String userId, String bei) {
        this.userId = userId;
        this.bei = bei;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public UserSchema(String userId, String bei, int seq) {
        this.userId = userId;
        this.bei = bei;
        this.seq = seq;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBei() {
        return bei;
    }

    public void setBei(String bei) {
        this.bei = bei;
    }

    public UserSchema() {
    }
}
