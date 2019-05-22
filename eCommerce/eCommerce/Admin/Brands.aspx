<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Brands.aspx.cs" Inherits="eCommerce.Admin.Brands" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
     <ContentTemplate>
            <div style="width:100%; float:none; margin:0px;">
                <asp:LinkButton ID="lbtnBrandInsertView" runat="server" OnClick="lbtnBrandInsertView_Click">Marka Ekle</asp:LinkButton> &nbsp; |
                <asp:LinkButton ID="lbtnBrandUpdate" runat="server" OnClick="lbtnBrandUpdate_Click">Marka Güncelle</asp:LinkButton> &nbsp; |
                <asp:LinkButton ID="lbtnBrandDelete" runat="server" OnClick="lbtnBrandDelete_Click">Marka Sil</asp:LinkButton> &nbsp; 

                <br />

                <asp:MultiView ID="MultiView1" runat="server">

                    <asp:View ID="View1" runat="server">
                        <table style="width:600px; float:left; text-align:left; vertical-align:top;">
                            <tr>
                                <td style="width:150px;">
                                    Marka Adi:
                                </td>

                                <td style="width:250px;">
                                    <asp:TextBox ID="txtBrandName" runat="server" Width="250px"></asp:TextBox>
                                </td>

                                <td style="width:200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Boş geçilemez!" ControlToValidate="txtBrandName" ForeColor="Red" ValidationGroup="BrandInsert">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td style="width:150px;">
                                    
                                </td>

                                <td style="width:250px;">

                                    <asp:Button ID="btnBrandInsert" runat="server" Text="Marka Ekle" Width="120px" ValidationGroup="BrandInsert" OnClick="btnBrandInsert_Click" />

                                    <asp:Button ID="btnBrandUpdate" runat="server" Text="Marka Güncelle" Width="120px" ValidationGroup="BrandInsert" OnClick="btnBrandUpdate_Click"  />

                                </td>

                                <td style="width:200px;">
                                    
                                </td>
                            </tr>

                            <tr>
                                <td style="width:150px;">
                                    
                                </td>

                                <td style="width:250px;">

                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ValidationGroup="BrandInsert" Font-Italic="True" ForeColor="Red" />

                                </td>

                                <td style="width:200px;">
                                    
                                </td>
                            </tr>
                        </table>
                    </asp:View>

                    <asp:View ID="View2" runat="server">
                        <asp:Repeater ID="rptBrands" runat="server" OnItemCommand="rptBrands_ItemCommand">
                            <ItemTemplate>
                                <div style="border-bottom:2px solid;">
                                    <asp:CheckBox ID="chkSil" runat="server" /> &nbsp; | &nbsp;<asp:Label ID="lblBrandName" runat="server" Text='<%# Eval("BrandName") %>'></asp:Label>
                                    <asp:HiddenField ID="hfBrandID" runat="server" Value='<%# Eval("BrandID") %>' />
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

</asp:Content>
