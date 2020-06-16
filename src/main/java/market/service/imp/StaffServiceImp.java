package market.service.imp;

import market.dao.StaffMapper;
import market.domain.Staff;
import market.service.IStaffService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StaffServiceImp implements IStaffService {
    @Resource
    private StaffMapper staffDao;

    public Staff getStaff(String staffid, String pwd) {
        Staff staff = staffDao.getStaff(staffid);

        if (staff != null) {
            if (staff.getPwd().equals(pwd))
                return staff;
        }
        return null;
    }

    public boolean update(Staff staff) {
        return staffDao.update(staff);

    }

    public Staff getbyid(String staffid) {
        // TODO Auto-generated method stub
        return staffDao.getbyid(staffid);
    }

    public int delete(String staffid) {
        // TODO Auto-generated method stub
        return staffDao.delete(staffid);
    }

    public int insert(Staff staff) {
        // TODO Auto-generated method stub
        return staffDao.insert(staff);
    }

    public List<Staff> getall() {
        // TODO Auto-generated method stub
        return staffDao.selectByExample();
    }

    public List<Staff> getbyparams(String staffid, String staffname) {
        // TODO Auto-generated method stub
        return staffDao.getbyparams(staffid, staffname);
    }

}
