/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Jose Antonio
 */
public class detalleFactura {
    
    
    private int productoId;
    private String nombreProducto;
    private int cantidadProducto;
    private String nombreCategoria;
    private double precio;
    private String fotografia;

    public detalleFactura(int productoId, String nombreProducto, int cantidadProducto, String nombreCategoria, double precio, String fotografia) {
        this.productoId = productoId;
        this.nombreProducto = nombreProducto;
        this.cantidadProducto = cantidadProducto;
        this.nombreCategoria = nombreCategoria;
        this.precio = precio;
        this.fotografia = fotografia;
    }

    public int getProductoId() {
        return productoId;
    }

    public void setProductoId(int productoId) {
        this.productoId = productoId;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getCantidadProducto() {
        return cantidadProducto;
    }

    public void setCantidadProducto(int cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getFotografia() {
        return fotografia;
    }

    public void setFotografia(String fotografia) {
        this.fotografia = fotografia;
    }
    
    
    
    
}
