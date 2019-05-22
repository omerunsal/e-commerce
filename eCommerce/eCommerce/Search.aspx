<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="eCommerce.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        
        <tr>
            <td>
                

            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <li class="span3">
                        <div class="thumbnail">
                            <a href='<%# "ProductDetail.aspx?ProductId=" + Eval("ProductID") %>'>
                                <%# Eval("ProductName") %>
                                <a href='<%# "ProductDetail.aspx?ProductId=" + Eval("ProductID") %>'>
                                    <asp:Image ID="imgSmallPhoto" runat="server" Height="100px" Width="100px" ImageUrl='<%# ResolveClientUrl(Eval("LargePhotoPath").ToString())%>' /></a>
                                <div class="caption">
                                    <h5>
                                        <a href='<%# "ProductDetail.aspx?ProductId=" + Eval("ProductID") %>'>
                                            <%# Eval("ProductName") %>
                                        </a>
                                    </h5>
                                    <p>
                                    </p>

                                       <h4 style="text-align: center"><a><asp:Button ID="btnSepet" class="btn" CommandName="addToCart" CommandArgument='<%# Eval("ProductID") %>' runat="server" Text="Sepete Ekle" /> </a>
                                           <a><asp:LinkButton ID="lbtnDetay" runat="server" class="prod_details" CommandName="details" CommandArgument='<%# Eval("ProductID") %>'><a class="btn" href='<%# "ProductDetail.aspx?ProductId=" + Eval("ProductID") %>'><i class="icon-zoom-in"></i></a></asp:LinkButton></a>
                                           <br />
                                           <a class="btn btn-primary" ><%# string.Format("{0:C}", Eval("UnitPrice")) %> </a>

                                       </h4>

                                </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:DataList>

        
            </td>
        </tr>
    </table>

</asp:Content>
