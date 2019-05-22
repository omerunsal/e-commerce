using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;
namespace eCommerce
{
    public partial class Search : System.Web.UI.Page
    {
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            if (string.IsNullOrEmpty(Request.QueryString["AranacakDeger"]) == false)
            {
                //txtAra.Text = Request.QueryString["AranacakDeger"];

                Arama(Request.QueryString["AranacakDeger"]);


            }
            //Page.Form.DefaultButton = btnAra.UniqueID;
        }

        private void Arama(string SearchParameter)
        {
            string aranacakDeger = SearchParameter.Replace("-", "").Replace("<", "").Replace("/", "");

            var result = from x in db.Products where x.ProductName.Contains(aranacakDeger) == true || x.Category.CategoryName.Contains(aranacakDeger) == true || x.Brand.BrandName.Contains(aranacakDeger) == true select x;

            DataList1.DataSource = result;
            DataList1.DataBind();
        }



        //protected void btnAra_Click(object sender, EventArgs e)
        //{
        //    Arama(txtAra.Text);
        //}

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