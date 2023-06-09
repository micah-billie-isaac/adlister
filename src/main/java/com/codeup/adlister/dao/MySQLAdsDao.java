package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
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



    @Override
    public void deleteAd(long id) {
        String query = "DELETE FROM ads WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad.", e);
        }
    }


    @Override
    public boolean update(Ad ad) {
        try {
            String updateQuery = "UPDATE ads SET user_id=?, title=?, description=? WHERE id=?";
            PreparedStatement stmt = connection.prepareStatement(updateQuery);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setLong(4, ad.getId());
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {

        long adID = rs.getLong("id");

        List<Category> categories = fetchCategoriesByAdID(adID);

        Ad ad = new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
        ad.setCategories(categories);
        return ad;
    }
    
    
    @Override
    public Ad fetchAdByID(long id){
        try{
            String fetchQuery = "SELECT * FROM ads WHERE id = "+id;
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(fetchQuery);
            rs.next();

            return extractAd(rs);
        }catch(Exception e){
            throw new RuntimeException("Error finding ad.", e);
        }
    }
    @Override
    public List<Category> fetchCategoriesByAdID(long adID){

        List<Category> categories = new ArrayList<>();

        try{
            String fetchQuery =
                    "select * " +
                "from ads_categories ac " +
                "join categories c on ac.category_id = c.id " +
                "where ac.ad_id = "+adID;
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(fetchQuery);
            while(rs.next()){
                Category category = new Category(

                        rs.getLong("category_id"),
                        rs.getString("name")
                );
                categories.add(category);
            }
            return categories;

        }catch(Exception e){
            throw new RuntimeException("Error finding category.", e);
        }
    }

    @Override
    public void deleteCategoryAd(long categoryId, long adId) {
        try {
            String query = "DELETE FROM ads_categories WHERE category_id = ? AND ad_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, categoryId);
            stmt.setLong(2, adId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting category-ad association.", e);
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
