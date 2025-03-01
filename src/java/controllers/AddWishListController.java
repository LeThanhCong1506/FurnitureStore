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
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.user.UserDTO;
import sample.wishlist.WishlistDAO;
import sample.wishlist.WishlistDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AddWishListController", urlPatterns = {"/AddWishListController"})
public class AddWishListController extends HttpServlet {

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
        String idPro = request.getParameter("idPro");
        ProductDTO existedPro = new ProductDAO().read(new ProductDTO(idPro));

        if (currentUser != null) {
            if (existedPro == null) {
                request.getRequestDispatcher("Home").forward(request, response);
            } else {
                ArrayList<WishlistDTO> list = new WishlistDAO().getUserWish(currentUser);
                boolean check = true;
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getProductId().equals(existedPro.getId())) {
                        check = false;
                    }
                }
                if (check) {
                    new WishlistDAO().addToWish(currentUser, existedPro);
                    request.getRequestDispatcher("Wishlist").forward(request, response);
                }else{
                    new WishlistDAO().removeFromCart(currentUser, existedPro);
                    request.getRequestDispatcher("Wishlist").forward(request, response);
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
