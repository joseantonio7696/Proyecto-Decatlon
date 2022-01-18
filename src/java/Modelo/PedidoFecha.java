/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Date;

/**
 *
 * @author josea
 */
public class PedidoFecha {
    
    private int pedidoId;
    private Date pedidoFecha;
    private String usuarioNombre;
    private String usuarioApellidos;
    private double pedidoTotal;
    

    public PedidoFecha(int pedidoId, Date pedidoFecha, String usuarioNombre, String usuarioApellidos, double pedidoTotal) {
        this.pedidoId = pedidoId;
        this.pedidoFecha = pedidoFecha;
        this.usuarioNombre = usuarioNombre;
        this.usuarioApellidos = usuarioApellidos;
        this.pedidoTotal = pedidoTotal;
        
    }

    public int getPedidoId() {
        return pedidoId;
    }

    public void setPedidoId(int pedidoId) {
        this.pedidoId = pedidoId;
    }

    public Date getPedidoFecha() {
        return pedidoFecha;
    }

    public void setPedidoFecha(Date pedidoFecha) {
        this.pedidoFecha = pedidoFecha;
    }

    public String getUsuarioNombre() {
        return usuarioNombre;
    }

    public void setUsuarioNombre(String usuarioNombre) {
        this.usuarioNombre = usuarioNombre;
    }

    public String getUsuarioApellidos() {
        return usuarioApellidos;
    }

    public void setUsuarioApellidos(String usuarioApellidos) {
        this.usuarioApellidos = usuarioApellidos;
    }

    public double getPedidoTotal() {
        return pedidoTotal;
    }

    public void setPedidoTotal(double pedidoTotal) {
        this.pedidoTotal = pedidoTotal;
    }
  
}
