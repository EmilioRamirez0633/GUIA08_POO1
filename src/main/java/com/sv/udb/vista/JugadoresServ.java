/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.vista;

import com.sv.udb.controlador.JugadoresCtrl;
import com.sv.udb.modelo.Jugadores;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author leyes
 */
@MultipartConfig
@WebServlet(name = "JugadoresServ", urlPatterns = {"/JugadoresServ"})
public class JugadoresServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            boolean esValido = request.getMethod().equals("POST");
            String mens = "";
            if(!esValido){
                response.sendRedirect(request.getContextPath() + "/jugadores.jsp");
            }
            else{
                  String CRUD = request.getParameter("btnJuga");
            if(CRUD.equals("Guardar"))
            {      
                Jugadores obje = new Jugadores();
                obje.setNombreJ(request.getParameter("nomb"));
                obje.setIdEquipo(Integer.parseInt(request.getParameter("equi")));
                obje.setEdad(request.getParameter("edad"));
                obje.setAltura(Integer.parseInt(request.getParameter("altu")));
                obje.setPeso(request.getParameter("pes"));
                Part filePart = request.getPart("img");
                int fotoSize = (int)filePart.getSize();
                byte[] foto = null;
                foto = new byte[fotoSize];
                try(DataInputStream dataImg = new DataInputStream(filePart.getInputStream()))
                {
                    dataImg.readFully(foto);
                }
                obje.setImg(foto);
                
                if(new JugadoresCtrl().guar(obje))
                {
                    mens = "Datos guardados";
                }
                else
                {
                    mens = "Error al guardar";
                } 
            }
            else if(CRUD.equals("Consultar"))
            {
                int codi = Integer.parseInt(request.getParameter("codiJugaRadio").isEmpty() ? "-1" : request.getParameter("codiJugaRadio"));
                Jugadores obje = new JugadoresCtrl().cons(codi);
                if(obje != null)
                {
                    request.setAttribute("codi", obje.getId());
                    request.setAttribute("nomb", obje.getNombreJ());
                    request.setAttribute("altu", obje.getAltura());
                    request.setAttribute("edad", obje.getEdad());
                    request.setAttribute("pes", obje.getPeso());
                }
                else
                {
                    mens = "Error al consultar";
                }
            }
            else if(CRUD.equals("Eliminar"))
            {
                 Jugadores obje = new Jugadores();
                int codi = Integer.parseInt(request.getParameter("codiJugaRadio").isEmpty() ? "-1" : request.getParameter("codiJugaRadio"));
                obje.setId(codi);
                if(new JugadoresCtrl().elim(obje))
                {mens = "Datos eliminados";
                   
                }
                else
                {
                    mens = "Error al consultar";
                }
            }
             else if(CRUD.equals("Modificar"))
            {
                 Jugadores obje = new Jugadores();
                obje.setId(Integer.parseInt(request.getParameter("codi")));
                obje.setNombreJ(request.getParameter("nomb"));
                obje.setIdEquipo(Integer.parseInt(request.getParameter("equi")));
                obje.setEdad(request.getParameter("edad"));
                obje.setAltura(Integer.parseInt(request.getParameter("altu")));
                obje.setPeso(request.getParameter("pes"));
                if(new JugadoresCtrl().modi(obje))
                {mens = "Datos modifcados";
                   
                }
                else
                {
                    mens = "Error al modificar";
                }
            }     
            request.setAttribute("mensAler",mens);
            request.getRequestDispatcher("/jugadores.jsp").forward(request, response);
            
            }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
