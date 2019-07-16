
package com.personal.idao;

import com.personal.modelos.Venta;
import java.util.List;

public interface IVentaDao {
    public List<Venta> listar();

    public Venta obtenerById(int id);
    
    public Boolean guardar(Venta persona);

    public Boolean modificar(Venta persona);

    public Boolean eliminar(Venta persona); 
}
