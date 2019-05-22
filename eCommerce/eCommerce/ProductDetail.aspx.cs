using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;
namespace eCommerce
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        public Product SelectedProduct { get; set; }

        public string stokDurumu = ""; //null
        public string kargoDurumu = ""; //null
        protected void Page_Load(object sender, EventArgs e)
        {
            UrunBilgisiniAl();
        }

        private void UrunBilgisiniAl()
        {
            hfProductID.Value = Request.QueryString["ProductID"];
            //----------------------------------------------------------------


            if (string.IsNullOrEmpty(Request.QueryString["ProductID"]) == true)
            {
                Response.Redirect("Default.aspx");
            }

            int id = Convert.ToInt32(Request.QueryString["ProductID"]);

            SelectedProduct = db.Products.FirstOrDefault(p => p.ProductID == id);

            //-----------------------------------------------------------
            if (SelectedProduct.UnitsInStock > 0) //stokta ürün varsa
                stokDurumu = "Stok var";
            else //stokta ürün varsa
                stokDurumu = "Tükendi";
            //---------------------------------------------------------------
            if (SelectedProduct.UnitPrice > 100) // 100 tl üstü kargo bedava
                kargoDurumu = "Kargo bedava";
            else
                kargoDurumu = "Kargo müşteriye aittir";
        }

       

       

        protected void btnKarsilastir_Click(object sender, EventArgs e)
        {
            // Session["myComparable"]

            WebLibrary.Product selected = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(hfProductID.Value));

            List<WebLibrary.Product> comparableItemsEnd = WebLibrary.Compare.Tools.AddToCompare(Session["myComparable"], selected);

            SelectedProduct = selected;
            Session["myComparable"] = comparableItemsEnd;


            ClientScript.RegisterStartupScript(this.GetType(), "INFO", "alert('Ürününüz karşılaştırılmak için eklenmiştir...');", true);
        }

        protected void btnSepet_Click(object sender, EventArgs e)
        {
            List<WebLibrary.Cart.CartProduct> currentItems = WebLibrary.Cart.Tools.GetAllCartProducts(Session["myCart"]);

            WebLibrary.Product selected = db.Products.FirstOrDefault(P => P.ProductID == Convert.ToInt32(hfProductID.Value));

            currentItems.Add(new WebLibrary.Cart.CartProduct()
            {
                Quantity = 1,
                SelectedProduct = (WebLibrary.Product)selected
            });

            Session["myCart"] = currentItems;

            //-----------------------------------------------------------

            //messageBox verelim

            ClientScript.RegisterStartupScript(this.GetType(), "INFO", "alert('Ürününüz başarıyla sepete eklenmiştir...');", true);
        }

        //protected void lbtnSepeteEkle_Click(object sender, EventArgs e)
        //{
        //    // messageBox olayımıza ->alert ile buradan da bakalım

        //    //ClientScript.RegisterStartupScript(this.GetType(), "INFO","alert('Ürününüz başarıyla sepete eklenmiştir...');",true);

        //    /*Response.Write("Ürün sepete eklenmiştir."); */

        //    //int productid = Convert.ToInt32(e.CommandArgument.ToString());

        //    List<Web.Librariess.Cart.CartProduct> currentItems = Web.Librariess.Cart.Tools.GetAllCartProducts(Session["myCart"]);

        //    Web.Librariess.Product selected = db.Products.FirstOrDefault(P => P.ProductID == Convert.ToInt32(hfProductID.Value));

        //    currentItems.Add(new Web.Librariess.Cart.CartProduct()
        //    {
        //        Quantity = 1,
        //        SelectedProduct = (Web.Librariess.Product)selected
        //    });

        //    Session["myCart"] = currentItems;

        //    //-----------------------------------------------------------

        //    //messageBox verelim

        //    ClientScript.RegisterStartupScript(this.GetType(), "INFO", "alert('Ürününüz başarıyla sepete eklenmiştir...');", true);


        //}

        //protected void lbtnKarsilastir_Click(object sender, EventArgs e)
        //{
        //    // Session["myComparable"]

        //    Web.Librariess.Product selected = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(hfProductID.Value));

        //    List<Web.Librariess.Product> comparableItemsEnd = Web.Librariess.Compare.Tools.AddToCompare(Session["myComparable"], selected);

        //    SelectedProduct = selected;
        //    Session["myComparable"] = comparableItemsEnd;


        //    ClientScript.RegisterStartupScript(this.GetType(), "INFO", "alert('Ürününüz karşılaştırılmak için eklenmiştir...');", true);
        //}
    }
}