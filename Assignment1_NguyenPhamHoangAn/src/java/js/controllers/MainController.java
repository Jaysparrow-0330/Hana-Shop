/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author jack3
 */
public class MainController extends HttpServlet {
     private final static Logger log = Logger.getLogger(MainController.class);

    final String ERROR_PAGE = "invalid.html";
    final String HOME_PAGE = "mainPage.jsp";
    final String MANAGE = "ManageController";

    final String LOGIN = "LoginController";
    final String LOGOUT = "LogoutController";
    final String PRODUCT = "ProductController";
     final String VIEW_CREATE_PRODUCT = "createProduct.jsp";
    
    final String CREATE_PRODUCT = "CreateProductController";
    final String UPDATE_PRODUCT = "UpdateProductController";
    final String DELETE_PRODUCT = "DeleteProductController";
    final String SEARCH_MANAGE_PRODUCT = "SearchManageProductController";
     final String SHOPPING_PRODUCT = "ShoppingController";
    final String SEARCH_PRODUCT = "SearchController";
    final String ADD_PRODUCT = "AddController";
        final String REMOVE_PRODUCT = "RemoveController";
        final String UPDATE_CART_PRODUCT = "UpdateCartController";
        final String CONFIRM_PRODUCT = "ConfirmController";


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
          String url = ERROR_PAGE;
        try  {
            String action = request.getParameter("btnAction");

            if (action.equals("Login")) {
                url = LOGIN;
            }
            else if (action.equals("Logout")) {
                url = LOGOUT;
            }
            else if (action.equals("Product")) {
                url = PRODUCT;
            }
            else if (action.equals("Manage")) {
                url = MANAGE;
            }
            else if(action.equals("Create")){
                url = CREATE_PRODUCT;
            }
            else if(action.equals("Update")){
                url = UPDATE_PRODUCT;
            }
            else if(action.equals("Delete")){
                url = DELETE_PRODUCT;
            }
            else if(action.equals("Search Product")){
            url = SEARCH_MANAGE_PRODUCT;
            }
             else if(action.equals("Menu")){
            url = SHOPPING_PRODUCT;
            }
             else if(action.equals("Search")){
            url = SEARCH_PRODUCT;
            }
             else if(action.equals("AddProd")){
            url = ADD_PRODUCT;
            }
             else if(action.equals("RemoveProd")){
            url = REMOVE_PRODUCT;
            }
             else if(action.equals("UpdateProd")){
            url = UPDATE_CART_PRODUCT;
            }
             else if(action.equals("ViewCreateProduct")){
                url = VIEW_CREATE_PRODUCT;
            }
             else if(action.equals("Confirm")){
                url = CONFIRM_PRODUCT;
            }
            else {
                url = HOME_PAGE;
            }
        }
        catch (Exception e) {
            log.error(e);
        }
        finally {
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
