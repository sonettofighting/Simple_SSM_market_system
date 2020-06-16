package market.service;

import market.domain.Type;

import java.util.List;

public interface ITypeService {
//	删除
    int delete(String protypeid);
//插入
    int insert(Type record);
//查询所有
    List<Type> getall();
//根据主键查询
    Type selectByid(String protypeid);

//更新
    boolean update(Type record);
    
//    按条件查询
    List<Type> getbyparams(String protypeid,String typename);
	
}
