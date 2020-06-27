package market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import market.domain.Kcxx;
import market.service.imp.KcxxServiceImp;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 库存信息
 */
@Controller
@RequestMapping("/kcxx")
public class KcxxController {
    @Resource
    KcxxServiceImp kcxxServiceImp;

    /**
     * 添加库存信息
     * @return 添加信息的页面
     */
    @RequestMapping("/toadd")
    public String toadd() {
        return "addkcxx";

    }

    /**
     * 更新库存信息
     * @param kcxx 库存的实体
     * @param model 存放页面交互的信息
     * @return 编辑库存信息的页面
     */
    @RequestMapping("/toupdate")
    public String editProduct(Kcxx kcxx, Model model) {
        model.addAttribute("kcxx", kcxxServiceImp.getbyid(kcxx.getProid()));
        return "editkcxx";
    }

    /**
     * 判断库存信息是否存在，如果没有就插入，如果有就修改
     * @param kcxx 库存信息实体
     * @return 库存信息列表页面
     */
    @RequestMapping("/insert")
    public String insert(Kcxx kcxx) {
        if (null == kcxxServiceImp.getbyid(kcxx.getProid())) {
            kcxxServiceImp.insert(kcxx);
        } else {
            kcxxServiceImp.update(kcxx);
        }
        return "getall_kcxx";

    }

    @RequestMapping("/delete")
    public String delete(String proid) {
        kcxxServiceImp.delete(proid);
        return "getall_kcxx";
    }

    /**
     *  更新库存信息
     * @param kcxx
     * @param model
     * @return
     */
    @RequestMapping("/update")
    public String update(Kcxx kcxx, Model model) {
        if (kcxxServiceImp.update(kcxx)) {
            kcxx = kcxxServiceImp.getbyid(kcxx.getProid());
            model.addAttribute("kcxx", kcxx);
            return "getall_kcxx";
        }
        return null;
    }



    @RequestMapping("/getall")
    public String getall_kcxx(ModelMap model,
                              @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 5);
        List<Kcxx> kcxxs = kcxxServiceImp.getall();
        PageInfo<Kcxx> pageInfo = new PageInfo<Kcxx>(kcxxs);
        model.addAttribute("pageInfo", pageInfo);
        return "getall_kcxx";

    }

    @RequestMapping("getsoldout")
    public String getsoldout(Model model,
                             @RequestParam(defaultValue = "1", value = "pn") Integer pn) {
        PageHelper.startPage(pn, 100);
        List<Kcxx> ckin = kcxxServiceImp.getsoldout();
        PageInfo<Kcxx> pageInfo = new PageInfo<Kcxx>(ckin);
        model.addAttribute("pageInfo", pageInfo);
        return "getkcxxsoldout";

    }
//  查询单个

    @RequestMapping("/getbyid")
    public String getbyid(String proid, HttpServletRequest request, Model model) {
        request.setAttribute("kcxx", kcxxServiceImp.getbyid(proid));
        model.addAttribute("kcxx", kcxxServiceImp.getbyid(proid));
        return "getall_kcxx";

    }

    @RequestMapping("/kcxxWithPro")
    public String kcxxWithPro(String proid, HttpServletRequest request, Model model) {
        Kcxx kcxx = kcxxServiceImp.kcxxWithPro(proid);
        request.setAttribute("kcxx", kcxx);
        model.addAttribute("kcxx", kcxx);
        return "getkcxx";

    }

    @InitBinder
    protected void init(ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    //	按条件获取所有进货信息
    @RequestMapping("getbyparams")
    public String getbyparams(Model model, @RequestParam(value = "proid", required = false) String proid,
                              @RequestParam(value = "pname", required = false) String pname, @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 100);
        List<Kcxx> ckin = kcxxServiceImp.getbyparams(proid, pname);
        PageInfo<Kcxx> pageInfo = new PageInfo<Kcxx>(ckin);
        model.addAttribute("pageInfo", pageInfo);
        return "getkcxxbyparams";

    }

    @RequestMapping("getkcxx")
    @ResponseBody
    public Kcxx getkcxx(String proid) {
        return kcxxServiceImp.getbyid(proid);
    }

}
