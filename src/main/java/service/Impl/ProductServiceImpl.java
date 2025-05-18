package service.Impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProductDao;
import model.Product;
import service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao dao;

	@Override
	public void save(Product product) {
		
		dao.save(product);
		
	}

	@Override
	public void update(Product product) {
		
		dao.update(product);
		
	}

	@Override
	public void delete(int id) {
	
		dao.delete(id);
		
	}

	@Override
	public Product get(int id) {
	
		return dao.get(id);
	}

	@Override
	public List<Product> list() {
	
		return dao.list();
	}

}
