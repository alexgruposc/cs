<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaEstoque.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConsultaEstoque" %>

<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <link href="../../Content/select2.css" rel="stylesheet" />
    <script src="../../Scripts/select2.js" type="text/javascript"></script>
    <script src="../../Scripts/select2.full.js" type="text/javascript"></script>
    <%--    <link href="../../Content/bootstrap.css" rel="stylesheet" />
       <link href="../../Content/bootstrap-select.css" rel="stylesheet" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.9.3/js/bootstrap-select.min.js"></script>--%>

    <%--    <script src="../../Scripts/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap-select.min.js"  type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">

        $(document).ready(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm != null) {
                prm.add_endRequest(function () {
                    init();
                });
            }

            init();
        });

        function init() {
            $('.js-example-basic-single').select2();
        }



    </script>

    <asp:Panel ID="pnlCadastroCanalVenda" runat="server">
        <asp:UpdatePanel ID="uppCadastroCanalVenda" runat="server" style="margin-bottom: 50px;">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroCanalVenda">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                                    
                        <div class="navegacao">
               
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" TabIndex="12" SkinID="ddlBootstrap2" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroModoPesquisa" runat="server" />
                                <asp:DropDownList ID="ddlFiltroModoPesquisa" runat="server" SkinID="ddlBootstrap2"
                                    AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlFiltroModoPesquisa_SelectedIndexChanged">
                                    <asp:ListItem Value="<%$ Resources:Resource, ConsolidadoPorLoja %>"
                                        Text="<%$ Resources:Resource, ConsolidadoPorLojaTexto %>" />
                                    <asp:ListItem Value="<%$ Resources:Resource, Consolidado %>"
                                        Text="<%$ Resources:Resource, ConsolidadoTexto %>" />
                                </asp:DropDownList>
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroFabricante" runat="server" />
                                <asp:DropDownList ID="ddFabricante" runat="server" SkinID="ddlBootstrapSelect" TabIndex="3"
                                    OnSelectedIndexChanged="ddFabricante_SelectedIndexChanged" AutoPostBack="true" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosNomeQuimico" runat="server" />
                                <asp:DropDownList ID="ddNomeQuimico" runat="server" TabIndex="2" SkinID="ddlBootstrapSelect" data-live-search="true"
                                    OnSelectedIndexChanged="ddNomeQuimico_SelectedIndexChanged" AutoPostBack="true" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblItemId" runat="server" />
                                <asp:TextBox ID="txtItemId" SkinID="txtBootstrap3" runat="server" MaxLength="6" TabIndex="52" AutoPostBack="true" OnTextChanged="txtItemId_TextChanged" />
                                <asp:HiddenField ID="hdPerfilUsuario" runat="server" />
                                <ucc:AutoCompleteExtender ID="aceItem" runat="server"
                                    CompletionListCssClass="autocomplete_list1"
                                    CompletionListItemCssClass="autocomplete_listitem"
                                    CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                    CompletionInterval="100"
                                    EnableCaching="false"
                                    MinimumPrefixLength="3"
                                    UseContextKey="true"
                                    TargetControlID="txtItemId"
                                    ServiceMethod="GetItens"
                                    ServicePath="~/AppWs/WsGetItens.asmx" />

                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosNomeComercial" runat="server" />
                                <asp:DropDownList ID="ddNomeComercial" runat="server" SkinID="ddlBootstrapSelect" TabIndex="1" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnSuccess" TabIndex="11"
                                        OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnWarning" TabIndex="12"
                                        OnClick="btnFiltrosLimpar_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS CONSOLIDADOS--%>
                        <div class="gridConsolidadoRegistros" style="width: 100%;">
                            <div id="dvGridConsolidado" runat="server" visible="false" style="width: 100%; display: table; height: 25px; background-color: #13213C; text-align: center;">
                                <div style="vertical-align: middle; height: 100%; display: table-cell;">
                                    <asp:Label ID="Label1" ForeColor="White" runat="server" Text="<%$ Resources:Resource, lblTituloGridEstoqueConsolidado %>" />
                                </div>
                            </div>
                            <div style="width: 100%; display: table;">
                                <asp:GridView ID="gvConsolidadoRegistros" runat="server" AllowPaging="true" Width="100%" SkinID="gvConsolidadoEstoque"
                                    DataKeyNames="CodProduto,NCMProduto,MSProduto,NomeComercial,NomeQuimico,FabricanteProduto,TipoProduto,TipoArmazenagem,ProdutoControlado,Estoque,Reserva,Pedido,Alocada,Saldo"
                                    OnRowDataBound="gvConsolidadoRegistros_RowDataBound"
                                    OnRowCommand="gvConsolidadoRegistros_RowCommand"
                                    OnPageIndexChanging="gvConsolidadoRegistros_PageIndexChanging">
                                    <Columns>
                                        <asp:BoundField DataField="CodProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="NCMProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="MSProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="NomeComercial" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="NomeQuimico" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="FabricanteProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="TipoProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="TipoArmazenagem" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="ProdutoControlado" ItemStyle-HorizontalAlign="Center" />

                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" Visible="false">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrLoja" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="false">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrValor" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrEstoque" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <div style="width: 100%; display: table;">
                                                    <div style="width: 50%; vertical-align: middle; display: table-cell; text-align: right;">
                                                        <asp:LinkButton ID="lkbReserva" runat="server"
                                                            ToolTip="<%$ Resources:Resource, lblVisualizarRservas %>"
                                                            CommandName="Reserva"
                                                            CommandArgument='<%# Eval("CodProduto") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                    </div>
                                                    <div style="width: 50%; vertical-align: middle; display: table-cell; text-align: left;">
                                                        <asp:ImageButton ID="imbPesquisaReserva" runat="server" ImageUrl="~/Imagens/Find.png" Width="25px" Height="25px"
                                                            ToolTip="<%$ Resources:Resource, lblVisualizarRservas %>"
                                                            CommandName="Reserva"
                                                            CommandArgument='<%# Eval("CodProduto") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div style="width: 100%; display: table;">
                                                    <div style="width: 50%; vertical-align: middle; display: table-cell; text-align: right;">
                                                        <asp:LinkButton ID="lkbPedido" runat="server"
                                                            ToolTip="<%$ Resources:Resource, lblVisualizarPedidos %>"
                                                            CommandName="Pedido"
                                                            CommandArgument='<%# Eval("CodProduto") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                    </div>
                                                    <div style="width: 50%; vertical-align: middle; display: table-cell; text-align: left;">
                                                        <asp:ImageButton ID="imbPesquisaPedido" runat="server" ImageUrl="~/Imagens/Find.png" Width="25px" Height="25px"
                                                            ToolTip="<%$ Resources:Resource, lblVisualizarPedidos %>"
                                                            CommandName="Pedido"
                                                            CommandArgument='<%# Eval("CodProduto") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrPedidoSF" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div style="width: 100%; display: table;">
                                                    <div style="width: 50%; vertical-align: middle; display: table-cell; text-align: right;">
                                                        <asp:LinkButton ID="lkbAlocada" runat="server"
                                                            ToolTip="<%$ Resources:Resource, lblVisualizarAlocada %>"
                                                            CommandName="Alocada"
                                                            CommandArgument='<%# Eval("CodProduto") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                    </div>
                                                    <div style="width: 50%; vertical-align: middle; display: table-cell; text-align: left;">
                                                        <asp:ImageButton ID="imbPesquisaAlocada" runat="server" ImageUrl="~/Imagens/Find.png" Width="25px" Height="25px"
                                                            ToolTip="<%$ Resources:Resource, lblVisualizarAlocada %>"
                                                            CommandName="Alocada"
                                                            CommandArgument='<%# Eval("CodProduto") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrSaldo" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                        <%-- GRID REGISTROS DETALHADO --%>
                        <div class="gridDetalhadoRegistros" style="margin-top: 15px;">

                            <div id="dvGridDetalhado" runat="server" visible="false" style="width: 100%; display: table; height: 25px; background-color: #13213C; text-align: center;">
                                <div style="vertical-align: middle; height: 25px; display: table-cell;">
                                    <asp:Label ID="Label2" ForeColor="White" runat="server" Text="<%$ Resources:Resource, lblTituloGridEstoqueDetalhado %>" />
                                </div>
                            </div>

                            <div style="width: 100%; display: table;">
                                <asp:GridView ID="gvDetalhadoRegistros" Width="100%" runat="server" TabIndex="7" SkinID="gvEstoquePaginadoDetalhado"
                                    DataKeyNames="CodProduto,NCMProduto,MSProduto,NomeComercial,NomeQuimico,FabricanteProduto,
                                              TipoProduto,TipoArmazenagem,ProdutoControlado,Loja,Deposito,Lote,Validade,
                                              Estoque,Reserva,Pedido,Alocada,Saldo"
                                    OnRowDataBound="gvDetalhadoRegistros_RowDataBound"
                                    OnPageIndexChanging="gridDetalhadoRegistros_PageIndexChanging">
                                    <Columns>
                                        <asp:BoundField DataField="CodProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="NCMProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="MSProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="NomeComercial" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="NomeQuimico" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="FabricanteProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="TipoProduto" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="TipoArmazenagem" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="ProdutoControlado" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Loja" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Deposito" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Lote" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Validade" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Estoque" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:###,###,###,##0.##}" />
                                        <asp:BoundField DataField="Reserva" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                        <asp:BoundField DataField="Pedido" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                        <asp:BoundField DataField="PedidoSF" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                        <asp:BoundField DataField="Alocada" ItemStyle-HorizontalAlign="Center" Visible="false" DataFormatString="{0:###,###,###,##0.##}" />
                                        <asp:BoundField DataField="Saldo" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>

                        </div>
                        <%-- GRID REGISTROS FUTURO --%>
                        <div class="gridFuturoRegistros" style="margin-top: 15px; margin-bottom: 50px;">
                            <div id="dvGridFuturo" runat="server" visible="false" style="width: 100%; display: table; height: 25px; background-color: #13213C; text-align: center;">
                                <div style="vertical-align: middle; height: 100%; display: table-cell;">
                                    <asp:Label ID="Label3" ForeColor="White" runat="server" Text="<%$ Resources:Resource, lblTituloGridEstoqueFuturo %>" />
                                </div>
                            </div>
                            <div style="width: 100%; display: table;">
                                <asp:GridView ID="gvFuturoRegistros" Width="100%" runat="server" TabIndex="8" SkinID="gvEstoquePaginado"
                                    DataKeyNames="estoquefuturoItemId,estoquefuturoNum_Pedido,estoquefuturoNumero_Ordem,estoquefuturoData_Pedido
                                                  ,estoquefuturoEstabelecimentoId,estoquefuturoDepositoId,estoquefuturoData_Previsao,estoquefuturoQuantidade
                                                  ,estoquefuturoPedidoObservacao,estoquefuturoItemObservacao,linkCartaFalta,estoqueFuturoParcela"
                                    OnRowDataBound="gvFuturoRegistros_RowDataBound"
                                    OnPageIndexChanging="gridFuturoRegistros_PageIndexChanging">
                                    <Columns>
                                        <asp:BoundField DataField="estoquefuturoItemId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="estoquefuturoNum_Pedido" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="estoquefuturoNumero_Ordem" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="estoqueFuturoParcela" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="estoquefuturoData_Pedido" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="estoquefuturoEstabelecimentoId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="estoquefuturoDepositoId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="estoquefuturoData_Previsao" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="estoquefuturoQuantidade" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:###,###,###,##0.##}" />
                                        <asp:BoundField DataField="estoquefuturoPedidoObservacao" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="estoquefuturoItemObservacao" ItemStyle-HorizontalAlign="Center" />

                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbLinkCartaFalta" SkinID="ImgGrid" ImageUrl="~/Imagens/url.png" runat="server"
                                                    ToolTip='<%# Eval("linkCartaFalta").ToString()%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </fieldset>
                </asp:Panel>

                <%-- Pop up RESERVA --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upReserva" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlPopReserva" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblReserva" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbReservaClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbReservaClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <asp:GridView ID="gvPopReserva" runat="server"
                                                DataKeyNames="estabelecimentoId"
                                                OnRowDataBound="gvPopReserva_RowDataBound"
                                                OnPageIndexChanging="gvPopReserva_PageIndexChanging">
                                                <Columns>
                                                    <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" />
                                                    <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" />
                                                    <asp:BoundField DataField="clienteRazaoSocial" />
                                                    <asp:BoundField DataField="pedidoItemQuantidade" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:###,###,###,#00.##}" ItemStyle-Width="80px" />
                                                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                    <asp:BoundField DataField="pedidoData" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px" />
                                                    <asp:BoundField DataField="condicaoPagamentoDescricao" ItemStyle-Width="150px" />
                                                    <asp:BoundField DataField="transportadoraNome" ItemStyle-Width="150px" />
                                                    <asp:BoundField DataField="pedidoDataEntregaPrevista" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                    <asp:BoundField DataField="pedidoSituacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                </Columns>
                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </fieldset>
                                    </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- Pop up PEDIDO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upPedido" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlPopPedido" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblPedido" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbPedidoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbPedidoClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <asp:GridView ID="gvPopPedido" runat="server"
                                            DataKeyNames="estabelecimentoId"
                                            OnRowDataBound="gvPopPedido_RowDataBound"
                                            OnPageIndexChanging="gvPopPedido_PageIndexChanging">
                                            <Columns>
                                                <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" />
                                                <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" />
                                                <asp:BoundField DataField="clienteRazaoSocial" />
                                                <asp:BoundField DataField="pedidoItemQuantidade" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:###,###,###,#00.##}" ItemStyle-Width="80px" />
                                                <asp:BoundField DataField="usuarioId" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField DataField="pedidoData" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px" />
                                                <asp:BoundField DataField="condicaoPagamentoDescricao" ItemStyle-Width="150px" />
                                                <asp:BoundField DataField="transportadoraNome" ItemStyle-Width="150px" />
                                                <asp:BoundField DataField="pedidoDataEntregaPrevista" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                <asp:BoundField DataField="pedidoSituacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                            </Columns>
                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- Pop up ALOCADA --%>
                <asp:UpdatePanel ID="upAlocada" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlPopAlocada" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround">
                            </div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblAlocada" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbAlocadaClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbAlocadaClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <asp:GridView ID="gvPopAlocada" runat="server"
                                        DataKeyNames="estabelecimentoId"
                                        OnRowDataBound="gvPopAlocada_RowDataBound"
                                        OnPageIndexChanging="gvPopAlocada_PageIndexChanging">
                                        <Columns>
                                            <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" />
                                            <asp:BoundField DataField="clienteRazaoSocial" />
                                            <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" />
                                            <asp:BoundField DataField="pedidoItemQuantidade" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:###,###,###,#00.##}" ItemStyle-Width="80px" />
                                            <asp:BoundField DataField="embarque" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="dataEmbarque" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" />
                                        </Columns>
                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
