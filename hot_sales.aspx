<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hot_sales.aspx.cs" Inherits="hot_sales" %>

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


        <div class="container my-5 pt-5">
            <div class="row" >
                <h1>Selected Items for You</h1>
            </div>
            <div class="row mb-5">
                <asp:PlaceHolder ID="login_warning_placeholder" runat="server" />
            </div>
            <div class="row">
                <asp:PlaceHolder ID="items_placeholder" runat="server"></asp:PlaceHolder>
            </div>
        </div>


        <footer class="container-fluid py-5 text-white custom-background-color">
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
