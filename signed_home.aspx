<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signed_home.aspx.cs" Inherits="signed_home" %>

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
                        <asp:Button ID="Button1" runat="server" Text="Logout" CssClass="btn btn-outline-secondary btn-sm mt-2 ml-1" OnClick="logout_button_OnClick" />
                    </li>
                </ul>
            </div>
        </nav>

        <div id="add_item_container">
            <div class="container-fluid">
                <div class="row justify-content-center mb-4">
                    <h1>ADD YOUR ITEM</h1>
                </div>
                <div class="row justify-content-center">
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#add_item_modal">Add Item</button>
                    <div class="modal fade" id="add_item_modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Add Item</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <asp:TextBox ID="item_name" CssClass="form-control mb-3" runat="server" placeholder="Item Name"/>
                                    <asp:TextBox ID="item_base_price" placeholder="Item base price" CssClass="form-control mb-3" runat="server"/>

                                    <div class="custom-file">
                                        <asp:FileUpload ID="FileUpload" CssClass="custom-file-input" runat="server"/>
                                        <label class="custom-file-label" for="FileUpload">Choose file...</label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="add_item" runat="server" Text="Add Item" CssClass="btn btn-primary" OnClick="add_item_OnClick" />
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container py-5">
            <div class="row mb-4">
                <h1>YOUR ITEMS</h1>
            </div>
            <div class="row">
                <asp:PlaceHolder ID="item_placeholder" runat="server"/>
            </div>
        </div>
        <hr/>
        <div class="container py-5">
            <div class="row mb-4">
                <h1>Bids Overriddent</h1>
            </div>
            <div class="row">
                <asp:PlaceHolder ID="overridden_placeholder" runat="server"/>
            </div>
        </div>
        <hr/>


        <div class="container-fluid" style="background-color: #e9a9f1">
          <div class="container py-5">
            <div class="row pb-4">
                <h1>Change Account Settings</h1>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <asp:TextBox ID="first_name" runat="server" CssClass="form-control input-sm mb-3" placeholder="First Name"/>
                        <asp:TextBox ID="pass" runat="server" CssClass="form-control input-sm" placeholder="Password"/>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <asp:TextBox ID="last_name" runat="server" CssClass="form-control input-sm mb-3" placeholder="Last Name"/>
                        <asp:TextBox ID="pass_confirm" runat="server" CssClass="form-control input-sm" placeholder="Retype Password"/>
                    </div>
                </div>
                <div class="col-12">
                    <asp:Button ID="update_user_button" runat="server" CssClass="btn btn-primary btn-lg" Text="Update" OnClick="update_user_button_Click"/>
                </div>
            </div>
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
