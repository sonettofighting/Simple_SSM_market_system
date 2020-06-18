package market.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import market.domain.Custom;
import market.service.imp.CustomServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 用户信息
 */
@Controller
@RequestMapping("/staff/flatform/custom")
public class CustomController {

    @Resource
    CustomServiceImp customServiceImp;

//  跳转到增加页面

    @RequestMapping("/toadd")
    public String toaddCustom() {
        return "addcus";

    }
//  跳转到修改页面

    @RequestMapping("/toupdate")
    public String editProduct(Custom custom, Model model) {
        model.addAttribute("custom", customServiceImp.getByid(custom.getCusid()));
        return "editcus";
    }
//  先判断数据库有没有，有就更新，没有就新增

    @RequestMapping("/insert")
    public String insert(Custom custom) {
        if (null == customServiceImp.getByid(custom.getCusid())) {
            customServiceImp.insert(custom);
        } else {
            customServiceImp.update(custom);
        }
        return "getall_type";

    }
//    删除

    @RequestMapping("/delete")
    public String delete(String cusid) {
        customServiceImp.delete(cusid);
        return "getall_type";
    }
//    修改

    @RequestMapping("/update")
    public String update(Custom custom, Model model) {
        if (customServiceImp.update(custom)) {
            custom = customServiceImp.getByid(custom.getCusid());
            model.addAttribute("custom", custom);
            return "getall_type";
        }
        return null;
    }

//    查询所有

    @RequestMapping("/getall")
    public String getall_cus(ModelMap model,
                             @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 5);
        List<Custom> Customs = customServiceImp.getlist();
        PageInfo<Custom> pageInfo = new PageInfo<Custom>(Customs);
        model.addAttribute("pageInfo", pageInfo);
        return "getall_cus";

    }
//  查询单个

    @RequestMapping("/getbyid")
    public String getbyid(String cusid, HttpServletRequest request, Model model) {
        request.setAttribute("custom", customServiceImp.getByid(cusid));
        model.addAttribute("custom", customServiceImp.getByid(cusid));
        return "getall_type";

    }

    //根据条件查询
    @RequestMapping("getbyparams")
    public String getbyparams(@RequestParam(value = "cusid", required = false) String cusid, @RequestParam(value = "cusname", required = false) String cusname,
                              @RequestParam(defaultValue = "1", value = "pn") Integer pn, Model model
    ) {
        PageHelper.startPage(pn, 100);
        List<Custom> customs = customServiceImp.getbyparams(cusid, cusname);
        PageInfo<Custom> pageInfo = new PageInfo<Custom>(customs);
        model.addAttribute("pageInfo", pageInfo);
        return "getcustombyparams";

    }
}

