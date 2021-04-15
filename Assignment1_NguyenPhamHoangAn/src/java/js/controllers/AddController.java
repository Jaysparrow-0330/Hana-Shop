/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import js.daos.ProductDAO;
import js.dtos.CartDTO;
import js.dtos.ProductDTO;
import js.dtos.UserDTO;

/**
 *
 * @author jack3
 */
public class AddController extends HttpServlet {

    private static final String SUCCESS = "ShoppingController";
    private static final String ERROR = "shopping.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;

        try {

            String ProductID = request.getParameter("PRODUCT_ID");
            String ProductName = request.getParameter("PRODUCT_NAME");
            String Category = request.getParameter("PRODUCT_CATE");
            int quantity = Integer.parseInt(request.getParameter("PRODUCT_QUANTITY"));
            String imageLink = request.getParameter("PRODUCT_IMAGE_LINK");

            float price = Float.parseFloat(request.getParameter("PRODUCT_PRICE"));

            String Description = request.getParameter("PRODUCT_DESCRIPTION");

            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
          
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (cart == null) {

                cart = new CartDTO(user.getUsername(), null);

            }
            cart.add(new ProductDTO(ProductID, ProductName, Category, quantity, imageLink, null, price, true, Description));
            ProductDAO dao = new ProductDAO();
            
//            for (int i = 0; i < list.size(); i++) {
//                if (list.get(i).getProductID().equals(ProductID)) {
//                    list.remove(i);
//                }
//            }
            session.setAttribute("CART", cart);
           
            session.setAttribute("USER_NAME", user.getFullname());

            url = SUCCESS;
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
