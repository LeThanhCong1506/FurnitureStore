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

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchProductTypeController", urlPatterns = {"/SearchProductTypeController"})
public class SearchProductTypeController extends HttpServlet {

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
        String productype = request.getParameter("searchtype");
        
        System.out.println(productype);
        
        if (productype == null||productype.isEmpty()) { 
            request.setAttribute("status", "Cannot found!");
            request.getRequestDispatcher("Shop").forward(request, response);
        } else { 
            ProductDTO readingUser = new ProductDTO();
            readingUser.setType(productype);
            ArrayList<ProductDTO> existedProduct = new ProductDAO().search2(readingUser);
//            for(int i=0;i<existedProduct.size();i++){
//                System.out.println(existedProduct.get(i));
//            }
            if (existedProduct == null||existedProduct.isEmpty()) { 
                request.setAttribute("status", "Cannot found!");
                request.getRequestDispatcher("Shop").forward(request, response);
            } else { 
                request.setAttribute("readingProduct", existedProduct);
                request.getRequestDispatcher("Shop").forward(request, response);
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
