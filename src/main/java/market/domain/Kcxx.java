package market.domain;

import lombok.Data;

import java.util.Date;

@Data
public class Kcxx {
    static Date now = new Date();
    Product product;
    private String proid;
    private String pname;
    private Integer num;
    private String marks;
}