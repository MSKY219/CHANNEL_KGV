package com.kh.kgv.management.model.vo;

import com.kh.kgv.customer.model.vo.Book;
import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Play;
import com.kh.kgv.items.model.vo.TimeTable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JoinBook {
	private Book book; //
	private Play play; //
	private User user; //
	private Movie movie; //
	private Screen screen; //
	private Cinema cinema; //
	private TimeTable tt; //
	private CinemaPrice cinemaPrice; //
}
