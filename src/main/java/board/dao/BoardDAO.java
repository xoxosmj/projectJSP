package board.dao;

import board.bean.BoardDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    public static BoardDAO instance = new BoardDAO();

    public static BoardDAO getInstance() {
        return instance;
    }

    public BoardDAO() {
        Context ctx;
        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        } catch (NamingException e) {
            e.printStackTrace();
        }

    }

    public void boardWrite(Map<String, String> map) {
        String sql = """
                insert into board(seq,id,name,email,subject,content,ref)
                values(seq_board.nextval,?,?,?,?,?,seq_board.nextval)
                """;

        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, map.get("id"));
            pstmt.setString(2, map.get("name"));
            pstmt.setString(3, map.get("email"));
            pstmt.setString(4, map.get("subject"));
            pstmt.setString(5, map.get("content"));

            pstmt.executeUpdate();

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
    }

    public List<BoardDTO> boardList(int startNum, int endNum) {
        List<BoardDTO> list = new ArrayList<BoardDTO>();

        String sql = """
                select * from
                (select rownum rn, tt.* from
                (select * from board order by ref desc, step asc) tt
                )where rn>=? and rn <=?
                """;

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startNum);
            pstmt.setInt(2, endNum);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setSeq(rs.getInt("seq"));
                boardDTO.setId(rs.getString("id"));
                boardDTO.setName(rs.getString("name"));
                boardDTO.setEmail(rs.getString("email"));
                boardDTO.setSubject(rs.getString("subject"));
                boardDTO.setContent(rs.getString("content"));
                boardDTO.setRef(rs.getInt("Ref"));
                boardDTO.setLev(rs.getInt("lev"));
                boardDTO.setStep(rs.getInt("step"));
                boardDTO.setPseq(rs.getInt("pseq"));
                boardDTO.setReply(rs.getInt("reply"));
                boardDTO.setHit(rs.getInt("hit"));
                boardDTO.setLogtime(rs.getTimestamp("logtime"));

                list.add(boardDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            list = null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();


            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    public int getTotalA() {
        int totalA = 0;
        String sql="select count(*) from board";

        try {
            conn=ds.getConnection();
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while (rs.next()) {
                totalA = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalA;
    }
}