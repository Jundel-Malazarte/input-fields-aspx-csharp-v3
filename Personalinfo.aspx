<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Personalinfo.aspx.cs" Inherits="Personalinfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details to table</title>
    <link rel="icon" href="./img/Dotnet.png" />
    <style>
        body {
            background-color: #eceff1;
        }
        /*  */
        #form1 {
            position: relative;  
        }

        /* Container Style */
        .container {
            margin: 0;
            margin-top: 25%;
            padding: 20px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            border-radius: 10px;
        }

        /* Save Button */
        #SubmitButton {
            margin: 5px;
            padding: 5px;
            height: 30px;
            width: 70px;
            border: none;
            border-radius: 5px;
            background-color: #3d5afe;
            color: #eceff1;
            font-weight: 500;
        }

        table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }
        table, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }   
        th {
            background-color: #f2f2f2;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" runat="server">
            <div>
                <asp:Label AssociatedControlID="Name" Text="Name:" runat="server"></asp:Label>
                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label AssociatedControlID="Address" Text="Address:" runat="server"></asp:Label>
                <asp:TextBox ID="Address" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label AssociatedControlID="Age" Text="Age:" runat="server"></asp:Label>
                <asp:TextBox ID="Age" runat="server"></asp:TextBox>
            </div>
            <div class="gender" runat="server">
                <asp:Label Text="Gender:" runat="server"></asp:Label><br />
                <asp:RadioButton ID="rdoMale" GroupName="GenderGroup" Text="Male" runat="server"/>
                <asp:RadioButton ID="rdoFemale" GroupName="GenderGroup" Text="Female" runat="server"/>
            </div>
            <div>
                <asp:Button ID="SubmitButton" Text="Save" runat="server" OnClick="SubmitButton_Click" />
            </div>

            <!-- Table output -->
            <div class="table" runat="server">
                <table>
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
                                        <asp:Button ID="btnUpdate" Text="Update" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="UpdateRecord" />
                                        <asp:Button ID="btnDelete" Text="Delete" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="DeleteRecord" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
