package market.service;

import market.domain.Purchase;

import java.util.List;

public interface IPurchaseService {

    int delete(String inid);

    int insert(Purchase record);


    List<Purchase> getall();

    Purchase getbyid(String inid);

    boolean update(Purchase record);

    List<Purchase> getbyparams(String proid, String inid, String pname, String indate);

}
