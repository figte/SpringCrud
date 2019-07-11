package com.personal.controladores;

import com.personal.modelos.*;
import com.personal.dao.PersonaDaoHibernate;
import com.personal.idao.IPersonaDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author FIGTE
 */
public class PersonaControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;
    IPersonaDao personaDao;

    public void init() {
        try {
            personaDao = new PersonaDaoHibernate();
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public PersonaControllerServlet() {
        super();
    }

    //METODOS DE ENRRUTAMIENTO
    //------------------------------------------------------------------------------------------------
    private void index(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/persona/ver.jsp");
        List<Persona> lista = personaDao.listar();
        request.setAttribute("lista", lista);
        dispatcher.forward(request, response);
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Persona p = new Persona(0, request.getParameter("nombre"), request.getParameter("apellidos"), Integer.parseInt(request.getParameter("edad")), request.getParameter("direccion"));
        personaDao.guardar(p);

        index(request, response);
    }

    private void nuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/persona/nuevo.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/persona/ver.jsp");
        List<Persona> lista = personaDao.listar();
        request.setAttribute("lista", lista);
        dispatcher.forward(request, response);
    }

    private void showEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Persona p=personaDao.obtenerById(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("item", p);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/persona/editar.jsp");
        dispatcher.forward(request, response);
    }
  private void showEliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Persona p=personaDao.obtenerById(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("item", p);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/persona/eliminar.jsp");
        dispatcher.forward(request, response);
    }

    private void editar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Persona p = new Persona(Integer.parseInt(request.getParameter("id")), request.getParameter("nombre"), request.getParameter("apellidos"), Integer.parseInt(request.getParameter("edad")), request.getParameter("direccion"));
        personaDao.modificar(p);

        index(request, response);
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Persona p = personaDao.obtenerById(Integer.parseInt(request.getParameter("id")));
        personaDao.eliminar(p);
        index(request, response);

    }

    //------------------------------------------------------------------------------------------------
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Hola Servlet..");

        String action = request.getParameter("action");
        if (action != null) {
            System.out.println(action);
            try {
                switch (action) {
                    case "index":
                        index(request, response);
                        break;
                    case "nuevo":
                        nuevo(request, response);
                        break;
                    case "registrar":
                        System.out.println("entro");
                        registrar(request, response);
                        break;
                    case "mostrar":
                        mostrar(request, response);
                        break;
                    case "showedit":
                        showEditar(request, response);
                        break;
                    case "editar":
                        editar(request, response);
                        break;
                    case "showEliminar":
                        showEliminar(request, response);
                        break;
                    case "eliminar":
                        eliminar(request, response);
                        break;
                    default:
                        break;
                }
            } catch (SQLException e) {
                e.getStackTrace();
            }
        } else {
            try {
                index(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(PersonaControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Hola Servlet..");
        doGet(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
