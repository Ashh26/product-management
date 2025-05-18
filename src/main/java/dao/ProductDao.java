package dao;

import java.util.List;

import model.Product;

public interface ProductDao {

	void save(Product product);
	void update(Product product);
	void delete(int id);
	Product get(int id);
	List<Product> list();
	
}
