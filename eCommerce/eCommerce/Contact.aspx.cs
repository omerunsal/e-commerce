using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;
namespace eCommerce
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
        }
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        protected void btnFormSend_Click(object sender, EventArgs e)
        {
            try
            {
                ContactData cd = new ContactData();
                cd.NameSurname = txtName.Text;
                cd.Email = txtEmail.Text;
                cd.Company = txtCompany.Text;
                cd.Phone = txtPhone.Text;
                cd.Message = txtMessage.Text;

                db.ContactDatas.InsertOnSubmit(cd);
                db.SubmitChanges();

                Label1.Text = "Mesajınız başarıyla gönderildi.";
                //Response.Redirect("Default.aspx");
            }
            catch (Exception)
            {
                Label1.Text = "Mesaj gönderme başarısız, tekrar deneyiniz!";
            }
        }
    }
}