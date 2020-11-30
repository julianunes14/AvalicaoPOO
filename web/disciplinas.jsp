<%@page import="fatec.Disciplina" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/componentes/menu.jspf" %>
        <%
            Exception err = null;
            
            try{               
                if(request.getParameter("nt") != null){
                    Disciplina.update(
                            Integer.parseInt(request.getParameter("nota")),
                            Integer.parseInt(request.getParameter("id"))
                            
                    );
                    response.sendRedirect(request.getRequestURI());
                }
                
                if(request.getParameter("cria") != null){
                    Disciplina.insert(
                            request.getParameter("nome"),
                            request.getParameter("ementa"),
                            Integer.parseInt(request.getParameter("ciclo"))
                            
                    );
                    response.sendRedirect(request.getRequestURI());
                }
                
                if(request.getParameter("excluir") != null){
                    Disciplina.delete(
                            Integer.parseInt(request.getParameter("id"))
                    );
                    response.sendRedirect(request.getRequestURI());
                }
                
            }catch(Exception ex){ 
                err = ex;
            }
            
        %>
        <form>
            <input type="text" placeholder="Disciplina" name="nome">
            <input type="text" placeholder="Ementa" name="ementa">
            <input type="number" placeholder="Ciclo" name="ciclo">
            <input type="submit" name="cria" value="Criar">
        </form>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
                <th>Editar Nota</th>
                <th>Ação</th>
            </tr>
            <% for(Disciplina disciplina : Disciplina.getList()){ %>
                <tr>
                    <td><%=disciplina.getNome()%></td>
                    <td><%=disciplina.getEmenta()%></td>
                    <td><%=disciplina.getCiclo()%></td>
                    <td><%=disciplina.getNota()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%=disciplina.getId()%>">
                            <input type="number" name="nota" required>
                            <input type="submit" name="nt" value="Alterar">
                        </form> 
                    </td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%=disciplina.getId()%>">
                            <input type="submit" name="excluir" value="Excluir">
                        </form> 
                    </td>
                </tr>
            <% } %>
        </table>
    </body>
</html>