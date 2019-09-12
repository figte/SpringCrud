
package com.personal.controladores;

import com.personal.dao.PersonaDaoHibernate;
import com.personal.idao.IPersonaDao;
import com.personal.modelos.Persona;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("Persona")

public class PersonaController {
     IPersonaDao personaDao;

    public PersonaController() {
          try {
            personaDao = new PersonaDaoHibernate();
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
      
    @GetMapping("index")
    public ModelAndView index(){
         ModelAndView mv=new ModelAndView("/persona/ver");
         List<Persona> lista = personaDao.listar();
         mv.addObject("lista", lista);
        return mv;   
    }
    
    @GetMapping("/nuevo")
    public String nuevo(){
        return "/persona/nuevo";
    }
    
    @PostMapping("/guardar")
    public String guardar(HttpServletRequest request){
        Persona p = new Persona(0, request.getParameter("nombre"), request.getParameter("apellidos"), Integer.parseInt(request.getParameter("edad")), request.getParameter("direccion"));
        personaDao.guardar(p);
       
        return "redirect:/Persona/index";
    }
    
    @GetMapping("/modificar/{id}")
    public ModelAndView editar(@PathVariable Integer id){
        return new ModelAndView("/persona/editar").addObject("item", personaDao.obtenerById(id));
    }
   
    @PostMapping("modificar")
    public ModelAndView modificar(HttpServletRequest request){
      Persona p = new Persona(Integer.parseInt(request.getParameter("id")), request.getParameter("nombre"), request.getParameter("apellidos"), Integer.parseInt(request.getParameter("edad")), request.getParameter("direccion"));
      personaDao.modificar(p);
      return new ModelAndView("redirect:/Persona/index");
        
    }
  
    @GetMapping("/eliminar/{id}")
    public ModelAndView eliminar(@PathVariable Integer id){
        return new ModelAndView("/persona/eliminar").addObject("item", personaDao.obtenerById(id));
    }
    
    @PostMapping("eliminar")
    public ModelAndView eliminado(HttpServletRequest request){
      Persona p = personaDao.obtenerById(Integer.parseInt(request.getParameter("id")));
      personaDao.eliminar(p); 
      return new ModelAndView("redirect:/Persona/index");   
    }  
}
