package market.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import market.domain.Type;
import market.service.imp.TypeServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/staff/flatform/type")
public class TypeController {

    @Resource
    TypeServiceImp typeServiceImp;

//  跳转到增加页面

    @RequestMapping("/toadd")
    public String toaddtype() {
        return "addtype";

    }
//  跳转到修改页面

    @RequestMapping("/toupdate")
    public String editProduct(Type type, Model model) {
        model.addAttribute("type", typeServiceImp.selectByid(type.getProtypeid()));
        return "edittype";
    }
//  先判断数据库有没有，有就更新，没有就新增

    @RequestMapping("/insert")
    public String insert(Type type) {
//        if (null == typeServiceImp.selectByid(type.getProtypeid())) {
//            typeServiceImp.insert(type);
//        } else {
//            typeServiceImp.update(type);
//        }
        return "addtype";

    }
//    删除

    @RequestMapping("/delete")
    public String delete(String protypeid) {
        typeServiceImp.delete(protypeid);
        return "getall_type";
    }
//    修改类别

    @RequestMapping("/update")
    public String update(Type type, Model model) {
        if (typeServiceImp.update(type)) {
            type = typeServiceImp.selectByid(type.getProtypeid());
            model.addAttribute("type", type);
            return "getall_type";
        }
        return null;
    }

//    查询所有

    @RequestMapping("/getall")
    public String getall(ModelMap model,
                         @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 5);
        List<Type> types = typeServiceImp.getall();
        PageInfo<Type> pageInfo = new PageInfo<Type>(types);
        model.addAttribute("pageInfo", pageInfo);
        return "getall_type";

    }
//  查询单个

    @RequestMapping("/getbyid")
    public String getbyid(String protypeid, HttpServletRequest request, Model model) {
        request.setAttribute("type", typeServiceImp.selectByid(protypeid));
        model.addAttribute("type", typeServiceImp.selectByid(protypeid));
        return "getall_type";

    }

    //根据条件查询
    @RequestMapping("getbyparams")
    public String getbyparams(@RequestParam(value = "typename", required = false) String typename, @RequestParam(value = "protypeid", required = false) String protypeid,
                              @RequestParam(defaultValue = "1", value = "pn") Integer pn, Model model
    ) {
        PageHelper.startPage(pn, 100);
        List<Type> types = typeServiceImp.getbyparams(protypeid, typename);
        PageInfo<Type> pageInfo = new PageInfo<Type>(types);
        model.addAttribute("pageInfo", pageInfo);
        return "gettypebyparams";

    }
}
