<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="eCommerce.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="width:100%">

        <asp:DataList ID="DataList2" runat="server" DataKeyField="ProductID" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnItemCreated="DataList1_ItemCreated">
            <ItemTemplate>
                <li class="span3">
			  <div class="thumbnail">
				<a href='<%# "ProductDetail.aspx?ProductId=" + Eval("ProductID") %>'><img src='<%# ResolveClientUrl(Eval("SmallPhotoPath").ToString())%>' alt=""/></a>
				<div class="caption">
				  <h5><%# Eval("ProductName") %></h5>
				  
				   <h4 style="text-align:center"><a class="btn" href='<%# "ProductDetail.aspx?ProductId=" + Eval("ProductID") %>'> <i class="icon-zoom-in"></i></a> <asp:Button ID="btnSepet" class="btn" CommandName="addToCart" CommandArgument='<%# Eval("ProductID") %>' runat="server" Text="Sepete Ekle" />  <a class="btn btn-primary" href="#"> <%# string.Format("{0:C}", Eval("UnitPrice")) %></a></h4>
				</div>
			  </div>
			</li>
            </ItemTemplate>
        </asp:DataList>

        

        <asp:SqlDataSource ID="eCommerce" runat="server" ConnectionString="<%$ ConnectionStrings:ETicaretDBConnectionString2 %>" SelectCommand="SELECT Top 9 * FROM [Products] ORDER BY [CategoryID] DESC"></asp:SqlDataSource>


    </div>

</asp:Content>

<%--<h4 style="text-align:center"><a class="btn" href='<%# "ProductDetail.aspx?ProductId=" + Eval("ProductID") %>'> <i class="icon-zoom-in"></i></a> <a class="btn"  href="#">Sepete Ekle <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#"> <%# string.Format("{0:C}", Eval("UnitPrice")) %></a></h4>--%>