package market.dao;

import market.domain.Export;
import market.domain.ExportExample;
import market.domain.Purchase;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExportMapper {
    int deleteByPrimaryKey(String inid);

    int insert(Export record);

    List<Export> selectByExample(ExportExample example);

    Export selectByPrimaryKey(String inid);


    Boolean updateByPrimaryKey(Export record);

    List<Export> getbyparams(@Param("proid") String proid, @Param("inid") String inid, @Param("pname") String pname, @Param("retdate") String retdate);

    List<Export> getinrange(@Param("indate")String param1, @Param("indate")String param2);
}