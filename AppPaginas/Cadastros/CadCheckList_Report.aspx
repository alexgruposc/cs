<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadCheckList_Report.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCheckList_Report" %>

<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html, body {
            border: solid 0px black;
            height: 100%;
            width: 100%;
            margin: 0px 0px 0px 0px;
            padding: 0px 0px 0px 0px;
            overflow: auto;
        }

        .div1 {
            height: 100%;
            width: 100%;
        }

        .myCtrl {
            background-color: Red;
            height: 100%;
            width: 100%;
            overflow: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


        <div class="div1">
            <asp:Panel ID="Panel1" runat="server" Height="700px">
                <asp:Localize ID="lbl_mensagem" runat="server"></asp:Localize>
                <asp:Literal ID="ltrReport" runat="server"></asp:Literal>
            </asp:Panel>
        </div>


    </form>
</body>
</html>
