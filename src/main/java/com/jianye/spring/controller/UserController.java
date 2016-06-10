package com.jianye.spring.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jianye.spring.entity.AcctUser;
import com.jianye.spring.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/showInfo/{userId}")
	public String showUserInfo(ModelMap modelMap, @PathVariable String userId) {
		logger.info("查询用户编号：" + userId);
		AcctUser acctUser = userService.load(userId);
		modelMap.addAttribute("userInfo", acctUser);
		return "/user/showInfo";
	}
	
	@RequestMapping("/showInfos")
	public @ResponseBody List<AcctUser> showUserInfos() {
		logger.info("查询所有用户");
		List<AcctUser> acctUsers = userService.findAll();
		return acctUsers;
	}
}
