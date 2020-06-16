package market.service.imp;

import market.dao.ExportMapper;
import market.domain.Export;
import market.service.IExportService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ExportServiceImp implements IExportService {

    @Resource
    ExportMapper exportMapper;

    public int delete(String inid) {
        // TODO Auto-generated method stub
        return exportMapper.deleteByPrimaryKey(inid);
    }

    public int insert(Export record) {
        // TODO Auto-generated method stub
        return exportMapper.insert(record);
    }

    public List<Export> getall() {
        // TODO Auto-generated method stub
        return exportMapper.selectByExample(null);
    }

    public Export getbyid(String inid) {
        // TODO Auto-generated method stub
        return exportMapper.selectByPrimaryKey(inid);
    }

    public Boolean update(Export record) {
        // TODO Auto-generated method stub
        return exportMapper.updateByPrimaryKey(record);
    }

    public List<Export> getbyparams(String proid, String inid, String pname, String retdate) {
        // TODO Auto-generated method stub
        return exportMapper.getbyparams(proid, inid, pname, retdate);
    }

}
