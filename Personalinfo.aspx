<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Personalinfo.aspx.cs" Inherits="Personalinfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details to table</title>
    <link rel="icon" href="../image/Dotnet.png">
    <!-- Bootstrap CSS from CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Custom Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #eceff1;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form1 {
            margin-top: 10%;
            width: 850px;
            padding: 25px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Save and Clear Buttons */
        #SubmitButton, #ClearButton {
            margin: 10px 0;
            width: 100px;
        }

        #SubmitButton {
            background-color: #3d5afe;
            border-color: #3d5afe;
            color: #fff;
        }
        #SubmitButton:hover {
            background-color: #3d5afe;
            opacity: 0.8;
        }

        #ClearButton {
            background-color: #ff6d00;
            border-color: #ff6d00;
            color: #fff;
        }
        #ClearButton:hover {
            background-color: #ff6d00;
            opacity: 0.8;
        }

        table {
            margin-top: 2px;
            width: 100%;
        }

        th {
            background-color: #212121;
            color: #fff;
        }

        .btnUpdate {
            background-color: #3d5afe;
            width: 80px;
            color: #fff;
        }
        .btnUpdate:hover {
            background-color: #3d5afe;
            color: #fff;
            opacity: 0.8;
        }

        /* Delete */
        .btnDelete {
            background-color: #ff3d00;
            width: 80px;
            color: #fff;
        }
        .btnDelete:hover {
            background-color: #ff3d00;
            color: #fff;
            opacity: 0.8;
        }


    </style>
</head>
<body>
    <form id="container" runat="server" class="container mt-5">
        <div class="form1 mx-auto col-md-6">
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label AssociatedControlID="Name" Text="Name:" runat="server" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="Name" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label AssociatedControlID="Address" Text="Address:" runat="server" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="Address" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label AssociatedControlID="Age" Text="Age:" runat="server" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="Age" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label Text="Gender" runat="server" CssClass="form-label"></asp:Label><br />
                    <asp:RadioButton ID="rdoMale" GroupName="GenderGroup" Text="Male" runat="server" class="form-check-input" />
                    <asp:RadioButton ID="rdoFemale" GroupName="GenderGroup" Text="Female" runat="server" class="form-check-input" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="SubmitButton" Text="Save" runat="server" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
                    <asp:Button ID="ClearButton" Text="Clear" runat="server" CssClass="btn btn-warning" OnClick="ClearButton_Click" />
                </div>
            </div>

            <!-- Table output -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="DetailsRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("id") %></td>
                                        <td><%# Eval("name") %></td>
                                        <td><%# Eval("address") %></td>
                                        <td><%# Eval("age") %></td>
                                        <td><%# Eval("gender") %></td>
                                        <td>
                                            <asp:Button ID="btnUpdate" CssClass="btn btnUpdate" Text="Update" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="UpdateRecord" />
                                            <asp:Button ID="btnDelete" CssClass="btn btnDelete" Text="Delete" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="DeleteRecord" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS from CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
