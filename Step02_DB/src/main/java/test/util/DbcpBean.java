package test.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
/*
 * [ DataBase Connection Pool Bean a.k.a DbcpBean ]
 * (*자바에서 Bean은 객체의 별칭이다.)
 * 
 * - connection pool에 미리 데이터베이스 정보를 얻어놔두고 필요할때마다 꺼내 쓰는것.
 * 
 * - 최초 Connection 이 필요한 시점에 미리 Connection 여러개를 얻어내서 Connection Pool에 넣어두고
 *   필요할 때 가져다 쓰고 다 가져다 쓴 다음 반납하는 구조로 사용.
 *   
 * - Connection Pool 에서 Connection 한 개를 가져오는 방법은 우리가 익히 아는 방법 :
 * 	 Connection conn=new DbcpBean().getConn();
 * 
 * - 다 사용한 후 반납하기 :
 * 	 conn.close(); <--  close() 메소드를 호출해서 Pool에 반납한다.
 * 
 */

public class DbcpBean {
   //필드
   private Connection conn;
   
   //생성자
   public DbcpBean() {
      try {
         Context initContext = new InitialContext();
         Context envContext  = (Context)initContext.lookup("java:/comp/env");
         DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle"); //context.xml 에 있는 Resource name
         //리턴되는 Connection 객체를 필드에 저장하기
         conn = ds.getConnection();
         System.out.println("Connection 얻어오기 성공!");
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   //메소드
   public Connection getConn() {
      return conn;
   }
}








