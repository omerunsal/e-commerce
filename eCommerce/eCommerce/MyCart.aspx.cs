using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;
namespace eCommerce
{
    public partial class MyCart : System.Web.UI.Page
    {
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        public decimal? TotalPrice { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;


            sepetiDoldur();
        }

        private void sepetiDoldur()
        {
            List<WebLibrary.Cart.CartProduct> listemiz = (List<WebLibrary.Cart.CartProduct>)Session["myCart"];

            if (listemiz != null)
            {
                rpyMycart.DataSource = listemiz;
                rpyMycart.DataBind();
                //--------------------------------------------
                decimal? total = 0;

                foreach (var li in listemiz)
                {
                    total += (li.Quantity * li.UnitPrice);
                }
                this.TotalPrice = total;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<WebLibrary.Cart.CartProduct> listemiz = (List<WebLibrary.Cart.CartProduct>)Session["myCart"];

            if (listemiz != null)
            {
                List<WebLibrary.Cart.CartProduct> kaldiralacaklar = new List<WebLibrary.Cart.CartProduct>();

                foreach (RepeaterItem rptItem in rpyMycart.Items)
                {
                    CheckBox chk = rptItem.FindControl("chkSeciniz") as CheckBox;

                    if (chk.Checked) //veya true
                    {
                        HiddenField hf = rptItem.FindControl("hfProductID") as HiddenField;

                        if (string.IsNullOrEmpty(hf.Value) == false)
                        {
                            int id = Convert.ToInt32(hf.Value);

                            foreach (var prod in listemiz)
                            {
                                if (prod.ProductID == id)
                                {
                                    kaldiralacaklar.Add(prod);
                                }
                            }
                        }
                    }
                }

                foreach (var silinen in kaldiralacaklar)
                {
                    listemiz.Remove(silinen);
                }

                Session["myCart"] = listemiz;
                //-----------------------------------
                sepetiDoldur();
            }
        }
    }
}