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
@WebServlet(name = "UpdateCartByUserController", urlPatterns = {"/UpdateCartByUserController"})
public class UpdateCartByUserController extends HttpServlet {

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

        ArrayList<CartDTO> cartList = new CartDAO().getUserCart(currentUser); // Lấy ra cart của người dùng
        boolean check = true;
        for (int i = 0; i < cartList.size(); i++) {
            int quantity = Integer.parseInt(request.getParameter("quantity_" + cartList.get(i).getProductId())); // Lấy ra các quantityProduct của từng cart
            if (cartList.get(i).getQuantity() != quantity) {
                ProductDTO existedProduct = new ProductDAO().read(new ProductDTO(cartList.get(i).getProductId()));
                if (quantity <= 0) {
                    new CartDAO().removeFromCart(currentUser, cartList.get(i));
                } else if (quantity > existedProduct.getQuantity()) {
                    check = false;
                    break;
                } else {
                    cartList.get(i).setQuantity(quantity);
                    cartList.get(i).setTotalPrice(quantity * cartList.get(i).getProductPrice());
                    new CartDAO().updateCart(currentUser, cartList.get(i));
                }
            }
        }
        if (check) {
            request.setAttribute("status", "Update success!");
            request.getRequestDispatcher("Cart").forward(request, response);
        } else {
            request.setAttribute("status", "The product exceeds the allowable quantity!");
            request.getRequestDispatcher("Cart").forward(request, response);
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
