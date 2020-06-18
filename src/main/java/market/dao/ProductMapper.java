package market.dao;

import market.domain.Product;
import market.domain.ProductExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(String proid);

    int insert(Product record);


    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(String proid);

    boolean updateByPrimaryKey(Product record);

    //    多条件查询
    List<Product> getbyparams(@Param("proid") String proid, @Param("supname") String supname, @Param("pname") String pname, @Param("protype") String protype);
}