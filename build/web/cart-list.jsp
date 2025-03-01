<%@page import="sample.cart.CartDTO"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Bootstrap Gallery - Mercury Admin Template</title>

        <!-- Meta -->
        <meta name="description" content="Marketplace for Bootstrap Admin Dashboards" />
        <meta name="author" content="Bootstrap Gallery" />
        <link rel="canonical" href="https://www.bootstrap.gallery/">
        <meta property="og:url" content="https://www.bootstrap.gallery">
        <meta property="og:title" content="Admin Templates - Dashboard Templates | Bootstrap Gallery">
        <meta property="og:description" content="Marketplace for Bootstrap Admin Dashboards">
        <meta property="og:type" content="Website">
        <meta property="og:site_name" content="Bootstrap Gallery">
        <link rel="shortcut icon" href="assets/images/favicon.svg" />

        <!-- *************
                ************ CSS Files *************
        ************* -->
        <link rel="stylesheet" href="assets/fonts/bootstrap/bootstrap-icons.css" />
        <link rel="stylesheet" href="assets/css/main.min.css" />

        <!-- *************
                ************ Vendor Css Files *************
        ************ -->

        <!-- Scrollbar CSS -->
        <link rel="stylesheet" href="assets/vendor/overlay-scroll/OverlayScrollbars.min.css" />

        <!-- Date Range CSS -->
        <link rel="stylesheet" href="assets/vendor/daterange/daterange.css" />
    </head>

    <body>
        <!-- Page wrapper start -->
        <div class="page-wrapper">

            <!-- Main container start -->
            <div class="main-container">

                <!-- Sidebar wrapper start -->
                <nav id="sidebar" class="sidebar-wrapper">

                    <!-- App brand starts -->
                    <div class="app-brand px-3 py-3 d-flex align-items-center">
                        <a href="index.html">
                            <img src="assets/images/logo.svg" class="logo" alt="Bootstrap Gallery" />
                        </a>
                    </div>
                    <!-- App brand ends -->

                    <!-- Sidebar profile starts -->
                    <div class="sidebar-user-profile">
                        <img src="assets/images/user.png" class="profile-thumb rounded-circle p-2 d-lg-flex d-none"
                             alt="Bootstrap Gallery" />
                        <h5 class="profile-name lh-lg mt-2 text-truncate">Michelle Max</h5>
                        <ul class="profile-actions d-flex m-0 p-0">
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="bi bi-skype fs-4"></i>
                                    <span class="count-label"></span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="bi bi-dribbble fs-4"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="bi bi-twitter fs-4"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- Sidebar profile ends -->

                    <%
                        UserDTO currentUser = (UserDTO) request.getSession().getAttribute("account");
                        if (currentUser.getRole() == 0) {
                    %>
                    <!-- Sidebar menu starts -->
                    <div class="sidebarMenuScroll">
                        <ul class="sidebar-menu">
                            <li class="">
                                <a href="Home2">
                                    <i class="bi bi-pie-chart"></i>
                                    <span class="menu-text">Dashboard</span>
                                </a>
                            </li>
                            <li class="treeview">
                                <a href="#!">
                                    <i class="bi bi-box"></i>
                                    <span class="menu-text">Product</span>
                                </a>
                                <ul class="treeview-menu">
                                    <li>
                                        <a href="ProductList">View/Modify</a>
                                    </li>
                                    <li>
                                        <a href="CreateProduct">Create</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="treeview">
                                <a href="#!">
                                    <i class="bi bi-window-sidebar"></i>
                                    <span class="menu-text">Invoices</span>
                                </a>
                                <ul class="treeview-menu">
                                    <li>
                                        <a href="InvoiceList">View/Modify</a>
                                    </li>
                                    <li>
                                        <a href="CreateInvoice">Create </a>
                                    </li>
                                    <li>
                                        <a href="CreateInvoiceDetail">Create detail</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="treeview active current-page">
                                <a href="profile.html">
                                    <i class="bi bi-person-square"></i>
                                    <span class="menu-text">User</span>
                                </a>
                                <ul class="treeview-menu">
                                    <li>
                                        <a href="UserList">View/Modify</a>
                                    </li>
                                    <li>
                                        <a href="CreateUser">Create </a>
                                    </li>
                                    <li>
                                        <a href="CartList">View cart</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="settings.html">
                                    <i class="bi bi-gear"></i>
                                    <span class="menu-text">Settings</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                    <!-- Sidebar menu ends -->
                    <%
                    } else {
                    %>
                    <div class="sidebarMenuScroll">
                        <ul class="sidebar-menu">
                            <li class="active current-page">
                                <a href="Home2">
                                    <i class="bi bi-pie-chart"></i>
                                    <span class="menu-text">Dashboard</span>
                                </a>
                            </li>
                            <li class="treeview">
                                <a href="#!">
                                    <i class="bi bi-box"></i>
                                    <span class="menu-text">Product</span>
                                </a>
                                <ul class="treeview-menu">
                                    <li>
                                        <a href="ProductList">View/Modify</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="treeview">
                                <a href="#!">
                                    <i class="bi bi-window-sidebar"></i>
                                    <span class="menu-text">Invoices</span>
                                </a>
                                <ul class="treeview-menu">
                                    <li>
                                        <a href="InvoiceList">View/Modify</a>
                                    </li>
                                    <li>
                                        <a href="CreateInvoice">Create </a>
                                    </li>
                                    <li>
                                        <a href="CreateInvoiceDetail">Create detail</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="treeview active current-page">
                                <a href="profile.html">
                                    <i class="bi bi-person-square"></i>
                                    <span class="menu-text">User</span>
                                </a>
                                <ul class="treeview-menu">
                                    <li>
                                        <a href="UserList">View</a>
                                    </li>
                                    <li>
                                        <a href="CartList">View cart</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="settings.html">
                                    <i class="bi bi-gear"></i>
                                    <span class="menu-text">Settings</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                <!-- Sidebar wrapper end -->
                <%
                    }
                %>

                </nav>
                <!-- Sidebar wrapper end -->

                <!-- App container starts -->
                <div class="app-container">

                    <!-- App header starts -->
                    <div class="app-header d-flex align-items-center">

                        <!-- Toggle buttons start -->
                        <div class="d-flex">
                            <button class="btn btn-outline-primary me-2 toggle-sidebar" id="toggle-sidebar">
                                <i class="bi bi-chevron-left fs-5"></i>
                            </button>
                            <button class="btn btn-outline-primary me-2 pin-sidebar" id="pin-sidebar">
                                <i class="bi bi-chevron-left fs-5"></i>
                            </button>
                        </div>
                        <!-- Toggle buttons end -->

                        <!-- App brand sm start -->
                        <div class="app-brand-sm d-md-none d-sm-block">
                            <a href="index.html">
                                <img src="assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
                            </a>
                        </div>
                        <!-- App brand sm end -->

                        <!-- App header actions start -->
                        <div class="header-actions">
                            <div class="d-lg-block d-none me-2">

                                <!-- Search container start -->
                                <form action="MainController" method="POST">
                                    <div class="input-group">

                                        <input type="text" class="form-control" placeholder="Search" name="searchcart"/>
                                        <button class="btn btn-outline-primary" type="submit" name="action" value="SearchCart">
                                            <i class="bi bi-search fs-5"></i>
                                        </button>

                                    </div>
                                </form>
                                <!-- Search container end -->

                            </div>
                            <div class="dropdown ms-3">
                                <a class="dropdown-toggle d-flex p-2 py-3" href="#!" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <i class="bi bi-grid fs-2 lh-1"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end shadow">
                                    <!-- Row start -->
                                    <div class="d-flex gap-2 m-2">
                                        <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                                            <img src="assets/images/brand-behance.svg" class="img-3x" alt="Admin Themes" />
                                        </a>
                                        <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                                            <img src="assets/images/brand-gatsby.svg" class="img-3x" alt="Admin Themes" />
                                        </a>
                                        <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                                            <img src="assets/images/brand-google.svg" class="img-3x" alt="Admin Themes" />
                                        </a>
                                        <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                                            <img src="assets/images/brand-bitcoin.svg" class="img-3x" alt="Admin Themes" />
                                        </a>
                                        <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                                            <img src="assets/images/brand-dribbble.svg" class="img-3x" alt="Admin Themes" />
                                        </a>
                                    </div>
                                    <!-- Row end -->
                                </div>
                            </div>
                            <div class="dropdown ms-3">
                                <a class="dropdown-toggle d-flex p-2 py-3" href="#!" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <i class="bi bi-bell fs-2 lh-1"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end shadow">
                                    <div class="dropdown-item">
                                        <div class="d-flex py-2 border-bottom">
                                            <img src="assets/images/user.png" class="img-4x me-3 rounded-3" alt="Admin Theme" />
                                            <div class="m-0">
                                                <h5 class="mb-1 fw-semibold">Sophie Michiels</h5>
                                                <p class="mb-1">Membership has been ended.</p>
                                                <p class="small m-0 text-primary">Today, 07:30pm</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-item">
                                        <div class="d-flex py-2 border-bottom">
                                            <img src="assets/images/user2.png" class="img-4x me-3 rounded-3" alt="Admin Theme" />
                                            <div class="m-0">
                                                <h5 class="mb-1 fw-semibold">Sophie Michiels</h5>
                                                <p class="mb-1">Congratulate, James for new job.</p>
                                                <p class="small m-0 text-primary">Today, 08:00pm</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-item">
                                        <div class="d-flex py-2">
                                            <img src="assets/images/user1.png" class="img-4x me-3 rounded-3" alt="Admin Theme" />
                                            <div class="m-0">
                                                <h5 class="mb-1 fw-semibold">Sophie Michiels</h5>
                                                <p class="mb-2">Lewis added new schedule release.</p>
                                                <p class="small m-0 text-primary">Today, 09:30pm</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border-top py-2 px-3 text-end">
                                        <a href="javascript:void(0)">View all</a>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown ms-3">
                                <a id="userSettings" class="dropdown-toggle d-flex py-2 align-items-center text-decoration-none"
                                   href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="d-none d-md-block me-2">Michelle Max</span>
                                    <img src="assets/images/user.png" class="rounded-circle img-3x" alt="Bootstrap Gallery" />
                                </a>
                                <div class="dropdown-menu dropdown-menu-end shadow">
                                    <a class="dropdown-item d-flex align-items-center" href="profile.html"><i
                                            class="bi bi-person fs-4 me-2"></i>Profile</a>
                                    <a class="dropdown-item d-flex align-items-center" href="UpdateDevStaff"><i
                                            class="bi bi-gear fs-4 me-2"></i>Account Settings</a>
                                    <a class="dropdown-item d-flex align-items-center" href="MainController?action=Logout"><i
                                            class="bi bi-escape fs-4 me-2"></i>Logout</a>
                                </div>
                            </div>
                        </div>
                        <!-- App header actions end -->

                    </div>
                    <!-- App header ends -->

                    <!-- App hero header starts -->
                    <div class="app-hero-header">
                        <h5 class="fw-light">Hello Michelle,</h5>
                        <h3 class="fw-light mb-5">
                            <span>Home</span> / <span>Product List</span>
                        </h3>
                    </div>
                    <!-- App Hero header ends -->

                    <!-- App body starts -->
                    <div class="app-body">
                        <!-- Row start -->
                        <div class="row">
                            <div class="col-xxl-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Pending Invoice List</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table align-middle">
                                                <thead>
                                                    <tr>
                                                        <td>No</td>
                                                        <td>username</td>
                                                        <td>product_id</td>
                                                        <td>product_name</td>
                                                        <td>product_image</td>
                                                        <td>product_price</td>
                                                        <td>quantity</td>
                                                        <td>total_price</td>
                                                    </tr>
                                                </thead>
                                                <%
                                                     ArrayList<CartDTO> list = (ArrayList<CartDTO>) request.getAttribute("listCart");
                                                    if (list.size() > 0) {
                                                %>
                                                <tbody>
                                                    <%
                                                        int count = 0;
                                                        for (int i = 0; i < list.size(); i++) {

                                                    %>
                                                    <tr>
                                                        <td><%=count++%></td>
                                                        <td><%= list.get(i).getUsername()%> </td>
                                                        <td><%=list.get(i).getProductId()%></td>
                                                        <td style="width: 20%"><%=list.get(i).getProductName()%></td>
                                                        <td><image src="images/<%=list.get(i).getProductImage()%>" style="width: 20%"></td>
                                                        <td><%=list.get(i).getProductPrice()%></td>
                                                        <td><%=list.get(i).getQuantity()%></td>
                                                        <td><%=list.get(i).getTotalPrice()%></td>

                                                        
                                                    </tr>
                                                    <%

                                                        }
                                                    %>
                                                </tbody>
                                                <%
                                                    }
                                                %>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Row end -->
                        
                    </div>
                    <!-- App body ends -->

                    <!-- App footer start -->
                    <div class="app-footer">
                        <span>© Bootstrap Gallery 2023</span>
                        <%
                            String ms = (String) request.getAttribute("status");
                            if (ms != null) {
                                if (ms.contains("success")) {
                        %>
                        <span style="text-align: center;color: green" ><%=ms%></span>
                        <%
                        } else {
                        %>
                        <span style="text-align: center;color: red" ><%=ms%></span>
                        <%

                                }
                            }
                        %>
                    </div>
                    <!-- App footer end -->

                </div>
                <!-- App container ends -->

            </div>
            <!-- Main container end -->

        </div>
        <!-- Page wrapper end -->

        <!-- *************
                ************ JavaScript Files *************
        ************* -->
        <!-- Required jQuery first, then Bootstrap Bundle JS -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/modernizr.js"></script>
        <script src="assets/js/moment.min.js"></script>

        <!-- *************
                ************ Vendor Js Files *************
        ************* -->

        <!-- Overlay Scroll JS -->
        <script src="assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
        <script src="assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

        <!-- Date Range JS -->
        <script src="assets/vendor/daterange/daterange.js"></script>
        <script src="assets/vendor/daterange/custom-daterange.js"></script>

        <!-- Custom JS files -->
        <script src="assets/js/custom.js"></script>
    </body>

</html>