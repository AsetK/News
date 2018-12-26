package com.epam.news.service.service;

import com.epam.news.dao.dao.DataBase;
import com.epam.news.domain.entity.News;

public class NewsCreating {

    public static void createNews(News news) {
        DataBase.addNews(news);
    }
}
