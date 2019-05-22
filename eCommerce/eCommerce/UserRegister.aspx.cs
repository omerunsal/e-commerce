using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLibrary;
namespace eCommerce
{
    public partial class UserRegister : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ETicaretDBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
        }
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        protected void btnKayitOl_Click(object sender, EventArgs e)
        {
            try
            {

                conn.Open();
                string checkUser = "Select count(*) from UsersData where UserName='" + txtNickname.Text + "'";
                SqlCommand cmd = new SqlCommand(checkUser, conn);
                int k = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                conn.Close();

                if (k == 0)
                {
                    SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ETicaretDBConnectionString"].ConnectionString);
                    cnn.Open();
                    string checkMail = "Select count(*) from UsersData where Email='" + txtMail.Text + "'";
                    SqlCommand cd = new SqlCommand(checkMail, cnn);
                    int x = Convert.ToInt32(cd.ExecuteScalar().ToString());
                    cnn.Close();

                    if (x == 1)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "INFO", "alert('Bu Mail ile kayıt olunmuştur!');", true);
                        Label4.Text = "Bu Mail ile kayıt olunmuştur!";
                    }
                    else
                    {
                        UsersData ud = new UsersData();
                        ud.UserName = txtNickname.Text;
                        ud.Password = txtSifre.Text;
                        ud.Email = txtMail.Text;

                        db.UsersDatas.InsertOnSubmit(ud);
                        db.SubmitChanges();

                        Response.Redirect("~/Default.aspx");

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "INFO", "alert('Kayıt Başarılı Girişi Yapabilirsiniz..');", true);
                    }
                }
                else if (k != 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "INFO", "alert('Bu kullanıcı adı database'de mevcuttur!');", true);
                    Label4.Text = "Bu kullanıcı adı database'de mevcuttur!";
                }
            }
            catch (Exception)
            {
                return;
            }
        }
    }
}