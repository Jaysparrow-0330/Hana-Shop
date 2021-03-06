/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import js.daos.ProductDAO;
import js.dtos.ProductDTO;
import js.dtos.UserDTO;

/**
 *
 * @author jack3
 */
public class SearchManageProductController extends HttpServlet {
 final String HOME_PAGE = "mainPage.jsp";
    final String MANAGE_PAGE = "manage.jsp";
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
        String url = HOME_PAGE;
        try {
            HttpSession ss = request.getSession();
            if ((((UserDTO) ss.getAttribute("LOGIN_USER")).getRoleID()).equals("AD")) {
                String search = request.getParameter("SEARCH_VALUE");
                //search and return list;
                ProductDAO dao = new ProductDAO();
                List<ProductDTO> list = dao.searchProductList(search);
                if (list != null && !list.isEmpty()) {
                  Map<String,String> map = dao.loadCategoriesMap();
                        request.setAttribute("PRODUCT_LIST", list);
                        request.setAttribute("CATEGORY_MAP", map);
                }
                else {
                    request.setAttribute("SEARCH_ERROR", "Sorry, can't find any product match your search");
                }
                request.setAttribute("SEARCH_VALUE", search);
                url = MANAGE_PAGE;
            }
        }
        catch (Exception e) {
            //log
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
