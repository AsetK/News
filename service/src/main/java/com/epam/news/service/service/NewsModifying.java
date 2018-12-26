package com.epam.news.service.service;

import com.epam.news.dao.dao.DataBase;
import com.epam.news.domain.entity.News;

public class NewsModifying {

    public static void modifyNews(News news) {
        DataBase.modifyNews(news);
    }
}
