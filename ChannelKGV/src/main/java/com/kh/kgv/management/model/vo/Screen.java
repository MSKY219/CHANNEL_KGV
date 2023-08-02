package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Screen {
    private int screenNo;
    private String cinemaName;
    private int screenName;
    private String screenStyle;
    private int screenSeat;
    private String screenDetail;
    private int screenRow;
    private int screenCol;
    private String screenAisle;
    private String screenSpace;
    private String screenSweet;
    private String screenImpaired;
}
