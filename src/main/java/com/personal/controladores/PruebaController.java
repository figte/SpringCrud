/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.personal.controladores;

import java.util.ArrayList;
import java.util.List;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController //anotacion para hacer un contraldor con servicios web de tipo Rest
@RequestMapping("/Prueba")
public class PruebaController {
    
 
    //metodo que retornara un JSON con una lista de datos de  tipo String
   @GetMapping("/prueba")
   public List<String> index(){
       List<String> l=new ArrayList<>();
       l.add("Hola");
       l.add("mensaje");
       l.add("mundo");
       return l;         
   }
   
}
