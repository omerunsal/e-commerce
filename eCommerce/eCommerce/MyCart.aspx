<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="eCommerce.MyCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active"> SHOPPING CART</li>
    </ul>
	<h3>  SEPET [ <small></small>]<a href="Default.aspx" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Alışverişe devam et... </a></h3>	
	<hr class="soft"/>
		
    <table class="table table-bordered">
              <thead>
                <tr>
                  <th>Ürün Adı</th>
                  <th>Açıklama</th>
                  <th>Adet</th>
				  <th>Fiyat</th>
                  <th>İndirim</th>
                  <th>Tax</th>
                  <th>Toplam</th>
				</tr>
              </thead>
              <tbody>
                  <asp:Repeater ID="rpyMycart" runat="server">
                      <ItemTemplate>
                          
                           <tr>
                                <td style="text-align:center; vertical-align:middle; width:75px;">
                       <asp:CheckBox ID="chkSeciniz" runat="server" />
                       <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                   </td>
                  <td> <img width="60" src=<%# Eval("SmallPhotoPath") %> alt=""/></td>
                  <td> <%# Eval("ProductName") %><br/><a><%# Eval("Description") %></a></td>
				  <td>
					<div class="input-append"><input class="span1" style="max-width:34px" placeholder="1" id="appendedInputButtons" size="16" type="text"><button class="btn" type="button"><i class="icon-minus"></i></button><button class="btn" type="button"><i class="icon-plus"></i></button><button class="btn btn-danger" type="button"><i class="icon-remove icon-white"></i></button></div>
				  </td>
                  <td></td>
                  <td><%# string.Format("{0:C}",((Convert.ToDouble(Eval("UnitPrice"))*0.18d))) %></td>
                  <td><%# Eval("UnitPrice") %></td>
                  
                </tr>
				
                      </ItemTemplate>
                      
                      <FooterTemplate>
                           <tr>
                  <td colspan="6" style="text-align:right">Toplam Bedel:	</td>
                  <td><%= TotalPrice.ToString() %></td>
                </tr>
				 <tr>
                  <td colspan="6" style="text-align:right">Toplam İndirim:	</td>
                  <td> 0 </td>
                </tr>
                 <tr>
                  <td colspan="6" style="text-align:right">Toplam Vergi:	</td>
                  <td><%= Convert.ToInt32(TotalPrice)*0.18 %>   </td>
                </tr>
                           <tr>
                  <td colspan="6" style="text-align:right"><strong>Toplam</strong></td>
                  <td class="label label-important" style="display:block"> <strong> <div> <%= TotalPrice.ToString() %> </div> </strong></td>
                </tr>
                      </FooterTemplate>
                  </asp:Repeater>
                  <asp:Button ID="Button1" runat="server" Text="Seçilenleri sil" OnClick="Button1_Click" />
				</tbody>
            </table>
        </div>
    <a href="#" class="btn btn-large pull-right">Ödeme Yap <i class="icon-arrow-right"></i></a>
</asp:Content>
