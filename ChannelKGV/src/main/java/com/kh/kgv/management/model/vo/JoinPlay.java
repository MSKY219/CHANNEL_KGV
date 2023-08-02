package com.kh.kgv.management.model.vo;

import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Play;
import com.kh.kgv.items.model.vo.TimeTable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JoinPlay {
	private Play play;
	private Cinema cinema;
	private Movie movie;
	private TimeTable tt;
	private Screen screen;
}
