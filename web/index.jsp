<%@page import="fatec.Disciplina" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <style>
    body {
    background-color: #93B874;
    }
    h1 {
    background-color: #00b33c;
    }
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>
        <%@include file="WEB-INF/componentes/menu.jspf" %>
        <h1>Julia Gabrielle Luciano Nunes</h1>
        <p>RA: 	1290481912044</p>
        <p>Total de disciplinas: <%=Disciplina.total()%></p>
    </body>
</html>
