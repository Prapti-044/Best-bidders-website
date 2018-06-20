<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BEST BID</title>
    <link href="Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="Style/custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top custom-background-color">
            <a class="navbar-brand" href="#">Best bidders</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="Div1">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="about.aspx">About</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="signed_home.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="hot_sales.aspx">Hot Sales</a>
                    </li>
                    <li class="nav-item">
                        <asp:PlaceHolder ID="login_placeholder" runat="server" />
                    </li>
                </ul>
            </div>
        </nav>
       

          <section class="container-fluid text-center py-5" style="background-color: #e9a9f1">
            <div class="row my-5">
                <div class="col-lg-8 mx-auto">
                    <h2 class="text-uppercase">Our service is what you need right now!</h2>
                    <hr class="my-5" />
                    <p class="mb-5">Best Bid is an online auction shopping site where you will definitely get your desired items through bidding in the minimum price ever and in given time! Start Bidding has everything you need to get your new items up and sold in no time! All of the items and prices on Best Bid are open source, free to choose, and easy to buy in given time!</p>
                <hr class="my-5" />
                </div>
            </div>
        </section>
        <footer class="container-fluid py-5 custom-background-color text-white">
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
