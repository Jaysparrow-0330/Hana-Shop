/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import js.daos.OrderDAO;
import js.daos.ProductDAO;
import js.dtos.CartDTO;
import js.dtos.ProductDTO;

/**
 *
 * @author jack3
 */
public class ConfirmController extends HttpServlet {
    private static final String SUCCESS = "confirm.jsp";
    private static final String ERROR = "confirm.jsp";
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
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
  

            if (cart != null) {
                OrderDAO order = new OrderDAO();
                ProductDAO dao = new ProductDAO();
                if (checkQuantity(request, response)) {
                    if (order.createOrder(cart)) {
                        for (ProductDTO dto : cart.getCartMap().values()) {
                            int quantity = dao.getQuantity(dto.getProductID());
                            dao.calculateQuantity(dto.getQuantity(), quantity, dto.getProductID());
                            List<String> list = dao.getListProductID();
                            for (int i = 0; i < list.size(); i++) {
                                cart.delete(list.get(i));
                            }
                            url = SUCCESS;
                            request.setAttribute("CONFIRM", "Congratulations! Your order has been confirmed! ");
                        }
                    } else {
                        url = SUCCESS;
                        request.setAttribute("CONFIRM", "Sorry! We don't have enough products!");
                    }
                } else {
                    url = SUCCESS;
                    request.setAttribute("CONFIRM", "Sorry! Your order has problem!");
                }
            } else {
                url = ERROR;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public static boolean checkQuantity(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");

            ProductDAO dao = new ProductDAO();

            for (ProductDTO dto : cart.getCartMap().values()) {
                if (dto.getQuantity() > dao.getQuantity(dto.getProductID())) {
                    System.out.println(dao.getQuantity(dto.getProductID()));
                    return false;
                }
            }
        } catch (Exception e) {
        }
        return true;
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
