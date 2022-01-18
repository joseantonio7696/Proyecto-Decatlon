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
public class Pedido {
    
    private int idPedido;
    private Date fechaPedido;
    private int usuarioId;
    private int costeTotalPedido;

    public Pedido(int idPedido, Date fechaPedido, int usuarioId, int costeTotalPedido) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.usuarioId = usuarioId;
        this.costeTotalPedido = costeTotalPedido;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Date getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public int getCosteTotalPedido() {
        return costeTotalPedido;
    }

    public void setCosteTotalPedido(int costeTotalPedido) {
        this.costeTotalPedido = costeTotalPedido;
    }
    
    
    
    
    
    
}
