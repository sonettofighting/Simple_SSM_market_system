package market.service;

import market.domain.Product;
import market.domain.ProductExample;

import java.util.List;

public interface IProductService {
    int deleteByPrimaryKey(String proid);
    int insert(Product record);
    List<Product> selectByExample(ProductExample example);
    public List<Product> getlist();
    Product selectByPrimaryKey(String proid);
    List<Product> getbyparams( String proid,String supname,String pname,String protype );
    boolean updateByPrimaryKey(Product record);
    }
