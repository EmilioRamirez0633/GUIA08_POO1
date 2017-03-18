/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.modelo;

/**
 *
 * @author leyes
 */
public class Partidos {
    private String Equipos;
    private int Codigos;
    private int codigo;
    private int codigoEquipoA;
    private String nombreEquipoA;
    private int codigoEquipoB;
    private String nombreEquipoB;
    private int marcadorEquipoA;
    private int marcadorEquipoB;
    private String fecha;
    private String hora;
    private String lugar;

    public Partidos(int codigo, int codigoEquipoA, String nombreEquipoA, int codigoEquipoB, String nombreEquipoB, int marcadorEquipoA, int marcadorEquipoB, String fecha, String hora, String lugar) {
        this.codigo = codigo;
        this.codigoEquipoA = codigoEquipoA;
        this.nombreEquipoA = nombreEquipoA;
        this.codigoEquipoB = codigoEquipoB;
        this.nombreEquipoB = nombreEquipoB;
        this.marcadorEquipoA = marcadorEquipoA;
        this.marcadorEquipoB = marcadorEquipoB;
        this.fecha = fecha;
        this.hora = hora;
        this.lugar = lugar;
    }

    public String getNombreEquipoA() {
        return nombreEquipoA;
    }

    public void setNombreEquipoA(String nombreEquipoA) {
        this.nombreEquipoA = nombreEquipoA;
    }

    public String getNombreEquipoB() {
        return nombreEquipoB;
    }

    public void setNombreEquipoB(String nombreEquipoB) {
        this.nombreEquipoB = nombreEquipoB;
    }

    

    

    public String getEquipos() {
        return Equipos;
    }

    public void setEquipos(String Equipos) {
        this.Equipos = Equipos;
    }

    public int getCodigos() {
        return Codigos;
    }

    public void setCodigos(int Codigos) {
        this.Codigos = Codigos;
    }

    public Partidos(int Codigos,String Equipos) {
        this.Equipos = Equipos;
        /*this.nombreEquipoA = Equipos;
        this.nombreEquipoB = Equipos;*/
        this.Codigos = Codigos;
        /*this.codigoEquipoA = Codigos;
        this.codigoEquipoB = Codigos;*/
    }

    @Override
    public String toString() {
        return this.Equipos;
    }


    public Partidos() {
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCodigoEquipoA() {
        return codigoEquipoA;
    }

    public void setCodigoEquipoA(int codigoEquipoA) {
        this.codigoEquipoA = codigoEquipoA;
    }

    public int getCodigoEquipoB() {
        return codigoEquipoB;
    }

    public void setCodigoEquipoB(int codigoEquipoB) {
        this.codigoEquipoB = codigoEquipoB;
    }

    public int getMarcadorEquipoA() {
        return marcadorEquipoA;
    }

    public void setMarcadorEquipoA(int marcadorEquipoA) {
        this.marcadorEquipoA = marcadorEquipoA;
    }

    public int getMarcadorEquipoB() {
        return marcadorEquipoB;
    }

    public void setMarcadorEquipoB(int marcadorEquipoB) {
        this.marcadorEquipoB = marcadorEquipoB;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }
}
