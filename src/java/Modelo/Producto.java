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
public class Producto {
    
    private int producto_id;
    private String producto_nombre;
    private int cadegoria_id;
    private String producto_detalle;
    private double producto_precio;
    private double producto_descuento;
    private double producto_precio_venta;
    private String producto_foto;
    private int cantidad;

    public Producto(int producto_id, String producto_nombre, int cadegoria_id, String producto_detalle, double producto_precio, double producto_descuento, String producto_foto,double producto_precioFinal ) {
        this.producto_id = producto_id;
        this.producto_nombre = producto_nombre;
        this.cadegoria_id = cadegoria_id;
        this.producto_detalle = producto_detalle;
        this.producto_precio = producto_precio;
        this.producto_descuento = producto_descuento;
        this.producto_foto = producto_foto;
        this.producto_precio_venta=producto_precioFinal;
        
        
    }

    public Producto(int producto_id, String producto_nombre, int cadegoria_id, String producto_detalle, double producto_precio, double producto_descuento, String producto_foto, int cantidad,double producto_precioFinal ) {
        this.producto_id = producto_id;
        this.producto_nombre = producto_nombre;
        this.cadegoria_id = cadegoria_id;
        this.producto_detalle = producto_detalle;
        this.producto_precio = producto_precio;
        this.producto_descuento = producto_descuento;
        this.producto_foto = producto_foto;
        this.cantidad = cantidad;
        this.producto_precio_venta=producto_precioFinal;
    }

    public double getProducto_precio_venta() {
        return producto_precio_venta;
    }

    public void setProducto_precio_venta(double producto_precio_venta) {
        this.producto_precio_venta = producto_precio_venta;
    }
    
    
    

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    

    

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public String getProducto_nombre() {
        return producto_nombre;
    }

    public void setProducto_nombre(String producto_nombre) {
        this.producto_nombre = producto_nombre;
    }

    public int getCadegoria_id() {
        return cadegoria_id;
    }

    public void setCadegoria_id(int cadegoria_id) {
        this.cadegoria_id = cadegoria_id;
    }

    public String getProducto_detalle() {
        return producto_detalle;
    }

    public void setProducto_detalle(String producto_detalle) {
        this.producto_detalle = producto_detalle;
    }

    public double getProducto_precio() {
        return producto_precio;
    }

    public void setProducto_precio(double producto_precio) {
        this.producto_precio = producto_precio;
    }

    public double getProducto_descuento() {
        return producto_descuento;
    }

    public void setProducto_descuento(double producto_descuento) {
        this.producto_descuento = producto_descuento;
    }

    public String getProducto_foto() {
        return producto_foto;
    }

    public void setProducto_foto(String producto_foto) {
        this.producto_foto = producto_foto;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Producto other = (Producto) obj;
        if (this.producto_id != other.producto_id) {
            return false;
        }
        return true;
    }
    
    
    
    
    
}
