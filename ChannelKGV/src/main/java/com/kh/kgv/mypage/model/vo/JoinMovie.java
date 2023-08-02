package com.kh.kgv.mypage.model.vo;

import com.kh.kgv.customer.model.vo.Book;
import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Play;
import com.kh.kgv.management.model.vo.Screen;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JoinMovie {
	private Book book;
	private Play play;
	private Movie movie;
	private User user;
	private Screen screen;
}
