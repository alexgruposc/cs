<%@ Page Title="SAC - Vortice CRM" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadSacOcorrencia.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadSacOcorrencia" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPedido.ascx" TagPrefix="CtlPedido" TagName="ControlPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updPrincipal" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnFiltrosIncluir" />
            <asp:AsyncPostBackTrigger ControlID="txtFiltroCliente" EventName="TextChanged" />
        </Triggers>
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="updAPI" runat="server" AssociatedUpdatePanelID="updPrincipal">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                <div style="height:10px"></div>
                <div id="filters" style="left: 0.5%; width: 99%; height: 20%;">
                    <fieldset>
                        <legend>
                            SAC - Vortice CRM
                        </legend>
                        <div id="filtersFields" class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroCliente" runat="server" Text="Cliente"></asp:Label><br />
                                <asp:TextBox ID="txtFiltroCliente" runat="server" SkinID="Filtro" MaxLength="50" AutoPostBack="true" OnTextChanged="txtFiltroCliente_TextChanged"></asp:TextBox>
                                <ucc:AutoCompleteExtender ID="aceCliente" runat="server"
                                    CompletionListCssClass="autocomplete_list1"
                                    CompletionListItemCssClass="autocomplete_listitem"
                                    CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                    CompletionInterval="100"
                                    EnableCaching="false"
                                    MinimumPrefixLength="3"
                                    UseContextKey="true"
                                    TargetControlID="txtFiltroCliente"
                                    ServiceMethod="GetClienteGeral"
                                    ServicePath="~/AppWs/WsGetCliente.asmx">
                                </ucc:AutoCompleteExtender>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroCPF" runat="server" Text="CPF/CNPJ"></asp:Label>
                                <asp:TextBox ID="txtFiltroCPF" runat="server" MaxLength="14" SkinID="Filtro"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroPedidoId" runat="server" Text="Pedido"></asp:Label>
                                <asp:TextBox ID="txtFiltroPedidoId" runat="server" MaxLength="9" SkinID="Filtro"></asp:TextBox>
                            </div>
                            <div class="boxPesquisa">
                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" Text="Pesquisar" OnClick="btnFiltrosPesquisa_Click"/>&nbsp;
                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" Text="Limpar" OnClick="btnFiltrosLimpar_Click" />&nbsp;
                                <asp:Button ID="btnFiltrosIncluir" runat="server" SkinID="ButtonRight" Text="Incluir" OnClick="btnFiltrosIncluir_Click" />
                            </div>
                        </div>
                    </fieldset>
                </div>

                <fieldset class="pad-10">
                    <div id="grid" class="gridRegistros">
                        <asp:GridView ID="grdRegistros" runat="server" 
                            OnPageIndexChanging="grdRegistros_PageIndexChanging"
                            EmptyDataText="Nenhum evento encontrado">
                            <Columns>
                                <asp:BoundField DataField="ID_PEDIDO_ONCO" HeaderText="Pedido" DataFormatString="{0:#}" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="DATA_CONTATO" HeaderText="Data Contato" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="DESCRICAO_ACAO" HeaderText="Ação" />
                                <asp:BoundField DataField="DESCRICAO_RESULTADO" HeaderText="Resultado" />
                                <asp:BoundField DataField="COMPLEMENTO_RESULTADO" HeaderText="Complemento" />
                                <asp:BoundField DataField="ATENDENTE" HeaderText="Atendente" />
                                <asp:BoundField DataField="DETALHE" HeaderText="Detalhe" />
                                <asp:BoundField DataField="SEQHISTORICO" HeaderText="Seq Historico" DataFormatString="{0:#}" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="CPF" HeaderText="CPF" ItemStyle-HorizontalAlign="Center"/>
                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </fieldset>
            </asp:Panel>

            <asp:Panel ID="pnlDados" runat="server" Visible="false">
                <div id="editButtons" class="form-row">
                    <div class="col-lg-10"></div>
                    <div class="col-lg-2">
                        <br />
                        <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeft" Text="Salvar" OnClick="btnSalvar_Click" />
                        <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonRight" Text="Voltar" OnClick="btnVoltar_Click" />
                    </div>
                </div>
                <div id="dataForm" class="form-row">
                    <div class="col-md-12">
                        <fieldset>
                            <legend>Incluir Evento SAC</legend>
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lblCliente" runat="server" Text="Cliente"></asp:Label>
                                <asp:TextBox ID="txtCliente" runat="server" OnTextChanged="txtCliente_TextChanged" Width="60%"></asp:TextBox>
                                <ucc:AutoCompleteExtender ID="aceClienteFormulario" runat="server"
                                    CompletionListCssClass="autocomplete_list1"
                                    CompletionListItemCssClass="autocomplete_listitem"
                                    CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                    CompletionInterval="100"
                                    EnableCaching="false"
                                    MinimumPrefixLength="3"
                                    UseContextKey="true"
                                    TargetControlID="txtCliente"
                                    ServiceMethod="GetClienteGeral"
                                    ServicePath="~/AppWs/WsGetCliente.asmx">
                                </ucc:AutoCompleteExtender>
                                <asp:HiddenField ID="hidCPF" runat="server" />
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <CtlPedido:ControlPedido ID="ctlPedido" runat="server" OnSelectionChanged="ctlPedido_SelectionChanged" ShowDetail="true" />
                                </div>
                                <div class="col-sm-6">
                                    <asp:RadioButtonList ID="rblCliente" runat="server" Visible="false">
                                        <asp:ListItem Text="Cliente" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Triangular" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="form-group"><br /></div>
                            <div class="form-group" >
                                <asp:Label ID="lblDetalhe" runat="server" Text="Detalhe"></asp:Label>
                                <textarea id="txaDetalhe" runat="server" rows="10" cols="100" style="width:100%;resize:none"></textarea>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblComplemento" runat="server" Text="Complemento"></asp:Label>
                                <textarea id="txaComplementoDetalhe" runat="server" rows="10" cols="100" style="width:100%;resize:none"></textarea>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
