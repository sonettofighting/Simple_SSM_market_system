package market.service.imp;

import market.dao.PurchaseMapper;
import market.dao.KcxxMapper;
import market.domain.Purchase;
import market.domain.Kcxx;
import market.service.IKcxxService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class KcxxServiceImp implements IKcxxService {
    @Resource
    KcxxMapper kcxxMapper;

    @Resource
    PurchaseMapper purchaseMapper;

    public int delete(String proid) {
        // TODO Auto-generated method stub
        return kcxxMapper.deleteByPrimaryKey(proid);
    }

    public int insert(Kcxx record) {
        // TODO Auto-generated method stub
        return kcxxMapper.insert(record);
    }

    public List<Kcxx> getall() {
        // TODO Auto-generated method stub
        return kcxxMapper.selectByExample(null);
    }

    public Kcxx getbyid(String proid) {
        // TODO Auto-generated method stub
        return kcxxMapper.selectByPrimaryKey(proid);
    }

    public Boolean update(Kcxx record) {
        Purchase purchase = new Purchase();
        purchase.setProid(record.getProid());
        purchase.setIndate(new Date());
        purchase.setNum(record.getNum());
        purchase.setPname(record.getPname());
        purchaseMapper.insert(purchase);
        return kcxxMapper.updateByPrimaryKey(record);
    }

    public Kcxx kcxxWithPro(String proid) {
        // TODO Auto-generated method stub
        return kcxxMapper.kcxxWithPro(proid);
    }

    public List<Kcxx> kcxxWithPronum() {
        // TODO Auto-generated method stub
        return kcxxMapper.kcxxWithPronum();
    }

    public List<Kcxx> kcxxWithProdata() {
        // TODO Auto-generated method stub
        return kcxxMapper.kcxxWithProdata();
    }

    public List<Kcxx> getbyparams(String proid, String pname) {
        // TODO Auto-generated method stub
        return kcxxMapper.getbyparams(proid, pname);
    }

    @Override
    public List<Kcxx> getsoldout() {
        return kcxxMapper.getsoldout();
    }


}
