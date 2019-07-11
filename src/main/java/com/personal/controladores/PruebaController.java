/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.personal.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Prueba")

public class PruebaController {
    
    @GetMapping("/prueba01")
    public ModelAndView prueba01(){
        ModelAndView mv=new ModelAndView("crud/index");
//        mv.addObject("parametro",52);
        return mv;
    }
}
