package com.jianye.spring.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jianye.spring.entity.AcctUser;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	@RequestMapping(value="/login")
	public String login(@ModelAttribute AcctUser acctUser, @RequestParam(required=false) Boolean logout,
			Errors errors) {
		logger.info("login");
		if (null != logout) {
			errors.reject("msg", "已经完全退出");
		}
		return "/login/login";
	}
	
}
