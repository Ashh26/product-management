package dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.ProductDao;
import model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private SessionFactory factory;
	
	public Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public void save(Product product) {
		
		getSession().save(product);
		
	}

	@Override
	public void update(Product product) {
		
		getSession().update(product);	
	}

	@Override
	public void delete(int id) {
		
		getSession().delete(get(id));
		
	}

	@Override
	public Product get(int id) {
		
		
		return getSession().get(Product.class, id);
	}

	@Override
	public List<Product> list() {

		return getSession().createQuery("from Product",Product.class).list();
	}

}
