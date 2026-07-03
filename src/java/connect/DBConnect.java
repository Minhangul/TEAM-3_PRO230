/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DBConnect {
    public static final String HOSTNAME = "Tsown";
    public static final String PORT = "1433";
    public static final String DBNAME = "QLPT";
    public static final String USERNAME = "sa";
    public static final String PASSWORD = "123";

    /**
     * Get connection to MSSQL Server
     *
     * @return Connection
     */
    public static Connection getConnection() {

        // Create a variable for the connection string.
        String connectionUrl = "jdbc:sqlserver://" + HOSTNAME + ":" + PORT + ";"
                + "databaseName=" + DBNAME+";encrypt=false";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(connectionUrl, USERNAME, PASSWORD);
        } // Handle any errors that may have occurred.
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}

//code sql:
//CREATE TABLE CanHo (
//    MaCanHo INT IDENTITY(1,1) PRIMARY KEY,
//    TenCanHo NVARCHAR(50) NOT NULL,
//    Tang INT,
//    DienTich FLOAT,
//    TrangThai NVARCHAR(30) DEFAULT N'Trống'
//);
//
//CREATE TABLE PhuongTien (
//    MaPhuongTien INT IDENTITY(1,1) PRIMARY KEY,
//    BienSo VARCHAR(20) NOT NULL,
//    LoaiXe NVARCHAR(50) NOT NULL,
//    MaCanHo INT NOT NULL,
//    ChuSoHuu NVARCHAR(100),
//    TrangThai NVARCHAR(30) DEFAULT N'Đang hoạt động',
//    FOREIGN KEY (MaCanHo) REFERENCES CanHo(MaCanHo)
//);
