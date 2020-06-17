package market.domain;

import lombok.Data;

import java.util.Date;
@Data
public class Kcxx {
    private String proid;

    private String pname;

    private Integer num;

    private String marks;
    
    Product product;
    static Date now = new Date();
}