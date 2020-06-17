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
@RequestMapping("/staff/flatform/kcxx")
public class KcxxController {
    @Resource
    KcxxServiceImp kcxxServiceImp;

//  跳转到增加页面

    @RequestMapping("/toadd")
    public String toadd() {
        return "addkcxx";

    }
//  跳转到修改页面

    @RequestMapping("/toupdate")
    public String editProduct(Kcxx kcxx, Model model) {
        model.addAttribute("kcxx", kcxxServiceImp.getbyid(kcxx.getProid()));
        return "editkcxx";
    }
//  先判断数据库有没有，有就更新，没有就新增

    @RequestMapping("/insert")
    public String insert(Kcxx kcxx) {
        if (null == kcxxServiceImp.getbyid(kcxx.getProid())) {
            kcxxServiceImp.insert(kcxx);
        } else {
            kcxxServiceImp.update(kcxx);
        }
        return "redirect:getall";

    }
//    删除

    @RequestMapping("/delete")
    public String delete(String proid) {
        kcxxServiceImp.delete(proid);
        return "redirect:getall";
    }
//    修改

    @RequestMapping("/update")
    public String update(Kcxx kcxx, Model model) {
        if (kcxxServiceImp.update(kcxx)) {
            kcxx = kcxxServiceImp.getbyid(kcxx.getProid());
            model.addAttribute("kcxx", kcxx);
            return "redirect:getall";
        }
        return null;
    }

//    查询所有

    @RequestMapping("/getall")
    public String getall_kcxx(ModelMap model,
                              @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 4);
        List<Kcxx> kcxxs = kcxxServiceImp.getall();
        PageInfo<Kcxx> pageInfo = new PageInfo<Kcxx>(kcxxs);
        model.addAttribute("pageInfo", pageInfo);
        return "getall_kcxx";

    }

    @RequestMapping("getsoldout")
    public String getsoldout(Model model,
                             @RequestParam(defaultValue = "1", value = "pn") Integer pn)
    {
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
        return "getall";

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
