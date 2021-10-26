package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.root.board.dto.BoardDTO;

public class BoardDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이브 로드 성공");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"ysshin", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> getBoardList() {
		int num=1;
		System.out.println("getBoardList 호출 되었습니다");
		String sql = "select * from jsp_board";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(num++);
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int register(BoardDTO dto) {
		String sql = "insert into jsp_board(title, content, id) values(?,?,?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getId());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public BoardDTO getBoard(String title) {
		System.out.println("title : "+title);
		String sql = "select * from jsp_board where title='"+title+"'";
		System.out.println(sql);
		BoardDTO dto = null;
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
	         try{
	             rs.close();
	             ps.close();
	             con.close();
	         }catch(Exception e){
	             e.printStackTrace();
	         }
		}
		return dto;
	}
	
	public int modifySave(BoardDTO dto) {
		int result = 0;
		String sql = 
			"update jsp_board set title=?, content=?, id=? where title=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			System.out.println(dto.getTitle());
			ps.setString(2, dto.getContent());
			System.out.println(dto.getContent());
			ps.setString(3, dto.getId());
			ps.setString(4, dto.getOrigin());
			System.out.println(dto.getOrigin());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String title) {
		int result = 0;
		String sql = "delete from jsp_board where title='"+title+"'";
		try {
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
	         try{
	             ps.close();
	             con.close();
	         }catch(Exception e){
	             e.printStackTrace();
	         }
		}
		return result;
	}
}
