<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadClienteTipoPedido.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadClienteTipoPedido" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript" src="../../Scripts/KraftSalesScripts.js"></script>
    <link rel="shortcut icon" href="../../Imagens/Icone.ico" />
    <link href="../../Styles/Style.css" rel="Stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scmngr" runat="server" AllowCustomErrorsRedirect="true" AsyncPostBackTimeout="600"
                       ScriptMode="Debug" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    
    <%-- CONTROLE --%>
    <CtlAlert:ControlAlert ID="CtlAlert" runat="server" />

    <asp:Panel ID="pnlCadastroClienteDocumento" runat="server">
        <asp:UpdatePanel ID="uppCadastroClienteDocumento" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroClienteDocumento">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" DefaultButton="btnSalvar">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>
                        <div class="alert_bottom_button">
                            <ol>                                
                                <li>
                                    <asp:Label ID="lblDadosClienteId" runat="server" SkinID="LabelForm" />
                                    <asp:Label ID="lblDadosClienteIdTexto" runat="server" SkinID="LabelResposta" />
                                </li>
                                <li>
                                    <div style="margin-left: 150px;">
                                        <asp:Label ID="lblDadosItensHeader" runat="server" SkinID="LabelFormPedido" />
                                        <hr />
                                    </div>
                                </li>
                                <li>
                                    <div style="margin-left: 150px;">
                                        <asp:CheckBox ID="chkDadosClienteTipoPedido" runat="server" Font-Bold="true" TabIndex="1" Text="<%$ Resources:Resource, lblSelecionarTodos %>" />
                                    </div>
                                    <div style="margin-left: 147px;">
                                        <asp:CheckBoxList ID="chklstDadosClienteTipoPedido" runat="server" TabIndex="2" RepeatDirection="Vertical" RepeatColumns="5" />
                                    </div>
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="3" SkinID="ButtonLeft" onclick="btnSalvar_Click" />
                                <asp:Button ID="btnExcluir" runat="server" TabIndex="4" SkinID="ButtonRight" 
                                    onclick="btnExcluir_Click" />
                            </div>
                        </div>
                    </fieldset>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    </form>
</body>
</html>
