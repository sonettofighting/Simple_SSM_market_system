package market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import market.domain.Export;
import market.domain.Purchase;
import market.service.imp.ExportServiceImp;
import market.service.imp.PurchaseServiceImp;
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
 * 出货信息
 */
@Controller
@RequestMapping("/export")
public class ExportController {
    @Resource
    ExportServiceImp exportServiceImp;

    @Resource
    PurchaseServiceImp purchaseServiceImp;

    //出货的信息列表
    @RequestMapping("getall")
    public String getlist(ModelMap model,
                          @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 5);
        List<Export> export = exportServiceImp.getall();
        PageInfo<Export> pageInfo = new PageInfo<Export>(export);
        model.addAttribute("pageInfo", pageInfo);
        return "getall_export";

    }

    //查询一条信息，根据一条信息可以进行CRUD操作
    @RequestMapping("/getexport")
    public String getbyid(String inid, HttpServletRequest request, Model model) {
        request.setAttribute("export", exportServiceImp.getbyid(inid));
        model.addAttribute("export", exportServiceImp.getbyid(inid));
        return "getexport";
    }

    //编辑
    @RequestMapping("edit")
    public String edit(Export export, Model model) {
        model.addAttribute("export", exportServiceImp.getbyid(export.getInid()));
        return "editexport";
    }

    @RequestMapping("update")
    public String update(Export export, Model model) {
        if (exportServiceImp.update(export)) {
            export = exportServiceImp.getbyid(export.getInid());
            model.addAttribute("export", export);
            return "getall_export";
        }
        return null;

    }

    @RequestMapping("/delete")
    public String deletete(String inid) {
        exportServiceImp.delete(inid);
        return "getall_export";
    }

    //添加
    @RequestMapping("/toadd")
    public String toadd() {
        return "addexport";

    }

    //判断
    @RequestMapping("/insert")
    public String insert(Export export) {
        if (null == exportServiceImp.getbyid(export.getInid())) {
            exportServiceImp.insert(export);
        } else {
            exportServiceImp.update(export);
        }
        return "getall_export";

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
                              @RequestParam(value = "inid", required = false) String inid, @RequestParam(value = "pname", required = false) String pname,
                              @RequestParam(value = "retdate", required = false) String retdate, @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 100);
        List<Export> ckin = exportServiceImp.getbyparams(proid, inid, pname, retdate);
        PageInfo<Export> pageInfo = new PageInfo<Export>(ckin);
        model.addAttribute("pageInfo", pageInfo);
        return "getexportbyparams";

    }

    //	根据id查询单个信息
    @RequestMapping("/getckret")
    @ResponseBody
    public Purchase export(String inid) {
        return purchaseServiceImp.getbyid(inid);
    }

    //	按时间区间获取所有进货信息
    @RequestMapping("getinrange")
    public String getinrange(Model model, @RequestParam(value = "param1", required = false)String param1,
                             @RequestParam(value = "param2", required = false)String param2,
                             @RequestParam(defaultValue = "1", value = "pn") Integer pn) {
        PageHelper.startPage(pn, 100);
        List<Export> ckin = exportServiceImp.getinrange(param1, param2);
        PageInfo<Export> pageInfo = new PageInfo<Export>(ckin);
        model.addAttribute("pageInfo", pageInfo);
        return "getexportbyparams";
    }
}
