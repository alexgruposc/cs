<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlDataB.ascx.cs" Inherits="KRAFTSALES.AppControles.CtlDataB" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<script language="javascript" type="text/javascript" src="../../Scripts/KraftSalesScripts.js"></script>
<link href="../../Styles/Style.css" rel="Stylesheet" type="text/css" />

<asp:Panel ID="pnlCalendar" runat="server" Width="125px">
    <div style="display: table; width: 125px;">
        <div style="display: table-cell; width: 100px; height: 16px; text-align: center; vertical-align: middle;">
            <asp:TextBox ID="txtData" runat="server" MaxLength="10" SkinID="txtBootstrap3" 
                ontextchanged="txtData_TextChanged" />
        </div>
        <div style="display: table-cell; width: 25px; height: 16px; text-align: center; vertical-align: middle;">
            <asp:Image ID="imgCalendario" runat="server" Height="20px" Width="20px" ImageAlign="Top"
                       ImageUrl="~/Imagens/Calendar.png" />
            <ucc:CalendarExtender ID="cldCalendario" runat="server" 
                                  FirstDayOfWeek="Sunday" 
                                  PopupButtonID="imgCalendario"
                                  TargetControlID="txtData" 
                                  CssClass="Calendario" />
            <asp:RequiredFieldValidator ID="rfvDate" runat="server" 
                                        ControlToValidate="txtData"
                                        Display="None" 
                                        SetFocusOnError="false" 
                                        Text="*" 
                                        Enabled="false" />
        </div>
    </div>
</asp:Panel>
