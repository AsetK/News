package com.epam.news.dao.dao;

import com.epam.news.domain.entity.News;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.Arrays;
import java.util.List;

@Repository
public class NewsDAO {

    @Autowired
    SessionFactory sessionFactory;
    private static final String NEWS_ID = "id";

    @Transactional
    public void addNews(News news) {
        sessionFactory.getCurrentSession().save(news);
    }

    @Transactional
    public News viewNews(Long newsId) {
        return sessionFactory.getCurrentSession().get(News.class, newsId);
    }

    @Transactional
    public List<News> getAllNews()  {
        return sessionFactory.getCurrentSession().createCriteria(News.class).list();
    }

    @Transactional
    public void deleteNews(Long newsId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete News where id =: id");
        query.setParameter(NEWS_ID, newsId);
        query.executeUpdate();
    }

    @Transactional
    public void deleteNews(Long[] newsId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete News where id in (:id)");
        ((org.hibernate.query.Query) query).setParameterList(NEWS_ID, newsId);
        query.executeUpdate();
    }

    @Transactional
    public void updateNews(News news) {
        sessionFactory.getCurrentSession().update(news);
    }
}
