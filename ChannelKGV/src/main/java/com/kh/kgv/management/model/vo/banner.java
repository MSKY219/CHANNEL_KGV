package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class banner {
    private int bannerNo;
    private String bannerTitle;
    private String bannerRegDate;
    private String bannerImg;
    private String bannerSt;
    private String bannerUrl;
}
