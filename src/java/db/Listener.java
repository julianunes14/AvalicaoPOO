package db;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
        
import fatec.Disciplina;

public class Listener implements ServletContextListener {
    private static final String CLASS_NAME = "org.sqlite.JDBC";
    private static final String DB_URL = "jdbc:sqlite:/Sqlite/sqlitejava.db";
    
    public static String exceptionMessage = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(DB_URL);
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce){
        Connection con = null;
        Statement stmt = null;
        
        try{
            Class.forName(CLASS_NAME);
            con = getConnection();
            
            stmt = con.createStatement();
            
            stmt.execute(Disciplina.getCreateStatement());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }finally{
            try{stmt.close();}catch(Exception ex){}
            try{con.close();}catch(Exception ex){}
        }
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce){}
}