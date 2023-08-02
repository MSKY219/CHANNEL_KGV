package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cinema {
    private int cinemaNo;
    private String cinemaName;
    private String cinemaArea;
    private String cinemaRegion;
    private int cinemaScreen;
}
