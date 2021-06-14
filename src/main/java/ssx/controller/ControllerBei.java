package ssx.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ssx.dao.IDaoC2;
import ssx.entity.UserSchema;
import ssx.service.ServiceC2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SessionAttributes(value = "queAlll")
@Controller
public class ControllerBei {

    @Autowired
    ServiceC2 serviceC2;

    @Autowired
    IDaoC2 iDaoC2;

    @RequestMapping(value = "bei/abcdefg.do",method = RequestMethod.POST)
    @ResponseBody
    public Map acceptAjax(@RequestBody UserSchema userSchema, Model model){
        Map map = new HashMap();

        String userId = userSchema.getUserId();
        int seq = 1;
        try {
            seq = serviceC2.queryMaxSeq(userId);
            seq++;
        } catch (Exception e) {

        }
        userSchema.setSeq(seq);

        boolean b = serviceC2.addBei(userSchema);
        if (b){
            map.put("status","succ");
        }else {
            map.put("status","fail");

        }

        return map;
    }


    @RequestMapping(value = "bei/queAll.do",method = RequestMethod.POST)
    @ResponseBody
    public Map queAll(@RequestBody Map reqMap, Model model) throws Exception{
        Logger logger = Logger.getLogger(ControllerBei.class);
        HashMap map = new HashMap();
        String userId = (String)reqMap.get("userId");
        List<UserSchema> userSchemas = iDaoC2.queryAll(userId);

        if (userSchemas.size()==0){
            userSchemas.add(new UserSchema(userId,"暂无内容",0));
        }
        map.put("status","succ");


        //json
        ObjectMapper objectMapper = new ObjectMapper();


        String s = objectMapper.writeValueAsString(userSchemas);
        logger.error("开始生成 String s = objectMapper.writeValueAsString(userSchemas);");
        logger.error("开始生成 String s = objectMapper.writeValueAsString(userSchemas);");
        logger.error("开始生成 String s = objectMapper.writeValueAsString(userSchemas);");
        logger.error("开始生成 String s = objectMapper.writeValueAsString(userSchemas);");
        logger.error("开始生成 String s = objectMapper.writeValueAsString(userSchemas);");
        logger.error("开始生成 String s = objectMapper.writeValueAsString(userSchemas);");
        logger.error("");
        logger.error("");
        logger.error("");
        logger.error(s);
        logger.error("结束生成 String s = objectMapper.writeValueAsString(userSchemas);");
        logger.error("结束生成 String s = objectMapper.writeValueAsString(userSchemas);");
        logger.error("结束生成 String s = objectMapper.writeValueAsString(userSchemas);");



        model.addAttribute("queAlll",s);

        return map;
    }

//    {
//        "records":[
//        {"Name":"Alfreds Futterkiste","City":"Berlin","Country":"Germany"},
//        {"Name":"Ana Trujillo Emparedados y helados","City":"México D.F.","Country":"Mexico"},
//        {"Name":"Antonio Moreno Taquería","City":"México D.F.","Country":"Mexico"},
//        {"Name":"Around the Horn","City":"London","Country":"UK"},
//        {"Name":"B's Beverages","City":"London","Country":"UK"},
//        {"Name":"Berglunds snabbköp","City":"Luleå","Country":"Sweden"},
//        {"Name":"Blauer See Delikatessen","City":"Mannheim","Country":"Germany"},
//        {"Name":"Blondel père et fils","City":"Strasbourg","Country":"France"},
//        {"Name":"Bólido Comidas preparadas","City":"Madrid","Country":"Spain"},
//        {"Name":"Bon app'","City":"Marseille","Country":"France"},
//        {"Name":"Bottom-Dollar Marketse","City":"Tsawassen","Country":"Canada"},
//        {"Name":"Cactus Comidas para llevar","City":"Buenos Aires","Country":"Argentina"},
//        {"Name":"Centro comercial Moctezuma","City":"México D.F.","Country":"Mexico"},
//        {"Name":"Chop-suey Chinese","City":"Bern","Country":"Switzerland"},
//        {"Name":"Comércio Mineiro","City":"São Paulo","Country":"Brazil"}
//]
//    }
}
