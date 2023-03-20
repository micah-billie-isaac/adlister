package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }



    @Override
    public ArrayList<Ad> getAdsByUser(User user) {
        ArrayList<Ad> ads = new ArrayList<>();
        String query = "SELECT * FROM ads WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, user.getId());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Ad ad = new Ad();
                ad.setId(rs.getLong("id"));
                ad.setTitle(rs.getString("title"));
                ad.setDescription(rs.getString("description"));
                // ...
                ads.add(ad);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ads;
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> findByTitle(String title) {
        String query = "SELECT * FROM ads WHERE title = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, title);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Ad not found", e);
        }
    }


    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }
    @Override
    public Ad fetchAdByID(long id){
        try{
            String fetchQuery = "SELECT * FROM ads WHERE id = "+id;
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(fetchQuery);
            rs.next();

            return new Ad(
                    rs.getLong("id"),
                    rs.getLong("user_id"),
                    rs.getString("title"),
                    rs.getString("description")
            );
        }catch(Exception e){
            throw new RuntimeException("Error finding ad.", e);
        }
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
