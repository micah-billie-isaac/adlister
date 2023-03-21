package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import java.util.ArrayList;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    List<Ad> findByTitle(String title);

    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    ArrayList<Ad> getAdsByUser(User user);

    void deleteAd(long id);

    boolean update(Ad ad);

    Ad fetchAdByID(long id);

    List<Category> fetchCategoriesByAdID(long adID);

    void deleteCategoryAd(long categoryId, long adId);
}
