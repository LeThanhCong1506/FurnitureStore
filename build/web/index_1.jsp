<%@page import="sample.user.UserDTO"%>
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
                            <li class="treeview">
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
                            <li class="treeview">
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
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search" />
                                    <button class="btn btn-outline-primary" type="button">
                                        <i class="bi bi-search fs-5"></i>
                                    </button>
                                </div>
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
                        <h3 class="fw-light mb-5">Have a good day :)</h3>
                    </div>
                    <!-- App Hero header ends -->

                    <!-- App body starts -->
                    <div class="app-body">
                        <!-- Row starts -->
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 col-12">
                                <div class="card shadow mb-4 p-2 rounded-4">
                                    <div class="card-body d-flex align-items-center">
                                        <div class="icon-box lg shadow-solid-rb border border-dark p-4 rounded-4 me-3">
                                            <i class="bi bi-pie-chart fs-1 lh-1 text-primary"></i>
                                        </div>
                                        <div class="m-0">
                                            <h5 class="fw-light mb-1">Products</h5>
                                            <h2 class="m-0 text-primary">250</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6 col-12">
                                <div class="card shadow mb-4 p-2 rounded-4">
                                    <div class="card-body d-flex align-items-center">
                                        <div class="icon-box lg shadow-solid-rb border border-dark p-4 rounded-4 me-3">
                                            <i class="bi bi-sticky fs-1 lh-1 text-primary"></i>
                                        </div>
                                        <div class="m-0">
                                            <h5 class="fw-light mb-1">Orders</h5>
                                            <h2 class="m-0 text-primary">900</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6 col-12">
                                <div class="card shadow mb-4 p-2 rounded-4">
                                    <div class="card-body d-flex align-items-center">
                                        <div class="icon-box lg shadow-solid-rb border border-dark p-4 rounded-4 me-3">
                                            <i class="bi bi-emoji-smile fs-1 lh-1 text-primary"></i>
                                        </div>
                                        <div class="m-0">
                                            <h5 class="fw-light mb-1">Customers</h5>
                                            <h2 class="m-0 text-primary">600</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6 col-12">
                                <div class="card shadow mb-4 p-2 rounded-4">
                                    <div class="card-body d-flex align-items-center">
                                        <div class="icon-box lg shadow-solid-rb border border-dark p-4 rounded-4 me-3">
                                            <i class="bi bi-star fs-1 lh-1 text-primary"></i>
                                        </div>
                                        <div class="m-0">
                                            <h5 class="fw-light mb-1">Reviews</h5>
                                            <h2 class="m-0 text-primary">95%</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Row ends -->

                        <!-- Row starts -->
                        <div class="row">
                            <div class="col-xxl-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">Yearly Sales</h5>
                                    </div>
                                    <div class="card-body p-4">
                                        <div id="yearlySales"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Row end -->

                        <!-- Row start -->
                        <div class="row">
                            <div class="col-sm-3 col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">Sales</h5>
                                    </div>
                                    <div class="card-body p-4">
                                        <div class="text-center my-4">
                                            <h1>
                                                689
                                                <i class="bi bi-arrow-up-right-circle-fill text-success fs-3"></i>
                                            </h1>
                                            <p class="fw-light m-0">18% higher than last month</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3 col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">Revenue</h5>
                                    </div>
                                    <div class="card-body p-4">
                                        <div class="text-center my-4">
                                            <h1>
                                                992
                                                <i class="bi bi-arrow-up-right-circle-fill text-success fs-3"></i>
                                            </h1>
                                            <p class="fw-light m-0">21% higher than last month</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3 col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">Payments</h5>
                                    </div>
                                    <div class="card-body p-4">
                                        <div class="text-center my-4">
                                            <h1>
                                                864
                                                <i class="bi bi-arrow-up-right-circle-fill text-success fs-3"></i>
                                            </h1>
                                            <p class="fw-light m-0">16% higher than last month</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3 col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">Income</h5>
                                    </div>
                                    <div class="card-body p-4">
                                        <div class="text-center my-4">
                                            <h1>
                                                598
                                                <i class="bi bi-arrow-down-right-circle-fill text-danger fs-3"></i>
                                            </h1>
                                            <p class="fw-light m-0">24% higher than last month</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Row end -->

                        <!-- Row start -->
                        <div class="row">
                            <div class="col-xxl-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">Order History</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered align-middle m-0">
                                                <thead>
                                                    <tr>
                                                        <th>Product</th>
                                                        <th>Link</th>
                                                        <th>Post Date</th>
                                                        <th>Distribution</th>
                                                        <th>Clicks</th>
                                                        <th>Rating</th>
                                                        <th>Views</th>
                                                        <th>Engagement</th>
                                                        <th>Growth</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex flex-row align-items-center">
                                                                <img src="assets/images/mobiles/mob3.jpg" class="img-4x rounded-3 h-auto"
                                                                     alt="Google Admin" />
                                                                <div class="d-flex flex-column ms-3">
                                                                    <p class="m-0">Apple iPhone 14</p>
                                                                    <p class="text-success m-0">(60% Discount)</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <a href="#!" class="text-danger">#L10010021</a>
                                                        </td>
                                                        <td>02/12/2022</td>
                                                        <td>
                                                            <span class="badge bg-warning"><i class="bi bi-caret-up-fill"></i>1.5x</span>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex gap-1">
                                                                <span class="badge bg-primary">325</span>
                                                                <span class="badge bg-info"><i class="bi bi-caret-up-fill"></i>
                                                                    21.2%</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="rate2 rating-stars"></div>
                                                        </td>
                                                        <td>
                                                            <div id="sparkline1"></div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex gap-1">
                                                                <span class="badge bg-primary">17</span>
                                                                <span class="badge bg-danger"><i class="bi bi-caret-down-fill"></i>
                                                                    13.5%</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="m-0">Higher than last week</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex flex-row align-items-center">
                                                                <img src="assets/images/mobiles/mob2.jpg" class="img-4x rounded-3 h-auto"
                                                                     alt="Bootstrap Gallery" />
                                                                <div class="d-flex flex-column ms-3">
                                                                    <p class="m-0">Apple iPhone 13</p>
                                                                    <p class="text-success m-0">(55% Discount)</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <a href="#!" class="text-danger">#L10010065</a>
                                                        </td>
                                                        <td>07/12/2022</td>
                                                        <td>
                                                            <span class="badge bg-success"><i class="bi bi-caret-up-fill"></i>2.9x</span>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex gap-1">
                                                                <span class="badge bg-primary">447</span>
                                                                <span class="badge bg-info"><i class="bi bi-caret-up-fill"></i>
                                                                    34.6%</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="rate5 rating-stars"></div>
                                                        </td>
                                                        <td>
                                                            <div id="sparkline2"></div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex gap-1">
                                                                <span class="badge bg-primary">65</span>
                                                                <span class="badge bg-info"><i class="bi bi-caret-down-fill"></i>
                                                                    22.3%</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="m-0">Higher than last week</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex flex-row align-items-center">
                                                                <img src="assets/images/mobiles/mob1.jpg" class="img-4x rounded-3 h-auto"
                                                                     alt="Bootstrap Gallery" />
                                                                <div class="d-flex flex-column ms-3">
                                                                    <p class="m-0">Apple iPhone 12</p>
                                                                    <p class="text-success m-0">(30% Discount)</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <a href="#!" class="text-danger">#L10010098</a>
                                                        </td>
                                                        <td>09/12/2022</td>
                                                        <td>
                                                            <span class="badge bg-primary"><i class="bi bi-caret-down-fill"></i>4.1x</span>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex gap-1">
                                                                <span class="badge bg-primary">825</span>
                                                                <span class="badge bg-info"><i class="bi bi-caret-up-fill"></i>
                                                                    18.3%</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="rate4 rating-stars"></div>
                                                        </td>
                                                        <td>
                                                            <div id="sparkline3"></div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex gap-1">
                                                                <span class="badge bg-primary">81</span>
                                                                <span class="badge bg-warning"><i class="bi bi-caret-down-fill"></i>
                                                                    18.4%</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="m-0">Lower than last week</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Row end -->

                        <!-- Row start -->
                        <div class="row">
                            <div class="col-xl-4 col-sm-12 col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">Notifications</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="scroll350 my-3">
                                            <ul class="list-unstyled m-0">
                                                <li class="d-flex">
                                                    <div class="icon-box lg flex-shrink-0 bg-primary rounded-4 text-white fs-5">
                                                        MK
                                                    </div>
                                                    <div class="ms-3 mb-4">
                                                        <span class="mb-3 badge border border-info text-info">Sales</span>
                                                        <h6 class="mb-2 fw-bold">Marie Kieffer</h6>
                                                        <p>
                                                            Thanks for choosing Apple product, further if you
                                                            have any questions please contact sales team.
                                                        </p>
                                                    </div>
                                                </li>
                                                <li class="d-flex">
                                                    <div class="icon-box lg flex-shrink-0 bg-primary rounded-4 text-white fs-5">
                                                        ES
                                                    </div>
                                                    <div class="ms-3 mb-4">
                                                        <span class="mb-3 badge border border-info text-info">Marketing</span>
                                                        <h6 class="mb-2 fw-bold">Ewelina Sikora</h6>
                                                        <p>
                                                            Boost your sales by 50% with the easiest and
                                                            proven marketing tool for customer enggement &amp;
                                                            motivation.
                                                        </p>
                                                    </div>
                                                </li>
                                                <li class="d-flex">
                                                    <div class="icon-box lg flex-shrink-0 bg-primary rounded-4 text-white fs-5">
                                                        TN
                                                    </div>
                                                    <div class="ms-3 mb-4">
                                                        <span class="mb-3 badge border border-info text-info">Business</span>
                                                        <h6 class="mb-2 fw-bold">Teboho Ncube</h6>
                                                        <p>
                                                            Use an exclusive promo code HKYMM50 and get 50%
                                                            off on your first order in the new year.
                                                        </p>
                                                    </div>
                                                </li>
                                                <li class="d-flex">
                                                    <div class="icon-box lg flex-shrink-0 bg-primary rounded-4 text-white fs-5">
                                                        CJ
                                                    </div>
                                                    <div class="ms-3 mb-4">
                                                        <span class="mb-3 badge border border-info text-info">Admin</span>
                                                        <h6 class="mb-2 fw-bold">Carla Jackson</h6>
                                                        <p>
                                                            Befor inviting the administrator, you must create
                                                            a role that can be assigned to them.
                                                        </p>
                                                    </div>
                                                </li>
                                                <li class="d-flex">
                                                    <div class="icon-box lg flex-shrink-0 bg-danger rounded-4 text-white fs-5">
                                                        JK
                                                    </div>
                                                    <div class="ms-3 mb-4">
                                                        <span class="mb-3 badge border border-danger text-danger">Security</span>
                                                        <h6 class="mb-2 fw-bold">Julie Kemp</h6>
                                                        <p>
                                                            Your security subscription has expired. Please
                                                            renew the subscription.
                                                        </p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-sm-6 col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">Invoices</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="scroll350 my-4">
                                            <div class="d-flex position-relative">
                                                <img src="assets/images/user.png" class="img-4x me-3 rounded-4" alt="Admin Dashboard" />
                                                <div class="mb-5">
                                                    <h6 class="mb-1 fw-bold">Sophie Michiels</h6>
                                                    <p class="mb-1">3 day ago</p>
                                                    <p class="mb-2 text-primary">
                                                        Paid invoice ref. #26788
                                                    </p>
                                                    <span class="badge border border-info text-info">Sent</span>
                                                </div>
                                            </div>
                                            <div class="d-flex position-relative">
                                                <img src="assets/images/user.png" class="img-4x me-3 rounded-4" alt="Admin Dashboard" />
                                                <div class="mb-5">
                                                    <h6 class="mb-1 fw-bold">Sunny Desmet</h6>
                                                    <p class="mb-1">3 hours ago</p>
                                                    <p class="mb-2 text-primary">
                                                        Sent invoice ref. #23457
                                                    </p>
                                                    <span class="badge border border-success text-success">Paid</span>
                                                </div>
                                            </div>
                                            <div class="d-flex position-relative">
                                                <img src="assets/images/user.png" class="img-4x me-3 rounded-4" alt="Admin Themes" />
                                                <div class="mb-5">
                                                    <h6 class="mb-1 fw-bold">Ilyana Maes</h6>
                                                    <p class="mb-1">One week ago</p>
                                                    <p class="mb-2 text-primary">
                                                        Paid invoice ref. #34546
                                                    </p>
                                                    <span class="badge border border-info text-info">Sent</span>
                                                </div>
                                            </div>
                                            <div class="d-flex position-relative">
                                                <img src="assets/images/user.png" class="img-4x me-3 rounded-4" alt="Admin Dashboard" />
                                                <div class="mb-5">
                                                    <h6 class="mb-1 fw-bold">Remssy Wilson</h6>
                                                    <p class="mb-1">7 hours ago</p>
                                                    <p class="mb-2 text-primary">
                                                        Paid invoice ref. #23459
                                                    </p>
                                                    <span class="badge border border-success text-success">Paid</span>
                                                </div>
                                            </div>
                                            <div class="d-flex position-relative">
                                                <img src="assets/images/user.png" class="img-4x me-3 rounded-4" alt="Admin Themes" />
                                                <div class="mb-5">
                                                    <h6 class="mb-1 fw-bold">Elliott Hermans</h6>
                                                    <p class="mb-1">1 day ago</p>
                                                    <p class="mb-2 text-primary">
                                                        Paid invoice ref. #23473
                                                    </p>
                                                    <span class="badge border border-warning text-warning">Pending</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-sm-6 col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">Income</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="scroll350 my-4">
                                            <div class="d-grid gap-3 my-4">
                                                <div class="d-flex align-items-center">
                                                    <div id="revenue"></div>
                                                    <div class="ms-3">
                                                        <h6 class="text-success d-flex align-items-center">
                                                            <i class="bi bi-arrow-up-right-circle-fill text-success fs-3 me-2"></i>
                                                            10%
                                                        </h6>
                                                        <h6>Offshore Income</h6>
                                                        <h3 class="text-primary">$65,000</h3>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div id="revenue2"></div>
                                                    <div class="ms-3">
                                                        <h6 class="text-success d-flex align-items-center">
                                                            <i class="bi bi-arrow-up-right-circle-fill text-success fs-3 me-2"></i>
                                                            15%
                                                        </h6>
                                                        <h6>Onsite Income</h6>
                                                        <h3 class="text-primary">$89,000</h3>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div id="revenue3"></div>
                                                    <div class="ms-3">
                                                        <h6 class="text-danger d-flex align-items-center">
                                                            <i class="bi bi-arrow-down-right-circle-fill text-danger fs-3 me-2"></i>
                                                            12%
                                                        </h6>
                                                        <h6>Contract Income</h6>
                                                        <h3 class="text-primary">$257,00</h3>
                                                    </div>
                                                </div>
                                            </div>
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
                        <span>� Bootstrap Gallery 2023</span>
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

        <!-- *************
                ************ Vendor Js Files *************
        ************* -->

        <!-- Overlay Scroll JS -->
        <script src="assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
        <script src="assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

        <!-- Apex Charts -->
        <script src="assets/vendor/apex/apexcharts.min.js"></script>
        <script src="assets/vendor/apex/custom/dash1/sales.js"></script>
        <script src="assets/vendor/apex/custom/dash1/sparkline.js"></script>
        <script src="assets/vendor/apex/custom/dash1/sparkline2.js"></script>

        <!-- Rating -->
        <script src="assets/vendor/rating/raty.js"></script>
        <script src="assets/vendor/rating/raty-custom.js"></script>

        <!-- Custom JS files -->
        <script src="assets/js/custom.js"></script>
    </body>

</html>