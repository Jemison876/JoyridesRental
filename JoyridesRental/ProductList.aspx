<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="JoyridesRental.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
        <div> 
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>
            <asp:ListView ID="productList" runat="server" DataKeyNames="ProductID" GroupItemCount="4" ItemType="JoyridesRental.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyDataTemplate>
                    <td/>
                </EmptyDataTemplate>
                <GroupTemplate>
                    <tr id ="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href ="ProductDetails.aspx?productID=<%#:Item.ProductID %>">
                                        <img src="/<%#:Item.ImagePath %>" width="300" height="250" style="border:
                              solid"/> 
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Item.ProductID%>">
                                        <span>
                                            <%#:Item.ProductName %>
                                        </span>
                                    </a>
                                    <br />
                                    <span>
                                        <b>Price:</b><%#:String.Format("{0:c}", Item.UnitPrice) %>
                                    </span>
                                    <br />
                                    <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">
                                        <span class ="ProductListItem"><b>Add to Cart</b></span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    
</asp:Content>
