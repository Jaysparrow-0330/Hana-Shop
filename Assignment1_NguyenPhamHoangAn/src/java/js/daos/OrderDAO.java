/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.daos;

import js.dtos.CartDTO;
import js.dtos.ProductDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.naming.NamingException;
import js.utils.DBUtil;

/**
 *
 * @author Admin
 */
public class OrderDAO {
    public boolean createOrder(CartDTO cart) throws SQLException, ClassNotFoundException, NamingException, NamingException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrders (userID, totalPrice, orderDate, status) VALUES(?,?,?,?)";
                String orderID[] = {"orderID"};
                Date orderDate = Date.valueOf(LocalDate.now());
                float totalPrice = 0;
                boolean status = true;
                for (ProductDTO dto : cart.getCartMap().values()) {
                    totalPrice +=  dto.getQuantity() * dto.getPrice();
                }
                stm = conn.prepareStatement(sql, orderID);
                stm.setString(1, cart.getUserID());
                stm.setFloat(2, totalPrice);
                stm.setDate(3, orderDate);
                stm.setBoolean(4, status);
                stm.executeUpdate();
                rs = stm.getGeneratedKeys();
                if (rs.next()) {
                    String orderDetailSql = "INSERT INTO tblsOrderDetail (orderID, itemID, price, quantity) VALUES (?,?,?,?)";
                    for (ProductDTO dto : cart.getCartMap().values()) {
                        stm = conn.prepareStatement(orderDetailSql);
                        stm.setInt(1, rs.getInt(1));
                        stm.setString(2, dto.getProductID());
                        stm.setFloat(3, dto.getPrice());
                        stm.setInt(4, dto.getQuantity());
                        stm.executeUpdate();
                    }
                    result = true;
                }
            }

        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
