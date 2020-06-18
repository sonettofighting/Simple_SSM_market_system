package market.service.imp;

import market.dao.TypeMapper;
import market.domain.Type;
import market.service.ITypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TypeServiceImp implements ITypeService {
    @Resource
    TypeMapper typeMapper;

    public int delete(String protypeid) {
        // TODO Auto-generated method stub
        return typeMapper.deleteByPrimaryKey(protypeid);


    }

    public int insert(Type record) {
        // TODO Auto-generated method stub
        return typeMapper.insert(record);
    }

    public List<Type> getall() {
        // TODO Auto-generated method stub
        return typeMapper.selectByExample(null);
    }

    public Type selectByid(String protypeid) {
        // TODO Auto-generated method stub
        return typeMapper.selectByPrimaryKey(protypeid);
    }

    public boolean update(Type record) {
        // TODO Auto-generated method stub
        return typeMapper.updateByPrimaryKey(record);
    }

    public List<Type> getbyparams(String protypeid, String typename) {
        // TODO Auto-generated method stub
        return typeMapper.getbyparams(protypeid, typename);
    }

}
