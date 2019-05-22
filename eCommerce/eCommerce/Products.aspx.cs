using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;

namespace eCommerce
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            ProductFill();
        }
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        private void ProductFill()
        {
            if (string.IsNullOrEmpty(Request.QueryString["CategoryID"]) != true)
            {
                //CategoryID'si seçili olan ürünleri getir -> mesela CategoryID = 1 (Bilgisayar) olan ürünler gelsin...
                var result = from x in db.Products where x.CategoryID == Convert.ToInt32(Request.QueryString["CategoryID"]) select x;

                DataList2.DataSource = result;
            }
            else if (string.IsNullOrEmpty(Request.QueryString["BrandID"]) != true)
            {

                var result = from x in db.Products where x.BrandID == Convert.ToInt32(Request.QueryString["BrandID"]) select x;

                DataList2.DataSource = result;
            }
            else
            {
                // CategoryID'si yoksa -> tüm ürünler gelsin

                var result = from x in db.Products select x;

                DataList2.DataSource = result;
            }
            DataList2.DataBind(); //unutma!
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument.ToString());

            switch (e.CommandName)
            {   //Sepete Ekle
                case "addToCart":
                    { /*Response.Write("Ürün sepete eklenmiştir."); */

                        //int productid = Convert.ToInt32(e.CommandArgument.ToString());

                        List<WebLibrary.Cart.CartProduct> currentItems = WebLibrary.Cart.Tools.GetAllCartProducts(Session["myCart"]);

                        WebLibrary.Product selected = db.Products.FirstOrDefault(P => P.ProductID == productId);

                        currentItems.Add(new WebLibrary.Cart.CartProduct()
                        {
                            Quantity = 1,
                            SelectedProduct = (WebLibrary.Product)selected
                        });

                        Session["myCart"] = currentItems;

                        //-----------------------------------------------------------

                        //messageBox verelim

                        ClientScript.RegisterStartupScript(this.GetType(), "INFO", "alert('Ürününüz başarıyla sepete eklenmiştir...');", true);

                    };
                    break;
                //Detay
                case "details":
                    { Response.Redirect("~/ProductDetail.aspx?ProductId=" + productId.ToString()); };
                    break;
            }

        }

        protected void DataList1_ItemCreated(object sender, DataListItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Product prod = e.Item.DataItem as Product;

                    int? stok = prod.UnitsInStock; // stokta ürün olmadığında => ? yani Nullable hata vermeyecek.

                    DropDownList drpStokAdeti = e.Item.FindControl("drpQuantity") as DropDownList;

                    if (IsPostBack == true && drpStokAdeti.SelectedItem != null)
                        return;
                    if (stok == null || stok == 0)
                    {
                        ListItem li = new ListItem("Stokta Yok", "0");
                        drpStokAdeti.Items.Add(li);
                    }
                    else
                    {
                        for (int i = 1; i <= stok; i++)
                        {
                            drpStokAdeti.Items.Add(i.ToString());
                        }
                    }
                }
            }
            catch (Exception)
            {

                
            }
        }
    }
}