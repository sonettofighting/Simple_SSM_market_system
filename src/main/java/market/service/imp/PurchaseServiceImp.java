package market.service.imp;

import market.dao.PurchaseMapper;
import market.domain.Purchase;
import market.service.IPurchaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PurchaseServiceImp implements IPurchaseService {
    @Resource
    PurchaseMapper purchaseMapper;

    public int delete(String inid) {
        // TODO Auto-generated method stub
        return purchaseMapper.deleteByPrimaryKey(inid);
    }

    public int insert(Purchase record) {
        // TODO Auto-generated method stub
        return purchaseMapper.insert(record);
    }

    public List<Purchase> getall() {
        // TODO Auto-generated method stub
        return purchaseMapper.selectByExample(null);
    }

    public Purchase getbyid(String inid) {
        // TODO Auto-generated method stub
        return purchaseMapper.selectByPrimaryKey(inid);
    }

    public boolean update(Purchase record) {
        // TODO Auto-generated method stub
        return purchaseMapper.updateByPrimaryKey(record);
    }

    public List<Purchase> getbyparams(String proid, String inid, String pname, String indate) {
        // TODO Auto-generated method stub
        return purchaseMapper.getbyparams(proid, inid, pname, indate);
    }


}
