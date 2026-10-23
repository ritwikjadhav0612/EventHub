
package com.eventhub.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {

    private static final Properties properties = new Properties();

    static {
        try (InputStream input = DBConnection.class
                .getClassLoader()
                .getResourceAsStream("config.properties")) {

            if (input != null) {
                properties.load(input);
            }

        } catch (IOException e) {
            // Log or ignore if properties are provided via environment variables
        }
    }

    public static Connection getConnection() throws SQLException {

        String url = System.getenv("DB_URL");
        if (url == null || url.isBlank()) {
            url = properties.getProperty("db.url");
        }

        String username = System.getenv("DB_USERNAME");
        if (username == null || username.isBlank()) {
            username = properties.getProperty("db.username");
        }

        String password = System.getenv("DB_PASSWORD");
        if (password == null || password.isBlank()) {
            password = properties.getProperty("db.password");
        }

        if (url == null || username == null || password == null) {
            throw new SQLException(
                "Database configuration is incomplete. Provide config.properties or DB_URL, DB_USERNAME, DB_PASSWORD environment variables."
            );
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(
                "MySQL JDBC driver not found in web application.", e
            );
        }

        return DriverManager.getConnection(url, username, password);
    }
}
