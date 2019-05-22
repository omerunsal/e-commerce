using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using WebLibrary;
namespace eCommerce
{
    public partial class Genel : System.Web.UI.MasterPage
    {
        OrmTicaretDataContextDataContext db = new OrmTicaretDataContextDataContext();
        public decimal? TotalPrice { get; set; }
        public int? Urun { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            sepetiDoldur();
            dolarDoldur();
        }

        private void dolarDoldur()
        {
            XmlDocument xmlVerisi = new XmlDocument();
            xmlVerisi.Load("http://www.tcmb.gov.tr/kurlar/today.xml");
            decimal dolar = Convert.ToDecimal(xmlVerisi.SelectSingleNode(string.Format("Tarih_Date/Currency[@Kod='{0}']/ForexSelling", "USD")).InnerText.Replace('.', '.'));
            decimal Euro = Convert.ToDecimal(xmlVerisi.SelectSingleNode(string.Format("Tarih_Date/Currency[@Kod='{0}']/ForexSelling", "EUR")).InnerText.Replace('.', '.'));
            lbDolar.Text = dolar.ToString();
            lbEuro.Text = Euro.ToString();
        }

        private void sepetiDoldur()
        {
            List<WebLibrary.Cart.CartProduct> listemiz = (List<WebLibrary.Cart.CartProduct>)Session["myCart"];

            if (listemiz != null)
            {
                int? urun = 0;
                urun = listemiz.Count();
                this.Urun = urun;
                //--------------------------------------------
                decimal? total = 0;

                foreach (var li in listemiz)
                {
                    total += (li.Quantity * li.UnitPrice);
                }
                this.TotalPrice = total;
            }
        }

        protected void lbtnKarsilastirma_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ComparedProducts.aspx");
        }

        
        protected void imgSearch_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Search.aspx?AranacakDeger=" + txtSearch.Text);
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            var sonuc = KontrolEt((Login)sender);
            if (sonuc.GirisYapmisMi)
            {
                e.Authenticated = true;
                if (sonuc.AdminMi) Response.Redirect("~/Admin");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "INFO", "alert('" + sonuc.Mesaj + "');", true);
                e.Authenticated = false;
            }
        }
        
        private GirisSonucu KontrolEt(Login logincontrol)
        {
            //TextBox myUserName = (TextBox)LoginView1.FindControl("UserName");
            //TextBox myPassword = (TextBox)LoginView1.FindControl("Password");

            bool GirisYapilmisMi = false;
            bool AdminMi = false;
            string mesaj = string.Empty;

            Login login1 = logincontrol;


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ETicaretDBConnectionString"].ConnectionString);
            conn.Open();
            string checkUser = "Select count(*) from UsersData where UserName='" + login1.UserName + "'";
            SqlCommand cmd = new SqlCommand(checkUser, conn);
            int k = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            conn.Close();

            if (k == 1)
            {
                conn.Open();
                string checkPasswordQuery = "Select Password From UsersData where UserName='" + login1.UserName + "'";
                SqlCommand passwordCmd = new SqlCommand(checkPasswordQuery, conn);
                string password = passwordCmd.ExecuteScalar().ToString();

                if (password == login1.Password)
                {
                    GirisYapilmisMi = true;

                    if (login1.UserName == "admin")
                        AdminMi = true;

                    mesaj = "Giriş başarılı";
                }
                else
                    mesaj = "Hatalı şifre!";
            }
            else
                mesaj = "Hatalı kullanıcı adı!";

            return new GirisSonucu()
            {
                GirisYapmisMi = GirisYapilmisMi,
                AdminMi = AdminMi,
                Mesaj = mesaj
            };
        }

        protected void btnKayitOl_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegister.aspx");
        }
    }
    //web config ve classs
    class GirisSonucu
    {
        public bool GirisYapmisMi { get; set; }
        public bool AdminMi { get; set; }
        public string Mesaj { get; set; }
    }
}
