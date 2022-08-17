package test.todo.dao;

import java.sql.*;
import java.util.*;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao2_mywork {
	private static TodoDao2_mywork dao;
	private TodoDao2_mywork() {}
	public static TodoDao2_mywork getInstance() {
		if(dao==null) {
			dao=new TodoDao2_mywork();
		}
		return dao;
	}
	
	// SHOW ALL
	public List<TodoDto> getListAll() {
		List<TodoDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT num, content, regdate"
					+ " FROM todo"
					+ " ORDER BY num ASC";
	        pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				TodoDto dto=new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// INSERT
	public boolean insert(TodoDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
	    int updatedRowCount=0;

		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO todo"
					+ " (num, content, regdate)"
					+ " VALUES(member_seq.NEXTVAL, ?, SYSDATE)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			updatedRowCount=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {}
		}
			if(updatedRowCount > 0) {
				return true;
			} else {
				return false;
			}
	}
	
	//DELETE
	public boolean delete(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updatedRowCount=0;
		
		try {
				conn=new DbcpBean().getConn();
				String sql="DELETE FROM todo"
				           + " WHERE num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getNum());
				updatedRowCount=pstmt.executeUpdate();
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {}
		}
		if(updatedRowCount > 0) { return true; }
		else { return false; }
	}
	
	//GETDATA
	public TodoDto getData(int num) {
		TodoDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=new DbcpBean().getConn();
			String sql = "SELECT content, regdate"
		               + " FROM todo"
		               + " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while (rs.next()) {
	            dto=new TodoDto();
	            dto.setNum(num);
	            dto.setContent(rs.getString("content"));
	            dto.setRegdate(rs.getString("regdate"));
	         }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	         try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	         } catch (Exception e) {}
	      }
		return dto;
	}
	
	//UPDATE
	   public boolean update(TodoDto dto) {
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		  int updatedRowCount=0;

	      conn=new DbcpBean().getConn();

	      try {
	          String sql="UPDATE todo"
	                  + " SET content=?"
	                  + " WHERE num=?";
	            pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1, dto.getContent());
	            pstmt.setInt(2, dto.getNum());
	            updatedRowCount=pstmt.executeUpdate();
	         }catch(Exception e) {
	            e.printStackTrace();
	         }finally {
	            try {
	               if(pstmt!=null)pstmt.close();
	               if(conn!=null)conn.close();
	            }catch(Exception e) {}
	         }
	         if(updatedRowCount > 0) {
	            return true;
	         }else {
	            return false;
	       }      
	   }
}

