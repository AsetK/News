package com.epam.news.dao.dao;

public class FactoryDAO {
    private static NewsDAO newsDAO = null;
    private static FactoryDAO instance = null;

    public static FactoryDAO getInstance(){
        if(instance == null)
        {
            synchronized(FactoryDAO.class)
            {
                if(instance == null)
                {
                    instance = new FactoryDAO();
                }
            }
        }
        return instance;
    }

    public NewsDAO getNewsDAO(){
        if (newsDAO == null){
            newsDAO = new NewsDAO();
        }
        return newsDAO;
    }
}
