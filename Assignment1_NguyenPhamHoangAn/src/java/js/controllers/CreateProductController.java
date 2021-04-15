/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import js.daos.ProductDAO;
import js.dtos.ProductDTO;
import js.dtos.ProductErrorDTO;

/**
 *
 * @author jack3
 */
public class CreateProductController extends HttpServlet {

    private static final String SUCCESS = "ManageController";
    private static final String ERROR = "createProduct.jsp";

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
        boolean check = true;
        try {
            String productID = request.getParameter("txtProductID");
            String productName = request.getParameter("txtProductName");
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            float price = Float.parseFloat(request.getParameter("txtPrice"));
            String categoryID = request.getParameter("txtCategory");
            String image = request.getParameter("txtImage");
            String description = request.getParameter("txtDescription");

            ProductDAO dao = new ProductDAO();
           

            ProductErrorDTO error = new ProductErrorDTO("", "", "", "", "");
            if (!dao.checkProductID(productID)) {
                check = false;
                error.setProductIDError("This ID is already exist---Please try another ID");
            }
            if (quantity <= 0) {
                check = false;
                error.setQuantityError("Quantity cannot equal or less than 0");
            }
            if (price <= 0) {
                check = false;
                error.setPriceError("Price cannot equal or less than 0");
            }
            if (image.length() > 500) {
                check = false;
                error.setImageError("Max length is 500");
            }
            if (description.length() > 300) {
                check = false;
                error.setDescriptionError("Max length is 300");
            }
            if (check) {
                ProductDTO dto = new ProductDTO(productID, productName, categoryID, quantity, image, null, price, true, description);
                dao.createProduct(dto);
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", error);
            }
        } catch (Exception e) {
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
