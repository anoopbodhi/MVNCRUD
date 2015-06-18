package com.mymvngitcrud.rep;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.mymvngitcrud.domain.User;
import com.mymvngitcrud.util.HibernateUtil;

public class UserRepository {

	/****************************************************************************
	 * Save user to database.
	 * @param Instance of User to be saved.
	 * @return Instance of inserted User upon successful insertion.
	 * null otherwise.
	 ****************************************************************************/
	
	public User save(User user)
	{
		SessionFactory sf=HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		session.beginTransaction();
		
		Long Id=(Long)session.save(user);
		user.setId(Id);
		
		session.getTransaction().commit();
		session.close();
		
		
		return user;
	}
	
	public User loginCheck(User user)
	{
		SessionFactory sf=HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		session.beginTransaction();
		
		String USERNAME=user.getUSERNAME();
		String PASSWORD=user.getPASSWORD();
		
		try{
				 user=null;
			
				 user=(User)session.createQuery("from User where userName='"+USERNAME+"' and passWord='"+PASSWORD+"'").list().get(0);
			
		}catch(Exception e)
		{
			System.out.println("Error in loginCheck="+e);
		}
		
		return user;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<User> getAllUser()
	{
			ArrayList<User> list_user=new ArrayList<User>();
			
			SessionFactory sf=HibernateUtil.getSessionFactory();
			
			
			
			Session session=sf.openSession();
			
			session.beginTransaction();
			
			try{
				
				list_user=(ArrayList<User>)session.createQuery("from User").list();
			
			}catch(Exception e)
			{
				System.out.println("Error in getAllUser="+e);
			}
			
			
			
			session.close();
			return list_user;
	}
	
	/*
	public User  getUserByID(Long Id)
	{
		
		
		SessionFactory sf=HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		session.beginTransaction();
		
		User user=null;
		
		try{
			
			
			user=(User)session.createQuery("from User where Id='"+Id+"'").list().get(0);
			
		}catch(Exception e)
		{
			System.out.println("Error in getUserByID="+e);
		}
	//	session.clear();
		session.close();
		return user;
	}
	*/
	public int deleteUserById(String id[])
	{
		SessionFactory sf=HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		
		
		int flag=0;
		
		User user;
		
		try{
			
			
			
			for(int i=0;i<id.length;i++)
			{
				
				session.beginTransaction();
				
				Long Id=Long.parseLong(id[i]);
				
			
				
			//	user=new UserRepository().getUserByID(Id);
				
				user=(User)session.createQuery("from User where Id='"+Id+"'").list().get(0);
				
				session.delete(user);
				session.getTransaction().commit();
				
				
			}
			
			session.close();
			flag=1;
			
			
			
		}catch(Exception e)
		{
			System.out.println("Error in deleteUserById="+e);
		}
		
		
		return flag;
	}
	
	public User getMyProfile(Long Id)
	{
		
		
		
		SessionFactory sf=HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		session.beginTransaction();
		User user=null;
		try{
			
			user=(User)session.createQuery("from User where Id='"+Id+"'").list().get(0);
			session.close();
		   }catch(Exception e){
			
			return null;
		   }
		
		
		
		return user;
	}
	
	public User profileUpdate(User user)
	{
		SessionFactory sf=HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		try{
			
			session.update(user);
			session.getTransaction().commit();
			session.close();
			
		}catch(Exception e)
		{
			System.out.println("Error in profileUpdate="+e);
			return null;
		}
		
		return user;
	}
	
}
