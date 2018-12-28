package com.epam.news.dao.dao;

import com.epam.news.domain.entity.News;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class NewsDAO {

    public void addNews(News news) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();

            tx = session.beginTransaction();
            session.save(news);
            tx.commit();
        }
        catch (Exception exc) {
            if(tx!=null)
                tx.rollback();
            throw exc;
        }
        finally {
            if(session!=null && session.isOpen())
                session.close();
        }
    }

    public News viewNews(Long newsId) {
        News news;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();

            tx = session.beginTransaction();
            news = session.get(News.class, newsId);
            tx.commit();
        }
        catch (Exception exc) {
            if(tx!=null)
                tx.rollback();
            throw exc;
        }
        finally {
            if(session!=null && session.isOpen())
                session.close();
        }
        return news;
    }

    public List<News> getAllNews()  {
        Session session = null;
        Transaction tx = null;
        List newsList;
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            tx = session.beginTransaction();
            newsList = session.createCriteria(News.class).list();
            tx.commit();
        }
        catch (Exception exc) {
            if(tx!=null)
                tx.rollback();
            throw exc;
        }
        finally {
            if(session!=null && session.isOpen())
                session.close();
        }
        return newsList;
    }

    public void deleteNews(Long newsId) {
        News news;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            tx = session.beginTransaction();
            news = session.get(News.class, newsId);
            session.delete(news);
            tx.commit();
        }
        catch (Exception exc) {
            if(tx!=null)
                tx.rollback();
            throw exc;
        }
        finally {
            if(session!=null && session.isOpen())
                session.close();
        }
    }

    public void updateNews(News news) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(news);
            tx.commit();
        }
        catch (Exception exc) {
            if(tx!=null)
                tx.rollback();
            throw exc;
        }
        finally {
            if(session!=null && session.isOpen())
                session.close();
        }
    }
}
