package com.epam.news.dao.dao;

import com.epam.news.domain.entity.News;

import java.util.HashMap;
import java.util.Map;

public class DataBase {
    private static Map<Long,News> newsList = new HashMap<Long,News>();
    private static Long id = 0L;

    public static Map<Long,News> getNewsList() {
        return newsList;
    }

    public static void setNewsList(Map<Long,News> newsList) {
        DataBase.newsList = newsList;
    }

    public static synchronized void  addNews(News news) {
        news.setId(++id);
        newsList.put(news.getId(),news);
    }

    public static synchronized void deleteNews(News news) {
        newsList.remove(news);
    }

    public static synchronized void modifyNews(News news) {
        newsList.replace(news.getId(), news);
    }

    public static News viewNews(Long newsId) {
        return newsList.get(newsId);
    }

}
