<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadCondicaoPagamentoParcela.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCondicaoPagamentoParcela" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>
<%-- ******** --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script language="javascript" type="text/javascript" src="../../Scripts/KraftSalesScripts.js" ></script>
    <link rel="shortcut icon" href="../../Imagens/Icone.ico" />
    <link href="../../Styles/Style.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scmngr" runat="server" AllowCustomErrorsRedirect="true" AsyncPostBackTimeout="600"
        ScriptMode="Debug" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    
    <%-- CONTROLE --%>
    <CtlAlert:ControlAlert ID="CtlAlert" runat="server" />

    <asp:Panel ID="pnlCadastroCondicaoPagamentoParcela" runat="server">
        <asp:UpdatePanel ID="uppCadastroCondicaoPagamentoParcela" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroCondicaoPagamentoParcela">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" DefaultButton="btnSalvar" Visible="false">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>
                        <div class="alert_bottom_button">
                            <ol>                                
                                <li>
                                    <asp:Label ID="lblDadosCondicaoPagamentoParcelaId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosCondicaoPagamentoParcelaId" runat="server" MaxLength="10" TabIndex="2" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosCondicaoPagamentoParcelaDias" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosCondicaoPagamentoParcelaDias" runat="server" MaxLength="4" TabIndex="3" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosCondicaoPagamentoParcelaPercentual" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosCondicaoPagamentoParcelaPercentual" runat="server" MaxLength="14" TabIndex="4" />
                                </li>                                
                                <li>
                                    <asp:Label ID="lblDadosCondicaoPagamentoId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosCondicaoPagamentoId" runat="server" TabIndex="1" Enabled="false"/>
                                </li>

                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="5" SkinID="ButtonLeft" 
                                    ValidationGroup="Validacao" onclick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="6" SkinID="ButtonCenter" 
                                    onclick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="7" SkinID="ButtonRight" 
                                    onclick="btnLimpar_Click" />
                            </div>
                        </div>
                    </fieldset>
                </asp:Panel>

                <%-- CONFIRMAR DADOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upDadosConfirmar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlDadosConfirmar" runat="server" DefaultButton="btnConfirmarYes"
                                Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblDadosConfirmarHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrDadosConfirmarHeader" runat="server" />
                                            </legend>
                                            <ol>
                                                <li>
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoDias" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoDiasTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoPercentual" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoPercentualTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>

                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" 
                                                    TabIndex="8" onclick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" 
                                                    TabIndex="9" onclick="btnConfirmarNo_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        <div class="navegacao"> 
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosCondicaoPagamentoParcela" runat="server" />
                                <asp:TextBox ID="txtFiltrosCondicaoPagamentoParcela" runat="server" SkinID="Filtro" MaxLength="10" TabIndex="10" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosCondicaoPagamentoParcelaDias" runat="server" />
                                <asp:TextBox ID="txtFiltrosCondicaoPagamentoParcelaDias" runat="server" SkinID="Filtro" MaxLength="4" TabIndex="11" />
                            </div>
                            <div class="boxPesquisa" >
                                <asp:Label ID="lblFiltrosCondicaPagamentoId" runat="server" Visible="false"/>
                                <asp:DropDownList ID="ddlFiltrosCondicaPagamentoId" runat="server" SkinID="DropFiltro" TabIndex="12" Visible="false"/>
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" 
                                        TabIndex="13" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" 
                                        TabIndex="14" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" 
                                        TabIndex="15" onclick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" 
                                        TabIndex="16" onclick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="19"                                 
                                DataKeyNames="condicaoPagamentoId,condicaoPagamentoParcela,condicaoPagamentoDias,condicaoPagamentoPercentual,condicaoPagamentoDescricao" 
                                onpageindexchanging="gvRegistros_PageIndexChanging" 
                                onrowcommand="gvRegistros_RowCommand" onrowdatabound="gvRegistros_RowDataBound" 
                                onrowdeleting="gvRegistros_RowDeleting" onrowupdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrCondicaoPagamentoId" runat="server" Text='<%# FormataStringSaida(Eval("condicaoPagamentoDescricao"), ddlFiltrosCondicaPagamentoId.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="condicaoPagamentoParcela" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrCondicaoPagamentoDias" runat="server" Text='<%# FormataStringSaida(Eval("condicaoPagamentoDias"), txtFiltrosCondicaoPagamentoParcelaDias.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="condicaoPagamentoPercentual" DataFormatString="{0:#,###,##0.00}" ItemStyle-HorizontalAlign="Right" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAlterar" runat="server" CommandName="Update"
                                                        Text="<%$ Resources:Resource, lblEditar %>"
                                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </asp:Panel>

                <%-- CONFIRMAR EXCLUSÃO --%>
                <div style="position: absolute;">
                    <asp:Panel ID="pnlConfirmarExclusao" runat="server" Visible="false">
                        <div class="OpacityBackGround"></div>
                        <div class="alert">
                            <div class="alert_header">
                                <div class="alert_header_message">
                                    <asp:Label ID="lblConfirmarExclusaoHeader" runat="server" ForeColor="White" />
                                </div>
                            </div>
                            <div class="alert_body">
                                <asp:Label ID="lblConfirmarExclusaoBody" runat="server" ForeColor="Black" />
                            </div>
                            <div class="alert_bottom">
                                <div class="alert_bottom_button">
                                    <div class="alert_bottom_button_left">
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft" 
                                            TabIndex="17" onclick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" 
                                            TabIndex="18" onclick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvCondicaoPagamentoParcelaId" runat="server" ControlToValidate="txtDadosCondicaoPagamentoParcelaId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvCondicaoPagamentoParcelaDias" runat="server" ControlToValidate="txtDadosCondicaoPagamentoParcelaDias" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvCondicaoPagamentoParcelaPercentual" runat="server" ControlToValidate="txtDadosCondicaoPagamentoParcelaPercentual" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</form>
</body>
</html>
