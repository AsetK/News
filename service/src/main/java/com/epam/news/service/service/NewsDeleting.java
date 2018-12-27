package com.epam.news.service.service;

import com.epam.news.dao.dao.DataBase;
import com.epam.news.domain.entity.News;

public class NewsDeleting {

    public static void deleteNews(Long newsId) {
        DataBase.deleteNews(newsId);
    }
}
