/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Bean.NewVendorBean;
import Com.DBConnection;
import Com.MD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;

/**
 *
 * @author divinity
 */
public class VendorRegistrationDao {
  public String getUserPresentStatus(String vendor, String cat) throws NamingException, SQLException
 {
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String tableName="login"+cat;
    con = DBConnection.createConnection();
    
    try
     {
        statement = con.createStatement(); 
        resultSet = statement.executeQuery("Select * from "+tableName+" where userName='"+vendor+"'"); 

        while(resultSet.next()) 
         {
          return "PRESENT";
         }
        statement.close();resultSet.close();con.close();
        return "NOTPRESENT";
     }
     catch(SQLException e)
     {
        try{
         con.close();
        }catch(Exception e1){}
        return String.valueOf(e);
     }
 }
    public String addVendor(NewVendorBean bean) throws NamingException, SQLException
    {
        Connection con = null;
        PreparedStatement stmt3=null;
//        PreparedStatement stmt5=null;
        con = DBConnection.createConnection();
        
        con.setAutoCommit(false);
        try
        {
            MD5 m=new MD5();
            String pw=m.getpass(bean.getPass());
            String ansr=m.getpass(bean.getAns());
            
            String sql1 = "insert into vender(venderName, Email, phno, phno2, address,  shopAct, CST, VAT, PAN, TAN, web, skilled, unskilled,blackList)values"
                + "('"+bean.getCompanyName()+"','"+bean.getEmail()+"','"+bean.getPhno1()+"','"+bean.getPhno2()+"','"+bean.getAddress()+"','"+bean.getSAN()+"','"+bean.getCST()+"','"+bean.getVAT()+"','"+bean.getPAN()+"','"+bean.getTAN()+"','"+bean.getWeb()+"','"+bean.getSkilled()+"','"+bean.getNonSkilled()+"',false)";
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            stmt1.executeUpdate();
            
            long VID=0;
            String sql2 = "SELECT VID FROM vender where Email='"+bean.getEmail()+"'";
            PreparedStatement stmt2 = con.prepareStatement(sql2);
            ResultSet rs2 = stmt2.executeQuery();
            while (rs2.next())
            {
                VID=rs2.getLong("VID");
            }
            
            String sql3="insert into venderfiles (VID,clearance,IT) values(?,?,?)";
            stmt3=con.prepareStatement(sql3);
            stmt3.setLong(1,VID);
            stmt3.setBytes(2,bean.getA());
            stmt3.setBytes(3,bean.getB());
            stmt3.executeUpdate();
            
            String sql4 = "insert into loginvender(userName, password,qus,ans)values('"+bean.getEmail()+"','"+pw+"','"+bean.getQus()+"','"+ansr+"')";
            PreparedStatement stmt4 = con.prepareStatement(sql4);
            stmt4.executeUpdate();
            
            String sql5 = "insert into vendercategory values('"+VID+"',"+bean.isBench()+","+bean.isBlackbord()+","+bean.isBook()+","+bean.isChemical()+","+bean.isGlassware()+","+bean.isIcard()+","+bean.isSports()+","+bean.isSteel()+","+bean.isWooden()+","+bean.isScienceInstru()+")";
            PreparedStatement stmt5 = con.prepareStatement(sql5);
            stmt5.executeUpdate();


            con.commit();
            stmt1.close();
            stmt2.close(); rs2.close();
            stmt3.close();
            stmt4.close();
            stmt5.close();
            con.close();
            return "SUCCESS";
        }
        catch(Exception e)
        {
             try{ con.close();}catch(Exception e1){}
            return String.valueOf(e);
        }
        
    }
    
}
