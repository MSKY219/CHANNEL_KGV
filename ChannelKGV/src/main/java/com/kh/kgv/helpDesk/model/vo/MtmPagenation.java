package com.kh.kgv.helpDesk.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MtmPagenation {
    private int currentPage;    // 현재 페이지 번호
    private int mtmCount;      // 전체 게시글 수
    private int limit = 10;     // 한 페이지에 보여질 게시글의 수
    private int pageSize = 10;  // 목록 하단 페이지 번호의 노출 개수
    private int maxPage;        // 제일 큰 페이지 번호 == 마지막 페이지 번호
    private int startPage;      // 목록 하단에 노출된 페이지의 시작 번호
    private int endPage;        // 목록 하단에 노출된 페이지의 끝 번호
    private int prevPage;       // 목록 하단에 노출된 번호의 이전 목록 끝 번호
    private int nextPage;       // 목록 하단에 노출된 번호의 다음 목록 시작 번호
	

    public MtmPagenation(int currentPage, int mtmCount) {
        this.currentPage = currentPage;
        this.mtmCount = mtmCount;
        calculatePagination();
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
        calculatePagination();
    }

    public void setListCount(int listCount) {
        this.mtmCount = listCount;
        calculatePagination();
    }

    public void setLimit(int limit) {
        this.limit = limit;
        calculatePagination();
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
        calculatePagination();
    }

	// 페이징 처리에 필요한 값을 계산하는 메서드
    private void calculatePagination() {
   	
        maxPage = (int) Math.ceil((double) mtmCount / limit);
        startPage = (currentPage - 1) / pageSize * pageSize + 1;
        endPage = startPage + pageSize - 1;
        
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        if (currentPage <= pageSize) {
            prevPage = 1;
        } else {
            prevPage = startPage - 1;
        }
        if (endPage == maxPage) {
            nextPage = maxPage;
        } else {
            nextPage = endPage + 1;
        }
    }
}