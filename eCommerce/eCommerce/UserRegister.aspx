<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="eCommerce.UserRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Registration</li>
    </ul>
	<h3> Registration</h3>	
	<div class="well">
	<!--
	<div class="alert alert-info fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	<div class="alert fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	 <div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply</strong> dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div> -->
	<form class="form-horizontal" >
		<h4>Kişisel Bilgiler</h4>
		
		<div class="control-group">
			<label class="control-label" for="inputFname1">Ad Soyad: <sup>*</sup></label>
			<div class="controls">
			  <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqKullaniciAdi" runat="server" ControlToValidate="txtUserName" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator>
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" for="inputLnam">Kullanici Adi: <sup>*</sup></label>
			<div class="controls">
			  <asp:TextBox ID="txtNickname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqSoyad" runat="server" ControlToValidate="txtNickname" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator>
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="input_email">Email <sup>*</sup></label>
		<div class="controls">
		 <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator>
		</div>
	  </div>	  
	<div class="control-group">
		<label class="control-label" for="inputPassword1">Password <sup>*</sup></label>
		<div class="controls">
		  <asp:TextBox ID="txtSifre" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSifre" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator>
		</div>
	  </div>	  
		

	<div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label></div>	

		<h4>Adres Bilgileri</h4>
		
		<div class="control-group">
			<label class="control-label" for="address">Adres<sup>*</sup></label>
			<div class="controls">
			  <asp:TextBox ID="txtAdres" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAdres" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="city">Şehir<sup>*</sup></label>
			<div class="controls">
			  <asp:TextBox ID="txtCity" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCity" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator> 
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="state">İlçe<sup>*</sup></label>
			<div class="controls">
			  <asp:TextBox ID="txtIlce" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtIlce" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator>  </div>
		</div>		
		<div class="control-group">
			<label class="control-label" for="postcode">Posta Kodu<sup>*</sup></label>
			<div class="controls">
			  <asp:TextBox ID="txtPostaKodu" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPostaKodu" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator> 
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="country">Ülke<sup>*</sup></label>
			<div class="controls">
			<asp:TextBox ID="txtUlke" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtUlke" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator> </div>
		</div>	
		<div class="control-group">
			<label class="control-label" for="aditionalInfo">Ek bilgiler: </label>
			<div class="controls">
			 <asp:TextBox ID="txtEk" runat="server" TextMode="MultiLine"></asp:TextBox>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="phone">Ev Telefonu: <sup>*</sup></label>
			<div class="controls">
			  <asp:TextBox ID="txtEvno" runat="server" TextMode="Phone"></asp:TextBox>
         
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="mobile">Cep Telefonu: </label>
			<div class="controls">
			  <asp:TextBox ID="txtCepNo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCepNo" ErrorMessage="Bos gecilemez" ForeColor="Red"></asp:RequiredFieldValidator>
			</div>
		</div>
		
	<p><sup>*</sup>Required field	</p>
	
	<div class="control-group">
			<div class="controls">
                <asp:Button ID="btnKayitOl" runat="server" class="btn btn-large btn-success" Text="Kayit Ol" OnClick="btnKayitOl_Click" />
			</div>
		</div>		
	</form>
</div>

</div>
</strong>
</asp:Content>
