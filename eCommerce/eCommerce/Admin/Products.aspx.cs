using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;
namespace eCommerce.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            ProductsFill();
        }

        private void ProductsFill()
        {
            rptProducts.DataSource = db.Products.ToList();
            rptProducts.DataBind();
        }

        protected void dlstCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Product> list = db.Products.Where(sc => sc.CategoryID == Convert.ToInt32(dlstCategories.SelectedValue)).ToList();

            rptProducts.DataSource = list;
            rptProducts.DataBind();

        }

        protected void btnProInsert_Click(object sender, EventArgs e)
        {

            ekle();
        }

        private void ekle()
        {
            Product prod = new Product();
            prod.ProductName = txtProductName.Text;
            prod.CategoryID = Convert.ToInt32(dlstCategories.SelectedValue);
            prod.UnitPrice = Convert.ToInt32(txtUnitPrice.Text);
            prod.BrandID = Convert.ToInt32(dlstBrands.SelectedValue);
            if (SmallPhotoPath.HasFile)
            {
                SmallPhotoPath.SaveAs(Server.MapPath("/images/small/") + SmallPhotoPath.FileName);
                prod.SmallPhotoPath = "/images/small/" + SmallPhotoPath.FileName;

            }

            if (LargePhotoPath.HasFile)
            {
                LargePhotoPath.SaveAs(Server.MapPath("/images/large") + LargePhotoPath.FileName);
                prod.LargePhotoPath = "/images/large" + LargePhotoPath.FileName;
            }

            db.Products.InsertOnSubmit(prod);
            db.SubmitChanges();

        }

        protected void lbtnProInsertView_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            btnProInsert.Visible = true;

        }

        protected void lbtnProUpdateView_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void lbtnProDeleteView_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            HiddenField hfId = e.Item.FindControl("hfProductID") as HiddenField;

            SelectedProductId = Convert.ToInt32(hfId.Value);

            //----------------------------------
            Product selectedPro = db.Products.FirstOrDefault(sc => sc.ProductID == SelectedProductId);

            txtProductName.Text = selectedPro.ProductName;
            txtUnitPrice.Text = selectedPro.UnitPrice.ToString();
            db.SubmitChanges();

            btnProInsert.Visible = false;
            btnProUpdate.Visible = true;

            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnSecilenleriSil_Click(object sender, EventArgs e)
        {
            List<Product> silinecekProduct = new List<Product>();

            foreach (RepeaterItem rpt in rptProducts.Items)
            {
                CheckBox chk = rpt.FindControl("chkSil") as CheckBox;

                if (chk.Checked)
                {
                    HiddenField hfId = rpt.FindControl("hfProductID") as HiddenField;

                    Product silinenPro = db.Products.FirstOrDefault(sc => sc.ProductID == Convert.ToInt32(hfId.Value));

                    silinecekProduct.Add(silinenPro);
                }
            }
            db.Products.DeleteAllOnSubmit(silinecekProduct);
            db.SubmitChanges();

            ProductsFill();
            MultiView1.ActiveViewIndex = 1;
        }
        public int? SelectedProductId
        {
            set
            {
                ViewState["SelectedProductId"] = value;
            }
            get
            {
                return (int?)ViewState["SelectedProductId"];
            }
        }
        protected void btnProUpdate_Click(object sender, EventArgs e)
        {
            Product selectedPro = db.Products.FirstOrDefault(sc => sc.ProductID == SelectedProductId);

            selectedPro.ProductName = txtProductName.Text;
            selectedPro.UnitPrice = Convert.ToInt32(txtUnitPrice.Text);
            db.SubmitChanges();

            //------------------------------
            SelectedProductId = null;
            btnProInsert.Visible = false;
            btnProUpdate.Visible = true;
            //--------------
            ProductsFill();
            MultiView1.ActiveViewIndex = 1;
        }

        
    }
}
