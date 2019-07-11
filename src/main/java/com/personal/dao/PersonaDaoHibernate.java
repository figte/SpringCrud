/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.personal.dao;

import com.personal.data.HibernateUtil;
import com.personal.idao.IPersonaDao;
import com.personal.modelos.Persona;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author FIGTE
 */
public class PersonaDaoHibernate implements IPersonaDao{

     Session session;
    SessionFactory sessionFactory;

    public PersonaDaoHibernate() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    @Override
    public List<Persona> listar() {
         List<Persona> lista = new ArrayList<Persona>();
        session = sessionFactory.openSession();
        try {

            // Getting Transaction Object From Session Object
            session.beginTransaction();

            lista = session.createNamedQuery("Persona.findAll").list();
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
    public Persona obtenerById(int id) {
         Persona p = null;
        session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            p = session.get(Persona.class, id);
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
    public Boolean guardar(Persona persona) {
          session = sessionFactory.openSession();

        session.beginTransaction();

        try {
            Persona p = new Persona();
            p.setNombre(persona.getNombre());
            p.setApellidos(persona.getApellidos());
            p.setEdad(persona.getEdad());
            p.setDireccion(persona.getDireccion());

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
    public Boolean modificar(Persona persona) {
        session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            session.update(persona);
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
    public Boolean eliminar(Persona persona) {
        
         session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            session.remove(persona);
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
