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
import sample.invoice.InvoiceDAO;
import sample.invoice.InvoiceDTO;
import sample.invoice.InvoicedetailDTO;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.wishlist.WishlistDAO;
import sample.wishlist.WishlistDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "MainController", urlPatterns = {
    "/MainController", "/Home", "/Shop", "/Checkout", "/Wishlist", "/Login", "/accountProfile", "/Cart",
    "/Register", "/Home2", "/UserList", "/UpdateUser", "/CreateUser", "/UpdateDevStaff", "/ProductList",
    "/UpdateProduct", "/CreateProduct", "/SingleProduct", "/Shop2", "/CartList", "/InvoiceList", "/InvoiceDetailList",
    "/CreateInvoice", "/CreateInvoiceDetail", "/ThankYou"})
public class MainController extends HttpServlet {

    private static final String ERROR = "page-not-found.html";

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginUserController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String CREATE = "CreateUser";
    private static final String CREATE_CONTROLLER = "CreateUserForDevController";
    private static final String CREATE2 = "CreateProduct";
    private static final String CREATE2_CONTROLLER = "CreateProductForDevController";
    private static final String CREATE3 = "CreateInvoice";
    private static final String CREATE3_CONTROLLER = "CreatingBillController";
    private static final String CREATE4 = "CreateInvoiceDetail";
    private static final String CREATE4_CONTROLLER = "CreateBillDetailController";
    private static final String CREATE5 = "AddWishList";
    private static final String CREATE5_CONTROLLER = "AddWishListController";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateUserController";
    private static final String UPDATE2 = "Update2";
    private static final String UPDATE2_CONTROLLER = "UpdateController";
    private static final String UPDATE3 = "UpdateForDev";
    private static final String UPDATE3_CONTROLLER = "UpdateUserForDevController";
    private static final String UPDATE4 = "UpdateProductForDev";
    private static final String UPDATE4_CONTROLLER = "UpdateProductForDevController";
    private static final String UPDATE5 = "UpdateCart";
    private static final String UPDATE5_CONTROLLER = "UpdateCartByUserController";
    private static final String DELETE = "DeleteForDev";
    private static final String DELETE_CONTROLLER = "DeleteUserForDevController";
    private static final String DELETE2 = "DeleteProductForDev";
    private static final String DELETE2_CONTROLLER = "DeleteProductForDevController";
    private static final String DELETE3 = "DeleteCart";
    private static final String DELETE3_CONTROLLER = "DeleteCartByUserController";
    private static final String DELETE4 = "DeleteInvoice";
    private static final String DELETE4_CONTROLLER = "DeleteInvoiceController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "RegisterUserController";
    private static final String SEARCH = "SearchUser";
    private static final String SEARCH_CONTROLLER = "SearchUserForDevController";
    private static final String SEARCH2 = "SearchProduct";
    private static final String SEARCH2_CONTROLLER = "SearchProductForDevController";
    private static final String SEARCH3 = "SearchProduct2";
    private static final String SEARCH3_CONTROLLER = "SearchProductForUserController";
    private static final String SEARCH4 = "SearchProduct3";
    private static final String SEARCH4_CONTROLLER = "SearchProductTypeController";
    private static final String SEARCH5 = "SearchCart";
    private static final String SEARCH5_CONTROLLER = "SearchCartForDevController";
    private static final String ADD = "AddToCart";
    private static final String ADD_CONTROLLER = "AddToCartController";
    private static final String CHECKOUT = "CheckOut";
    private static final String CHECKOUT_CONTROLLER = "CheckOutBillController";
    private static final String CHECKOUTDETAIL = "CheckOutDetail";
    private static final String CHECKOUTDETAIL_CONTROLLER = "CheckOutBillDetailController";
    private static final String ADD2 = "AddToWish";
    private static final String ADD2_CONTROLLER = "AddWishListController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String path = request.getServletPath();

            String action = request.getParameter("action");
            switch (path) {
                case "/Home": {
                    this.listCart(request, response);
                    this.listProduct(request, response);
                    url = "index.jsp";
                    break;
                }
                case "/Shop": {
                    this.listCart(request, response);
                    this.listProduct(request, response);
                    url = "shop.jsp";
                    break;
                }
                case "/Shop2": {
                    this.listCart(request, response);
                    this.listProduct(request, response);
                    url = "shop_1.jsp";
                    break;
                }
                case "/Cart": {
                    this.listCart(request, response);
                    url = "cart.jsp";
                    break;
                }
                case "/Checkout": {
                    this.listCart(request, response);
                    url = "checkout.jsp";
                    break;
                }
                case "/Wishlist": {
                    this.wishList(request, response);
                    this.listCart(request, response);
                    url = "wishlist.jsp";
                    break;
                }
                case "/Login": {
                    this.listCart(request, response);
                    url = "login.jsp";
                    break;
                }
                case "/accountProfile": {
                    this.listCart(request, response);
                    url = "account-profile.jsp";
                    break;
                }
                case "/Register": {
                    url = "register.jsp";
                    break;
                }
                case "/Home2": {
                    url = "index_1.jsp";
                    break;
                }
                case "/UserList": {
                    this.listUser(request, response);
                    url = "user-list.jsp";
                    break;
                }
                case "/ProductList": {
                    this.listProduct(request, response);
                    url = "product-list.jsp";
                    break;
                }
                case "/CartList": {
                    this.listCart2(request, response);
                    url = "cart-list.jsp";
                    break;
                }
                case "/UpdateUser": {
                    this.updateUserId(request, response);
                    url = "user-modify.jsp";
                    break;
                }
                case "/CreateUser": {
                    url = "create-user.jsp";
                    break;
                }
                case "/UpdateDevStaff": {
                    url = "setting.jsp";
                    break;
                }
                case "/UpdateProduct": {
                    this.updateProductId(request, response);
                    url = "product-modify.jsp";
                    break;
                }
                case "/CreateProduct": {
                    url = "create-product.jsp";
                    break;
                }
                case "/SingleProduct": {
                    this.listCart(request, response);
                    this.singleProduct(request, response);
                    this.listProduct(request, response);
                    url = "single-product.jsp";
                    break;
                }
                case "/InvoiceList": {
                    this.listInvoice(request, response);
                    url = "invoice-list.jsp";
                    break;
                }
                case "/InvoiceDetailList": {
                    this.listInvoiceDetail(request, response);
                    url = "invoiceDetail-list.jsp";
                    break;
                }
                case "/CreateInvoice": {
                    url = "create-invoice.jsp";
                    break;
                }
                case "/CreateInvoiceDetail": {
                    this.getBillId(request, response);
                    url = "create-invoiceDetail.jsp";
                    break;
                }
                case "/ThankYou": {
                    url = "thankyou.jsp";
                    break;
                }

                case "/MainController": {
                    if (LOGIN.equals(action)) {
                        url = LOGIN_CONTROLLER;
                    } else if (LOGOUT.equals(action)) {
                        url = LOGOUT_CONTROLLER;
                    } else if (CREATE.equals(action)) {
                        url = CREATE_CONTROLLER;
                    } else if (CREATE2.equals(action)) {
                        url = CREATE2_CONTROLLER;
                    } else if (CREATE3.equals(action)) {
                        url = CREATE3_CONTROLLER;
                    } else if (CREATE4.equals(action)) {
                        url = CREATE4_CONTROLLER;
                    } else if (CREATE5.equals(action)) {
                        url = CREATE5_CONTROLLER;
                    } else if (UPDATE.equals(action)) {
                        url = UPDATE_CONTROLLER;
                    } else if (UPDATE2.equals(action)) {
                        url = UPDATE2_CONTROLLER;
                    } else if (UPDATE3.equals(action)) {
                        url = UPDATE3_CONTROLLER;
                    } else if (UPDATE4.equals(action)) {
                        url = UPDATE4_CONTROLLER;
                    } else if (UPDATE5.equals(action)) {
                        url = UPDATE5_CONTROLLER;
                    } else if (DELETE.equals(action)) {
                        url = DELETE_CONTROLLER;
                    } else if (DELETE2.equals(action)) {
                        url = DELETE2_CONTROLLER;
                    } else if (DELETE3.equals(action)) {
                        url = DELETE3_CONTROLLER;
                    } else if (DELETE4.equals(action)) {
                        url = DELETE4_CONTROLLER;
                    } else if (REGISTER.equals(action)) {
                        url = REGISTER_CONTROLLER;
                    } else if (SEARCH.equals(action)) {
                        url = SEARCH_CONTROLLER;
                    } else if (SEARCH2.equals(action)) {
                        url = SEARCH2_CONTROLLER;
                    } else if (SEARCH3.equals(action)) {
                        url = SEARCH3_CONTROLLER;
                    } else if (SEARCH4.equals(action)) {
                        url = SEARCH4_CONTROLLER;
                    } else if (SEARCH5.equals(action)) {
                        url = SEARCH5_CONTROLLER;
                    } else if (ADD.equals(action)) {
                        url = ADD_CONTROLLER;
                    } else if (ADD2.equals(action)) {
                        url = ADD2_CONTROLLER;
                    } else if (CHECKOUT.equals(action)) {
                        url = CHECKOUT_CONTROLLER;
                    } else if (CHECKOUTDETAIL.equals(action)) {
                        url = CHECKOUTDETAIL_CONTROLLER;
                    } else {
                        request.setAttribute("ERROR", "Your action not support");
                        url = ERROR;
                    }
                    break;
                }
            }

        } catch (Exception e) {
//            log("Error at MainController: " + e.toString());
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void singleProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String sp = (String) req.getParameter("id");
        ProductDTO SP = new ProductDTO(sp);
        ProductDTO SP1 = new ProductDAO().read(SP);
        if (SP1 != null) {
            req.setAttribute("singleProduct", SP1);
        }
    }

    private void listInvoiceDetail(HttpServletRequest request, HttpServletResponse response) {
        String id = (String) request.getParameter("id1");
        InvoiceDTO a = new InvoiceDTO(id);
        ArrayList<InvoicedetailDTO> list = new InvoiceDAO().getInvoiceDetailList(a);
        if (list != null) {
            request.setAttribute("listInvoiceDetail", list);
        }
    }

    private void listProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<ProductDTO> listProduct = (ArrayList<ProductDTO>) req.getAttribute("readingProduct");

        if (listProduct == null || listProduct.isEmpty()) {
            req.setAttribute("productList", new ProductDAO().getAll());
        } else {
            req.setAttribute("productList", listProduct);
        }

    }

    private void listUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<UserDTO> listUser = (ArrayList<UserDTO>) req.getAttribute("readingUser");
        if (listUser == null || listUser.isEmpty()) {
            req.setAttribute("userList", new UserDAO().getAll());
        } else {
            req.setAttribute("userList", listUser);
        }
    }

    private void updateUserId(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String id = (String) req.getParameter("id1");
        req.setAttribute("modifyUser", new UserDAO().read(new UserDTO(id, "")));
    }

    private void updateProductId(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String id = (String) req.getParameter("id1");
        req.setAttribute("modifyProduct", new ProductDAO().read(new ProductDTO(id)));
    }

    private void listCart(HttpServletRequest request, HttpServletResponse response) {
        UserDTO currentUser = (UserDTO) request.getSession().getAttribute("account");
        if (currentUser != null) {
            ArrayList<CartDTO> listCart = new CartDAO().getUserCart(currentUser);
            if (listCart != null) {
                request.setAttribute("listCart", listCart);
            } else {
                listCart = new ArrayList<CartDTO>();
                request.setAttribute("listCart", listCart);
            }
        }
    }

    private void listCart2(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<CartDTO> listCart = (ArrayList<CartDTO>) request.getAttribute("readingCart");
        if (listCart == null || listCart.isEmpty()) {
            request.setAttribute("listCart", new CartDAO().getCartList());
        } else {
            request.setAttribute("listCart", listCart);
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

    private void listInvoice(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<InvoiceDTO> list = new InvoiceDAO().getAll();
        if (list != null || !list.isEmpty()) {
            request.setAttribute("invoiceList", list);
        } else {
            list = new ArrayList<>();
            request.setAttribute("invoiceList", list);
        }
    }

    private void getBillId(HttpServletRequest request, HttpServletResponse response) {
        String billId = (String) request.getParameter("idBill");
        request.setAttribute("idBill", billId);
    }

    private void wishList(HttpServletRequest request, HttpServletResponse response) {
        UserDTO currentUser = (UserDTO) request.getSession().getAttribute("account");
        if (currentUser != null) {
            ArrayList<WishlistDTO> list = new WishlistDAO().getUserWish(currentUser);
            if (list != null) {
                request.setAttribute("wishList", list);
            }
        }
    }

}
