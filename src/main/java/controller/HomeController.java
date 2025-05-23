package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import model.Product;
import service.ProductService;

@Controller
public class HomeController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("/")
	public String home(Model model) {
		List<Product> products = productService.list();
	    model.addAttribute("products", products);
	    return "index";
	}
	
}
