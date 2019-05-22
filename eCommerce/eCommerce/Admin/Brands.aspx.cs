using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;
namespace eCommerce.Admin
{
    public partial class Brands : System.Web.UI.Page
    {
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            BrandFill();
        }

        private void BrandFill()
        {
            rptBrands.DataSource = db.Brands.ToList();
            rptBrands.DataBind();
        }

        protected void btnBrandInsert_Click(object sender, EventArgs e)
        {
            Brand bra = new Brand();
            bra.BrandName = txtBrandName.Text;


            db.Brands.InsertOnSubmit(bra);
            db.SubmitChanges();

            BrandFill();
            MultiView1.ActiveViewIndex = 1;
        }
        public int? SelectedBrandId
        {
            set
            {
                ViewState["SelectedBrandId"] = value;
            }
            get
            {
                return (int?)ViewState["SelectedBrandId"];
            }
        }
        protected void btnBrandUpdate_Click(object sender, EventArgs e)
        {
            Brand selectedBra = db.Brands.FirstOrDefault(sc => sc.BrandID == SelectedBrandId);

            selectedBra.BrandName = txtBrandName.Text;
            db.SubmitChanges();

            //------------------------------
            SelectedBrandId = null;
            btnBrandInsert.Visible = false;
            btnBrandUpdate.Visible = true;
            //--------------
            BrandFill();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnSecilenleriSil_Click(object sender, EventArgs e)
        {
            List<Brand> silinecekMarkalar = new List<Brand>();

            foreach (RepeaterItem rpt in rptBrands.Items)
            {
                CheckBox chk = rpt.FindControl("chkSil") as CheckBox;

                if (chk.Checked)
                {
                    HiddenField hfId = rpt.FindControl("hfBrandID") as HiddenField;

                    Brand silinenBrand = db.Brands.FirstOrDefault(sc => sc.BrandID == Convert.ToInt32(hfId.Value));

                    silinecekMarkalar.Add(silinenBrand);
                }
            }
            db.Brands.DeleteAllOnSubmit(silinecekMarkalar);
            db.SubmitChanges();

            BrandFill();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void lbtnBrandInsertView_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0; //View1
            btnBrandInsert.Visible = true;
            btnBrandUpdate.Visible = false;
        }

        protected void lbtnBrandUpdate_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void lbtnBrandDelete_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void rptBrands_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            HiddenField hfId = e.Item.FindControl("hfBrandID") as HiddenField;

            SelectedBrandId = Convert.ToInt32(hfId.Value);

            //----------------------------------
            Brand selectedBra = db.Brands.FirstOrDefault(sc => sc.BrandID == SelectedBrandId);

            txtBrandName.Text = selectedBra.BrandName;
            db.SubmitChanges();

            btnBrandInsert.Visible = false;
            btnBrandUpdate.Visible = true;

            MultiView1.ActiveViewIndex = 0;
        }
    }
}