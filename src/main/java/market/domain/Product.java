package market.domain;

import lombok.Data;

import java.util.Date;
@Data
public class Product {
    private String proid;

    private String pname;

    private Double price;

    private Double inprice;

    private Date prodate;

    private Date reledate;

    private String supname;

    private String protype;

    private String unit;

    private String marks;
    private Kcxx kcxx;

}