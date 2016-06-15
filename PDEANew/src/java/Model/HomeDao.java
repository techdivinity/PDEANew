/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Com.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author divinity
 */
public class HomeDao {
    public ArrayList<String[]> getActiveTender()
    {
        ArrayList<String[]> list=new ArrayList<String[]>();
        Connection con = null;
        Statement stmt1 = null;
        ResultSet rs1 = null;
        String[] arr;
        SimpleDateFormat dt=new SimpleDateFormat("dd/MM/yyyy");
        try
        {
            con = DBConnection.createConnection();con.setAutoCommit(false);
            stmt1 = con.createStatement(); 
            rs1 = stmt1.executeQuery("SELECT * FROM tender where CURDATE() BETWEEN startDate and endDate"); 

            while(rs1.next()) 
            {
                arr=new String[4];
                
                String dep=rs1.getString("tenderType");
                if(dep.equals("1")||dep.equals("2")||dep.equals("5")){dep="Account";}
                else if(dep.equals("3")||dep.equals("4")){dep="Building";}
                
                arr[0]=rs1.getString("tenderName");
                arr[1]=rs1.getString("description");
                arr[2]=dt.format(rs1.getDate("endDate"));
                arr[3]=dep;
                list.add(arr);
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
