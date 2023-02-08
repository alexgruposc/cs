<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="KRAFTSALES.AppPaginaErro.ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/Style.css" rel="Stylesheet" type="text/css" />
</head>
<body style="background: transparent url('../ImagemCliente/oncoprod.png') no-repeat center;">
    <form id="form1" runat="server">
    <div class="alert" style="width: 50%; height: 70%; left: 25%; top: 15%;">
        <div class="alert_header">
            <div class="alert_header_message">
                <asp:Label ID="lblErrorHeader" runat="server" ForeColor="White" />
            </div>
        </div>
        <div style="width: 100%; height: 20%; margin-bottom: 0px; margin-top: 1px; display: table; ">
            <div style="left: 1.5%; width: 96.8%; height: 90%; background-color: #FFFFFF; display: table; position: relative; 
                        padding-bottom: 0px; margin-bottom: 0px; text-align: center;">
                <asp:Image ID="imgBody" runat="server" Width="200px" Height="100px" ImageUrl="~/ImagemCliente/oncoprod.png" />
            </div>
            <div id="dvDefaultMessage" style="left: 1.5%; width: 96.8%; height: 10%; background-color: #FFFFFF; display: table; position: relative; 
                        padding-bottom: 0px; margin-bottom: 0px; text-align: center;">
                <asp:Label ID="lblDefaultMessage" runat="server" />
            </div>
        </div>
        <div class="alert_body_Error" style="height: 62%; ">
            <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                <div style="width: 30%; height: 100%; display: table-cell; vertical-align: middle;">
                    <asp:Image ID="imgLeft" runat="server" Height="160px" Width="160px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/operador.jpg" />
                </div>
                <div style="width: 50%; height: 100%; display: table-cell; vertical-align: middle;">
                    <asp:Label ID="lblErrorBody" runat="server" ForeColor="Black" />
                </div>
                <div id="dvImg" runat="server" style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                    <asp:Image ID="imgAlert" runat="server" Height="160px" Width="160px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/_error.png" />
                </div>
            </div>
        </div>
        <div class="alert_bottom">
            <div class="alert_bottom_button">
                <asp:Button ID="btnErrorOk" runat="server" onclick="btnErrorOk_Click" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
