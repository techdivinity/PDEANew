/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import javax.naming.InitialContext;
import javax.naming.Context;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import javax.naming.NamingException;
import javax.sql.DataSource;


/**
 *
 * @author divinity
 */
public class loginAttrib 
{
    static Connection getConnect() throws NamingException, SQLException
    {
        InitialContext initialContext = new InitialContext();
        Context context = (Context) initialContext.lookup("java:comp/env");
        DataSource ds = (DataSource) context.lookup("pdea");
        Connection con = ds.getConnection();
        return con;
    }
    
    public static String getCategory(String un,String pass) throws NamingException, SQLException
    {
        Connection con=null;
        String category=null;
        try
        {
            con=getConnect();
            String tempPass=null;
            String tempCat=null;
            String sql1 = "select password, category from loginadmin where userName='"+un+"'";
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            ResultSet rs1 = stmt1.executeQuery();
            while (rs1.next())
            {
                tempPass=rs1.getString("password");
                tempCat=rs1.getString("category");
            }
            stmt1.close();rs1.close();
            if(pass.equals(tempPass))
            {
                category=tempCat;
            }
            con.close();
            return category;
        }
        catch (Exception e)
        {
            return String.valueOf(e);
        }
        finally{}
        
    }
    
    public static String getVID(String un) throws NamingException, SQLException
    {
        Connection con=getConnect();
        String VID=null;
        try
        {
            String sql1 = "select VID from vender where Email='"+un+"'";
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            ResultSet rs1 = stmt1.executeQuery();
            while (rs1.next())
            {
                VID=rs1.getString("VID");
            }
            stmt1.close();rs1.close();
                      
        }
        catch (Exception e)
        {
            VID=null;
        }
        finally{con.close();}
        return VID;
    }
    
    public static String getCID(String un) throws NamingException, SQLException
    {
        Connection con=getConnect();
        String CID=null;
        try
        {
            String sql1 = "select CID from college where Email='"+un+"'";
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            ResultSet rs1 = stmt1.executeQuery();
            while (rs1.next())
            {
                CID=rs1.getString("CID");
            }
            stmt1.close();rs1.close();
                      
        }
        catch (Exception e)
        {
            CID=null;
        }
        finally{con.close();}
        return CID;
    }
    
    public static String getCoID(String un) throws NamingException, SQLException
    {
        Connection con=getConnect();
        String CoID=null;
        try
        {
            String sql1 = "select CoID from contractor where email='"+un+"'";
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            ResultSet rs1 = stmt1.executeQuery();
            while (rs1.next())
            {
                CoID=rs1.getString("CoID");
            }
            stmt1.close();rs1.close();
                      
        }
        catch (Exception e)
        {
            CoID=null;
        }
        finally{con.close();}
        return CoID;
    }
    
    public static boolean getExtraPass(String adminType, String authType,String pass) throws NamingException, SQLException
    {
        Connection con=getConnect();
        boolean go=false;
        try
        {
            String tempPass=null;
            
            String sql1 = "select password from extrapass where adminType='"+adminType+"' and authType='"+authType+"'";
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            ResultSet rs1 = stmt1.executeQuery();
            while (rs1.next())
            {
                tempPass=rs1.getString("password");
            }
            stmt1.close();rs1.close();
            if(pass.equals(tempPass))
            {
                go=true;
            }
            
        }
        catch (Exception e)
        {
            go=false;
        }
        finally{con.close();}
        return go;
    }
    
    public static String ChkUserPass(String un,String pass,String cat) throws NamingException, SQLException
    {
        Connection con=getConnect();
//        boolean go=false;
        String retID=null;
        try
        {
            String tempPass=null;
            String logCat="login"+cat;
            
            String sql1 = "select password from "+logCat+" where userName='"+un+"'";
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            ResultSet rs1 = stmt1.executeQuery();
            while (rs1.next())
            {
                tempPass=rs1.getString("password");
            }
            stmt1.close();rs1.close();
            
            
            
            if(pass.equals(tempPass))
            {
                
                
                String id=null;
                if(cat.equals("college"))
                    id="CID";
                else if(cat.equals("vender"))
                    id="VID";
                else if(cat.equals("contractor"))
                    id="CoID";
                
                String sql2 = "select "+id+" from "+cat+" where Email='"+un+"'";
                PreparedStatement stmt2 = con.prepareStatement(sql2);
                ResultSet rs2 = stmt2.executeQuery();
                while (rs2.next())
                {
                    retID=rs2.getString(id);
                }
                stmt2.close();rs2.close();
                
            }
            
        }
        catch (Exception e)
        {
            retID=null;
        }
        finally{con.close();}
        return retID;
    }
    
    
}
