
package com.personal.servicios;

import com.personal.data.HibernateUtil;
import com.personal.modelos.Usuario;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import sun.security.provider.MD5;

public class UsuariosServices {
    
    Session s;
    SessionFactory sf;

    public UsuariosServices() {
        sf=HibernateUtil.getSessionFactory();
    }
      
    public Boolean validarUsuario(String name, String pass){
        s=sf.openSession();
        try {
            s.beginTransaction();
            //En caso este encriptada la contrasenia
           // pass=UtilServices.encriptar(pass);
            List<Usuario> l=(List<Usuario>) s.createNativeQuery("select * from usuarios u where u.username='"+name+"' and u.password='"+pass+"'").list();
            
            if(l.size()>0){
                System.out.println("si existe el usuario");
               return true;
            }else{
                System.out.println("no existe el usuario");
                return false;
            }
        } catch (Exception e) {
            System.err.println("Error al comparar:"+e.getMessage());
            return false;
        }
    }
}
