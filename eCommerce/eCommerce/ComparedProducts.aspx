<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="ComparedProducts.aspx.cs" Inherits="eCommerce.ComparedProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div style="width: 100%">

        <asp:GridView ID="gwrUrunKarsilastirma" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" BorderWidth="1px" Height="50px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

            <Columns>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkRemove" runat="server" Text="Sil" AutoPostBack="true" />
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ProductName">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfProductId" runat="server" Value='<%# Eval("ProductID") %>' />
                        <div style="padding: 20px">
                            <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="UnitPrice">
                    <ItemTemplate>
                        <%--<asp:HiddenField ID="hfProductId" runat="server" Value='<%# Eval("ProductID") %>'/>--%>

                        <div style=" padding:20px">
                            <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Photo">
                    <ItemTemplate>
                        <div style="padding: 20px">
                            <asp:Image ID="imgPhoto" runat="server" Width="100px" Height="100px" ImageUrl='<%# ResolveClientUrl(Eval("SmallPhotoPath").ToString()) %>' />
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>

    <div>
        <asp:LinkButton ID="lbtnSecilenleriKaldir" runat="server" class="compare" Width="100px" OnClick="lbtnSecilenleriKaldir_Click" >Secilenleri Kaldir</asp:LinkButton>
    </div>


</asp:Content>
