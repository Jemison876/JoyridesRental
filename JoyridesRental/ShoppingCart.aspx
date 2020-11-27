<%@ Page Title="ShoppingCart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="JoyridesRental.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {

            $("#RentalDate").datepicker({
                minDate: 0,
                maxDate: '+1Y+6M',
                onSelect: function (dateStr) {
                    var min = $(this).datepicker('getDate'); // Get selected date
                    $("#ReturnDate").datepicker('option', 'minDate', '1'); // Set other min, default to today
                }
            });

            $("#ReturnDate").datepicker({
                minDate: 1,
                maxDate: '+1Y+6M',
                onSelect: function (dateStr) {
                    var max = $(this).datepicker('getDate'); // Get selected date
                    $('#datepicker').datepicker('option', 'maxDate', '+1Y+6M'); // Set other max, default to +18 months
                    var start = $("#RentalDate").datepicker("getDate");
                    var end = $("#ReturnDate").datepicker("getDate");
                    var days = (end - start) / (1000 * 60 * 60 * 24);
                    if (days == 0) {
                        days = 1;
                    }
                    $("#PurchaseNumberOfDays").val(days);
                }
            });

            $("#btnShow").click(function () {


            });
            $("#save").click(function () {

                $("")

            });


        });
    </script>
    <style>
      .myButton {font-size: 16px;}
    </style>

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <center><h4 class="modal-title">Please Select Start and End Date</h4></center>
                </div>
                <div class="modal-body">
                    <p>Start Date:<asp:TextBox runat="server" ID="RentalDate"  ClientIDMode="Static"></asp:TextBox></p>
                    <p>Return Date:<asp:TextBox runat="server" ID="ReturnDate"  ClientIDMode="Static"></asp:TextBox></p>
                    <p>Days:<asp:TextBox runat="server" ID="NumberOfDays"  ClientIDMode="Static"></asp:TextBox></p>
                    <p>Enter Car ID:<asp:TextBox runat="server" ID="ProductID"  ClientIDMode="Static"></asp:TextBox></p>
                </div>
                <div>
                    <asp:Button id="sav" runat="server" Text="Save"  OnClick="SaveBtn_Click"/>
                </div>
            </div>
        </div>
    </div>


    <div id="ShoppingCartTitle" runat="server" class ="ContentHead">
        <h1>Shopping Cart</h1>
    </div>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4" ItemType="JoyridesRental.Models.CartItem" SelectMethod="GetShoppingCartItems" CssClass="table table-striped table-bordered">
        <Columns>
            <asp:BoundField DataField ="ProductID" HeaderText="ID" SortExpression="ProductID" />
            <asp:BoundField DataField ="Product.ProductName" HeaderText="Name" />
            <asp:BoundField DataField ="Product.UnitPrice" HeaderText="Price (per car)" DataFormatString="{0:c}" />            
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#:Item.Quantity %>"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText ="Item Total">
                <ItemTemplate>
                    <%#:String.Format("{0:c}",((Convert.ToDouble(Item.Quantity))* Convert.ToDouble(Item.Product.UnitPrice)))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rent Date">
              <ItemTemplate>
              <asp:TextBox runat="server" ID="RentalDate" Width="100" Text="<%#: Item.RentalDate %>"></asp:TextBox>
                  </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Return Date">
               <ItemTemplate>
              <asp:TextBox runat="server" ID="ReturnDate" Width="100" Text="<%#: Item.ReturnDate %>"></asp:TextBox>
                    <button type="button" class="myButton"" id="btnShow" data-toggle="modal" data-target="#myModal">Set Date</button>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remove Item">
                <ItemTemplate>
                    <asp:CheckBox ID="Remove" runat="server" />                    
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>       
    </asp:GridView>
    <div>
        <p></p>
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total:"></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong>
    </div>
    <table>
        <tr>
            <td>
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>
