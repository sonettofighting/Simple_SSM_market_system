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
 * 用户管理页面与数据进行交互
 */
@Controller
@RequestMapping("/custom")
public class CustomController {

    @Resource
    CustomServiceImp customServiceImp;

    /**
     *  添加用户之前进行判断，如果存在就修改，不存在就删除
     * @param custom 用户实体
     * @return 用户列表页面
     */
    @RequestMapping("/insert")
    public String insert(Custom custom) {
        if (null == customServiceImp.getByid(custom.getCusid())) {
            customServiceImp.insert(custom);
        } else {
            customServiceImp.update(custom);
        }
        return "getall_cus";

    }

    /**
     * 添加用户
     * @return 添加用户的页面
     */
    @RequestMapping("/toadd")
    public String toaddCustom() {
        return "addcus";

    }

    /**
     * 更新页面的信息
     * @param custom 用户实体
     * @param model 与jsp页面交互的内容
     * @return
     */
    @RequestMapping("/toupdate")
    public String editProduct(Custom custom, Model model) {
        model.addAttribute("custom", customServiceImp.getByid(custom.getCusid()));
        return "editcus";
    }

    /**
     * 删除用户
     * @param cusid 用户id，同时也是数据库的主键
     * @return
     */
    @RequestMapping("/delete")
    public String delete(String cusid) {
        customServiceImp.delete(cusid);
        return "getall_cus";
    }

    /**
     * 更新用户信息，之后跳转至用户列表
     * @param custom 用户实体
     * @param model 与jsp页面交互的内容
     * @return 用户列表页面
     */
    @RequestMapping("/update")
    public String update(Custom custom, Model model) {
            customServiceImp.update(custom);
            custom = customServiceImp.getByid(custom.getCusid());
            model.addAttribute("custom", custom);
            return "getall_cus";
    }

    //查询所有的用户
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


    @RequestMapping("/getbyid")
    public String getbyid(String cusid, HttpServletRequest request, Model model) {
        request.setAttribute("custom", customServiceImp.getByid(cusid));
        model.addAttribute("custom", customServiceImp.getByid(cusid));
        return "getall_cus";

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

