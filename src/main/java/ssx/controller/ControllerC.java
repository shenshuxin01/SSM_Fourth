package ssx.controller;

 import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.http.MediaType;
 import org.springframework.stereotype.Controller;
 import org.springframework.ui.Model;
 import org.springframework.web.bind.annotation.*;
 import ssx.service.ServiceC;

 import java.util.Map;

//ajax方式
@Controller
@SessionAttributes(value = {"loginUserName","loginUserEmail"})
public class ControllerC {

    @Autowired
    ServiceC serviceC;

    @RequestMapping(value = "ajax/{action}.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public String isPresentUser(Model model, @RequestBody String  st, @PathVariable(name = "action")String action){
        JSONObject json = new JSONObject();
        JSONObject jsonObject  = JSONObject.parseObject(st);

        if ("0".equals(action)){
            String userName0 = (String) jsonObject.get("userName0");
            String emailName0 = (String) jsonObject.get("emailName0");
            String emailPassword0 = (String) jsonObject.get("emailPassword0");
            String user_password = serviceC.queryOnepw(emailName0, "user_password");
            if (user_password==null || "".equals(user_password)){
                boolean b = serviceC.addUser(userName0, emailName0, emailPassword0);
                if (b){
                    json.put("status","succ");
                    json.put("desc","用户"+emailName0+"注册成功！");
                    return json.toJSONString();
                }else {
                    json.put("status","fail");
                    json.put("desc","注册失败！数据错误");
                    return json.toJSONString();
                }
            }else {
                json.put("status","fail");
                json.put("desc","用户"+emailName0+"已存在，不能注册！");
                return json.toJSONString();
            }
        }
        else if ("1".equals(action)){
            String emailName1 = (String) jsonObject.get("emailName1");
            String emailPassword1 = (String) jsonObject.get("emailPassword1");

            String user_password = serviceC.queryOnepw(emailName1, "user_password");
            if (user_password==null || "".equals(user_password)){
                json.put("status","fail");
                json.put("desc","登录失败！数据库用户不存在");
                 return json.toJSONString();
            }else {
                if (user_password.equals(emailPassword1)){
                    json.put("status","succ");
                    json.put("desc","登录成功");
                    String user_name = serviceC.queryOneuser(emailName1, "user_name");
                    json.put("uname", user_name);
                    model.addAttribute("loginUserName",user_name);
                    model.addAttribute("loginUserEmail",emailName1);

                    Map<String, Object> stringObjectMap = model.asMap();
                    return json.toJSONString();
                }else {
                    json.put("status","fail");
                    json.put("desc","登录失败！密码输入错误");
                    return json.toJSONString();
                }
            }

        }
        return "{\"status\":\"fail\"}";
    }
}
