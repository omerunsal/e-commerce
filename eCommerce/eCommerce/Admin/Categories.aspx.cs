using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;
namespace eCommerce.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            /* MultiView1.ActiveViewIndex = 1;*/ //hiçbir view seçili gelmez.

            CategoryFill();
        }

        private void CategoryFill()
        {
            rptCategories.DataSource = db.Categories.ToList();
            rptCategories.DataBind();
        }

        #region Link Buttonlarım
        protected void lbtnCateInsertView_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0; //View1
            btnCateInsert.Visible = true;
            btnCateUpdate.Visible = false;
        }

        protected void lbtnCateUpdate_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void lbtnCateDelete_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        #endregion

        #region Butonlarım
        // Kategori Ekle
        protected void btnCateInsert_Click(object sender, EventArgs e)
        {
            Category cate = new Category();
            cate.CategoryName = txtCategoryName.Text;

            db.Categories.InsertOnSubmit(cate);
            db.SubmitChanges();

            CategoryFill();
            MultiView1.ActiveViewIndex = 1;
        }
        // Kategori GÜncelle
        public int? SelectedCategoryId
        {
            set
            {
                ViewState["SelectedCategoryId"] = value;
            }
            get
            {
                return (int?)ViewState["SelectedCategoryId"];
            }
        }
        protected void btnCateUpdate_Click(object sender, EventArgs e)
        {
            Category selectedCate = db.Categories.FirstOrDefault(sc => sc.CategoryID == SelectedCategoryId);

            selectedCate.CategoryName = txtCategoryName.Text;
            db.SubmitChanges();

            //------------------------------
            SelectedCategoryId = null;
            btnCateInsert.Visible = false;
            btnCateUpdate.Visible = true;
            //--------------
            CategoryFill();
            MultiView1.ActiveViewIndex = 1;
        }
        #endregion

        protected void btnSecilenleriSil_Click(object sender, EventArgs e)
        {
            List<Category> silinecekKategoriler = new List<Category>();

            foreach (RepeaterItem rpt in rptCategories.Items)
            {
                CheckBox chk = rpt.FindControl("chkSil") as CheckBox;

                if (chk.Checked)
                {
                    HiddenField hfId = rpt.FindControl("hfCategoryID") as HiddenField;

                    Category silinenCate = db.Categories.FirstOrDefault(sc => sc.CategoryID == Convert.ToInt32(hfId.Value));

                    silinecekKategoriler.Add(silinenCate);
                }
            }
            db.Categories.DeleteAllOnSubmit(silinecekKategoriler);
            db.SubmitChanges();

            CategoryFill();
            MultiView1.ActiveViewIndex = 1;

        }

        protected void rptCategories_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            HiddenField hfId = e.Item.FindControl("hfCategoryID") as HiddenField;

            SelectedCategoryId = Convert.ToInt32(hfId.Value);

            //----------------------------------
            Category selectedCate = db.Categories.FirstOrDefault(sc => sc.CategoryID == SelectedCategoryId);

            txtCategoryName.Text = selectedCate.CategoryName;
            db.SubmitChanges();

            btnCateInsert.Visible = false;
            btnCateUpdate.Visible = true;

            MultiView1.ActiveViewIndex = 0;
        }

    }
}