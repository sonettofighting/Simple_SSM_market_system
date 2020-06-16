package market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import market.domain.Export;
import market.domain.Purchase;
import market.service.imp.PurchaseServiceImp;
import market.service.imp.ExportServiceImp;
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
@RequestMapping("/staff/flatform/export")
public class ExportController {
	@Resource
	ExportServiceImp exportServiceImp;

	@Resource
	PurchaseServiceImp purchaseServiceImp;

//	获取所有退货信息
	@RequestMapping("getall")
	public String getlist(ModelMap model,
			@RequestParam(defaultValue="1", value="pn") Integer pn
			) {
		PageHelper.startPage(pn, 4);
		List<Export> export = exportServiceImp.getall();
		PageInfo<Export> pageInfo= new PageInfo<Export>(export);
		model.addAttribute("pageInfo", pageInfo);
		return "getall_export";
		
	}
//	根据id查询单个信息
    @RequestMapping("/getexport")
    public String getbyid(String inid,HttpServletRequest request,Model model){  
        request.setAttribute("export", exportServiceImp.getbyid(inid));
        model.addAttribute("export", exportServiceImp.getbyid(inid));
        return "getexport";
    }
//    根据条件查询
	@RequestMapping("edit")
	public String edit(Export export, Model model){
		model.addAttribute("export", exportServiceImp.getbyid(export.getInid()));
		return "editexport";
	}	
	@RequestMapping("update")
	public String update(Export export, Model model){
    	if(exportServiceImp.update(export)) {
    		export = exportServiceImp.getbyid(export.getInid());
    		model.addAttribute("export", export);
    		return "redirect:getall"; 
    	}
    	return null;
         
    } 
    @RequestMapping("/delete")  
    public String deletete(String inid){
    	exportServiceImp.delete(inid);
        return "redirect:getall";  
    } 
//  跳转到增加页面
    @RequestMapping("/toadd")  
  public String toadd (){  
  	return "addexport";

  } 
    
    @RequestMapping("/insert")  
//    先判断数据库有没有，有就更新，没有就新增
    public String insert(Export export){
    	if(null== exportServiceImp.getbyid(export.getInid())) {
        	exportServiceImp.insert(export);
    	}else {
    		exportServiceImp.update(export);
    	}
    	return "redirect:getall";

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
		List<Export> ckin= exportServiceImp.getbyparams(proid, inid, pname, retdate);
		PageInfo<Export> pageInfo= new PageInfo<Export>(ckin);
		model.addAttribute("pageInfo", pageInfo);
		return "getexportbyparams";
		
	}

//	根据id查询单个信息
    @RequestMapping("/getckret")  
    @ResponseBody
    public Purchase export(String inid){
		return purchaseServiceImp.getbyid(inid);
    }

}
