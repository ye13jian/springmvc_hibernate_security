package com.jianye.spring.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
	
	@RequestMapping(value="main")
	public String main(ModelMap modelMap) {
		logger.info("显示主页面");
		
		// 后台获取Security保存在Session的用户信息
		// 获取Security的上下文
		SecurityContext securityContext = SecurityContextHolder.getContext();
		// 获取认证对象
		Authentication authentication = securityContext.getAuthentication();
		// 在认证对象中获取主体对象
		Object principal = authentication.getPrincipal();
		
		String username = "";
		if (principal instanceof UserDetails) {
			username = ((UserDetails)principal).getUsername();
		} else {
			username = principal.toString();
		}
		modelMap.addAttribute("username", username);
		return "/user/main";
	}
	
	@RequestMapping(value="/manage")
	public String manage(ModelMap modelMap) {
		logger.info("显示主界面");
		modelMap.addAttribute("msg", "manage");
		return "/user/option";
	}
	
	@RequestMapping(value="save")
	public String save(ModelMap modelMap) {
		logger.info("保存");
		modelMap.addAttribute("msg", "save");
		return "/user/option";
	}
	
	@RequestMapping(value="delete")
	public String delete(ModelMap modelMap) {
		logger.info("删除");
		modelMap.addAttribute("msg", "delete");
		return "/user/option";
	}
	
	@RequestMapping(value="update")
	public String update(ModelMap modelMap) {
		logger.info("修改");
		modelMap.addAttribute("msg", "update");
		return "/user/option";
	}
}
