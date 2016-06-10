package com.jianye.spring.service;

import java.util.List;

import com.jianye.spring.entity.AcctUser;

public interface UserService {
	AcctUser load(String id);
	
	AcctUser get(String id);
	
	List<AcctUser> findAll();
	
	void persit(AcctUser entity);
	
	String save(AcctUser entity);
	
	void saveOrUpdate(AcctUser entity);
	
	void delete(String id);
	
	void flush();
}
