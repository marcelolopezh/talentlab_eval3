package com.tiendavirtual.data.controllers;



import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.tiendavirtual.data.models.Usuario;
import com.tiendavirtual.data.services.UsuarioService;



@Controller
@RequestMapping("/")
public class IndexController {
	
    private final UsuarioService uservice;
	public IndexController(UsuarioService usuarioService) {
		this.uservice = usuarioService;
	}
	
	@RequestMapping("")
	public String indexUsuario() {
		return "redirect:/ingresar";
	}
	
	@RequestMapping("/ingresar")
	public String loginUsuario(HttpSession session) {
		if(session.getAttribute("userId")!=null) {
			return "redirect:/producto";
		}
		return "login.jsp";
	}
	
	@RequestMapping("/registrar")
	public String registrarUsuario(@ModelAttribute("usuario") Usuario usuario,Model model, HttpSession session) {
		if(session.getAttribute("userId")!=null) {
			return "redirect:/producto";
		}
		return "registrar.jsp";
	}
	
	
	@RequestMapping("/ingreso")
	public String ingresar(@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpSession session, Model model
			) {
		boolean exiteUsuario = uservice.validarUser(email, password);
		if(exiteUsuario) {
			Usuario usuario = uservice.findByEmail(email);
			session.setAttribute("userId", usuario.getId());
			return "redirect:/producto";
		}
		model.addAttribute("error","Datos De Ingreso Incorrectos");
		return "login.jsp";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		if(session.getAttribute("userId")!=null) {
			session.invalidate();//matamos todas las variables de session
		}
		return "redirect:/";
	}
	

}