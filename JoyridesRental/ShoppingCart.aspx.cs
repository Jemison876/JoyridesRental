using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JoyridesRental.Models;
using JoyridesRental.Logic;
using System.Collections.Specialized;
using System.Collections;
using System.Web.ModelBinding;
using System.Data.SqlClient;
using System.Data;
using System.Windows;
using System.Configuration;

namespace JoyridesRental
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (ShoppingCartActions usersShoppingCart = new ShoppingCartActions())
            {
                decimal cartTotal = 0;
                cartTotal = usersShoppingCart.GetTotal();
                if(cartTotal > 0)
                {
                    lblTotal.Text = String.Format("{0:c}", cartTotal);
                }
                else
                {
                    LabelTotalText.Text = "";
                    lblTotal.Text = "";
                    ShoppingCartTitle.InnerText = "Shopping Cart is Empty";
                    UpdateBtn.Visible = false;
                }
            }
        }

        public List<CartItem> GetShoppingCartItems()
        {
            ShoppingCartActions action = new ShoppingCartActions();
            return action.GetCartItems();
        } 

        public List<CartItem> UpdateCartItems()
        {
            using (ShoppingCartActions usersShoppingCart = new ShoppingCartActions())
            {
                String cartId = usersShoppingCart.GetCartId();
                ShoppingCartActions.ShoppingCartUpdates[] cartUpdates = new ShoppingCartActions.ShoppingCartUpdates[CartList.Rows.Count];
                for(int i = 0; i< CartList.Rows.Count; i++)
                {
                    IOrderedDictionary rowValues = new OrderedDictionary();
                    rowValues = GetValues(CartList.Rows[i]);
                    cartUpdates[i].ProductId = Convert.ToInt32(rowValues["ProductID"]);

                    CheckBox cbRemove = new CheckBox();
                    cbRemove = (CheckBox)CartList.Rows[i].FindControl("Remove");
                    cartUpdates[i].RemoveItem = cbRemove.Checked;

                    TextBox quantityTextBox = new TextBox();
                    quantityTextBox = (TextBox)CartList.Rows[i].FindControl("PurchaseQuantity");
                    cartUpdates[i].PurchaseQuantity = Convert.ToInt16(quantityTextBox.Text.ToString());

                    TextBox RentalDateTextBox = new TextBox();
                    RentalDateTextBox = (TextBox)CartList.Rows[i].FindControl("RentalDate");
                    cartUpdates[i].NewRentDate = RentalDateTextBox.Text.ToString();

                    TextBox ReturnDateTextBox = new TextBox();
                    ReturnDateTextBox = (TextBox)CartList.Rows[i].FindControl("ReturnDate");
                    cartUpdates[i].NewReturnDate = ReturnDateTextBox.Text.ToString();
                }
                usersShoppingCart.UpdateShoppingCartDatabase(cartId, cartUpdates);
                CartList.DataBind();
                lblTotal.Text = String.Format("{0:c}", usersShoppingCart.GetTotal());
                return usersShoppingCart.GetCartItems();
            }
        }
        public static IOrderedDictionary GetValues(GridViewRow row)
        {
            IOrderedDictionary values = new OrderedDictionary();
            foreach(DataControlFieldCell cell in row.Cells)
            {
                if (cell.Visible)
                {
                    cell.ContainingField.ExtractValuesFromCell(values, cell, row.RowState, true);
                }
            }
            return values;
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            UpdateCartItems();
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("myCookie");
            HttpCookie cookie1 = new HttpCookie("myCookie1");
            HttpCookie cookie2 = new HttpCookie("myCookie2");
            HttpCookie cookie3 = new HttpCookie("myCookie3");

            cookie.Values["myCookie"] = RentalDate.Text;
            cookie1.Values["myCookie1"] = ReturnDate.Text;
            cookie2.Values["myCookie2"] = NumberOfDays.Text;
            cookie3.Values["myCookie3"] = ProductID.Text;

            cookie.Expires = DateTime.Now.AddSeconds(10);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-JoyridesRental-20201109071013.mdf;Integrated Security=True");
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("update CartItems set RentalDate='" + RentalDate.Text + "',ReturnDate='" + ReturnDate.Text + "',Quantity='" + NumberOfDays.Text + "' Where ProductId=" + Convert.ToInt32(ProductID.Text) + "", con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Write("<script>alert('Data inserted successfully')</script>");
                Response.Redirect("ShoppingCart.aspx");
            }
            else
            {
                Response.Redirect("ErrorPage.aspx");
            }
            con.Close();
        }
    }
}