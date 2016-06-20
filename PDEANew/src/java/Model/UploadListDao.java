/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Bean.ListBean;
import Com.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.naming.NamingException;

/**
 *
 * @author divinity
 */
public class UploadListDao {
    public String uploadList(ListBean bean) throws NamingException, SQLException
    {
        PreparedStatement stmt2=null;
        PreparedStatement stmt3=null;
        PreparedStatement stmt4=null;
        Connection con = DBConnection.createConnection();
        
        SimpleDateFormat date1=new SimpleDateFormat("yyMMddHHmmss");
        String datefinal=date1.format(new java.util.Date());
        
        con.setAutoCommit(false);
        try{ 
            
            String sql1="insert into list(LID,name,uploadDate, avilable,list_cat) values('"+datefinal+"','"+bean.getFile()+"',now(),true,'"+bean.getListType()+"')";    
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            stmt1.executeUpdate();
            stmt1.close();
            
            String sql2="insert into itemheader(LID,headerCnt,headerValue) values(?,?,?)";
            for(int i=0;i<bean.getHeaders().length;i++)
            {   
                stmt2 = con.prepareStatement(sql2);
                stmt2.setString(1,datefinal);
                stmt2.setString(2,String.valueOf(i));
                stmt2.setString(3,bean.getHeaders()[i]);
                stmt2.executeUpdate();
                stmt2.close();
            }
            int iid=0;
            String sql3="insert into itemdata(LID,IID,columnNo,columnValue) values(?,?,?,?)";
            for(int i=0;i<bean.getElements().get(0).length;i++)
            {
                for(int j=0;j<bean.getHeaders().length;j++)
                {
                    stmt3 = con.prepareStatement(sql3);
                    stmt3.setString(1,datefinal);
                    stmt3.setString(2,String.valueOf(iid));
                    stmt3.setString(3,String.valueOf(j));
                    stmt3.setString(4,bean.getElements().get(j)[i]);
                    stmt3.executeUpdate();
                    stmt3.close();
                }
                iid++;
            }
            String sql4="INSERT INTO listallowedtocid(LID,CID)values(?,?)";
            for(int i=0;i<bean.getAllowedCIDUniq().length;i++)
            {
                stmt4 = con.prepareStatement(sql4);
                stmt4.setString(1,datefinal);
                stmt4.setString(2,bean.getAllowedCIDUniq()[i]);
                stmt4.executeUpdate();
                stmt4.close(); 
            }
            con.commit();
            con.close();
            return "SUCCESS";
            
        }catch(Exception e)
        {
            try{con.rollback();
            con.close();
            }catch(Exception e2){}
            return String.valueOf(e);
        }
        
    }
    
}
