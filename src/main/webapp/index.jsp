<%@page import="java.util.Base64"%>
<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<%-- language maneja el idioma actual --%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.me.jsp.bundle.Internacionalizacion" />
<html>
    
    <body>
        <head>
            
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Guía 08 :::: POO1</title>
            <link rel='stylesheet' href='webjars/materialize/0.97.3/dist/css/materialize.min.css'>
             <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <script type="text/javascript" src="webjars/jquery/2.1.4/jquery.min.js"></script>
            <script type="text/javascript" src="webjars/materialize/0.97.3/dist/js/materialize.min.js"></script>
        </head>
        <div class="container">
            
             <form>
                <fmt:message key="label.select_language" />: 
                <select id="language" name="language" onchange="submit();">
                   <option value="es_ES" 
                     <c:if test="${language=='es_ES'}">selected</c:if>>
                     <fmt:message key="label.spanish" />
                   </option>
                   <option value="en_US" 
                     <c:if test="${language=='en_US'}">selected</c:if>>
                     <fmt:message key="label.english" />
                   </option>
                </select>
            </form>
              <br />
            <li><a href="jugadores.jsp">Jugadores</a></li>
            <h1>${mensAler}</h1>
            <form method="POST" action="EquiposServ" name="Demo" enctype="multipart/form-data">
                <label>Id:</label>
                <input type="text" name="codi" id="codi" value="${codi}"/>
                 <label>Nombre:</label>
                <input type="text" name="nomb" id="nomb" value="${nomb}"/>
                 <label>Descripcion:</label>
                <input type="text" name="desc" id="desc" value="${desc}"/><br/>
                <div class='input-field col s12 m12 l12'>
                        <div class="file-field input-field">
                            <button class="btn red darken-2">
                            <i class="material-icons">insert_photo</i>
                            <input type="file" name="img" id="img" required/>
                            </button>
                            <div class="file-path-wrapper">
                            <input class="file-path validate" name="img" type="text" value="${ima}" placeholder='1200x1200px máx., 2MB máx., PNG/JPG/GIF '>
                            </div>  
                        </div>
                    </div>
                <button class="btn waves-effect waves-light" type="submit" name="btnEqui" value="Guardar">Guardar
                        <i class="material-icons right">send</i>
                 </button>
                 <button class="btn waves-effect waves-light" type="submit" name="btnEqui" value="Modificar">Modificar
                        <i class="material-icons right">send</i>
                 </button>
            </form>
             <h1>La Tabla</h1>  
             <form method="POST" action="EquiposServ" name="Tabla">                                                                                  
                 <table>
                    <thead>
                      <tr>
                          <th>Seleccion:</th>
                          <th>Nombre:</th>
                          <th>Descripcion:</th>
                      </tr>
                    </thead>

                    <tbody>
                       </tr>
                            <%
                             for(Equipos temp : new EquiposCtrl().consTodo())
                             {
                                  byte[] photo = temp.getImg();
                                  String bphoto = Base64.getEncoder().encodeToString(photo);
                            %>        
                            <tr>
                                 
                                <td><p><input name="codiEquiRadi"  type="radio" value="<%=temp.getCodiEqui()%>" id="<%=temp.getCodiEqui()%>" /><label for="<%=temp.getCodiEqui()%>"></label></p></td>
                                <td><%=temp.getNombreEqui()%></td>
                                <td><%=temp.getDescEqui()%></td>
                                 <td><img src="data:image/*;base64,<%=bphoto%>" class="materialboxed" width="100" height="100"></td>

                            </tr>
                            <%
                             }
                            %>
                    </tbody>
                  </table>
                     <button class="btn waves-effect waves-light" type="submit" name="btnEqui" value="Consultar">Consultar
                        <i class="material-icons right">send</i>
                     </button>
                    <button class="btn waves-effect waves-light" type="submit" name="btnEqui" value="Eliminar">Eliminar
                        <i class="material-icons right">delete</i>
                     </button>
             </form>
                    
         </div>
    </body>
</html>
