package com.epam.news.dao.dao;

import com.epam.news.domain.entity.News;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class NewsDAO {
    private JdbcTemplate jdbcTemplate;

    public NewsDAO(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<News> list() {
        String sql = "SELECT * FROM NEWS";
        List<News> newsList = jdbcTemplate.query(sql, new RowMapper<News>() {

            @Override
            public News mapRow(ResultSet rs, int rowNum) throws SQLException {
                News news = new News();

                news.setId(rs.getLong("id"));
                news.setTitle(rs.getString("title"));
                news.setBrief(rs.getString("brief"));
                news.setContent(rs.getString("content"));
                news.setDate(rs.getDate("newsdate"));

                return news;
            }

        });

        return newsList;
    }

    public void delete(Long newId) {
        String sql = "DELETE FROM NEWS WHERE id=?";
        jdbcTemplate.update(sql, newId);
    }
}
