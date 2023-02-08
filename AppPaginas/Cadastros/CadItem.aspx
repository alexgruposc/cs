<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadItem.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="pnlCadastroItem" runat="server">
        <asp:UpdatePanel ID="uppCadastroItem" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroItem">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server"  Visible="false">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>
                        <div class="alert_bottom_button">
                            <ol>
                                <li>
                                    <asp:Label ID="lblDadosItemId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosItemId" runat="server" MaxLength="30" TabIndex="5" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosItemFamiliaComercialId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosItemFamiliaComercialId" runat="server" TabIndex="1" />
                                <li>
                                    <asp:Label ID="lblDadosItemFamiliaMaterialId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosItemFamiliaMaterialId" runat="server" TabIndex="2" />
                                </li>                               
                                <li>
                                    <asp:Label ID="lblDadosItemFabricanteId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosItemFabricanteId" runat="server" TabIndex="3" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosItemGrupoEstoqueId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosItemGrupoEstoqueId" runat="server" TabIndex="4" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosItemDescricao" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosItemDescricao" runat="server" MaxLength="100" TabIndex="6" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosItemUnidadeMedida" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosItemUnidadeMedidaId" runat="server" TabIndex="7" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosItemPesoBruto" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosItemPesoBruto" runat="server" MaxLength="18" TabIndex="8" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosItemPesoLiquido" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosItemPesoLiquido" runat="server" MaxLength="18" TabIndex="9" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosItemClassificacaoFiscalId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosItemClassificacaoFiscalId" runat="server"  TabIndex="10"  />
                                </li>
                                <li>
                                    <div style="margin-left: 150px;">
                                        <asp:CheckBox ID="chkDadosItemRefrigerado" runat="server" Font-Bold="true" TabIndex="11" Text="<%$ Resources:Resource, lblItemRefrigerado %>" />
                                    </div>
                                </li>
                                <li>
                                    <div style="margin-left: 150px;">
                                        <asp:CheckBox ID="chkDadosItemControlado" runat="server" Font-Bold="true" TabIndex="12" Text="<%$ Resources:Resource, lblItemControlado %>" />
                                    </div>
                                </li>
                                <li>
                                    <div class="line">
                                        <div class="line_itens">
                                            <asp:Label ID="lblDadosItemInfoComplementar" runat="server" SkinID="LabelForm" />
                                        </div>
                                        <div class="line_itens">
                                            <asp:TextBox ID="txtDadosItemInfoComplementar" runat="server" MaxLength="50" TextMode="MultiLine" Columns="100" Rows="5" TabIndex="13" />
                                        </div>
                                    </div>
                                </li>

                                    <li>
                                        <div style="left: 1%; width: 100%; height: 35%;top:3%; display: table;">
                                        <div style="left: 0%; display: table-row;">
                                            <center />
                                            <asp:Panel ID="pnlInfoSap" runat="server">
                                                <fieldset style="height: 32%; width: 95.7%;">
                                                    <div style="height: 100%; overflow-x: none; overflow-y: none;">
                                                   
                                                        <div style="width: 16%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblAutorizaVacinas" runat="server" />
                                                        </div>
                                                         <div style="width: 16%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkAutorizaVacinas" Font-Bold="true" runat="server" Enabled="false"/>
                                                        </div>
                                                        <div style="width: 16%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblAutorizaRetinoide" runat="server" />
                                                        </div>
                                                        <div style="width: 16%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkAutorizaRetinoide" Font-Bold="true" runat="server" Enabled="false"/>
                                                        </div>
                                                        <div style="width: 16%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblBloqMisoprostol" runat="server" />
                                                        </div>
                                                        <div style="width: 16%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkBloqMisoprostol" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>
                                                       
                                                    </div>
                                                </fieldset>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="14" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click"  Visible="false"/>
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="15" SkinID="ButtonCenter" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="16" SkinID="ButtonRight" OnClick="btnLimpar_Click" Visible="false" />
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
                                                    <asp:Label ID="lblConfirmarDadosItemId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemFamiliaComercial" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemFamiliaComercialTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemFamiliaMaterial" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemFamiliaMaterialTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemFabricante" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemFabricanteTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemGrupoEstoque" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemGrupoEstoqueTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemUnidadeMedida" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemUnidadeMedidaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemPesoBruto" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemPesoBrutoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemPesoLiquido" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemPesoLiquidoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemClassificacaoFiscal" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemClassificacaoFiscalTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemRefrigerado" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemRefrigeradoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemControlado" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemControladoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemInfoComplementar" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemInfoComplementarTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>

                                            
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="17" onclick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="18" onclick="btnConfirmarNo_Click" />
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
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosItemId" runat="server" />
                                <asp:TextBox ID="txtFiltrosItemId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="19" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosItemDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltrosItemDescricao" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="20" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFamiliaComercialId" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosFamiliaComercialId" runat="server" TabIndex="21" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFamiliaMaterialId" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosFamiliaMaterialId" runat="server" TabIndex="22" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosGrupoEstoqueId" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosGrupoEstoqueId" runat="server" TabIndex="23" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFabricanteId" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosFabricanteId" runat="server" TabIndex="24" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosClassificacaoId" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosClassificacaoId" runat="server" TabIndex="25" SkinID="DropFiltro" />
                            </div>
                        </div>
                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="26" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" TabIndex="27" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" TabIndex="28" OnClick="btnFiltrosNovoCadastro_Click" Visible="false"/>
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="29" OnClick="btnFiltrosExcluir_Click"  Visible="false"/>
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="32"                                 
                                DataKeyNames="itemId,itemDescricao,itemInfComplementar,itemPesoBruto,itemPesoLiquido,itemRefrigerado,itemControlado,
                                              familiaComercialId,familiaComercialDescricao,familiaMaterialId,familiaMaterialDescricao,grupoEstoqueId,grupoEstoqueDescricao,
                                              fabricanteId,fabricanteNome,fabricanteNomeAbreviado,classificacaoFiscalId,classificacaoFiscalDescricao,
                                              unidadeMedidaId,unidadeMedidaSigla,AutorizaVacinas,AutorizaRetinoide,BloqMisoprostol" 
                                onpageindexchanging="gvRegistros_PageIndexChanging" 
                                onrowcommand="gvRegistros_RowCommand" 
                                onrowdatabound="gvRegistros_RowDataBound" 
                                onrowdeleting="gvRegistros_RowDeleting"
                                onrowupdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemId" runat="server" Text='<%# FormataStringSaida(Eval("itemId"), txtFiltrosItemId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemDescricao" runat="server" Text='<%# FormataStringSaida(Eval("itemDescricao"), txtFiltrosItemDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:BoundField DataField="unidadeMedidaSigla" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemFamiliaComercial" runat="server" Text='<%# FormataStringSaida(Eval("familiaComercialDescricao"), ddlFiltrosFamiliaComercialId.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemFamiliaMaterial" runat="server" Text='<%# FormataStringSaida(Eval("familiaMaterialDescricao"), ddlFiltrosFamiliaMaterialId.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemGrupoEstoque" runat="server" Text='<%# FormataStringSaida(Eval("grupoEstoqueDescricao"), ddlFiltrosGrupoEstoqueId.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemFabricante" runat="server" Text='<%# FormataStringSaida(Eval("fabricanteNome"), ddlFiltrosFabricanteId.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemClassificacaoId" runat="server" Text='<%# FormataStringSaida(Eval("classificacaoFiscalDescricao"), ddlFiltrosClassificacaoId.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75px">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAlterar" runat="server" CommandName="Update"
                                                        Text="<%$ Resources:Resource, lblVisualizar %>"
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
                        <div class="OpacityBackGround">
                        </div>
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
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="30" onclick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="31" onclick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvItemId" runat="server" ControlToValidate="txtDadosItemId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvItemDescricao" runat="server" ControlToValidate="txtDadosItemDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />                
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
