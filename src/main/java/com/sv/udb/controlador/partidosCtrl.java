/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.Partidos;
import com.sv.udb.recursos.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author leyes
 */
public class partidosCtrl {
    //Buscar equipos
    public List<Partidos> consPart()
    {
       List<Partidos> resp = new ArrayList();
       Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("select codi_equi, nomb_equi from equipos");
            ResultSet rs = cmd.executeQuery();
            while(rs.next())
            {
                resp.add(new Partidos(rs.getInt(1),rs.getString(2)));
            }
            //Se carga el 
        }
        catch(Exception err)
        {
            err.printStackTrace();
        }
        finally
        {
            try
            {
                if(cn!=null)
                {
                    if(!cn.isClosed())
                    {
                        cn.close();
                    }
                }
            }
            catch(SQLException err)
            {
                err.printStackTrace();
            }
        }
        return resp;
    } 
    // cargar datos
    
     public List<Partidos> consDatos()
    {
       List<Partidos> resp = new ArrayList();
       Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("select id_partido, partidos.codi_equipo_a,partidos.codi_equipo_b,equipos.nomb_equi,marcador_equipo_a, marcador_equipo_b,fecha,hora,lugar "
                    + "from equipos,partidos where partidos.codi_equipo_b = equipos.codi_equi");
            ResultSet rs = cmd.executeQuery();
            PreparedStatement cmd2 = cn.prepareStatement("select nomb_equi from partidos,equipos where partidos.codi_equipo_a = equipos.codi_equi");
            ResultSet rs2 = cmd2.executeQuery();
            while(rs.next())
            {
                resp.add(new Partidos(rs.getInt(1), rs.getInt(2),rs2.getString(1),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getString(9)));
            }
            //Se carga el 
        }
        catch(Exception err)
        {
            err.printStackTrace();
        }
        finally
        {
            try
            {
                if(cn!=null)
                {
                    if(!cn.isClosed())
                    {
                        cn.close();
                    }
                }
            }
            catch(SQLException err)
            {
                err.printStackTrace();
            }
        }
        return resp;
    } 
    // guardamos
    
    public boolean guar(Partidos obje)
    {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("INSERT INTO partidos VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)");
            cmd.setInt(1, obje.getCodigoEquipoA());
            cmd.setInt(2, obje.getCodigoEquipoB());
            cmd.setInt(3, obje.getMarcadorEquipoA());
            cmd.setInt(4, obje.getMarcadorEquipoB());
            cmd.setString(5, obje.getFecha());
            cmd.setString(6, obje.getHora());
            cmd.setString(7, obje.getLugar());
            cmd.executeUpdate();
            resp=true;
        }
        catch(Exception ex)
        {
            System.err.println("Error al guardar Equipos: " + ex.getMessage());
        }
        finally
        {
            try
            {
                if(cn!=null)
                {
                    if(!cn.isClosed())
                    {
                        cn.close();
                    }
                }
            }
            catch(SQLException err)
            {
                err.printStackTrace();
            }
        }
        return resp;
    }
}
