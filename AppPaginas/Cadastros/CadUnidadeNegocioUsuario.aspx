<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadUnidadeNegocioUsuario.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadUnidadeNegocioUsuario" %>

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

    <asp:Panel ID="pnlCadastroUnidadeNegocioUsuario" runat="server">
        <asp:UpdatePanel ID="uppCadastroUnidadeNegocioUsuario" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroUnidadeNegocioUsuario">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>                
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>

                        <%-- FORMULÁRIO --%>
                        <div class="alert_bottom_button">
                            <ol>
                                <li>
                                    <asp:Label ID="lblDadosUnidadeNegocio" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosUnidadeNegocio" runat="server" MaxLength="30" TabIndex="1" Enabled="false"/> 
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosUsuario" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosUsuario" runat="server" MaxLength="30" TabIndex="2" />                                        
                                </li>

                                <li>
                                    <asp:Label ID="lblDadosUsuarioAprovaCredito" runat="server" SkinID="LabelForm" />
                                    <asp:CheckBox ID="cbDadosUsuarioAprovaCredito" runat="server"  TabIndex="3" />                                        
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosUsuarioAprovaPedido" runat="server" SkinID="LabelForm" />
                                    <asp:CheckBox ID="cbDadosUsuarioAprovaPedido" runat="server"  TabIndex="4" />                                        
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosUsuarioBandaMinima" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosUsuarioBandaMinima" runat="server"  TabIndex="5" />                                        
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosUsuarioBandaMaxima" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosUsuarioBandaMaxima" runat="server"  TabIndex="6" />                   
                                </li>
                            </ol>
                        <div class="line">
                            <asp:Button ID="btnSalvar" runat="server" TabIndex="7" SkinID="ButtonLeft" ValidationGroup="Validacao"
                                onclick="btnSalvar_Click" />
                            <asp:Button ID="btnBuscar" runat="server" TabIndex="8" SkinID="ButtonCenter" 
                                onclick="btnBuscar_Click" />
                            <asp:Button ID="btnLimpar" runat="server" TabIndex="9" SkinID="ButtonRight" 
                                onclick="btnLimpar_Click" />
                        </div>

                        </div>

                    </fieldset>
                </asp:Panel>


             
                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>

                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosUsuarioId" runat="server" />
                                <asp:TextBox ID="txtFiltrosUsuarioId" runat="server" SkinID="Filtro" MaxLength="10" TabIndex="10" />
                            </div>    
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosUsuarioNome" runat="server" />
                                <asp:TextBox ID="txtFiltrosUsuarioNome" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="11" />
                            </div>
                            
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="12"
                                        onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" TabIndex="13"
                                        onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" 
                                        TabIndex="14" onclick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="15"
                                        onclick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <%--  --%> 
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="2"                                 
                                DataKeyNames="usuarioId,usuarioNome,unidadeNegocioId,unidadeNegocioDescricao,usuarioAprovaCredito,usuarioAprovaPedido
                                             ,usuarioBandaMinima,usuarioBandaMaxima"
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

                                    <asp:BoundField DataField="unidadeNegocioDescricao"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100"/>
                                     <asp:TemplateField ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioId" runat="server" Text='<%# FormataStringSaida(Eval("usuarioId"), txtFiltrosUsuarioId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioNome" runat="server" Text='<%# FormataStringSaida(Eval("usuarioNome"), txtFiltrosUsuarioNome.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="usuarioTipoId"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100"/> 
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

                <%-- NOVO CADASTRO USUÁRIO X UNIDADE NEGOCIO --%>
                <asp:Panel ID="pnlNovoCadastro" runat="server" DefaultButton="btnFiltrosPesquisa" Visible="false">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeaderNovo" runat="server" />
                        </legend>

                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblNovoUsuarioId" runat="server" />
                                <asp:TextBox ID="txtNovoUsuarioId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="10" />
                            </div>    
                            <div class="boxPesquisa">
                                <asp:Label ID="lblNovoUsuarioNome" runat="server" />
                                <asp:TextBox ID="txtNovoUsuarioNome" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="11" />
                            </div>
                            
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnNovoUsuarioPesquisa" runat="server" SkinID="ButtonLeft" 
                                        TabIndex="12" onclick="btnNovoUsuarioPesquisa_Click"
                                        />
                                    <asp:Button ID="btnNovoUsuarioLimpar" runat="server" SkinID="ButtonCenter" 
                                        TabIndex="13" onclick="btnNovoUsuarioLimpar_Click"
                                        />
                                    <asp:Button ID="btnNovoUsuarioVoltar" runat="server" SkinID="ButtonRight" 
                                        TabIndex="14" onclick="btnNovoUsuarioVoltar_Click"
                                        />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS NOVO --%>
                        <%--  --%> 
                        <div class="gridNovoRegistros">
                            <asp:GridView ID="gvNovo" runat="server" TabIndex="2"                                 
                                DataKeyNames="usuarioId,usuarioNome"
                                onpageindexchanging="gvRegistrosNovo_PageIndexChanging" 
                                onrowcommand="gvRegistrosNovo_RowCommand" onrowdatabound="gvRegistrosNovo_RowDataBound" 
                                onrowdeleting="gvRegistrosNovo_RowDeleting" onrowupdating="gvRegistrosNovo_RowUpdating">
                                <Columns>
                                     <asp:TemplateField ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrNovoUsuarioId" runat="server" Text='<%# FormataStringSaida(Eval("usuarioId"), txtNovoUsuarioId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrNovoUsuarioNome" runat="server" Text='<%# FormataStringSaida(Eval("usuarioNome"), txtNovoUsuarioNome.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="usuarioTipoId"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150"/> 
                                   <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75px">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAlterarNovo" runat="server" CommandName="Update"
                                                        Text="<%$ Resources:Resource, lblSelecione%>"
                                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </asp:Panel>


                 <%-- CONFIRMAR DADOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upDadosConfirmar" runat="server" UpdateMode="Conditional" >
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlDadosConfirmar" runat="server" DefaultButton="btnConfirmarYes" Visible="false">
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
                                                    <asp:Label ID="lblConfirmarDadosUnidadeNegocio" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosUnidadeNegocioTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosUsuario" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosUsuarioTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosUsuarioAprovaCredito" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosUsuarioAprovaCreditoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosUsuarioAprovaPedido" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosUsuarioAprovaPedidoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosUsuarioBandaMinima" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosUsuarioBandaMinimaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosUsuarioBandaMaxima" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosUsuarioBandaMaximaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" 
                                                    TabIndex="6" onclick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" 
                                                    TabIndex="7" onclick="btnConfirmarNo_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                
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
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="14"
                                            onclick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="15"
                                            onclick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>


            <%-- VALIDATION   --%> 
                <asp:RequiredFieldValidator ID="rfvUsuarioId" runat="server" ControlToValidate="txtDadosUnidadeNegocio" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvUsuarioNome" runat="server" ControlToValidate="txtDadosUsuario" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvUsuarioBandaMinima" runat="server" ControlToValidate="txtDadosUsuarioBandaMinima" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvUsuarioBandaMaxima" runat="server" ControlToValidate="txtDadosUsuarioBandaMaxima" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</form>
</body>
</html>
