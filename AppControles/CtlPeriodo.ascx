<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlPeriodo.ascx.cs" Inherits="KRAFTSALES.AppControles.CtlPeriodo" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<script language="javascript" type="text/javascript" src="../../Scripts/KraftSalesScripts.js"></script>
<link href="../../Styles/Style.css" rel="Stylesheet" type="text/css" />

<asp:Panel ID="pnlPeriodo" runat="server" Width="360px">
    <div style="display: table;">
        <div runat="server" id="dvHeaderLine" style="display: table; width: 360px; height: 16px; text-align: left; vertical-align: middle;">
            <asp:Label ID="lblPeriodoHeader" runat="server" />
            <hr runat="server" id="hrLine" />
        </div>
        <div style="display: table; width: 360px;">
            <div style="display: table-cell; width: 70px; height: 16px; vertical-align: middle;">
                <asp:Label ID="lblInicio" runat="server" Text="<%$ Resources:Resource, lblPeriodoDe %>" />
            </div>
            <div style="display: table-cell; width: 100px; height: 16px; text-align: center; vertical-align: middle;">
                <asp:TextBox ID="txtInicio" runat="server" SkinID="Data" MaxLength="10" />
            </div>
            <div style="display: table-cell; width: 25px; height: 16px; text-align: center; vertical-align: middle;">
                <asp:Image ID="imgInicio" runat="server" Height="20px" Width="20px" ImageAlign="Top"
                    ImageUrl="~/Imagens/Calendar.png" />
                <ucc:CalendarExtender ID="cldInicio" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgInicio"
                    TargetControlID="txtInicio" CssClass="Calendario" />
            </div>
            <div style="display: table-cell; width: 40px; height: 16px; vertical-align: middle;">
                <asp:Label ID="lblFim" runat="server" Text="<%$ Resources:Resource, lblPeriodoAte %>" />
            </div>
            <div style="display: table-cell; width: 100px; height: 16px; text-align: center; vertical-align: middle;">
                <asp:TextBox ID="txtFim" runat="server" SkinID="Data" MaxLength="10" />
            </div>
            <div style="display: table-cell; width: 25px; height: 16px; text-align: center; vertical-align: middle;">
                <asp:Image ID="imgFim" runat="server" Height="20px" Width="20px" ImageAlign="Top"
                    ImageUrl="~/Imagens/Calendar.png" />
                <ucc:CalendarExtender ID="cldFim" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgFim"
                    TargetControlID="txtFim" CssClass="Calendario" />
            </div>            
        </div>
    </div>
</asp:Panel>
