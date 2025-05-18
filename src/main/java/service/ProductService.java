package service;

import java.util.List;

import model.Product;

public interface ProductService {

	void save(Product product);
	void update(Product product);
	void delete(int id);
	Product get(int id);
	List<Product> list();
	
}
