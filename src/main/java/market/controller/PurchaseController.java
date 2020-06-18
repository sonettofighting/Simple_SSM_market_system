package market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import market.domain.Purchase;
import market.service.imp.PurchaseServiceImp;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 进货信息与网页进行交互页面
 */
@Controller
@RequestMapping("/staff/flatform/purchase")
public class PurchaseController {
    @Resource
    PurchaseServiceImp purchaseServiceImp;

    //	获取所有进货信息
    @RequestMapping("getall")
    public String getlist(ModelMap model,
                          @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 5);
        List<Purchase> purchase = purchaseServiceImp.getall();
        PageInfo<Purchase> pageInfo = new PageInfo<Purchase>(purchase);
        model.addAttribute("pageInfo", pageInfo);
        return "getall_purchase";

    }

    //	根据id查询单个信息
    @RequestMapping("/getpurchase")
    public String getbyid(String inid, HttpServletRequest request, Model model) {
        request.setAttribute("purchase", purchaseServiceImp.getbyid(inid));
        model.addAttribute("purchase", purchaseServiceImp.getbyid(inid));
        return "getpurchase";
    }

    @RequestMapping("edit")
    public String edit(Purchase purchase, Model model) {
        model.addAttribute("purchase", purchaseServiceImp.getbyid(purchase.getInid()));
        return "editpurchase";
    }

    @RequestMapping("update")
    public String update(Purchase purchase, Model model) {
        if (purchaseServiceImp.update(purchase)) {
            purchase = purchaseServiceImp.getbyid(purchase.getInid());
            model.addAttribute("purchase", purchase);
            return "getall_purchase";
        }
        return null;

    }

    @RequestMapping("/delete")
    public String delete(String inid) {
        purchaseServiceImp.delete(inid);
        return "getall_purchase";
    }

    //  跳转到增加页面
    @RequestMapping("/toadd")
    public String toadd() {
        return "addpurchase";

    }

    @RequestMapping("/insert")
//    先判断数据库有没有，有就更新，没有就新增
    public String insert(Purchase purchase) {
        if (null == purchaseServiceImp.getbyid(purchase.getInid())) {
            purchaseServiceImp.insert(purchase);
        } else {
            purchaseServiceImp.update(purchase);
        }
        return "getall_purchase";

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
                              @RequestParam(value = "indate", required = false) String indate, @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 100);
        List<Purchase> purchase = purchaseServiceImp.getbyparams(proid, inid, pname, indate);
        PageInfo<Purchase> pageInfo = new PageInfo<Purchase>(purchase);
        model.addAttribute("pageInfo", pageInfo);
        return "getpurchasebyparams";
    }
    //	按时间区间获取所有进货信息
    @RequestMapping("getinrange")
    public String getinrange(Model model, @RequestParam(value = "param1", required = false)String param1,
                             @RequestParam(value = "param2", required = false)String param2,
                             @RequestParam(defaultValue = "1", value = "pn") Integer pn) {
        PageHelper.startPage(pn, 100);
        List<Purchase> purchase = purchaseServiceImp.getinrange(param1, param2);
        PageInfo<Purchase> pageInfo = new PageInfo<Purchase>(purchase);
        model.addAttribute("pageInfo", pageInfo);
        return "getpurchasebyparams";
    }
}

