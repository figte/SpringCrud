/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.personal.servicios;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author FIGTE
 */
public class UtilServices {
    public static String encriptar(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        MessageDigest crypt=MessageDigest.getInstance("SHA-1");
        crypt.reset();
        crypt.update(password.getBytes("UTF-8"));
        return new BigInteger(1,crypt.digest()).toString(16);
    }
}
