/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.cart.CartDAO;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.cart.CartDTO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "DeleteCartByUserController", urlPatterns = {"/DeleteCartByUserController"})
public class DeleteCartByUserController extends HttpServlet {

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
        UserDTO currentUser = (UserDTO) request.getSession().getAttribute("account");
        String productId = request.getParameter("productId");

        if (productId == null) {
            request.getRequestDispatcher("Home").forward(request, response);
        } else {
            ProductDTO readingProduct = new ProductDTO();
            readingProduct.setId(productId);
            ProductDTO existedProduct = new ProductDAO().read(readingProduct);
            if (existedProduct == null) {
                request.getRequestDispatcher("Home").forward(request, response);
            } else {
                ArrayList<CartDTO> cartList = new CartDAO().getUserCart(currentUser);
                for (int i = 0; i < cartList.size(); i++) {
                    if (cartList.get(i).getProductId().equals(existedProduct.getId())) {
                        new CartDAO().removeFromCart(currentUser, cartList.get(i));
                        request.setAttribute("status", "Delete success!");
                        request.getRequestDispatcher("Cart").forward(request, response);
                        return;
                    }
                }
                request.getRequestDispatcher("Home").forward(request, response);
            }
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
