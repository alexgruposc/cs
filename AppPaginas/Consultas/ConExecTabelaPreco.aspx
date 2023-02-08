<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConExecTabelaPreco.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConExecTabelaPreco" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="left: 0.5%; height: 70%; width: 99%; position: fixed; ">
        <fieldset style="left: 0.5%; width: 99%;">
            <legend>
                <asp:Literal ID="lblJoTabelaPrecoHeader" runat="server" Text="<%$ Resources:Resource, lblJobTabelaPrecosHeader %>" />
            </legend>

            <div style="display: table; width: 100%; height: 90%;">
                <div style="display: table; width: 100%; height: 20%;">
                    <div style="display: table-cell; width: 10%; height: 100%; text-align: center; vertical-align: middle;">
                        <asp:Button ID="btnExecutar" runat="server" 
                                    Visible="false"
                                    Text="<%$ Resources:Resource, lblExecutarNovamente %>" 
                                    onclick="btnExecutar_Click" />
                    </div>
                    <div style="display: table-cell; width: 90%; height: 100%; text-align: left; vertical-align: middle;"></div>
                </div>
                <div style="display: table; width: 100%; height: 30%;">
                    <div style="display: table-cell; width: 10%; vertical-align: middle; text-align: center;">
                        <asp:Image ID="imgIconeOperacao" runat="server" ImageAlign="AbsMiddle" Height="60px" Width="60px" />
                    </div>
                    <div style="display: table-cell; width: 90%; vertical-align: middle;">
                        <asp:Label ID="lblMensagem" runat="server" />
                    </div>
                </div>
                <div style="display: table; width: 100%; height: 50%;"></div>                
            </div>

        </fieldset>
    </div>
</asp:Content>
