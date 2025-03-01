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
import sample.invoice.InvoiceDAO;
import sample.invoice.InvoiceDTO;
import sample.invoice.InvoicedetailDTO;
import sample.product.ProductDAO;
import sample.product.ProductDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CreateBillDetailController", urlPatterns = {"/CreateBillDetailController"})
public class CreateBillDetailController extends HttpServlet {

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
        String billId = request.getParameter("idBill");
        String productId = request.getParameter("idPro");
        String quantity = request.getParameter("quantity");

        if ((productId == null || productId.isEmpty()) || (quantity == null || quantity.isEmpty())) {
            request.setAttribute("status", "Please fill all input!");
            request.getRequestDispatcher("CreateInvoiceDetail").forward(request, response);

        } else {
            InvoiceDTO creatingBill = new InvoiceDAO().read(new InvoiceDTO(billId));
            ProductDTO existedProduct = new ProductDAO().read(new ProductDTO(productId));

            if (creatingBill == null) {
                request.setAttribute("status", "Create bill before bill detail!");
                request.getRequestDispatcher("CreateInvoice").forward(request, response);
            } else if (existedProduct == null) {
                request.setAttribute("status", "Create fail!");
                request.getRequestDispatcher("CreateInvoiceDetail").forward(request, response);
            } else {
                InvoicedetailDTO billDetail = new InvoicedetailDTO();
                billDetail.setInvoiceId(billId);
                billDetail.setProductId(existedProduct.getId());
                billDetail.setProductName(existedProduct.getName());
                billDetail.setProductImage(existedProduct.getImage());
                billDetail.setProductPrice(existedProduct.getPrice());
                billDetail.setQuantity(1);
                billDetail.setTotalPrice(existedProduct.getPrice());
                new InvoiceDAO().create2(billDetail, null);
                request.setAttribute("status", "Create success!");
                request.getRequestDispatcher("CreateInvoiceDetail").forward(request, response);
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
