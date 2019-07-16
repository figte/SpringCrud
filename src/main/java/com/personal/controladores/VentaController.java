
package com.personal.controladores;

import com.personal.dao.VentasDaoHibernate;
import com.personal.idao.IVentaDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Venta")
public class VentaController {
    
    IVentaDao dao=null;

    public VentaController() {
       dao= new VentasDaoHibernate();
    }
    
    
    
    @GetMapping("/index")
    public ModelAndView index(){
        ModelAndView mv=new ModelAndView("/ventas/index");
        mv.addObject("list", dao.listar());
        return mv;
                
    }
        
    
}
