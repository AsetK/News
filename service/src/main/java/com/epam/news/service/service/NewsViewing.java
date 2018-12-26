package com.epam.news.service.service;

import com.epam.news.dao.dao.DataBase;
import com.epam.news.domain.entity.News;

public class NewsViewing {

    public static News viewNews(Long newsId) {
        return DataBase.viewNews(newsId);
    }
}
