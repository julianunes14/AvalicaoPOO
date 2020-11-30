package fatec;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.Listener;

public class Disciplina {
    private int id;
    private String nome;
    private String ementa;
    private int ciclo;
    private int nota;
    
    public Disciplina(){
    
    }
    
    public Disciplina(int id, String nome, String ementa, int ciclo, int nota){
        this.id = id;
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }
    
    public static ArrayList<Disciplina> getList() throws Exception{
        ArrayList<Disciplina> list = new ArrayList<>();
        
        Connection con = null; 
        Statement stmt = null; 
        ResultSet rs = null;
        
        Exception methodException = null;
        
        try{
            con = Listener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM disciplinas");
            
            while(rs.next()){
                list.add(new Disciplina(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getString("ementa"),
                        rs.getInt("ciclo"),
                        rs.getInt("nota")
                ));
            }
            
        } catch(Exception ex){
            methodException = ex;
            
        } finally {
            try{ rs.close(); } catch( Exception ex2 ){}
            try{ stmt.close(); } catch( Exception ex2 ){}
            try{ con.close(); } catch( Exception ex2 ){}
        }
        
        if( methodException != null ) throw methodException;
        
        return list;
    }
    
    public static void insert(String nome, String ementa, int ciclo) throws Exception{
        Connection con = null; 
        PreparedStatement stmt = null; 
        ResultSet rs = null;
        
        Exception methodException = null;
        
        try{
            con = Listener.getConnection();
            stmt = con.prepareStatement("INSERT INTO disciplinas(nome, ementa, ciclo) values(?,?,?)");
            
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setInt(3, ciclo);
            
            stmt.execute();
            
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        
        if(methodException!=null) throw methodException;
    }
    
    public static void update(int nota, int id) throws Exception{
        Connection con = null; 
        PreparedStatement stmt = null; 
        ResultSet rs = null;
        
        Exception methodException = null;
        
        try{
            con = Listener.getConnection();
            stmt = con.prepareStatement("UPDATE disciplinas SET nota=? WHERE id=?");
            
            stmt.setInt(1, nota);
            stmt.setInt(2, id);
            
            stmt.execute();
            
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        
        if(methodException!=null) throw methodException;
    }
    
    public static void delete(int id) throws Exception{
        Connection con = null; 
        PreparedStatement stmt = null; 
        ResultSet rs = null;
        
        Exception methodException = null;
        
        try{
            con = Listener.getConnection();
            stmt = con.prepareStatement("DELETE FROM disciplinas WHERE id=?");
            stmt.setInt(1, id);
            
            stmt.execute();
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        
        if(methodException!=null) throw methodException;
    }
    
    public static int total() throws Exception{
        int total = 0;
        
        Connection con = null; 
        Statement stmt = null;  
        ResultSet rs = null;
        
        Exception methodException = null;
        
        try{
            con = Listener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM disciplinas");
            
            while(rs.next()){
                total = rs.getInt(1);
            }
            
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        
        if(methodException!=null) throw methodException;
        
        return total;
    }
    
    public int getId(){
        return this.id;
    }
    
    public String getNome(){
        return this.nome;
    }
    
    public String getEmenta(){
        return this.ementa;
    }
    
    public int getCiclo(){
        return this.ciclo;
    }
    
    public int getNota(){
        return this.nota;
    }
    
    public void setNota(int nota){
        this.nota = nota;
    }
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS disciplinas("
                    + "id INTEGER PRIMARY KEY,"
                    + "nome VARCHAR(50) NOT NULL,"
                    + "ementa VARCHAR(200) NOT NULL,"
                    + "ciclo INTEGER NOT NULL,"
                    + "nota INTEGER DEFAULT 0"
                + ")";
    }
    
}
