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

    

public class Jugadores {
    private int id;
    private String nombreJ;
    private String equipo;
    private int idEquipo;

    private String edad;
    private int altura;

    public int getAltura() {
        return altura;
    }

    public void setAltura(int altura) {
        this.altura = altura;
    }
    private String peso;
    
     @Override
    public String toString() {
        return this.equipo ;
    }

    public String getNombreJ() {
        return nombreJ;
    }

    public void setNombreJ(String nombreJ) {
        this.nombreJ = nombreJ;
    }

    public Jugadores(int id, int idEquipo, String equipo, String nombreJ, String edad, int altura, String peso) {
        this.id = id;
        this.nombreJ = nombreJ;
        this.equipo = equipo;
        this.idEquipo = idEquipo;
        this.edad = edad;
        this.altura = altura;
        this.peso = peso;
    }
    
    public Jugadores(String equipo, int idEquipo) {
        this.equipo = equipo;
        this.idEquipo = idEquipo;
    }

    public Jugadores() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    
    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }
}
