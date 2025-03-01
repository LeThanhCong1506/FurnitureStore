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
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

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
        String quantity = request.getParameter("quantity");

        if (currentUser != null) {
            if (productId == null) {
                request.getRequestDispatcher("Home").forward(request, response);
            } else {
                ProductDTO readingProduct = new ProductDTO();
                readingProduct.setId(productId);
                ProductDTO existedProduct = new ProductDAO().read(readingProduct);
                if (existedProduct == null) {
                    request.setAttribute("status", "Add fail!");
                    request.getRequestDispatcher("Home").forward(request, response);
                } else if (quantity != null) {
                    if (Integer.parseInt(quantity) < existedProduct.getQuantity()) {
                        ArrayList<CartDTO> cartDetails = new CartDAO().getUserCart(currentUser);
                        for (CartDTO cartDetail : cartDetails) {
                            if (cartDetail.getProductId().equals(existedProduct.getId())) {
                                cartDetail.setQuantity(cartDetail.getQuantity() + Integer.parseInt(quantity));
                                cartDetail.setTotalPrice(cartDetail.getTotalPrice() + cartDetail.getProductPrice());
                                new CartDAO().updateCart(currentUser, cartDetail);
                                request.setAttribute("status", "Add success!");
                                request.getRequestDispatcher("Cart").forward(request, response);
                                return;
                            }
                        }
                        CartDTO cartDetail = new CartDTO();
                        cartDetail.setProductId(existedProduct.getId());
                        cartDetail.setProductName(existedProduct.getName());
                        cartDetail.setProductImage(existedProduct.getImage());
                        cartDetail.setProductPrice(existedProduct.getPrice());
                        cartDetail.setQuantity(Integer.parseInt(quantity));
                        cartDetail.setTotalPrice(existedProduct.getPrice());
                        new CartDAO().addToCart(currentUser, cartDetail);
                        request.setAttribute("status", "Add success!");
                        request.getRequestDispatcher("Cart").forward(request, response);
                    }else{
                        request.setAttribute("status",  "This product exceeds the allowable quantity!");
                        request.getRequestDispatcher("Cart").forward(request, response);
                    }
                } else {
                    ArrayList<CartDTO> cartDetails = new CartDAO().getUserCart(currentUser);
                    for (CartDTO cartDetail : cartDetails) {
                        if (cartDetail.getProductId().equals(existedProduct.getId())) {
                            cartDetail.setQuantity(cartDetail.getQuantity() + 1);
                            cartDetail.setTotalPrice(cartDetail.getTotalPrice() + cartDetail.getProductPrice());
                            new CartDAO().updateCart(currentUser, cartDetail);
                            request.setAttribute("status", "Add success!");
                            request.getRequestDispatcher("Cart").forward(request, response);
                            return;
                        }
                    }
                    CartDTO cartDetail = new CartDTO();
                    cartDetail.setProductId(existedProduct.getId());
                    cartDetail.setProductName(existedProduct.getName());
                    cartDetail.setProductImage(existedProduct.getImage());
                    cartDetail.setProductPrice(existedProduct.getPrice());
                    cartDetail.setQuantity(1);
                    cartDetail.setTotalPrice(existedProduct.getPrice());
                    new CartDAO().addToCart(currentUser, cartDetail);
                    request.setAttribute("status", "Add success!");
                    request.getRequestDispatcher("Cart").forward(request, response);
                }
            }
        } else {
            request.setAttribute("status", "Please login before shopping!");
            request.getRequestDispatcher("Login").forward(request, response);
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
