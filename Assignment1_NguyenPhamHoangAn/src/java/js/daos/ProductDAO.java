/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import js.dtos.ProductDTO;
import js.utils.DBUtil;

/**
 *
 * @author jack3
 */
public class ProductDAO {

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

    public List<ProductDTO> loadProductList() {
        List<ProductDTO> list = null;
        try {

            con = DBUtil.getConnection();
            String sql = "SELECT itemID,itemName,c.categoryName AS 'Category',quantity,imageLink,createDate,price,description "
                    + "FROM tblItem p JOIN tblCategory c on p.categoryID = c.categoryID WHERE p.status = 1 AND p.quantity > 0";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("itemID");
                String name = rs.getString("itemName");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                String imageLink = rs.getString("imageLink");
                Date createDate = rs.getDate("createDate");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                boolean status = true;

                list.add(new ProductDTO(id, name, category, quantity, imageLink, createDate, price, status, description));
            }

        } catch (ClassNotFoundException | SQLException | NamingException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<ProductDTO> loadAllProductList(int index) {
        List<ProductDTO> list = null;
        try {

            con = DBUtil.getConnection();
            String sql = "SELECT itemID,itemName,c.categoryName AS 'Category',quantity,imageLink,createDate,price,description,status "
                    + "FROM tblItem p JOIN tblCategory c on p.categoryID = c.categoryID order by createDate offset ? rows fetch first 20 rows only";
            stm = con.prepareStatement(sql);

            stm.setInt(1, (index - 1) * 20);

            rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("itemID");
                String name = rs.getString("itemName");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                String imageLink = rs.getString("imageLink");
                Date createDate = rs.getDate("createDate");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");

                list.add(new ProductDTO(id, name, category, quantity, imageLink, createDate, price, status, description));
            }

        } catch (ClassNotFoundException | SQLException | NamingException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return list;
    }

    public Map<String, String> loadCategoriesMap() {
        Map<String, String> categoryMap = new HashMap<>();
        try {
            con = DBUtil.getConnection();
            String sql = "SELECT categoryID,categoryName FROM tblCategory";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                categoryMap.put(rs.getString("categoryID"), rs.getString("categoryName"));
            }
        } catch (Exception e) {
            //Log
        } finally {
            closeConnection();
        }
        return categoryMap;
    }

    public List<ProductDTO> searchProductList(String search) {
        List<ProductDTO> list = null;
        try {

            con = DBUtil.getConnection();
            String sql = "SELECT itemID,itemName,c.categoryName AS 'Category',quantity,imageLink,createDate,price,description,status "
                    + "FROM tblItem p JOIN tblCategory c on p.categoryID = c.categoryID "
                    + "WHERE p.itemName LIKE ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("itemID");
                String name = rs.getString("itemName");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                String imageLink = rs.getString("imageLink");
                Date createDate = rs.getDate("createDate");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");

                list.add(new ProductDTO(id, name, category, quantity, imageLink, createDate, price, status, description));
            }
        } catch (ClassNotFoundException | SQLException | NamingException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean updateProductInfo(ProductDTO dto) {
        boolean success = true;

        try {

            con = DBUtil.getConnection();
            String sql = "UPDATE tblItem SET itemName=?,categoryID=?,createDate=?"
                    + ",imageLink=?,quantity=?,price=?,description=? WHERE itemID = ?";
            stm = con.prepareStatement(sql);

            stm.setString(1, dto.getName());
            stm.setString(2, dto.getCategory());
            stm.setDate(3, dto.getCreateDate());
            stm.setString(4, dto.getImageLink());
            stm.setInt(5, dto.getQuantity());
            stm.setFloat(6, dto.getPrice());
            stm.setString(7, dto.getDescription());
            stm.setString(8, dto.getProductID());

            int affectedRow = stm.executeUpdate();
            if (affectedRow > 0) {
                success = true;
            }
        } catch (ClassNotFoundException | SQLException | NamingException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return success;
    }

    public List<ProductDTO> searchProductOnCategory_PriceRange(String productName, String categoryID, float min, float max) {
        List<ProductDTO> list = null;
        try {

            con = DBUtil.getConnection();
            String sql = "SELECT itemID,itemName,c.categoryName AS 'Category',quantity,imageLink,createDate,price,description "
                    + "FROM tblItem p JOIN tblCategory c on p.categoryID = c.categoryID "
                    + "WHERE (p.status = 1 AND p.quantity > 0) AND ((p.itemName LIKE ?) OR (p.categoryID LIKE ?) OR (p.price BETWEEN ? AND ?)) "
                    + "ORDER BY p.createDate";
            stm = con.prepareStatement(sql);

            if (productName.trim().isEmpty()) {
                stm.setNull(1, java.sql.Types.VARCHAR);
            } else {
                stm.setString(1, "%" + productName + "%");
            }
            if (categoryID.equals("none")) {
                stm.setNull(2, java.sql.Types.VARCHAR);
            } else {
                stm.setString(2, "%" + categoryID + "%");
            }
            if (min == 0.0 && max == 0.0) {
                stm.setNull(3, java.sql.Types.FLOAT);
                stm.setNull(4, java.sql.Types.FLOAT);
            } else {
                stm.setFloat(3, min);
                stm.setFloat(4, max);
            }
            rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("itemID");
                String name = rs.getString("itemName");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                String imageLink = rs.getString("imageLink");
                Date createDate = rs.getDate("createDate");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                boolean status = true;

                list.add(new ProductDTO(id, name, category, quantity, imageLink, createDate, price, status, description));
            }

        } catch (ClassNotFoundException | SQLException | NamingException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean checkProductID(String productID) throws ClassNotFoundException, SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT itemID FROM tblItem WHERE itemID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, productID);
            rs = stm.executeQuery();
            while (rs.next()) {
                return false;
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
        return true;
    }

    public void createProduct(ProductDTO dto) throws ClassNotFoundException, SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO tblItem (itemID, itemName, quantity, price, description, categoryID, imageLink, status, createDate) VALUES (?,?,?,?,?,?,?,?,?)";
            Date createDate = Date.valueOf(LocalDate.now());
            stm = conn.prepareStatement(sql);
            stm.setString(1, dto.getProductID());
            stm.setString(2, dto.getName());
            stm.setInt(3, dto.getQuantity());
            stm.setFloat(4, dto.getPrice());
            stm.setString(5, dto.getDescription());
            stm.setString(6, dto.getCategory());
            stm.setString(7, dto.getImageLink());
            stm.setBoolean(8, dto.isStatus());
            stm.setDate(9, createDate);
            stm.executeUpdate();

        } catch (SQLException e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<ProductDTO> getAllProduct(int index) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        DBUtil util = new DBUtil();
        List<ProductDTO> list = new ArrayList<>();
        String query = "select itemID,  itemName, quantity, price, description, categoryID, imageLink, status, createDate from tblItem order by createDate offset ? rows fetch first 20 rows only";
        try {
            conn = util.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 20);
            rs = ps.executeQuery();
            while (rs.next()) {
                String ID = rs.getString("itemID");
                String name = rs.getString("itemName");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                String category = rs.getString("categoryID");
                String image = rs.getString("imageLink");
                boolean status = rs.getBoolean("status");
                Date createDate = rs.getDate("createDate");

                list.add(new ProductDTO(ID, name, category, quantity, image, createDate, price, status, description));
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getNumberPage() throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "select COUNT(itemID) from tblItem";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = 0;
                    countPage = total / 20;
                    if (total % 20 != 0) {
                        countPage++;
                    }
                    return countPage;
                }
            }

        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public int getQuantity(String id) throws ClassNotFoundException, SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int quantity = 0;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT quantity from tblItem WHERE itemID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt(1);
            }

        } catch (SQLException e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;
    }

    public void calculateQuantity(int orderQuantity, int storedQuantity, String productID) throws SQLException, ClassNotFoundException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;

        int remainingQuantity = 0;
        try {
            conn = DBUtil.getConnection();
            remainingQuantity = storedQuantity - orderQuantity;
            if (remainingQuantity > 0) {
                String sql = "UPDATE tblItem SET quantity = ? WHERE itemID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, remainingQuantity);
                stm.setString(2, productID);

            } else if (remainingQuantity == 0) {
                String sql = "UPDATE tblItem SET quantity = ? , status = 'false' WHERE itemID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, remainingQuantity);
                stm.setString(2, productID);
            }

            stm.setInt(1, remainingQuantity);
            stm.setString(2, productID);
            stm.executeUpdate();
        } catch (SQLException ex) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    public List<String> getListProductID() throws SQLException, ClassNotFoundException, NamingException {
        List<String> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT itemID FROM tblProducts";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString(1);

                if (list == null) {
                    list = new ArrayList<String>();
                }
                list.add(productID);
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
        return list;
    }
    public boolean deleteProduct(String productID) {
        boolean success = true;

        try {

            con = DBUtil.getConnection();
            String sql = "UPDATE tblProducts SET status = 0 WHERE productID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, productID);

            int affectedRow = stm.executeUpdate();
            if (affectedRow > 0) {
                success = true;
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            System.out.println(ex);
        }
        finally {
            closeConnection();
        }
        return success;
    }
}
