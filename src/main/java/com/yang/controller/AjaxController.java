package com.yang.controller;

import com.yang.pojo.Buiding;
import com.yang.service.BuidingService;
import com.yang.service.DeviceService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
    @Resource
    DeviceService deviceService;
    @Resource
    BuidingService buidingService;
    @RequestMapping("/sho")
    public List<Buiding> sho(){
        return buidingService.getAll();
    }
    @RequestMapping("/toqi")
    public String toqi(Integer status,long id){
        if (deviceService.update(status,id)>0){
            return "ok";
        }else{
            return "no";
        }

    }
}
