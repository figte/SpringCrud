package com.personal.controladores;

import com.personal.dao.ProductosDaoHibernate;
import com.personal.idao.IProductoDao;
import com.personal.modelos.Producto;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.json.Json;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.PathParam;
import org.primefaces.json.JSONException;
import org.primefaces.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/productos")
public class ProductoController {

    IProductoDao dao;

    public ProductoController() {
        dao = new ProductosDaoHibernate();
    }

    @GetMapping("index")
    public ModelAndView index() {
        return new ModelAndView("/productos/index");
    }

    @GetMapping(value = "/listar", produces = "application/json")
    public List<HashMap<String, Object>> listar() throws JSONException {

        List<HashMap<String, Object>> map = new ArrayList<>();
        List<Producto> l = dao.listar();
        for (Producto producto : l) {
            HashMap<String, Object> m = new HashMap<>();
            m.put("id", producto.getId());
            m.put("nombre", producto.getNombre());
            m.put("precio", producto.getPrecio());
            m.put("existencias", producto.getExistencias());
            map.add(m);
        }
        return map;
    }

    @GetMapping(value = "/obtener/{id}", produces = "application/json")
    public HashMap<String, Object> obtener(@PathVariable Integer id) {
        Producto p = dao.obtenerById(id);
        HashMap<String, Object> m = new HashMap<>();
        m.put("id", p.getId());
        m.put("nombre", p.getNombre());
        m.put("precio", p.getPrecio());
        m.put("existencias", p.getExistencias());
        return m;
    }

    @PostMapping("guardar")
    public ResponseEntity guardar(HttpServletRequest request) {
        Producto p = new Producto();
        p.setNombre(request.getParameter("nombre"));
        p.setPrecio(Double.parseDouble(request.getParameter("precio")));
        p.setExistencias(Integer.parseInt(request.getParameter("existencias")));

        if (dao.guardar(p)) {
            return new ResponseEntity("Registro guardado", HttpStatus.OK);
        } else {
            return new ResponseEntity("Registro no guardado", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("modificar/{id}")
    public ResponseEntity modificar(HttpServletRequest request, @PathVariable Integer id) {
        Producto p = new Producto();

        try {
            p.setId(id);
            p.setNombre(request.getParameter("nombre"));
            p.setPrecio(Double.parseDouble(request.getParameter("precio").toString()));
            p.setExistencias(Integer.parseInt(request.getParameter("existencias").toString()));

            if (dao.modificar(p)) {
                return new ResponseEntity("Registro modificado", HttpStatus.OK);
            } else {
                return new ResponseEntity("Registro no modificado", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            System.out.println(" 2 " + p.getId() + " " + p.getNombre() + " " + p.getPrecio() + " " + p.getExistencias());

            return new ResponseEntity("Registro no modificado " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @DeleteMapping("eliminar/{id}")
    public ResponseEntity eliminar(@PathVariable Integer id) {
        Producto p = new Producto();
        try {

            p = dao.obtenerById(id);
            System.out.println(" " + p.getId() + " " + p.getNombre() + " " + p.getPrecio() + " " + p.getExistencias());

            if (dao.eliminar(p)) {
                return new ResponseEntity("Registro eliminado", HttpStatus.OK);
            } else {
                return new ResponseEntity("Registro no eliminado", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            System.out.println(" " + p.getId() + " " + p.getNombre() + " " + p.getPrecio() + " " + p.getExistencias());

            return new ResponseEntity("Registro no eliminado " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
