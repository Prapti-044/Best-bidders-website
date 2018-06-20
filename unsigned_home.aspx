<%@ Page Language="C#" AutoEventWireup="true" CodeFile="unsigned_home.aspx.cs" Inherits="unsigned_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BEST BID</title>
    <link href="Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="Style/custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    
        <div class="modal fade" tabindex="-1" role="dialog" id="signupmodal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Sign up</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:TextBox ID="first_name" runat="server" CssClass="form-control input-sm" placeholder="First Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <asp:TextBox ID="last_name" CssClass="form-control input-sm" placeholder="Last Name" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="signup_email" CssClass="form-control input-sm" placeholder="Email Address" runat="server"></asp:TextBox>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:TextBox ID="signup_password" CssClass="input-sm form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <asp:TextBox ID="pass_confirmation" CssClass="form-control input-sm" placeholder="Confirm Password" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="sign_up" runat="server" Text="Sign up" OnClick="sign_up_click" CssClass="btn btn-primary" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" tabindex="-1" role="dialog" id="signinmodal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Sign in</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <asp:TextBox ID="login_email" CssClass="form-control input-sm" placeholder="Email" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="login_pass" CssClass="form-control input-sm" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="sign_in" runat="server" Text="Sign in" CssClass="btn btn-primary" OnClick="sign_in_Click" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-dark fixed-top custom-background-color">
            <a class="navbar-brand" href="#">Best bidders</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="about.aspx">About</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="hot_sales.aspx">Hot Sales</a>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-outline-secondary btn-sm mt-2 ml-1" type="button" data-toggle="modal" data-target="#signinmodal">
                            Login
                        </button>
                        
                    </li>
                </ul>
            </div>
        </nav>

        <header class="text-white container-fluid text-center py-5" style="height: 720px; background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('images/heading_image.jpg'); background-size: cover">
            <div class="row" style="margin-top: 260px">
                <div class="col-lg-10 mx-auto">
                    <h1 class="text-uppercase">
                        <strong>Bid at your wish and get the perfect deal ever!</strong>
                    </h1>
                    <hr/>
                </div>
                <div class="col-lg-8 mx-auto">
                    <p>Bid at your best in the given time to buy item in minimum price you can possibly get!</p>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#signupmodal">Sign up</button>
                    
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#signinmodal">Sign in</button>
                    
                </div>
            </div>
        </header>

        <section class="container-fluid text-center py-5" style="background-color: #e9a9f1">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <h2 class="text-uppercase">Our service is what you need right now!</h2>
                    <hr class="my-4" />
                    <p class="mb-4">Start Bidding has everything you need to get your new items up and sold in no time! All of the items and prices on Best Bid are open source, free to choose, and easy to buy in given time!</p>
                    <a class="btn btn-primary" href="about.aspx">Contact us</a>
                </div>
            </div>
        </section>

        <footer class="container-fluid pt-2 custom-background-color text-white">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h3>Presented To</h3>
                        <ul>
                            <li>Mishty Miss</li>
                            <li>Aziz Sir</li>
                        </ul>
                    </div>
                    <div class="col">
                        <h3>Presented By</h3>
                        <ul>
                            <li>Prapti Shadmaan</li>
                            <li>Juyana Islam</li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    
    </form>
    <script src="Bootstrap/jquery-3.3.1.slim.min.js"></script>
    <script src="Bootstrap/popper.min.js"></script>
    <script src="Bootstrap/bootstrap.min.js"></script>
</body>
</html>
