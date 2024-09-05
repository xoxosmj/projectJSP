package member.dao;

import member.bean.MemberDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class MemberDAO {

    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private DataSource ds; //커넥션풀


    private static MemberDAO memberDAO = new MemberDAO();

    public static MemberDAO getInstance() {
        return memberDAO;
    }

    public MemberDAO() {
        Context ctx = null;
        try {
            ctx = new InitialContext(); //Context는 인터페이스라 바로 new가 안되고 메소드를 호출해서 생성
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); //톰캣의 경우에만 앞에 접두사로 java:comp/env/가 붙는다
        } catch (NamingException e) {
            e.printStackTrace();
        }

    }


    public boolean isExistId(String id) {
        boolean exist = false;

        String sql = "select * from member where id=?";

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                exist = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return exist;
    }


    public boolean memberWrite(MemberDTO memberDTO) {
       boolean success = false;

        String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDTO.getName());
            pstmt.setString(2, memberDTO.getId());
            pstmt.setString(3, memberDTO.getPwd());
            pstmt.setString(4, memberDTO.getGender());
            pstmt.setString(5, memberDTO.getEmail1());
            pstmt.setString(6, memberDTO.getEmail2());
            pstmt.setString(7, memberDTO.getTel1());
            pstmt.setString(8, memberDTO.getTel2());
            pstmt.setString(9, memberDTO.getTel3());
            pstmt.setString(10, memberDTO.getZipcode());
            pstmt.setString(11, memberDTO.getAddr1());
            pstmt.setString(12, memberDTO.getAddr2());

            int join = pstmt.executeUpdate();
            if (join > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return success;

    }
}
