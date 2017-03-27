<%-- 
    Document   : jugadores
    Created on : 03-19-2017, 09:59:07 AM
    Author     : leyes
--%>

<%@page import="java.util.Base64"%>
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
         <link rel='stylesheet' href='webjars/materialize/0.97.3/dist/css/materialize.min.css'>
             <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <script type="text/javascript" src="webjars/jquery/2.1.4/jquery.min.js"></script>
            <script type="text/javascript" src="webjars/materialize/0.97.3/dist/js/materialize.min.js"></script>
    </head>
    <body>
        <div class="container"> 
        <li><a href="index.jsp">Equipos</a></li>
        <h1>${mensAler}</h1>
        <form method="POST" action="JugadoresServ" name="Demo" enctype="multipart/form-data"></br>
            <label>Id:</label>
            <input type="text" name="codi" id="codi" value="${codi}"/></br>
             <label>Nombre:</label>
            <input type="text" name="nomb" id="nomb" value="${nomb}"/></br>
             <div class="input-field col s12">
                <select name="equi" id="equi">
                  <option value="" disabled selected>Choose your option</option>
                <%
                     for(Equipos temp : new EquiposCtrl().consTodo())
                 {
                %>
                 <option value="<%=temp.getCodiEqui()%>"><%=temp.getNombreEqui()%></option>
                 <%
                  }
                 %>
                 </select>
                <label>Equipos:</label>
              </div>
             </select></br>
             <label>Edad:</label>
            <input type="text" name="edad" id="edad" value="${edad}"/></br>
            <label>Altura:</label>
            <input type="text" name="altu" id="altu" value="${altu}"/></br>
            <label>Peso:</label>
            <input type="text" name="pes" id="pes" value="${pes}"/></br>
            <div class='input-field col s12 m12 l12'>
                        <div class="file-field input-field">
                            <button class="btn red darken-2">
                            <i class="material-icons">insert_photo</i>
                            <input type="file" name="img" id="img"/>
                            </button>
                            <div class="file-path-wrapper">
                            <input class="file-path validate" name="img" type="text" value="${ima}" placeholder='1200x1200px máx., 2MB máx., PNG/JPG/GIF '>
                            </div>  
                        </div>
                    </div>
                <button class="btn waves-effect waves-light" type="submit" name="btnJuga" value="Guardar">Guardar
                        <i class="material-icons right">send</i>
                 </button>
                 <button class="btn waves-effect waves-light" type="submit" name="btnJuga" value="Modificar">Modificar
                        <i class="material-icons right">send</i>
                 </button>
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
                    <th>Imagen</th>
                </tr>
                <%
                 for(Jugadores temp : new JugadoresCtrl().consTodo())
                 {
                     byte[] photo = temp.getImg();
                     String bphoto = Base64.getEncoder().encodeToString(photo);
                %>     
                <tr>
                     <td><p><input name="codiJugaRadio"  type="radio" value="<%=temp.getId()%>" id="<%=temp.getId()%>" /><label for="<%=temp.getId()%>"></label></p></td>
                    <td><%=temp.getNombreJ()%></td>
                    <td><%=temp.getEquipo()%></td>
                    <td><%=temp.getEdad()%></td>
                    <td><%=temp.getAltura()%></td>
                    <td><%=temp.getPeso()%></td>
                    <td><img src="data:image/*;base64,<%=bphoto%>" class="materialboxed" width="100" height="100"></td>
                </tr>
                <%
                 }
                %>
            </table>
            <button class="btn waves-effect waves-light" type="submit" name="btnJuga" value="Consultar">Consultar
                        <i class="material-icons right">send</i>
                     </button>
                    <button class="btn waves-effect waves-light" type="submit" name="btnJuga" value="Eliminar">Eliminar
                        <i class="material-icons right">delete</i>
                     </button>
         </form>
                    
        </div>
    </body>
    <script>
        $(document).ready(function() {
            $('select').material_select();
          });
    </script>
    
</html>
