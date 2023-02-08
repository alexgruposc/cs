<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadClienteEndereco.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadClienteEndereco" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>
<%@ Register Src="~/AppControles/CtlData.ascx"  TagPrefix="CtlData" TagName="ControlData" %>

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

    <asp:Panel ID="pnlCadastroClienteEndereco" runat="server">
        <asp:UpdatePanel ID="uppCadastroClienteEndereco" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroClienteEndereco">
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
                                    <asp:Label ID="lblDadosCliente" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosCliente" runat="server" MaxLength="30" TabIndex="1" Enabled="false" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteTipoEndereco" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddDadosClienteTipoEndereco" runat="server"  TabIndex="2" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteEndereco" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteEndereco" runat="server"  TabIndex="3"  MaxLength="100"/>
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteEnderecoNumero" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteEnderecoNumero" runat="server" MaxLength="30" TabIndex="4" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteEnderecoComplemento" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteEnderecoComplemento" runat="server" MaxLength="100" TabIndex="5" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteEnderecoCep" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteEnderecoCep" runat="server" MaxLength="30" TabIndex="6" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteEnderecoPais" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddDadosClienteEnderecoPais" runat="server"  TabIndex="7" 
                                    AutoPostBack="True"  onselectedindexchanged="ddDadosClienteEnderecoPais_SelectedIndexChanged"/>
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteEnderecoUf" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddDadosClienteEnderecoUf" runat="server"  TabIndex="8"/>
                                </li>

                                <li>
                                    <asp:Label ID="lblDadosClienteEnderecoObservacoes" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteEnderecoObservacoes" runat="server" MaxLength="500" TabIndex="9" TextMode="MultiLine" />
                                </li>

                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="11" SkinID="ButtonLeft" 
                                    ValidationGroup="Validacao" onclick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="12" SkinID="ButtonCenter" 
                                    onclick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="13" SkinID="ButtonRight" 
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
                                                    <asp:Label ID="lblConfirmarCliente" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteTipoEndereco" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteTipoEnderecoTexo" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteEndereco" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteEnderecoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteEnderecoNumero" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteEnderecoNumeroTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteEnderecoComplemento" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteEnderecoComplementoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteEnderecoCep" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteEnderecoCepTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteEnderecoPais" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteEnderecoPaisTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteEnderecoUf" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteEnderecoUfTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteEnderecoObservacoes" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteEnderecoObservacoesTexto" runat="server" SkinID="LabelResposta" />
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
                                <asp:Label ID="lblFiltrosClienteEndereco" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteEndereco" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="11" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteEnderecoPais" runat="server" />
                                <asp:DropDownList ID="ddFiltrosClienteEnderecoPais" runat="server" SkinID="DropFiltro"  TabIndex="12" 
                                AutoPostBack="True"   onselectedindexchanged="ddFiltrosClienteEnderecoPais_SelectedIndexChanged" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteEnderecoUf" runat="server" />
                                <asp:DropDownList ID="ddFiltrosClienteEnderecoUf" runat="server" SkinID="DropFiltro"  TabIndex="13" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" 
                                        TabIndex="14" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" 
                                        TabIndex="15" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" 
                                        TabIndex="16" onclick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" 
                                        TabIndex="17" onclick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="19"                                 
                                DataKeyNames="tipoEnderecoDescricao,paisNome,estadoNome,clienteId,tipoEnderecoId,clienteEndereco,clienteEnderecoNumero,clienteEnderecoComplemento,clienteEnderecoCEP,paisId,ufId,clienteEnderecoObservacoes" 
                                onpageindexchanging="gvRegistros_PageIndexChanging" 
                                onrowcommand="gvRegistros_RowCommand" onrowdatabound="gvRegistros_RowDataBound" 
                                onrowdeleting="gvRegistros_RowDeleting" onrowupdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 <asp:TemplateField ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Literal ID="ltrCondicaoPagamentoId" runat="server" Text='<%# FormataStringSaida(Eval("clienteEndereco"), txtFiltrosClienteEndereco.Text) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                                
                                <asp:BoundField DataField="paisNome"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px"/>
                                <asp:BoundField DataField="estadoNome"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px"/>

                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75px">
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
                <asp:RequiredFieldValidator ID="rfvClienteEndereco" runat="server" ControlToValidate="txtDadosClienteEndereco" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteEnderecoNumero" runat="server" ControlToValidate="txtDadosClienteEnderecoNumero" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteEnderecoCep" runat="server" ControlToValidate="txtDadosClienteEnderecoCep" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteEnderecoObservacoes" runat="server" ControlToValidate="txtDadosClienteEnderecoObservacoes" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
               <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</form>
</body>
</html>
