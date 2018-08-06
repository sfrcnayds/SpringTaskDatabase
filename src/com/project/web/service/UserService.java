package com.project.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.dao.User;
import com.project.web.dao.UserDAO;

@Service
public class UserService {
	
	private UserDAO userDAO;

	@Autowired
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public List<User> getAllUser(){
		return userDAO.getUsers();
	}
	public List<User> getAllUserByName(String name){
		return userDAO.getUsersByName(name);
	}
	public boolean createUser(User user) {
		 return userDAO.createUser(user);
	}
	public int deleteUser(int id) {
		return userDAO.delete(id);
	}
}
