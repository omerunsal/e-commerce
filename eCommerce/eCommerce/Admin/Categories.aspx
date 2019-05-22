<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="eCommerce.Admin.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width:100%; float:none; margin:0px;">
                <asp:LinkButton ID="lbtnCateInsertView" runat="server" OnClick="lbtnCateInsertView_Click">Kategori Ekle</asp:LinkButton> &nbsp; |
                <asp:LinkButton ID="lbtnCateUpdate" runat="server" OnClick="lbtnCateUpdate_Click1">Kategori Güncelle</asp:LinkButton> &nbsp; |
                <asp:LinkButton ID="lbtnCateDelete" runat="server" OnClick="lbtnCateDelete_Click">Kategori Sil</asp:LinkButton> &nbsp; 

                <br />

                <asp:MultiView ID="MultiView1" runat="server">

                    <asp:View ID="View1" runat="server">
                        <table style="width:600px; float:left; text-align:left; vertical-align:top;">
                            <tr>
                                <td style="width:150px;">
                                    Kategori Adi:
                                </td>

                                <td style="width:250px;">
                                    <asp:TextBox ID="txtCategoryName" runat="server" Width="250px"></asp:TextBox>
                                </td>

                                <td style="width:200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Boş geçilemez!" ControlToValidate="txtCategoryName" ForeColor="Red" ValidationGroup="CateInsert">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td style="width:150px;">
                                    
                                </td>

                                <td style="width:250px;">

                                    <asp:Button ID="btnCateInsert" runat="server" Text="Kategori Ekle" Width="120px" ValidationGroup="CateInsert" OnClick="btnCateInsert_Click" />

                                    <asp:Button ID="btnCateUpdate" runat="server" Text="Kategori Güncelle" Width="120px" ValidationGroup="CateInsert" OnClick="btnCateUpdate_Click"  />

                                </td>

                                <td style="width:200px;">
                                    
                                </td>
                            </tr>

                            <tr>
                                <td style="width:150px;">
                                    
                                </td>

                                <td style="width:250px;">

                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ValidationGroup="CateInsert" Font-Italic="True" ForeColor="Red" />

                                </td>

                                <td style="width:200px;">
                                    
                                </td>
                            </tr>
                        </table>
                    </asp:View>

                    <asp:View ID="View2" runat="server">
                        <asp:Repeater ID="rptCategories" runat="server" OnItemCommand="rptCategories_ItemCommand">
                            <ItemTemplate>
                                <div style="border-bottom:2px solid;">
                                    <asp:CheckBox ID="chkSil" runat="server" /> &nbsp; | &nbsp;<asp:Label ID="lblCategoryName" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                    <asp:HiddenField ID="hfCategoryID" runat="server" Value='<%# Eval("CategoryID") %>' />
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
