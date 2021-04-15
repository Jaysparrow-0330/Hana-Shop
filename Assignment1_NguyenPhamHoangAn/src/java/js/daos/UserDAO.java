/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import js.dtos.UserDTO;
import js.utils.DBUtil;

/**
 *
 * @author jack3
 */
public class UserDAO {

    Connection con;
    PreparedStatement stm;
    ResultSet rs;

    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
    * This method take the 
    * @param #usr and #pwd to check if there's any user from DB match that info 
    * @return a DTO of that user if exist or null if not
    */
    public UserDTO checkLogin(String usr, String pwd) {
        
        UserDTO dto = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT roleID,userName,phone,address,status FROM tblUser WHERE userID = ? AND userPassword = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, usr);
            stm.setString(2, pwd);
            rs = stm.executeQuery();
            
            if(rs.next()){
                String roleID = rs.getString("roleID");
                String fullname = rs.getString("userName");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                boolean status  = rs.getBoolean("status");
                
                dto = new UserDTO(roleID, usr, "***", fullname, address, phone, status); 
            }
        } catch (ClassNotFoundException | SQLException | NamingException ex) {
            //Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            
        } finally {
            closeConnection();
        }
        return dto;
    }

}
