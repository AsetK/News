package com.epam.news.web.controller;

import com.epam.news.dao.dao.DataBase;
import com.epam.news.dao.dao.NewsDAO;
import com.epam.news.domain.entity.News;
import com.epam.news.service.service.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class NewsController {

    @RequestMapping("/newsmanagement")
    public ModelAndView newsManagementPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsmanagement");

        return mv;
    }

    @RequestMapping(value = "/newslistpage",method = RequestMethod.POST)
    public ModelAndView newsListPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newslist");

        NewsDAO dao = new NewsDAO();
        mv.addObject("newsList", dao.getAllNews());
        //mv.addObject("newsList", NewsListViewing.viewNewsList());

        return mv;
    }

    @RequestMapping("/addnewspage")
    public ModelAndView createNewsPage(@ModelAttribute("news") News news) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addnews");

        return mv;
    }

    @RequestMapping(value = "/addnews", method = RequestMethod.POST)
    public ModelAndView createNews(@ModelAttribute("news") News news){
        //NewsCreating.createNews(news);
        NewsDAO dao = new NewsDAO();
        dao.addNews(news);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsisadded");

        return mv;
    }

    @RequestMapping(value = "/viewnews", method = RequestMethod.POST)
    public ModelAndView viewNews(@RequestParam("newsId") Long newsId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("viewnews");

        NewsDAO dao = new NewsDAO();
        mv.addObject("news", dao.viewNews(newsId));
        //mv.addObject("news", NewsViewing.viewNews(newsId));

        return mv;
    }

    @RequestMapping(value = "/editnews", method = RequestMethod.POST)
    public ModelAndView editNews(@RequestParam("newsId") Long newsId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("editnews");

        NewsDAO dao = new NewsDAO();
        mv.addObject("news", dao.viewNews(newsId));
        //mv.addObject("news", NewsViewing.viewNews(newsId));

        return mv;
    }

    @RequestMapping(value = "/savechanges", method = RequestMethod.POST)
    public ModelAndView saveChanges(@ModelAttribute("news") News news) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsisedited");
        NewsDAO dao = new NewsDAO();
        dao.updateNews(news);
        //NewsModifying.modifyNews(news);

        return mv;
    }

    @RequestMapping(value = "/deletenews", method = RequestMethod.POST)
    public ModelAndView deleteNews(@RequestParam("newsId") Long newsId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsisdeleted");

        NewsDAO dao = new NewsDAO();
        dao.deleteNews(newsId);
        //NewsDeleting.deleteNews(newsId);

        return mv;
    }

    @RequestMapping(value = "/deletesignednews", method = RequestMethod.POST)
    public ModelAndView deleteSignedNews(@RequestParam("newsId[]") Long[] newsId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsisdeleted");

        NewsDAO dao = new NewsDAO();

        for(long id:newsId) {
            dao.deleteNews(id);
            //NewsDeleting.deleteNews(id);
        }

        return mv;
    }



}
