package market.dao;

import market.domain.Purchase;
import market.domain.PurchaseExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PurchaseMapper {

    int deleteByPrimaryKey(String inid);

    int insert(Purchase record);


    List<Purchase> selectByExample(PurchaseExample example);

    Purchase selectByPrimaryKey(String inid);

    boolean updateByPrimaryKey(Purchase record);

    List<Purchase> getbyparams(@Param("proid") String proid, @Param("inid") String inid, @Param("pname") String pname, @Param("indate") String indate);

    List<Purchase> getinrange(@Param("indate")String param1, @Param("indate")String param2);
}