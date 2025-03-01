/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.user.UserDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "UpdateProductForDevController", urlPatterns = {"/UpdateProductForDevController"})
public class UpdateProdForDevController extends HttpServlet {

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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String sale = request.getParameter("sale");
        String quantity = request.getParameter("quantity");

        if (currentUser.getRole() == 0) {
            if ((id == null || id.isEmpty()) || (name == null || name.isEmpty()) || (type == null || type.isEmpty())
                    || (description == null || description.isEmpty()) || (price == null || price.isEmpty()) || (quantity == null || quantity.isEmpty())) {
                request.setAttribute("status", "Please do not miss any input!");
                request.getRequestDispatcher("ProductList").forward(request, response);
            } else {

                ProductDTO updatingProduct = new ProductDTO(id, name, type, image, description, Float.parseFloat(price), Integer.parseInt(sale), Integer.parseInt(quantity));
                ProductDTO existedProduct = new ProductDAO().read(updatingProduct);
                if (image == null || image.isEmpty()) {
                    updatingProduct = new ProductDTO(id, name, type, existedProduct.getImage(), description, Float.parseFloat(price), Integer.parseInt(sale), Integer.parseInt(quantity));
                }
                if (existedProduct != null) {
                    new ProductDAO().update(updatingProduct);
                    request.setAttribute("status", "Update success!");
                    request.getRequestDispatcher("ProductList").forward(request, response);
                } else {
                    request.setAttribute("status", "Unexisted product!");
                    request.getRequestDispatcher("ProductList").forward(request, response);
                }
            }
        } else {
            if (quantity == null || quantity.isEmpty()) {
                request.setAttribute("status", "Please do not miss any input!");
                request.getRequestDispatcher("ProductList").forward(request, response);
            } else {
                
                ProductDTO updatingProduct = new ProductDTO(id, name, type, image, description, Float.parseFloat(price), Integer.parseInt(sale), Integer.parseInt(quantity));
                ProductDTO existedProduct = new ProductDAO().read(updatingProduct);
                existedProduct.setQuantity(updatingProduct.getQuantity());
                if (existedProduct != null) {
                    new ProductDAO().update(existedProduct);
                    request.setAttribute("status", "Update success!");
                    request.getRequestDispatcher("ProductList").forward(request, response);
                } else {
                    request.setAttribute("status", "Unexisted product!");
                    request.getRequestDispatcher("ProductList").forward(request, response);
                }
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
