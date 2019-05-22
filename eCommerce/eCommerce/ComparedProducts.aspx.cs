using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;
namespace eCommerce
{
    public partial class ComparedProducts : System.Web.UI.Page
    {
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            karsilastirilacakUrunleriDoldur();
        }

        private void karsilastirilacakUrunleriDoldur()
        {
            List<Product> listemiz = WebLibrary.Compare.Tools.GetComparables(Session["myComparable"]);

            gwrUrunKarsilastirma.DataSource = listemiz;
            gwrUrunKarsilastirma.DataBind();
        }

        protected void lbtnSecilenleriKaldir_Click(object sender, EventArgs e)
        {
            List<Product> currentItems = WebLibrary.Compare.Tools.GetComparables(Session["myComparable"]);

            foreach (GridViewRow gw in gwrUrunKarsilastirma.Rows)
            {
                CheckBox chk = gw.FindControl("chkRemove") as CheckBox;

                if (chk.Checked == true)
                {
                    int prodId = Convert.ToInt32((gw.FindControl("hfProductId") as HiddenField).Value);

                    Product kaldirilanUrun = currentItems.FirstOrDefault(x => x.ProductID == prodId);

                    currentItems.Remove(kaldirilanUrun);
                }
            }
            Session["myComparable"] = currentItems;

            //-------------------------------------------
            karsilastirilacakUrunleriDoldur();
        }
    }
}