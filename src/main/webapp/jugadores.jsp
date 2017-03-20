<%-- 
    Document   : jugadores
    Created on : 03-19-2017, 09:59:07 AM
    Author     : leyes
--%>

<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page import="com.sv.udb.controlador.JugadoresCtrl"%>
<%@page import="com.sv.udb.modelo.Jugadores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <li><a href="index.jsp">Equipos</a></li>
        <h1>${mensAler}</h1>
        <form method="POST" action="JugadoresServ" name="Demo"></br>
            <label>Id:</label>
            <input type="text" name="codi" id="codi" value="${codi}"/></br>
             <label>Nombre:</label>
            <input type="text" name="nomb" id="nomb" value="${nomb}"/></br>
             <label>Equipo:</label>
            <select name="equi" id="equi">
                <%
                     for(Equipos temp : new EquiposCtrl().consTodo())
                 {
                %>
                 <option value="<%=temp.getCodiEqui()%>"><%=temp.getNombreEqui()%></option>
                 <%
                  }
                 %>
             </select></br>
             <label>Edad:</label>
            <input type="text" name="edad" id="edad" value="${edad}"/></br>
            <label>Altura:</label>
            <input type="text" name="altu" id="altu" value="${altu}"/></br>
            <label>Peso:</label>
            <input type="text" name="pes" id="pes" value="${pes}"/></br>
            
            <input type="submit" name="btnJuga" value="Guardar"/>
            <input type="submit" name="btnJuga" value="Modificar"/>
        </form>
         <h1>La Tabla</h1>  
         <form method="POST" action="JugadoresServ" name="Tabla">                                                                                  
            <table border="1">
                <tr>
                    <th>Cons</th>
                    <th>Nombre</th>
                    <th>Equipo</th>
                    <th>Edad</th>
                    <th>Altura</th>
                    <th>peso</th>
                </tr>
                <%
                 for(Jugadores temp : new JugadoresCtrl().consTodo())
                 {
                %>     
                <tr>
                    <td><input type="radio" name="codiJugaRadio" value="<%=temp.getId()%>"></td>
                    <td><%=temp.getNombreJ()%></td>
                    <td><%=temp.getEquipo()%></td>
                    <td><%=temp.getEdad()%></td>
                    <td><%=temp.getAltura()%></td>
                    <td><%=temp.getPeso()%></td>
                </tr>
                <%
                 }
                %>
            </table>
            <input type="submit" name="btnJuga" value="Consultar"/>
            <input type="submit" name="btnJuga" value="Eliminar"/>
         </form>
    </body>
</html>
