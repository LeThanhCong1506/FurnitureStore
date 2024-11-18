/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
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
@WebServlet(name = "RegisterUserController", urlPatterns = {"/RegisterUserController"})
public class RegisterUserController extends HttpServlet {

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
        String passwordConfirm = request.getParameter("passwordConfirm");

        if ((username == null||username.isEmpty()) || (password == null||password.isEmpty()) || (fullName == null||fullName.isEmpty()) || (phoneNumber == null||phoneNumber.isEmpty())
                || (email == null||email.isEmpty()) || (address == null||address.isEmpty()) || (passwordConfirm == null||passwordConfirm.isEmpty())) {
            request.setAttribute("status", "Please do not miss any input!");
            request.getRequestDispatcher("Register").forward(request, response);
            
        }else if(phoneNumber.length()!=10){
            request.setAttribute("status", "Wrong phone number!");
            request.getRequestDispatcher("Register").forward(request, response);
        } else {
            UserDTO registerUser = new UserDTO(username, password, fullName, phoneNumber, email, address, 2);
            UserDTO existedUser = new UserDAO().read(registerUser);
            if (existedUser == null) {  
                new UserDAO().create(registerUser);
                request.setAttribute("status", "Create success!");
            } else { 
                request.setAttribute("status", "Existed username!");
            }
            request.getRequestDispatcher("Register").forward(request, response);
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
