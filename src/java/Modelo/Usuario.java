/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author josea
 */
public class Usuario {
    
    private int idUsuario;
    private String nombreUsuario;
    private String apellidoUsuario;
    private String tipoUsuario;  
    private String email;
    private String pass;
    private String direccion;
    private int telefono;

    public Usuario(int idUsuario, String nombreUsuario, String apellidoUsuario, String tipoUsuario, String email, String pass, String direccion, int telefono) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.tipoUsuario = tipoUsuario;
        this.email = email;
        this.pass = pass;
        this.direccion = direccion;
        this.telefono = telefono;
    }
    
    

    public Usuario(String nombreUsuario, String apellidoUsuario, String email, String pass, String direccion, int telefono) {
        this.idUsuario = 0;
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.tipoUsuario = "Cliente";
        this.email = email;
        this.pass = pass;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getApellidoUsuario() {
        return apellidoUsuario;
    }

    public void setApellidoUsuario(String apellidoUsuario) {
        this.apellidoUsuario = apellidoUsuario;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
    
    
    
    
    
    
}
