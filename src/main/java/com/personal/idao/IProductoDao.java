
package com.personal.idao;

import com.personal.modelos.Producto;
import java.util.List;

public interface IProductoDao {
    public List<Producto> listar();

    public Producto obtenerById(int id);
    
    public Boolean guardar(Producto producto);

    public Boolean modificar(Producto producto);

    public Boolean eliminar(Producto producto); 
}
