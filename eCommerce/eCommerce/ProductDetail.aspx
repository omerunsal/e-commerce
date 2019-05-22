<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="eCommerce.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width:100%">

        <div class="row">	  
			<div id="gallery" class="span3">
            <a href='<%=SelectedProduct.LargePhotoPath %>' title="">
				<img src='<%= SelectedProduct.LargePhotoPath %>' style="width:100%" />
            </a>
			<div id="differentview" class="moreOptopm carousel slide">
                <div class="carousel-inner">
                  <div class="item active">
                   <%--<a href="themes/images/products/large/f1.jpg"> <img style="width:29%" src="themes/images/products/large/f1.jpg" alt=""/></a>--%>
                   
                  </div>
                  <div class="item">
                   <%--<a href="themes/images/products/large/f3.jpg" > <img style="width:29%" src="themes/images/products/large/f3.jpg" alt=""/></a>
                   <a href="themes/images/products/large/f1.jpg"> <img style="width:29%" src="themes/images/products/large/f1.jpg" alt=""/></a>
                   <a href="themes/images/products/large/f2.jpg"> <img style="width:29%" src="themes/images/products/large/f2.jpg" alt=""/></a>--%>
                  </div>
                </div>
              <!--  
			  <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
              <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> 
			  -->
              </div>
			  
			 <div class="btn-toolbar">
			  <div class="btn-group">
				<%--<span class="btn"><i class="icon-envelope"></i></span>
				<span class="btn" ><i class="icon-print"></i></span>
				<span class="btn" ><i class="icon-zoom-in"></i></span>--%>

				<%--<span class="btn" ><i class="icon-star"></i></span>--%>


				<%--<span class="btn" ><i class=" icon-thumbs-up"></i></span>
				<span class="btn" ><i class="icon-thumbs-down"></i></span>--%>
			  </div>
			</div>
			</div>
			<div class="span6">
				<h3> <%= SelectedProduct.ProductName %></h3>
				<small></small>
				<hr class="soft"/>
				<form class="form-horizontal qtyFrm">
				  <div class="control-group">
					<label class="control-label"><span><%=string.Format("{0:C}",(Convert.ToDouble(SelectedProduct.UnitPrice))) %></span></label>
					<div class="controls">
					<%--<input type="number" class="span1" placeholder="Qty."/>--%>
					  <%--<button type="submit" class="btn btn-large btn-primary pull-right"> Sepete Ekle <i class=" icon-shopping-cart"></i></button>--%>

                        <asp:Button ID="btnSepet" class="btn btn-large btn-primary" CommandName="addToCart" CommandArgument='<%# Eval("ProductID") %>' runat="server" Text="Sepete Ekle" OnClick="btnSepet_Click"  />
                       
                      <%--  <asp:LinkButton ID="lbtnSepet" runat="server" CommandName="addToCart" CommandArgument='<%# Eval("ProductID") %>'><a class="btn" href="#">Sepete Ekle<i class="icon-shopping-cart"></i></a></asp:LinkButton>--%>

                        <asp:Button type="submit" class="btn btn-large btn-primary" ID="btnKarsilastir" runat="server" Text="Urun Karsilastir" OnClick="btnKarsilastir_Click" />
					</div>
				  </div>
				</form>
				
				<hr class="soft"/>
				<h4>Stok Durumu: <span class="blue"><%= stokDurumu %></span> </h4>
				<form class="form-horizontal qtyFrm pull-right">
				  
				</form>
				<hr class="soft clr"/>
				<p>
				<%=SelectedProduct.Description %>
				</p>
				
				<br class="clr"/>
			<a href="#" name="detail"></a>
			<hr class="soft"/>
			</div>
			
			<div class="span9">
            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
              <li><a href="#profile" data-toggle="tab">Related Products</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade active in" id="home">
			  <h4>Ürün Bilgileri</h4>
                <table class="table table-bordered">
				<tbody>
				<tr class="techSpecRow"><th colspan="2">Ürün Detayları</th></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Brand: </td><td class="techSpecTD2"><%=SelectedProduct.Brand.BrandName %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Garanti: </td><td class="techSpecTD2">24 AY</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Kargo: </td><td class="techSpecTD2"><%=kargoDurumu %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Kategori : </td><td class="techSpecTD2"><%=SelectedProduct.Category.CategoryName %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1"></td><td class="techSpecTD2"></td></tr>
				</tbody>
				</table>
				
				
		</div>
          </div>

	</div>
        <asp:HiddenField ID="hfProductID" runat="server" />
    </div>

</asp:Content>
