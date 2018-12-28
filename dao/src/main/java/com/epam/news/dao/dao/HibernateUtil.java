package com.epam.news.dao.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static final SessionFactory sessionFactory;

    static
    {
        try
        {
            sessionFactory = new Configuration().configure().buildSessionFactory();
            System.out.println("SessionFactory is created");
        }
        catch (Throwable exc)
        {
            System.err.print("Initial SessionFactory creation failed." + exc);
            throw new ExceptionInInitializerError(exc);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
