package test.member.dao;
/*
 *  Application 전역에서 MemberDao 객체는 오직 하나만 생성되어서 사용되도록 만들기
 */

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
   //자신의 참조값을 저장할수 있는 static 필드 선언
   private static MemberDao dao;
   //외부에서 객체 생성하지 못하게
   private MemberDao() {}
   //MemberDao 객체의 참조값을 리턴해주는 public static 메소드 만들어 놓기 
   public static MemberDao getInstance() {
      //만일 static 필드가 null 이면(최초로 getInstance() 메소드가 호출된 것이라면)
      if(dao==null) {
         //MemberDao 객체를 생성해서 static 필드에 저장한다.
         dao=new MemberDao();
      }
      //static 필드에 저장된 MemberDao 객체의 참조값을 리턴해 준다. 
      return dao;
   }
   
   /*
     	Connection conn = null;
	   	PreparedStatement pstmt = null;
	    conn=new DbcpBean().getConn();
		
		겹치는 거 아냐? 라고 하면서 이 코드를 밖으로 빼서는 안된다.
		여러 명이 같이 쓰는 자원이기 때문에, 여러 명이 수정하고 지지고 볶은 게 공유자원으로 뒤섞여 버리기 때문이다...
    */
   

   //INSERT 
   //인자로 전달되는 MemberDto 객체에 담긴 회원의 이름과 주소를 DB에 저장하는 메소드
   public boolean insert(MemberDto dto) {
	   	Connection conn = null;
	   	PreparedStatement pstmt = null;
	    int updatedRowCount=0;

		try {
		   	conn=new DbcpBean().getConn();
		   	//실행 SQL문
			String sql="INSERT INTO member"
			  + " (num, name, address)"
			  + " VALUES(member_seq.NEXTVAL, ?, ?)";
			//PreparedStatement 객체 얻어내기 
			pstmt=conn.prepareStatement(sql);
			//? 바인딩 할게 있으면 바인딩 한다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			//실행후 메소드가 리턴해주는 변화된 행의 갯수를 지역변수에 담는다. 
			updatedRowCount=pstmt.executeUpdate();
		} catch(Exception e) {
		    e.printStackTrace();
		} finally {
		    try {
		    	if(pstmt!=null)pstmt.close();
		    	if(conn!=null)conn.close();
		    } catch(Exception e) {}
		}
			//만일 변화된 행의 갯수가 0보다 크면
			if(updatedRowCount > 0) {
			//작업 성공의 의미이기 때문에 true 를 리턴하고 
			    return true;
			} else {
			//작업이 실패면 false 를 리턴한다. 
			    return false;
		}      
   }
   
   //전체 회원의 목록을 리턴하는 메소드 
   public List<MemberDto> getList(){
      
      //회원 목록을 담을 객체 생성
      List<MemberDto> list=new ArrayList<>();
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
	         //Connection 객체의 참조값 얻어오기 (Connection Pool 에서 하나 가져오기)
	         conn = new DbcpBean().getConn();
	         //실행할 SQL 문 작성
	         String sql = "SELECT num, name, address"
	               + " FROM member"
	               + " ORDER BY num ASC";
	         //SQL 문을 전달하면서 PreparedStatement 객체의 참조값 얻어오기
	         pstmt = conn.prepareStatement(sql);
	         //?에 값을 바인딩 할게 있으면 한다.
	
	         //select 문 수행하고 결과를 ResultSet 으로 받아온다.
	         rs = pstmt.executeQuery();
	         //반복문 돌면서 ResultSet 의 cursor 를 한칸씩 내린다.
	         while (rs.next()) {
	            //cursor 가 위치한 곳의 칼럼 데이터 추출해서 어딘가에 담기 
	            
	            //MemberDto 객체를 생성해서 
	            MemberDto dto=new MemberDto();
	            //ResultSet 에서 읽어온 정보를 MemberDto 객체의 setter 메소드를 이용해서 담는다.
	            dto.setNum(rs.getInt("num"));
	            dto.setName(rs.getString("name"));
	            dto.setAddr(rs.getString("address"));
	            //회원 한명의 정보를 담고 있는 MemberDto 객체의 참조값을 ArrayList 객체에 누적시키기
	            list.add(dto);
	         }
      } catch (Exception e) {
         //혹시 예외가 발생한다면 예외정보를 콘솔에 출력해서 에러의 원인 찾기 
         e.printStackTrace();
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close(); //Connection 반납
         } catch (Exception e) {
         }
      }
      
      //ArrayList 객체의 참조값 리턴하기
      return list;
   }


   //DELETE
	public boolean delete(MemberDto dto) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   int updatedRowCount=0;
	
	   try {
	       conn=new DbcpBean().getConn();
	       String sql="DELETE FROM member"
	               + " WHERE num=?";
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1, dto.getNum());
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
	
   //GETDATA
   public MemberDto getData(int num) {
	      MemberDto dto=null;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         //Connection 객체의 참조값 얻어오기 (Connection Pool 에서 하나 가져오기)
	         conn = new DbcpBean().getConn();
	         //실행할 SQL 문 작성
	         String sql = "SELECT name, address"
	               + " FROM member"
	               + " WHERE num=?";
	         //SQL 문을 전달하면서 PreparedStatement 객체의 참조값 얻어오기
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값을 바인딩 할게 있으면 한다.
	         pstmt.setInt(1, num);
	         //select 문 수행하고 결과를 ResultSet 으로 받아온다.
	         rs = pstmt.executeQuery();
	         //반복문 돌면서 ResultSet 의 cursor 를 한칸씩 내린다.
	         while (rs.next()) {
	            //cursor 가 위치한 곳의 칼럼 데이터 추출해서 어딘가에 담기 
	            dto=new MemberDto();
	            dto.setNum(num);
	            dto.setName(rs.getString("name"));
	            dto.setAddr(rs.getString("address"));
	         }

	      } catch (Exception e) {
	         //혹시 예외가 발생한다면 예외정보를 콘솔에 출력해서 에러의 원인 찾기 
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close(); //Connection 반납
	         } catch (Exception e) {
	         }
	      }
	      return dto;
	   }
	   
   //UPDATE
   public boolean update(MemberDto dto) {
	  Connection conn = null;
	  PreparedStatement pstmt = null;
	  int updatedRowCount=0;

      conn=new DbcpBean().getConn();

      try {
          String sql="UPDATE member"
                  + " SET name=?, address=?"
                  + " WHERE num=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getAddr());
            pstmt.setInt(3, dto.getNum());
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










