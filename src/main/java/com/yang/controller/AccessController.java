package com.yang.controller;

import com.yang.pojo.Device;
import com.yang.service.BuidingService;
import com.yang.service.DeviceService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
public class AccessController {
    @Resource
    BuidingService buidingService;
    @Resource
    DeviceService deviceService;
    @RequestMapping("/")
    public String index(){
        return "redirect:/show";
    }
    @RequestMapping("/show")
    public String showPage(@RequestParam(value = "hotId",defaultValue = "-1") Integer hotId
            ,@RequestParam(value = "pageIndex",defaultValue = "1") Integer pageIndex, Model model){
        model.addAttribute("page",deviceService.getDeviceLimit(hotId,pageIndex,3));
        return  "index";

    }
    @RequestMapping("/doadd")
    public String doadd(Device device){
        if (deviceService.insert(device)>0){
            return "redirect:/show";
        }
        return "add";
    }

}
