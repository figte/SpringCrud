
package com.personal.dao;

import com.personal.data.HibernateUtil;
import com.personal.idao.IProductoDao;
import com.personal.modelos.Persona;
import com.personal.modelos.Producto;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class ProductosDaoHibernate implements IProductoDao{

    Session session;
    SessionFactory sessionFactory;

    public ProductosDaoHibernate() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    
    @Override
    public List<Producto> listar() {
         List<Producto> lista = new ArrayList<Producto>();
        session = sessionFactory.openSession();
        try {

            // Getting Transaction Object From Session Object
            session.beginTransaction();

            lista = session.createNamedQuery("Producto.findAll").list();
        } catch (Exception sqlException) {
            if (null != session.getTransaction()) {
                //  logger.info("\n.......Transaction Is Being Rolled Back.......\n");
                session.getTransaction().rollback();
            }
            sqlException.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            return lista;
        }
    }

    @Override
    public Producto obtenerById(int id) {
       
           Producto p = null;
        session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            p = session.get(Producto.class, id);
            session.getTransaction().commit();
            session.close();
            return p;
        } catch (Exception e) {
            session.getTransaction().rollback();
            session.clear();
            session.close();
            return null;

        }
    }

    @Override
    public Boolean guardar(Producto producto) {
        
        session = sessionFactory.openSession();

        session.beginTransaction();

        try {
            Producto p = new Producto();
            p.setNombre(producto.getNombre());
            p.setExistencias(producto.getExistencias());
            p.setPrecio(producto.getPrecio());
            

            session.save(p);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            session.clear();
            session.close();
            return false;

        }
    }

    @Override
    public Boolean modificar(Producto producto) {
        session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            session.update(producto);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            session.clear();
            session.close();
            return false;

        }
    }

    @Override
    public Boolean eliminar(Producto producto) {
         session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            session.remove(producto);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            session.clear();
            session.close();
            return false;

        }
    }
    
}
