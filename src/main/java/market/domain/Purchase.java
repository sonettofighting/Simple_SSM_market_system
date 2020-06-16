package market.domain;

import lombok.Data;

import java.util.Date;

@Data
public class Purchase {
    private String inid;

    private String proid;

    private String pname;

    private Integer num;

    private Date indate;

    private String marks;

}