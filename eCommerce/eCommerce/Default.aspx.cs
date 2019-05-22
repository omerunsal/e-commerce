using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;

namespace eCommerce
{
    public partial class Default : System.Web.UI.Page
    {
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}