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
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "UpdateController", urlPatterns = {"/UpdateController"})
public class UpdateController extends HttpServlet {

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullname");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String currentPassword = request.getParameter("currentPassword");
        String passwordConfirm = request.getParameter("passwordConfirm");
        UserDTO currentAccount = (UserDTO) request.getSession().getAttribute("account");

        if ((username == null||username.isEmpty()) || (password == null||password.isEmpty()) || (fullName == null||fullName.isEmpty()) || (phoneNumber == null||phoneNumber.isEmpty())
                || (email == null||email.isEmpty()) || (address == null||address.isEmpty()) || (passwordConfirm == null||passwordConfirm.isEmpty()) ||(currentPassword==null||currentPassword.isEmpty())) {
            request.setAttribute("status", "Please do not miss any input!");
            request.getRequestDispatcher("UpdateDevStaff").forward(request, response);
        } else if (!passwordConfirm.equals(password)) {
            request.setAttribute("status", "Confirm password must be equal to password!");
            request.getRequestDispatcher("UpdateDevStaff").forward(request, response);
        } else {
            UserDTO updatingUser = null;
            if (currentAccount.getRole() == 0) {
                updatingUser = new UserDTO(username, password, fullName, phoneNumber, email, address, 0);
            } else {
                updatingUser = new UserDTO(username, password, fullName, phoneNumber, email, address, 1);
            }
            UserDTO existedUser = new UserDAO().read(updatingUser);
            if (existedUser == null) {
                request.getSession().setAttribute("status", "Existed username!");
                request.getRequestDispatcher("UpdateDevStaff").forward(request, response);
            } else {
                new UserDAO().update(updatingUser);
                request.getSession().setAttribute("status","Update success!");
                request.getRequestDispatcher("UpdateDevStaff").forward(request, response);
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
