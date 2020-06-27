package market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import market.domain.Constants;
import market.domain.Staff;
import market.service.imp.StaffServiceImp;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/staff")
public class StaffController {
    @Autowired
    StaffServiceImp staffServiceImp;
    private final Logger logger = Logger.getLogger(StaffController.class);

    @RequestMapping("/login")
    public String login() {
        logger.debug("LoginController welcome AppInfoSystem develpor==================");
        return "stafflogin";
    }

    @RequestMapping(value = "/dologin")
    public String dologin(@RequestParam String staffid, @RequestParam String pwd,
                          HttpSession session, HttpServletRequest request) {
        Staff staff = staffServiceImp.getStaff(staffid, pwd);
        if (staff != null) {
            session.setAttribute(Constants.Staff_SESSION, staff);
            return "redirect:main";
        } else {
            request.setAttribute("error", "账号密码不匹配");
            return "stafflogin";
        }
    }

    @RequestMapping(value = "/main")
    public String main(HttpSession session) {
//		验证是否有session信息，防止非法登录，没有就跳转到登录页面
        if (session.getAttribute(Constants.Staff_SESSION) == null) {
            return "redirect:/staff/login";
        }
        return "main";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
//		退出清除esison
        session.removeAttribute(Constants.Staff_SESSION);
        return "stafflogin";

    }

    @RequestMapping("/getbyid")
    public String grxx(String staffid, HttpServletRequest request, Model model) {
        request.setAttribute("staff", staffServiceImp.getbyid(staffid));
        model.addAttribute("staff", staffServiceImp.getbyid(staffid));
        return "grxx";

    }

    @RequestMapping("/update")
    public String update(Staff staff, Model model) {
        if (staffServiceImp.update(staff)) {
            staff = staffServiceImp.getbyid(staff.getStaffid());
            model.addAttribute("custom", staff);
            return "redirect:/staff/login";
        }
        return null;
    }
//  跳转到修改页面

    @RequestMapping("/toupdate")
    public String editstaff(Staff staff, Model model) {
        model.addAttribute("staff", staffServiceImp.getbyid(staff.getStaffid()));
        return "editstaff";
    }

//  跳转到增加页面

    @RequestMapping("/toadd")
    public String toadd() {
        return "addstaff";

    }


//  先判断数据库有没有，有就更新，没有就新增

    @RequestMapping("/insert")
    public String insert(Staff staff) {
        if (null == staffServiceImp.getbyid(staff.getStaffid())) {
            staffServiceImp.insert(staff);
        } else {
            staffServiceImp.update(staff);
        }
        return "getall_cus";

    }
//    删除

    @RequestMapping("/delete")
    public String delete(String staffid) {
        staffServiceImp.delete(staffid);
        return "getall_cus";
    }
//  查询所有

    @RequestMapping("/getall")
    public String getall_cus(ModelMap model,
                             @RequestParam(defaultValue = "1", value = "pn") Integer pn
    ) {
        PageHelper.startPage(pn, 5);
        List<Staff> staffs = staffServiceImp.getall();
        PageInfo<Staff> pageInfo = new PageInfo<Staff>(staffs);
        model.addAttribute("pageInfo", pageInfo);
        return "getall_staff";
    }

    //根据条件查询
    @RequestMapping("getbyparams")
    public String getbyparams(@RequestParam(value = "staffname", required = false) String staffname, @RequestParam(value = "staffid", required = false) String staffid,
                              @RequestParam(defaultValue = "1", value = "pn") Integer pn, Model model
    ) {
        PageHelper.startPage(pn, 100);
        List<Staff> staffs = staffServiceImp.getbyparams(staffid, staffname);
        PageInfo<Staff> pageInfo = new PageInfo<Staff>(staffs);
        model.addAttribute("pageInfo", pageInfo);
        return "getstaffbyparams";

    }
}

