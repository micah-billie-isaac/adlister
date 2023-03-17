package com.codeup.adlister.dao;

class Config {
    public String getUrl() {
        return "jdbc:mysql://studentdb.fulgentcorp.com/ymir_adlister_1?allowPublicKeyRetrieval=true&useSSL=false";
    }
    public String getUser() {
        return "ymir_adlister_1";
    }
    public String getPassword() {
        return "avocado";
    }
}