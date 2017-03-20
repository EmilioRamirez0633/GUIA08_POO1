<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    
    <body>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Guía 08 :::: POO1</title>
            <!--<link rel='stylesheet' href='webjars/materialize/0.97.3/css/materialize.min.css'>
            <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
            <script type="text/javascript" src="webjars/materialize/0.97.3/js/materialize.min.js"></script-->
        </head>
        <li><a href="jugadores.jsp">Jugadores</a></li>
        <h1>${mensAler}</h1>
        <form method="POST" action="EquiposServ" name="Demo">
            <label>Id:</label>
            <input type="text" name="codi" id="codi" value="${codi}"/>
             <label>Nombre:</label>
            <input type="text" name="nomb" id="nomb" value="${nomb}"/>
             <label>Descripcion:</label>
            <input type="text" name="desc" id="desc" value="${desc}"/><br/>
            <input type="submit" name="btnEqui" value="Guardar"/>
            <input type="submit" name="btnEqui" value="Modificar"/>
        </form>
         <h1>La Tabla</h1>  
         <form method="POST" action="EquiposServ" name="Tabla">                                                                                  
            <table border="1">
                <tr>
                    <th>Cons</th>
                    <th>Nombre</th>
                    <th>Duracion</th>
                </tr>
                <%
                 for(Equipos temp : new EquiposCtrl().consTodo())
                 {
                %>     
                <tr>
                    <td><input type="radio" name="codiEquiRadi" value="<%=temp.getCodiEqui()%>"></td>
                    <td><%=temp.getNombreEqui()%></td>
                    <td><%=temp.getDescEqui                                        ()%></td>
                </tr>
                <%
                 }
                %>
            </table>
            <input type="submit" name="btnEqui" value="Consultar"/>
            <input type="submit" name="btnEqui" value="Eliminar"/>
         </form>
    </body>
</html>
