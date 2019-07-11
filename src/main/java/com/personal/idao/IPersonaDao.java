
package com.personal.idao;

import com.personal.modelos.Persona;
import java.util.List;


public interface IPersonaDao {
    public List<Persona> listar();

    public Persona obtenerById(int id);
    
    public Boolean guardar(Persona persona);

    public Boolean modificar(Persona persona);

    public Boolean eliminar(Persona persona);  
}
