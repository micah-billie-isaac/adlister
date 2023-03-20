package com.codeup.adlister.models;

import java.util.ArrayList;

public class User {
    private long id;
    private String username;
    private String email;
    private String password;

    private ArrayList<Ad> ads;



    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.ads = null;
    }

    public User(long id, String username, String email, String password) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public ArrayList<Ad> getAds() {
        return ads;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", ads=" + ads +
                '}';
    }

    public void setAds(ArrayList<Ad> ads) {
        this.ads = ads;
    }
}

