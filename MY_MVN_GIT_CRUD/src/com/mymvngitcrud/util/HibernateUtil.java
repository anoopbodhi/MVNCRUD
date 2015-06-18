package com.mymvngitcrud.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {
	
	@SuppressWarnings("deprecation")
	private static final SessionFactory sessionFactory=buildSessionFactory();

	private static SessionFactory buildSessionFactory() {
		
		try{
			
			return new AnnotationConfiguration().configure().buildSessionFactory();
			
		}catch(Exception ex)
		{
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
		
		
	}
	
	public static SessionFactory getSessionFactory()
	{
		return sessionFactory;
	}

}
