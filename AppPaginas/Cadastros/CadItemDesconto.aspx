<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AppMaster/KraftMaster.Master" CodeBehind="CadItemDesconto.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadItemDesconto" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="uppItemDesconto" runat="server">
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppItemDesconto">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>


            <%-- PAINEL DE PESQUISA --%>
            <asp:Panel ID="pnlItemDescontoFiltros" runat="server" DefaultButton="btnFiltrosPesquisa">
                <div style="left: 0.5%; width: 99%; height: 100%; overflow-x: none;">
                    <fieldset style="left: 0.5%; width: 99%;">
                        <legend>
                            <asp:Literal ID="ltrItemDescontoPesquisa" runat="server" Text="<%$ Resources:Resource, lblItemDescontoHeaderPesquisa %>" />
                        </legend>

                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroItemCodigo" runat="server" />
                                <asp:TextBox ID="txtFiltroItemCodigo" runat="server" SkinID="Filtro" MaxLength="5" TabIndex="1" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroItemDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltroItemDescricao" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="2" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroUfOrigem" runat="server" />
                                <asp:DropDownList ID="ddlFiltroUfOrigem" runat="server" SkinID="DropFiltro" TabIndex="3" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroUfDestino" runat="server" />
                                <asp:DropDownList ID="ddlFiltroUfDestino" runat="server" SkinID="DropFiltro" TabIndex="4" />
                            </div>
                            <div class="boxPesquisa">
                               <%-- <asp:Label ID="lblFiltroContribuinte" runat="server" />
                                <asp:RadioButtonList ID="rblContribuinte" runat="server" TabIndex="5" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="2" Selected="True" Text="<%$ Resources:Resource, lblAmbos %>" />
                                    <asp:ListItem Value="True" Text="<%$ Resources:Resource, lblSim %>" />
                                    <asp:ListItem Value="False" Text="<%$ Resources:Resource, lblNao  %>" />
                                </asp:RadioButtonList>--%>
                            </div> 
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="6" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" TabIndex="7" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovo" runat="server" SkinID="ButtonRight"  TabIndex="8" OnClick="btnFiltrosNovo_Click" />
                                </div>
                            </div>
                        </div>

                            <%-- REGISTROS --%>
                        <center />
                        <div class="gridRegistros" style="margin-top: 10px; margin-bottom: 10px;">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="9"
                                DataKeyNames="itemId,ufIdOrigem,ufIdDestino,coeficienteDesconto,
                                              dtCadastro,resolucao13,convenio87,classeFiscal,usuarioId,usuarioNome,
                                              itemDescricao,dtAlteracao,usuarioIdAlteracao,UfOrigem,UfDestino"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemId" runat="server" Text='<%# FormataStringSaida(Eval("itemId"), txtFiltroItemCodigo.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemDescricao" runat="server" Text='<%# FormataStringSaida(Eval("itemDescricao"), txtFiltroItemDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUfOrigem" runat="server" Text='<%# FormataStringSaida(Eval("ufIdOrigem"), ddlFiltroUfOrigem.SelectedValue) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUfDestino" runat="server" Text='<%# FormataStringSaida(Eval("ufIdDestino"), ddlFiltroUfDestino.SelectedValue) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrContribuinte" runat="server" Text='<%# FormataStringSaida(bool.Parse(Eval("contribuinte").ToString()) ? GetResourceValue("lblSim") : GetResourceValue("lblNao"), rblContribuinte.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrResolucao" runat="server" Text='<%# (bool.Parse(Eval("resolucao13").ToString()) ? GetResourceValue("lblSim") : GetResourceValue("lblNao")).ToUpper() %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrConvenio" runat="server" Text='<%# (bool.Parse(Eval("convenio87").ToString()) ? GetResourceValue("lblSim") : GetResourceValue("lblNao")).ToUpper() %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:BoundField DataField="classeFiscal" ItemStyle-Width="200px" />--%>
                                    <asp:TemplateField ItemStyle-Width="200px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClasseFiscal" runat="server" Text='<%# !String.IsNullOrEmpty(Eval("classeFiscal").ToString()) ? GetResourceValue(Eval("classeFiscal").ToString()).ToUpper() : string.Empty %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="coeficienteDesconto" DataFormatString="{0:n2}" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbView" runat="server"
                                                CommandName="View"
                                                SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                CommandArgument='<%# Eval("itemId") + "|" + Eval("ufIdOrigem") + "|" + 
                                                                     Eval("ufIdDestino") + "|" + Eval("contribuinte") %>'
                                                ImageUrl="~/Imagens/find.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>                        

                    </fieldset>
                </div>
            </asp:Panel>
            
            <%-- FORMULÁRIO CADASTRO --%>
            <asp:Panel ID="pnlItemDescontoFormulario" runat="server" DefaultButton="btnSalvar" Visible="false">
                <div style="left: 0.5%; width: 99%; height: 100%; position: fixed; overflow-x: none;">
                    <fieldset style="left: 0.5%; width: 99%;">
                        <legend>
                            <asp:Literal ID="ltrItemDescontoCadastro" runat="server" Text="<%$ Resources:Resource, lblItemDescontoHeaderCadastro %>" />
                        </legend>

                        <%-- FORMULÁRIO --%>
                        <div class="alert_bottom_button" style="width: 100%;">
                            <ol>
                                <li>
                                    <asp:Label ID="lblCadItemCodigo" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtCadItemCodigo" runat="server" SkinID="SmallFilter" MaxLength="30" TabIndex="10" AutoPostBack="true" OnTextChanged="txtCadItemCodigo_TextChanged" />
                                    <asp:Label ID="lblCadItemDescricao" runat="server" SkinID="LabelResposta" />
                                    <ucc:AutoCompleteExtender ID="aceItens" runat="server" 
                                                              CompletionListCssClass="autocomplete_list1"
                                                              CompletionListItemCssClass="autocomplete_listitem" 
                                                              CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                              CompletionInterval="100" 
                                                              EnableCaching="false" 
                                                              MinimumPrefixLength="3" 
                                                              TargetControlID="txtCadItemCodigo"
                                                              ServiceMethod="GetItens" 
                                                              ServicePath="~/AppWs/WsGetItens.asmx" />
                                </li>
                                <li>
                                    <asp:Label ID="lblCadUfOrigem" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlCadUfOrigem" runat="server" TabIndex="11" />
                                </li>
                                <li>
                                    <asp:Label ID="lblCadUfDestino" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlCadUfDestino" runat="server" TabIndex="12" />
                                </li>
                                <li>
                                    <div style="padding-left: 150px;">
                                        <asp:CheckBox ID="chkCadContribuinte" runat="server" TextAlign="Right" Font-Bold="true"  TabIndex="13" />
                                    </div>
                                </li>
                                <li>
                                    <asp:Label ID="lblCadItemDesconto" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtCadItemDesconto" runat="server" MaxLength="18" TabIndex="14" SkinID="Currency150" />
                                </li>
                                <li>
                                    <asp:Label ID="lblCadResolucao13" runat="server" SkinID="LabelForm" />
                                    <asp:Label ID="lblCadResolucao13Desc" runat="server" SkinID="LabelResposta" />
                                </li>
                                <li>
                                    <asp:Label ID="lblCadConvenio87" runat="server" SkinID="LabelForm" />
                                    <asp:Label ID="lblCadConvenio87Desc" runat="server" SkinID="LabelResposta" />
                                </li>
                                <li>
                                    <asp:Label ID="lblCadClasseFiscal" runat="server" SkinID="LabelForm" />
                                    <asp:Label ID="lblCadClasseFiscalDesc" runat="server" SkinID="LabelResposta" />
                                </li>
                                <li>
                                    <div style="height: 10px; width: 100%;"></div>
                                </li>
                                <li>
                                    <asp:Label ID="lblCadDataCadastro" runat="server" SkinID="LabelForm" />
                                    <asp:Label ID="lblCadaDataCadastroDesc" runat="server" SkinID="LabelResposta" />
                                </li>
                                <li>
                                    <asp:Label ID="lblCadUserCadastro" runat="server" SkinID="LabelForm" />
                                    <asp:Label ID="lblCadUserCadastroDesc" runat="server" SkinID="LabelResposta" />
                                </li>
                                <li>
                                    <asp:Label ID="lblCadUserAlt" runat="server" SkinID="LabelForm" />
                                    <asp:Label ID="lblCadUserAltDesc" runat="server" SkinID="LabelResposta" />
                                </li>
                                <li style="padding-left: 150px;">
                                    <asp:Button ID="btnSalvar" runat="server" TabIndex="15" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                    <asp:Button ID="btnBuscar" runat="server" TabIndex="16" SkinID="ButtonCenter" OnClick="btnBuscar_Click" />
                                    <asp:Button ID="btnLimpar" runat="server" TabIndex="17" SkinID="ButtonRight" OnClick="btnLimpar_Click" />
                                </li>
                            </ol>
                        </div>

                    </fieldset>
                </div>
            </asp:Panel>

            <asp:RequiredFieldValidator ID="rfvItem" runat="server" ControlToValidate="txtCadItemCodigo" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao"  />
            <asp:RequiredFieldValidator ID="rfvDesconto" runat="server" ControlToValidate="txtCadItemDesconto" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao"  />
            <asp:ValidationSummary ID="vsmValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
