package member.dao;

import member.bean.MemberDTO;

import java.sql.*;

public class MemberDAO {

    private String driver = "oracle.jdbc.driver.OracleDriver";
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String username = "c##java";
    private String password = "1234";

    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private static MemberDAO memberDAO = new MemberDAO();

    public static MemberDAO getInstance() {
        return memberDAO;
    }

    public MemberDAO() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    public void getConnection() {
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
            //오류나면 conn=null 추가
        }

    }


    public boolean isExistId(String id) {
        boolean exist = false;
        getConnection();

        String sql = "select * from member where id=?";

        try {
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
        getConnection();
        boolean success = false;

        String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
        try {
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
