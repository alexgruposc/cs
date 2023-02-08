<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadCondicoesPagamentoWE.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCondicoesPagamentoWE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<script src="../../Scripts/jquery-1.10.2.min.js"></script>--%>
    <script src="../../Scripts/jquery-3.1.0.js"></script>
    <%--   <script src="../../Scripts/bootstrap.js"></script>--%>
    <link href="../../Styles/custom.css" rel="stylesheet" />

    <link href="../../Styles/font-awesome.css" rel="stylesheet" />
    <link href="../../Styles/bootstrap-select.css" rel="stylesheet" />
    <script src="../../Scripts/bootstrap.js"></script>
    <script src="../../Scripts/bootstrap-select.js"></script>
    <br />
    <br />
    <asp:UpdatePanel ID="updCadastro" runat="server">
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updCadastro">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <script>
                
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

                    $(document).ready(function () {
          
                        $('.selectpicker').selectpicker();

                    });
                }
            </script>
            <asp:Panel ID="pnlGrid" runat="server" Width="100%" Height="100%">
                <asp:UpdatePanel ID="uppFiltros" runat="server">
                    <ContentTemplate>
                        <div style="display: table; text-align: center; width: 99%;">
                            <div style="width: 100%; margin-top: 10px;">
                                <div style="width: 100%; background-color: #13213C; text-align: left;">
                                    <table style="width: auto;">
                                        <tr>
                                            <td valign="middle">
                                                <asp:ImageButton ID="imbFiltros" runat="server" Height="15px" Width="15px" ImageAlign="AbsMiddle"
                                                    ImageUrl="~/Imagens/Colapse.png"
                                                    ToolTip="<%$ Resources:Resource, lblContrair %>"
                                                    OnClick="imbFiltros_Click" />
                                            </td>
                                            <td valign="middle">
                                                <asp:Label ID="lblFiltrosHeader" runat="server" SkinID="lblLastShowHide" Text="<%$ Resources:Resource, lblFiltros %>" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <asp:Panel ID="pnlFiltros" runat="server" SkinID="PnlMenu">
                                    <div style="display: table; text-align: center; width: 99%;">
                                        <div style="display: table; width: 100%;">

                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroCondicaoWE" runat="server" Text="Condição Pagto WE" />
                                                    <asp:DropDownList ID="dplFiltroCondicaoWE" SkinID="DropFiltro" runat="server"   />
                                                </div>
                                                    <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroDescricaoCondicaoWE" runat="server" Text="Descrição Cond. Pagamento WE" />
                                                    <asp:TextBox ID="txtDescricaoCondicaoWE" runat="server" TabIndex="2" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroCondicaoPagamento" runat="server" Text=" Cond. Pagamento Kraft" />
                                                    <asp:DropDownList ID="dplFiltroCondicaoPagamento" CssClass="selectpicker" SkinID="DropFiltro" runat="server"   />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <div class="line">
                                                        <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnDefault"
                                                            TabIndex="13" OnClick="btnFiltrosPesquisa_Click" Text="Pesquisar" />
                                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault"
                                                            TabIndex="14" OnClick="btnFiltrosLimpar_Click" Text="Limpar" />
                                                        <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnDefault" TabIndex="22" Text="Novo"
                                                            OnClick="btnFiltrosNovoCadastro_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <fieldset>
                    <div class="gridRegistros">
                        <asp:GridView ID="gvRegistros" runat="server"
                            OnPageIndexChanging="gvRegistros_PageIndexChanging"
                            OnRowDataBound="gvRegistros_RowDataBound"
                            OnRowCommand="gvRegistros_RowCommand"
                            EmptyDataText="Não foi encontrado nenhum resultado!">
                            <Columns>
                                <%--   <asp:BoundField DataField="configId" ItemStyle-HorizontalAlign="Center" />--%>
                                <asp:BoundField DataField="condicaoPagamentoWEId" ItemStyle-HorizontalAlign="Center" HeaderText="Código Pagamento" />
                                <asp:BoundField DataField="condicaoPagamentoWEDescricao" ItemStyle-HorizontalAlign="Center" HeaderText="Descrição" />
                                <asp:BoundField DataField="condicaoPagamentoId" ItemStyle-HorizontalAlign="Center" HeaderText="Código Pagamento Kraft" />
                                <asp:BoundField DataField="condicaoPagamentoDescricao" ItemStyle-HorizontalAlign="Center" HeaderText="Descrição" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Atualizar" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# Eval("codCondicaoId")%>'
                                            ImageUrl="~/Imagens/find.png" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbCancelar" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblExcluir %>" CommandArgument='<%# Eval("codCondicaoId") + "|" + Eval("condicaoPagamentoWEDescricao") %>'
                                            ImageUrl="~/Imagens/Fechar.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </fieldset>
            </asp:Panel>
            <asp:Panel ID="pnlDados" runat="server">
                <asp:UpdatePanel ID="uppDados" runat="server">
                    <ContentTemplate>
                        <div class="form-row">
                            <div class="col-lg-10"></div>
                            <div class="col-lg-2">
                                <asp:Button ID="btnSalvar" runat="server" SkinID="BtnDefault" Text="Salvar" OnClick="btnSalvar_Click" UseSubmitBehavior="false" />
                                <asp:Button ID="btnLimpar" runat="server" SkinID="BtnDefault" Text="Limpar" OnClick="btnLimpar_Click" UseSubmitBehavior="false" />
                                <asp:Button ID="btnVoltar" runat="server" SkinID="BtnDefault" Text="Voltar" OnClick="btnVoltar_Click" UseSubmitBehavior="false" />
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Configuração de Fabricante Fidelize</h2>
                                    <div class="nav navbar-right panel_toolbox">
                                        <br />
                                        <br />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <div class="form-group">
                                                    <asp:Label ID="lblcondicaoPagamentoWEId" runat="server" Text="Código"></asp:Label>
                                                    <asp:TextBox ID="txtcondicaoPagamentoWEId" runat="server" TabIndex="11" SkinID="txtBootstrap3"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-group">
                                                    <asp:Label ID="lblcondicaoPagamentoWEDescricao" runat="server" Text="Descrição Condição"></asp:Label>
                                                    <asp:TextBox ID="txtcondicaoPagamentoWEDescricao" runat="server" TabIndex="11" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="lblHeaderCondicaoPagamento" runat="server" SkinID="LabelForm" Text="Condição Pagamento Kraft" />
                                                <div class="input-group">
                                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                                      <asp:TextBox ID="txtCondicaoPagamento" runat="server" Enabled="false" Font-Bold="true" SkinID="txtBootstrap3" />
                                                        </div>
                                                      <div class="input-group-btn">
                                                     <asp:ImageButton ID="imbCondicaoPagamento" runat="server"
                                                        ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                        ToolTip="<%$ Resources:Resource, lblPesquisar %>" ImageUrl="~/Imagens/find.png"
                                                        OnClick="imbCondicaoPagamento_Click" />
                                                      </div>
                                                    </div>
                                                
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    
                <%-- CONDIÇÕES DE PAGAMENTO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppCondicaoPagamento" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbCondicaoPagamento" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlCondicaoPagamento" runat="server" DefaultButton="btnCondicaoPagamentoBuscar" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblCondicaoPagamentoHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbCondicaoPagamentoClose" runat="server"
                                                ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbCondicaoPagamentoClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <h2>
                                                <asp:Literal ID="ltrCondicaoPagamentoHeader" runat="server" />
                                            </h2>

                                            <%-- FILTROS --%>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblCondicaoPagamentoFiltroId" runat="server" />
                                                    <asp:TextBox ID="txtCondicaoPagamentoFiltroId" runat="server" SkinID="Filtro" MaxLength="30" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblCondicaoPagamentoFiltroDescricao" runat="server" />
                                                    <asp:TextBox ID="txtCondicaoPagamentoFiltroDescricao" runat="server" SkinID="Filtro" MaxLength="50" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Button ID="btnCondicaoPagamentoBuscar" runat="server" SkinID="ButtonLeft" OnClick="btnCondicaoPagamentoBuscar_Click" />
                                                    <asp:Button ID="btnCondicaoPagamentoLimpar" runat="server" SkinID="ButtonRight" OnClick="btnCondicaoPagamentoLimpar_Click" />
                                                </div>
                                            </div>

                                            <%-- GRID REGISTROS --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvCondicoesPagamento" runat="server"
                                                    DataKeyNames="condicaoPagamentoId,condicaoPagamentoDescricao"
                                                    OnRowCommand="gvCondicoesPagamento_RowCommand"
                                                    OnRowDataBound="gvCondicoesPagamento_RowDataBound"
                                                    OnPageIndexChanging="gvCondicoesPagamento_PageIndexChanging">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrCondicaoPagamentoId" runat="server" Text='<%# FormataStringSaida(Eval("condicaoPagamentoId"), txtCondicaoPagamentoFiltroId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrCondicaoPagamentoDescricao" runat="server" Text='<%# FormataStringSaida(Eval("condicaoPagamentoDescricao"), txtCondicaoPagamentoFiltroDescricao.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbSelect" runat="server" SkinID="ImgGrid"
                                                                    ImageUrl="~/Imagens/check.png" CommandName="Select"
                                                                    ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                    CommandArgument='<%# Eval("condicaoPagamentoId") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
</asp:Content>
