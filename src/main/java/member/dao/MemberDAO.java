package member.dao;

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
        boolean exist=false;
        getConnection();

        String sql = "select * from member where id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                exist=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exist;
    }
}
