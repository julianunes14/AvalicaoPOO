<%-- 
    Document   : index
    Created on : 03/10/2020, 23:31:51
    Author     : Júlia Nunes
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Disciplina" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Disciplina> disciplinaList = (ArrayList)application.getAttribute("disciplinaList");
    if(disciplinaList == null){
        disciplinaList = new ArrayList<>();
        
        disciplinaList.add(new Disciplina("Banco de dados","Conceitos de Base de Dados. Modelos conceituais de informações. ", "4"));
        disciplinaList.add(new Disciplina("Engenharia de Software III","Conceitos, evolução e importância de arquitetura de software. ", "4"));
        disciplinaList.add(new Disciplina("Programacao Orientada a Objetos","Conceitos e evolução da tecnologia de orientação a objetos. ", "4"));
        disciplinaList.add(new Disciplina("Linguagem de Programacao IV","Comandos de linguagens usadas na construção e estruturação de sites para a Web, com páginas dinâmi­cas e interativas.", "4"));disciplinaList.add(new Disciplina("Banco de dados","Conceitos de Base de Dados. Modelos conceituais de informações. ", "4"));
        disciplinaList.add(new Disciplina("Sistemas Operacionais II","Apresentação de um sistema operacional específico utilizado em ambiente corporativo. ", "4"));
        disciplinaList.add(new Disciplina("Ingles IV","Consolidação da compreensão e produção oral e escrita por meio da integração das habilidades lingüístico-comunicativas desenvolvidas na disciplina Inglês 3. ", "4"));
        disciplinaList.add(new Disciplina("Metodologia da Pesquica Cientifico -Tecnologica","O Papel da ciência e da tecnologia. Tipos de conhecimento. Método e técnica. ", "4"));
        
        application.setAttribute("disciplinaList", disciplinaList);
    }



    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Avaliacao POO</h1>
        <h2>Julia Gabrielle Luciano Nunes</h2>
        <h3>RA: 1290481912044</h3>
        <h3>
            
            Total de Disciplinas: <%= Disciplina.getList(disciplinaList).size()%>
            
        </h3>
    </body>
</html>
