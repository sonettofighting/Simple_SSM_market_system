package market.service;

import market.domain.Export;
import market.domain.Purchase;

import java.util.List;

public interface IExportService {

    int delete(String inid);

    int insert(Export record);

    List<Export> getall();

    Export getbyid(String inid);


    Boolean update(Export record);

    List<Export> getbyparams(String proid, String inid, String pname, String retdate);

    List<Export> getinrange(String param1, String param2);
}
