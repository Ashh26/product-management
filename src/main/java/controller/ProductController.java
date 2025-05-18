package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Product;
import service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping
	public String list(Model model) {
		model.addAttribute("products", productService.list());
		return "product-list";
	}

	@GetMapping("/new")
	public String createForm(Model model) {
		model.addAttribute("product", new Product());
		return "product-form";
	}
	
	@PostMapping("/save")
	public String save(@ModelAttribute Product product) {
		if(product.getId()==0) {
			productService.save(product);
		}else {
			productService.update(product);
		}
		return "redirect:/products";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable int id,Model model) {
		model.addAttribute("product",productService.get(id));
		return "product-form";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		productService.delete(id);
		return "redirect:/products";
	}

}











