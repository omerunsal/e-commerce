<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="eCommerce.Admin.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnProInsert" />
        </Triggers>
        <ContentTemplate>
            
            <div style="width:100%; float:none; margin:0px;">
                <asp:LinkButton ID="lbtnProInsertView" runat="server" OnClick="lbtnProInsertView_Click">Ürün Ekle</asp:LinkButton> &nbsp; |
                <asp:LinkButton ID="lbtnProUpdateView" runat="server" OnClick="lbtnProUpdateView_Click">Ürün Güncelle</asp:LinkButton> &nbsp; |
                <asp:LinkButton ID="lbtnProDeleteView" runat="server" OnClick="lbtnProDeleteView_Click">Ürün Sil</asp:LinkButton> &nbsp; 

                <br />

                <asp:MultiView ID="MultiView1" runat="server">

                    <asp:View ID="View1" runat="server">
                        <table style="width:600px; float:left; text-align:left; vertical-align:top;">
                            <tr>
                                <td style="width:150px;">
                                    Kategori Adi:
                                </td>

                                <td style="width:250px;">
                                    <asp:DropDownList ID="dlstCategories" runat="server" Width="250px" DataSourceID="Etic" DataTextField="CategoryName" DataValueField="CategoryID" OnSelectedIndexChanged="dlstCategories_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:HiddenField ID="hfCategoryID" runat="server" Value='<%# Eval("CategoryID") %>' />
                                    <asp:SqlDataSource ID="Etic" runat="server" ConnectionString="<%$ ConnectionStrings:ETicaretDBConnectionString %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
                                    
                                </td>

                            </tr>
                            <tr>
                                  <td style="width:150px;">
                                    Marka Adi:
                                </td>

                                <td style="width:250px;">
                                    <asp:DropDownList ID="dlstBrands" runat="server" Width="250px" DataSourceID="SqlDataSource1" DataTextField="BrandName" DataValueField="BrandID"  AutoPostBack="True"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ETicaretDBConnectionString %>" SelectCommand="SELECT * FROM [Brands]"></asp:SqlDataSource>
                                    <asp:HiddenField ID="hfBrandID" runat="server" Value='<%# Eval("BrandID") %>' />
                                   
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px;">
                                    Ürün Adi:
                                </td>

                                <td style="width:250px;">

                                
                                    <asp:TextBox ID="txtProductName" runat="server" Width="250px" ValidationGroup="ProInsert"></asp:TextBox>

                                </td>

                                <td style="width:200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Boş geçilemez!" ControlToValidate="txtProductName" ForeColor="Red" ValidationGroup="ProInsert">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px;">
                                    Ürün Fiyati:
                                </td>

                                <td style="width:250px;">

                                
                                    <asp:TextBox ID="txtUnitPrice" runat="server" Width="250px" ValidationGroup="ProInsert" TextMode="Number"></asp:TextBox>

                                </td>


                                <td style="width:200px;">
                                  <asp:Button ID="btnProInsert" runat="server" Text="Ürün Ekle" Width="200px" ValidationGroup="ProInsert" OnClick="btnProInsert_Click" />  
                                </td>
                            </tr>
                            
                              <tr>
                                <td style="width:150px;">
                                    Küçük Fotoğraf Seçiniz:
                                </td>

                                <td style="width:250px;">

                                    <asp:FileUpload ID="SmallPhotoPath" runat="server" />
                                  </td>
                                  

                            </tr>

                            <tr>
                                <td style="width:150px;">
                                    Büyük Fotoğraf Seçiniz:
                                </td>

                                <td style="width:250px;">

                                    <asp:FileUpload ID="LargePhotoPath" runat="server" />
                                    </td>

                            </tr>

                            <tr>
                                <td style="width:150px;">
                                    
                                    
                                </td>

                                <td style="width:250px;">

                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ValidationGroup="ProInsert" Font-Italic="True" ForeColor="Red" />

                                </td>

                                <td style="width:200px;">
                                  <asp:Button ID="btnProUpdate" runat="server" Text="Ürün Güncelle" Width="200px"  ValidationGroup="ProInsert" OnClick="btnProUpdate_Click"  />  
                                </td>
                            </tr>
                        </table>
                    </asp:View>

                    <asp:View ID="View2" runat="server">

                        
                        <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                            <ItemTemplate>
                                <div style="border-bottom:2px solid;">
                                    <asp:CheckBox ID="chkSil" runat="server" /> &nbsp; | &nbsp;<asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                    <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                    <span>
                                        <asp:LinkButton ID="lbtnGuncelle" runat="server">Güncelle</asp:LinkButton>
                                    </span>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <br />
                        <asp:Button ID="btnSecilenleriSil" runat="server" Text="Seçilenleri Sil" Width="185px" OnClick="btnSecilenleriSil_Click" />
                        
                    </asp:View>
                    <br />
                </asp:MultiView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
