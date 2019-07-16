/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.personal.modelos;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author FIGTE
 */
@Entity
@Table(name = "detalles_ventas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetallesVenta.findAll", query = "SELECT d FROM DetallesVenta d"),
    @NamedQuery(name = "DetallesVenta.findById", query = "SELECT d FROM DetallesVenta d WHERE d.id = :id"),
    @NamedQuery(name = "DetallesVenta.findByCantidad", query = "SELECT d FROM DetallesVenta d WHERE d.cantidad = :cantidad")})
public class DetallesVenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad")
    private int cantidad;
    @JoinColumn(name = "idProducto", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Producto idProducto;
    @JoinColumn(name = "idVenta", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Venta idVenta;

    public DetallesVenta() {
    }

    public DetallesVenta(Integer id) {
        this.id = id;
    }

    public DetallesVenta(Integer id, int cantidad) {
        this.id = id;
        this.cantidad = cantidad;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Producto getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Producto idProducto) {
        this.idProducto = idProducto;
    }

    public Venta getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(Venta idVenta) {
        this.idVenta = idVenta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetallesVenta)) {
            return false;
        }
        DetallesVenta other = (DetallesVenta) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.personal.modelos.DetallesVenta[ id=" + id + " ]";
    }
    
}
