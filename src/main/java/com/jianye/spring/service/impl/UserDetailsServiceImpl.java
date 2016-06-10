package com.jianye.spring.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jianye.spring.dao.UserDao;
import com.jianye.spring.entity.AcctAuthority;
import com.jianye.spring.entity.AcctRole;
import com.jianye.spring.entity.AcctUser;
import com.jianye.spring.service.UserDetailsService;

public class UserDetailsServiceImpl implements UserDetailsService {
	
	private static final Logger logger = Logger.getLogger(UserDetailsServiceImpl.class);
	
	@Autowired
	private UserDao userDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("认证用户：" + username);
		// 查询数据库获取用户信息
		AcctUser acctUser = userDao.findUserByNickname(username);
		
		if (null == acctUser) {
			throw new UsernameNotFoundException("认证用户：" + username + ",不存在");
		}
		
		Set<GrantedAuthority> authrities = getAuthorities(acctUser);
		// 将没有设置到属性设置为true
		UserDetails userDetails = new User(acctUser.getNickName(), acctUser.getNickPassword(), 
				true, true, true, true, authrities);
		return userDetails;
	}
	
	 // 获得用户所有角色的权限  
    private Set<GrantedAuthority> getAuthorities(AcctUser acctUser) {  
        Set<GrantedAuthority> authoritySet = new HashSet<GrantedAuthority>();  
  
        // 默认所有的用户有"浏览用户"的权利  
        authoritySet.add(new SimpleGrantedAuthority("ROLE_浏览用户"));  
  
        // 依次添加  
        if (null != acctUser.getAcctRoles()  
                && acctUser.getAcctRoles().size() > 0)  
            for (AcctRole role : acctUser.getAcctRoles()) {  
                if (null != role.getAcctAuthorities()  
                        && role.getAcctAuthorities().size() > 0)  
                    for (AcctAuthority authority : role.getAcctAuthorities()) {  
                        authoritySet.add(new SimpleGrantedAuthority(authority.getPrefixedName()));  
                    }  
            }  
  
        return authoritySet;  
    }

}
