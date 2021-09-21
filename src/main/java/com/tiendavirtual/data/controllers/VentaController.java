package com.tiendavirtual.data.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tiendavirtual.data.models.Producto;
import com.tiendavirtual.data.models.Usuario;
import com.tiendavirtual.data.models.Venta;
import com.tiendavirtual.data.services.ProductoService;
import com.tiendavirtual.data.services.UsuarioService;
import com.tiendavirtual.data.services.VentaService;
@Controller
@RequestMapping("/venta")
public class VentaController {
	@Autowired 
	private VentaService vservice;
	
	@Autowired 
	private ProductoService productoservice;
	
	@Autowired 
	private UsuarioService usuarioservice;
	
	@RequestMapping("")
	public String indexUsuario(@ModelAttribute("venta") Venta venta,Model model, HttpSession session ) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		List<Venta> lista_ventas = vservice.findAll();
		List<Producto> lista_productos =productoservice.findAll();
		List<Usuario> lista_usuarios =usuarioservice.findAll();
		
		model.addAttribute("lista_productos", lista_productos);
		model.addAttribute("lista_ventas", lista_ventas);
		model.addAttribute("lista_usuarios", lista_usuarios);
		
		return "venta.jsp";
	}
	
	@RequestMapping(value="/crear", method = RequestMethod.POST)
	public String crearUsuario(@Valid @ModelAttribute("venta") Venta venta, Model model, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		List<Venta> lista_venta = vservice.findAll();
		List<Producto> lista_productos =productoservice.findAll();
		List<Usuario> lista_usuarios = usuarioservice.findAll();
		//Verifica campos vacíos
		if(venta.getDireccion_envio().isBlank()) {
			model.addAttribute("error", "Todos los campos son requeridos!");
			model.addAttribute("lista_ventas", lista_venta);
			model.addAttribute("lista_productos", lista_productos);
			model.addAttribute("lista_usuarios", lista_usuarios);
			
			return "venta.jsp";
		}
		
		vservice.insertarVenta(venta);
		return "redirect:/venta";
	}
	
	@RequestMapping(value="/actualizar/{id}", method = RequestMethod.GET)
	public String actualizarVenta(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		Venta venta = vservice.buscarVenta(id);
		
		model.addAttribute("venta", venta);
		return "editar_venta.jsp";
	}
	
	@RequestMapping(value="/modificar",method= RequestMethod.PUT)
	public String modificar(@Valid @ModelAttribute("venta") Venta venta, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		
		System.out.println("el Id a modificar es: "+ venta.getId());
		vservice.modificarVenta(venta);
		
		return "redirect:/venta";
	}
	
	@RequestMapping(value="/eliminar/{id}", method = RequestMethod.DELETE)
	public String eliminar(@PathVariable("id") Long id, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		System.out.println("Eliminar id: "+ id);
		vservice.eliminarVenta(id);
		
		return "redirect:/venta";
	}
}
