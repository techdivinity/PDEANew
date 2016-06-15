/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com;

import java.util.*;
import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author admin
 */
public class MD5 
{
    private  byte[] digest;
    
    public  String getpass(String pass) throws NoSuchAlgorithmException, UnsupportedEncodingException
    {
        String newPass=encryptMD5(pass, "VivekSatpute");
        return newPass;
    }
    
    public  String encryptMD5(String data, String salt) throws NoSuchAlgorithmException, 
                                                              UnsupportedEncodingException
    {
        StringBuffer strbuf = new StringBuffer();
        MessageDigest md5 = MessageDigest.getInstance("md5"); //encrypt using md5
        md5.reset();
        md5.update(salt.getBytes()); //use given salt
        md5.update(data.getBytes(), 0, data.length()); 
        digest = md5.digest();      
        for (int i = 0; i < digest.length; i++) 
        {
            strbuf.append(toHexString(digest[i]));
        } 
        return strbuf.toString();      
    }
 
    /**
     * toHexString
     * Convert byte <--> hex string
     * (message digists works with bytes but we want to compare strings) 
     */
    public String toHexString(byte b) 
    {
        int value = (b & 0x7F) + (b < 0 ? 128 : 0);
        String ret = (value < 16 ? "0" : "");
        ret += Integer.toHexString(value);
        return ret.toLowerCase();
    }
    
}
