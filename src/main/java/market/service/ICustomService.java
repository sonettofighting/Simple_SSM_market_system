package market.service;

import market.domain.Custom;
import market.domain.CustomExample;

import java.util.List;

public interface ICustomService {
    int delete(String cusid);

    int insert(Custom record);

    List<Custom> selectByExample(CustomExample example);

    Custom getByid(String cusid);

    boolean update(Custom record);

    List<Custom> getlist();

    List<Custom> getbyparams(String cusid, String cusname);
}
