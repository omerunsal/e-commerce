<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="eCommerce.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
	<hr class="soften">
	<h1>Bizi ziyaret edin</h1>
	<hr class="soften"/>	
	<div class="row">
		<div class="span4">
		<h4>İletişim Detayları</h4>
		<p>	ISTANBUL <br/> 34000, TR
			<br/><br/>
			info@unsal.com<br/>
			﻿Tel 123-456-6780<br/>
			Fax 123-456-5679<br/>
			
		</p>		
		</div>
			
		<div class="span4">
		<h4>Mesai Saatleri</h4>
			<h5> Pazartesi - Cuma</h5>
			<p>08:00 - 17:00<br/><br/></p>
			<h5>Saturday</h5>
			<p>08:00 - 17:00<br/><br/></p>
			<h5>Sunday</h5>
			<p>08:00 - 17:00<br/><br/></p>
		</div>
		<div class="span4">
		<h4>Bize mail gönder</h4>
		<form class="form-horizontal">
          <fieldset>
          <div class="control-group">
           
              <asp:TextBox ID="txtName"  placeholder="ad" class="input-xlarge" runat="server"></asp:TextBox>
           
          </div>
		   <div class="control-group">
           
               <asp:TextBox ID="txtSoyad"  placeholder="soyad" class="input-xlarge" runat="server"></asp:TextBox>
           
          </div>
		   <div class="control-group">
           
               <asp:TextBox ID="txtEmail" placeholder="email" class="input-xlarge" runat="server"></asp:TextBox>
          
          </div>
          <div class="control-group">
              
              <asp:TextBox ID="txtPhone" runat="server" placeholder="telefon" class="input-xlarge" TextMode="Phone"></asp:TextBox>
           
          </div>
            <div class="control-group">
              
              <asp:TextBox ID="txtCompany" placeholder="şirket" class="input-xlarge" runat="server"></asp:TextBox>
          </div>
            <div class="control-group">
              <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
          </div>
              <asp:Button ID="btnFormSend" class="btn btn-large" runat="server" Text="Gönder" OnClick="btnFormSend_Click" />
              <br />
              <asp:Label ID="Label1" style="color:red" runat="server" Text=""></asp:Label>
        </fieldset>
      </form>
		</div>
	</div>
</div>

</asp:Content>
