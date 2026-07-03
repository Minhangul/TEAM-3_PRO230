/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Account;

public class AccountDAO {
    public Account checkLogin(String username, String password) {
        if ("admin".equals(username) && "123".equals(password)) {
            Account acc = new Account();
            acc.setUsename(username);
            return acc;
        }
        return null;
    }
}
