<%-- 
    Document   : disciplina
    Created on : 03/10/2020, 23:30:51
    Author     : Júlia Nunes
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Disciplina" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Disciplina>minhasDisciplinas= Disciplina.getList((ArrayList)application.getAttribute("disciplinaList"));
     if(request.getParameter("alterar")!=null){
        int i = Integer.parseInt(request.getParameter("i"));
        Double nota = Double.parseDouble(request.getParameter("nota"));
        if(nota>=0 && nota<=10){
            minhasDisciplinas.get(i).setNota(nota);
            response.sendRedirect(request.getRequestURI());
        }
        else{
            out.print("<script>alert('Mensagem de retorno');</script>");
        }
     }
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/componentes/menu.jspf" %>
        <h1>Materias</h1>
        <table border ="1">
            <tr>
                <th>Nome</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota Atual</th>
                <th>Alterar Nota</th>
         
            
            <%for(int i =0; i<minhasDisciplinas.size();i++){%>
                <%Disciplina u = minhasDisciplinas.get(i);%>
                <td><%= u.getNome()%></td>
                <td><%= u.getEmenta()%></td>
                <td><%= u.getCiclo()%></td>
                <td><%= u.getNota()%></td>
                <td>
                    <form>
                        
                        <input type="hidden" name="i" value="<%=i%>" />
                        <input type ="text" name="nota" />     
                        <input type ="submit" name="alterar" value="Alterar" />  
                        
                        
                        
                    </form>
                   
                </td>
            
        </tr>
            
        <%}%>  
            
            
            
            
            
            
        </table>
    </body>
</html>
