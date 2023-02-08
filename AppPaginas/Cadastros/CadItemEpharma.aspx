<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadItemEpharma.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadItemEpharma" %>

<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/Mensagem.ascx" TagPrefix="MsgBox" TagName="Mensagem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_initializeRequest(InitializeRequest);
        prm.add_endRequest(EndRequest);
        var postBackElement;

        function InitializeRequest(sender, args) {
            if (prm.get_isInAsyncPostBack()) {
                args.set_cancel(true);
            }

            postBackElement = args.get_postBackElement();

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnUpload.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';
            }


        }

        function EndRequest(sender, args) {

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnUpload.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';
            }

        }
    </script>
    <asp:Panel ID="pnlCadastroItem" runat="server">
        <asp:UpdatePanel ID="uppCadastroItem" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnUpload" />
                 <asp:PostBackTrigger ControlID="btnExportacao" />

            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroItem">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                   <MsgBox:Mensagem runat="server" ID="MensagemBox" />
                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                      <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>

                    <div class="form-row">
                        <div class="col-lg-10"></div>
                        <div class="col-lg-2">
                            <asp:Button ID="btnSalvar" runat="server" TabIndex="14" SkinID="BtnDefault" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                            <asp:Button ID="btnBuscar" runat="server" TabIndex="15" SkinID="BtnDefault" OnClick="btnBuscar_Click" />
                            <asp:Button ID="btnLimpar" runat="server" TabIndex="16" SkinID="BtnDefault" OnClick="btnLimpar_Click" Visible="false" />

                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Cadastro de produtos Epharma 
                                </h2>
                                <div class="nav navbar-right panel_toolbox">
                                    <br />
                                    <br />
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="demo-container">
                                        <div class="form-group col-md-2">

                                            <asp:Label ID="lblDadosItemId" runat="server"   />
                                            <asp:TextBox ID="txtDadosItemId" SkinID="txtBootstrap4" AutoPostBack="true" OnTextChanged="txtDadosItemId_TextChanged" runat="server" />
                                             <ucc:AutoCompleteExtender ID="aceItem2" runat="server"
                                                CompletionListCssClass="autocomplete_list1"
                                                CompletionListItemCssClass="autocomplete_listitem"
                                                CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                CompletionInterval="100"
                                                EnableCaching="false"
                                                MinimumPrefixLength="3"
                                                UseContextKey="true"
                                                TargetControlID="txtDadosItemId"
                                                ServiceMethod="GetItens"
                                                ServicePath="~/AppWs/WsGetItens.asmx" />
                                        </div>
                                        <div class="form-group col-md-4">
                                            <asp:Label ID="lblDadosItemDescricao" runat="server"   />
                                            <asp:TextBox ID="txtDadosItemDescricao" SkinID="txtBootstrap4" Enabled="false" runat="server" MaxLength="30" TabIndex="5" />
                                        </div>
                                        <div class="form-group col-md-4">
                                            <asp:Label ID="lblEAN" runat="server"   />
                                            <asp:TextBox ID="txtEAN" runat="server" MaxLength="30"  SkinID="txtBootstrap4"  TabIndex="5" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="demo-container">
                                        <div class="form-group col-md-4">
                                            <asp:Label ID="lblNomeConvenio" runat="server"   />
                                            <asp:DropDownList ID="cmbNomeConvenio" Enabled="true" runat="server" SkinID="ddlBootstrap1" />
                                        </div>


                                    </div>
                                </div>

                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="demo-container">
                                        <div class="col-md-2 col-sm-2 col-xs-12">
                                            <asp:Label ID="lblTabelaPrecoVlrTabela" runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTabelaPrecoVlrTabela" runat="server" SkinID="txtBootstrap3" Font-Bold="true" />
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-12">
                                            <asp:Label ID="lbltxtTabelaPrecoVlrMinimo" runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTabelaPrecoVlrMinimo" runat="server"  Font-Bold="true" MaxLength="18"  SkinID="txtBootstrap3" />
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-12">
                                              <asp:Label ID="lblTabelaPrecoVlrMaximo" runat="server"  />
                                            <div class="form-group">
                                                 <asp:TextBox ID="txtTabelaPrecoVlrMaximo" runat="server" SkinID="txtBootstrap3" Font-Bold="true" MaxLength="18" />
                                            </div>
                                        </div>
                                    </div>
                                </div>



                            </div>
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
                                                    <asp:Label ID="lblConfirmarDadosItemInfoComplementar" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemInfoComplementarTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="17" OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="18" OnClick="btnConfirmarNo_Click" />
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
                        <asp:Panel ID="pnlFiltros" runat="server" SkinID="PnlMenu">
                            <div style="display: table; text-align: center; width: 99%;">
                                <div style="display: table; width: 100%;">

                                    <div class="navegacao">
                                        <div class="boxPesquisa">
                                            <CtlPeriodo:ControlPeriodo ID="CtlPeriodoInclusao" runat="server"
                                                TabIndexDataInicio="1" TabIndexDataTermino="2"
                                                ShowHeaderLine="false" />
                                        </div>
                                        <div class="boxPesquisa">
                                            <asp:Label ID="lblFiltrosItem" runat="server" Text="Item" />
                                            <asp:TextBox ID="txtFiltrosItemDescricao" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="20" AutoPostBack="true" OnTextChanged="txtFiltrosItemDescricao_TextChanged" />
                                            <ucc:AutoCompleteExtender ID="aceItem" runat="server"
                                                CompletionListCssClass="autocomplete_list1"
                                                CompletionListItemCssClass="autocomplete_listitem"
                                                CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                CompletionInterval="100"
                                                EnableCaching="false"
                                                MinimumPrefixLength="3"
                                                UseContextKey="true"
                                                TargetControlID="txtFiltrosItemDescricao"
                                                ServiceMethod="GetItens"
                                                ServicePath="~/AppWs/WsGetItens.asmx" />
                                        </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblEanFiltro" runat="server" Text="Item" />
                                            <asp:TextBox ID="txtEanFiltro" SkinID="Filtro" runat="server" />
                                                </div>
                                        <div class="boxPesquisa">
                                            <asp:Label ID="lblConvenioFiltro" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="dplConvenioFiltro" Enabled="true" runat="server" MaxLength="30" TabIndex="5" />
                                        </div>
                                        <div class="boxPesquisa">
                                            <div class="line">
                                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnDefault"
                                                    TabIndex="13" OnClick="btnFiltrosPesquisa_Click" Text="Pesquisar" />
                                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault"
                                                    TabIndex="14" OnClick="btnFiltrosLimpar_Click" Text="Limpar" />
                                                <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnDefault" TabIndex="22" Text="Novo"
                                                    OnClick="btnFiltrosNovoCadastro_Click" />
                                                <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="BtnDefault" TabIndex="29" OnClick="btnFiltrosExcluir_Click" Visible="false" />
                                                <asp:ImageButton ID="btnExportacao" runat="server" Width="25px" OnClick="btnExportacao_Click"
                                                    Height="25px" ImageAlign="AbsMiddle" TabIndex="15" ImageUrl="~/Imagens/ImportXLS.png"
                                                    ToolTip="Exportação Modelo Carga" Visible="true" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>


                        <div style="border: solid 0px; margin-top: 21px;">
                            <div class="boxPesquisa">
                                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                    <asp:FileUpload ID="fulArquivo" runat="server" />
                                </div>
                            </div>

                            <div class="boxPesquisa">
                                <asp:Button ID="btnUpload" runat="server" Width="160px" Text="<%$ Resources:Resource, lblCarregar %>" OnClick="btnUpload_Click" />
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="32"
                                DataKeyNames="itemId,itemDescricao,CodigoConvenio,nomeConvenio,EAN,tabelaPrecoVlrTabela,tabelaPrecoVlrMinimo,tabelaPrecoVlrMaximo,ePharmaProdutoId"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound">
                                <Columns>

                                    <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />

                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemDescricao" runat="server" Text='<%# FormataStringSaida(Eval("itemDescricao"), txtFiltrosItemDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="nomeConvenio" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="EAN" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="tabelaPrecoVlrTabela" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="tabelaPrecoVlrMinimo" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="tabelaPrecoVlrMaximo" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrDataCadastro" runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltritemInserido" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltritemAtualizado" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                             <%--       <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltritemExcluido" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                 <%--   <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemSemAtualizacao" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Alterar" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/find.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbExcluir" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblExcluir %>" CommandArgument='<%# Eval("ePharmaProdutoId") %>'
                                            ImageUrl="~/Imagens/Fechar.png" />
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
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="30" OnClick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="31" OnClick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvItemId" runat="server" ControlToValidate="txtDadosItemId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvItemEan" runat="server" ControlToValidate="txtEAN" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvTabelaPrecoVlrTabela" runat="server" ControlToValidate="txtTabelaPrecoVlrTabela" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvTabelaPrecoVlrMinimo" runat="server" ControlToValidate="txtTabelaPrecoVlrMinimo" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvTabelaPrecoVlrMaximo" runat="server" ControlToValidate="txtTabelaPrecoVlrMaximo" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

