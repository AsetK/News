package com.epam.news.service.service;

import com.epam.news.dao.dao.DataBase;
import com.epam.news.domain.entity.News;

import java.util.Map;

public class NewsListViewing {
    public static Map<Long, News> viewNewsList() {
        return DataBase.getNewsList();
    }
}
