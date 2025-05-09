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
import sample.invoice.InvoiceDAO;
import sample.invoice.InvoiceDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "DeleteInvoiceController", urlPatterns = {"/DeleteInvoiceController"})
public class DeleteInvoiceController extends HttpServlet {

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
        String billId = request.getParameter("id1");
        System.out.println(billId);

        if (billId == null) {
            request.getRequestDispatcher("InvoiceList").forward(request, response);
        } else {
            InvoiceDTO readingInvoice = new InvoiceDTO();
            readingInvoice.setId(billId);
            InvoiceDTO existedInvoice = new InvoiceDAO().read(readingInvoice);
            if (existedInvoice == null) {
                request.getRequestDispatcher("InvoiceList").forward(request, response);
            } else {
                ArrayList<InvoiceDTO> invoiceList = new InvoiceDAO().getAll();
                for (int i = 0; i < invoiceList.size(); i++) {
                    if (invoiceList.get(i).getId().equals(existedInvoice.getId())) {
                        new InvoiceDAO().delete(existedInvoice);
                        request.setAttribute("status", "Delete success!");
                        request.getRequestDispatcher("InvoiceList").forward(request, response);
                        return;
                    }
                }
                request.getRequestDispatcher("InvoiceList").forward(request, response);
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
