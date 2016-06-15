/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author divinity
 */
public class DBConnection {
    public static Connection createConnection() throws NamingException, SQLException
    {
        InitialContext initialContext = new InitialContext();
        Context context = (Context) initialContext.lookup("java:comp/env");
        DataSource ds = (DataSource) context.lookup("pdea");
        Connection con = ds.getConnection();
        return con;    
    }
    
}
