/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Bean.CollegeBean;
import Com.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author divinity
 */
public class InfosDao 
{
    public ArrayList<CollegeBean> getAllCollegeInfo()
    {
        ArrayList<CollegeBean> list=new ArrayList<CollegeBean>();
        CollegeBean bean;
        Connection con = null;
        Statement stmt1 = null;
        ResultSet rs1 = null;
        try
        {
            con = DBConnection.createConnection();
            stmt1 = con.createStatement(); 
            rs1 = stmt1.executeQuery("SELECT * FROM college"); 

            while(rs1.next()) 
            {
                bean= new CollegeBean();
                bean.setCID(rs1.getString("CID"));
                bean.setCollegeName(rs1.getString("collegeName"));
                bean.setEmail(rs1.getString("Email"));
                bean.setPhno1(rs1.getString("phno1"));
                bean.setPhno2(rs1.getString("phno2"));
                bean.setAddress(rs1.getString("address"));
                bean.setPrimry(rs1.getBoolean("primry"));
                bean.setSecondary(rs1.getBoolean("secondary"));
                bean.setJunior(rs1.getBoolean("junior"));
                bean.setUG(rs1.getBoolean("UG"));
                bean.setPG(rs1.getBoolean("PG"));
                bean.setVocational(rs1.getBoolean("vocational"));
                bean.setPharmacy(rs1.getBoolean("pharmacy"));
                bean.setAyurved(rs1.getBoolean("ayurved"));
                bean.setPolytech(rs1.getBoolean("polytech"));
                bean.setEngg(rs1.getBoolean("engg"));
                bean.setMba(rs1.getBoolean("mba"));
                bean.setArchitech(rs1.getBoolean("architech"));
                list.add(bean);
            }
            stmt1.close();rs1.close(); con.close();
            return list;
            
        }
        catch(Exception e)
        {
            try{
             con.close();
            }catch(Exception e1){}
            return null;
        }
        
    }
    
}
