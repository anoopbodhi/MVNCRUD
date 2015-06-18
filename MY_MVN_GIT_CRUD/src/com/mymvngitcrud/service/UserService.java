package com.mymvngitcrud.service;

import java.util.ArrayList;

import com.mymvngitcrud.domain.User;
import com.mymvngitcrud.rep.UserRepository;

public class UserService {
	
	
	public ArrayList getUsers()
	{
		ArrayList list_user=(ArrayList)new UserRepository().getAllUser();
		
		return list_user;
		
	}
	
	public int deleteUser(String id [])
	{
		int flag=0;
		
		flag=new UserRepository().deleteUserById(id);
		
		
		return flag;
	}
	
	
	public User getSingleUser(Long id)
	{
		User user=new UserRepository().getMyProfile(id);
		
		return user;
	}

}
