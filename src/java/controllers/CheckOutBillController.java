/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.cart.CartDAO;
import sample.cart.CartDTO;
import sample.invoice.InvoiceDAO;
import sample.invoice.InvoiceDTO;
import sample.invoice.InvoicedetailDTO;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CheckOutBillController", urlPatterns = {"/CheckOutBillController"})
public class CheckOutBillController extends HttpServlet {

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
        String billId = null;
        if (!new InvoiceDAO().getAll().isEmpty()) {
            billId = "bill" + (new InvoiceDAO().getAll().size() + 1);
        }

        UserDTO currentUser = (UserDTO) request.getSession().getAttribute("account");
        LocalDate currentDate = LocalDate.now();
        String date = currentDate.getDayOfMonth() + "-" + currentDate.getMonth() + "-" + currentDate.getYear();

        InvoiceDTO invoiceSearch = new InvoiceDTO(billId);
        InvoiceDTO invoice = new InvoiceDAO().read(invoiceSearch);
        if (currentUser != null) {

            if (invoice == null) {// Chưa có hóa đơn
                float totalPrice = 0;
                ArrayList<CartDTO> list = new CartDAO().getUserCart(currentUser);
                if (list == null) {
                    request.setAttribute("status", "Add to cart before checkout!");
                    request.getRequestDispatcher("Login").forward(request, response);
                } else {
                    for (int i = 0; i < list.size(); i++) {
                        totalPrice += list.get(i).getTotalPrice();
                    }

                    InvoiceDTO creatingBill = new InvoiceDTO(billId, currentUser.getUsername(), date, totalPrice);
                    if (new InvoiceDAO().create(creatingBill, null)) {
                        for (int i = 0; i < list.size(); i++) {
                            ProductDTO updatePro
                                    = new ProductDAO().read(new ProductDTO(list.get(i).getProductId()));
                            updatePro.setQuantity(updatePro.getQuantity() - list.get(i).getQuantity());
                            if (new ProductDAO().update(updatePro)) {
                                InvoicedetailDTO createInvoiceDetail
                                        = new InvoicedetailDTO(billId,
                                                list.get(i).getProductId(),
                                                list.get(i).getProductName(),
                                                list.get(i).getProductImage(),
                                                list.get(i).getProductPrice(),
                                                list.get(i).getQuantity(),
                                                list.get(i).getTotalPrice());
                                if (new InvoiceDAO().create2(createInvoiceDetail, null)) {
                                    new CartDAO().removeFromCart(currentUser, list.get(i));
                                }
                            }
                        }
                    }
                    request.getRequestDispatcher("ThankYou").forward(request, response);
                }
            } else {
                request.setAttribute("status", "Create fail!");
                request.getRequestDispatcher("CreateInvoice").forward(request, response);
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
