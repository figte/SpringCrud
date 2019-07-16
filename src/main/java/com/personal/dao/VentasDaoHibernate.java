
package com.personal.dao;

import com.personal.data.HibernateUtil;
import com.personal.idao.IVentaDao;
import com.personal.modelos.Persona;
import com.personal.modelos.Venta;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class VentasDaoHibernate implements IVentaDao{

    Session session;
    SessionFactory sessionFactory;

    public VentasDaoHibernate() {
        sessionFactory=HibernateUtil.getSessionFactory();
       
    }
    
    
    @Override
    public List<Venta> listar() {
       List<Venta> lista = new ArrayList<Venta>();
        session = sessionFactory.openSession();
        try {

            // Getting Transaction Object From Session Object
            session.beginTransaction();

            lista = session.createNamedQuery("Venta.findAll").list();
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
    public Venta obtenerById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Boolean guardar(Venta persona) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Boolean modificar(Venta persona) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Boolean eliminar(Venta persona) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
