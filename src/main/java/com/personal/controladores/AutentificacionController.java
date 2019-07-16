
package com.personal.controladores;

import com.personal.servicios.UsuariosServices;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class AutentificacionController {
    
   @RequestMapping(value="", method = RequestMethod.GET)
    public String index(){
        return "Login";
    }
    
    @PostMapping("/login")
    public ModelAndView login(HttpServletRequest request){
        
        String user=request.getParameter("username");
        String pass=request.getParameter("password");
        
        HttpSession sesion = request.getSession();
        ModelAndView mv=null;
        
        UsuariosServices us=new UsuariosServices();
        //deberíamos buscar el usuario en la base de datos, pero dado que se escapa de este tema, ponemos un ejemplo en el mismo código
        if(us.validarUsuario(user, pass) && sesion.getAttribute("usuario") == null){
            //si coincide usuario y password y además no hay sesión iniciada
            sesion.setAttribute("estado", true);
            sesion.setAttribute("usuario", user);
            //redirijo a página con información de login exitoso
           mv=new ModelAndView("redirect:Persona/index");
        }else{
            //lógica para login inválido
          mv=new ModelAndView("Login").addObject("error", "usuario o contraseña incorrecta");
        }
  
        return mv;
    }
    
    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
         HttpSession sesion = request.getSession();
         sesion.invalidate();
        return "redirect:/";
    }
}
