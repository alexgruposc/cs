<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadConfigValorExEstab.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadConfigValorExEstab" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <link href="../../Content/select2.css" rel="stylesheet" />
    <script src="../../Scripts/select2.js" type="text/javascript"></script>
    <script src="../../Scripts/select2.full.js" type="text/javascript"></script>
    <%--<script src="../../Scripts/jquery-1.10.2.min.js"></script>--%>
    <%--    <script type="text/javascript" src="../../Scripts/jquery-3.1.0.js"></script>--%>
    <script src="../../Scripts/bootstrap.js"></script>
    <link href="../../Styles/custom.css" rel="stylesheet" />

    <link href="../../Styles/font-awesome.css" rel="stylesheet" />

    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.css" />

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.js"></script>--%>
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
                                                    <CtlPeriodo:ControlPeriodo ID="CtlPeriodoInclusao" runat="server"
                                                        TabIndexDataInicio="1" TabIndexDataTermino="2"
                                                        ShowHeaderLine="false" />
                                                </div>


                                                <div class="boxPesquisaCurta">
                                                    <asp:Label ID="lblFiltroEstabelecimento" runat="server" Text="Loja:" />
                                                    <asp:DropDownList ID="dplFiltroEstabelecimento" SkinID="ddlBootstrapSelect" data-live-search="true" runat="server" />
                                                </div>
                                                <div class="boxPesquisaCurta">
                                                    <asp:Label ID="lblFiltroStatus" runat="server" Text="Usuário Cadastro" />
                                                    <asp:DropDownList ID="dplFiltroUsuario" SkinID="ddlBootstrapSelect" data-live-search="true" runat="server" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <div class="line">
                                                        <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnSuccess"
                                                            TabIndex="13" OnClick="btnFiltrosPesquisa_Click" Text="Pesquisar" />
                                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDanger"
                                                            TabIndex="14" OnClick="btnFiltrosLimpar_Click" Text="Limpar" />
                                                        <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnWarning" Text="Novo"
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
                                <asp:BoundField DataField="Estabelecimentoid" ItemStyle-HorizontalAlign="Center" HeaderText="Código Loja" />
                                <asp:BoundField DataField="estabelecimentoRazaoSocial" ItemStyle-HorizontalAlign="Center" HeaderText="Razão Social" />
                                <asp:BoundField DataField="DtIniValidade" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Início validade" />
                                <asp:BoundField DataField="DtIFimValidade" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fim validade" />
                                <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" HeaderText="Usuário" />
                                <asp:BoundField DataField="DataCadastro" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data Cadastro" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Atualizar" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# Eval("ValExcecaoId")%>'
                                            ImageUrl="~/Imagens/find.png" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbCancelar" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblExcluir %>" CommandArgument='<%# Eval("ValExcecaoId")+ "|" + Eval("Estabelecimentoid") + "|" + Eval("estabelecimentoRazaoSocial") %>'
                                            ImageUrl="~/Imagens/Fechar.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </fieldset>
                <asp:Button ID="btnClickGrid" runat="server" Style="display: none" Text="" OnClick="btnClickGrid_Click" />
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
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Configuração de Exceção  Valor</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="container body">
                                    <asp:HiddenField ID="hdconfigId" runat="server" />
                                    <br />

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <div class="col-md-6">
                                                <h2>
                                                    <asp:Label ID="lblEstabelecimento" runat="server" Text="Loja"></asp:Label></h2>
                                                <asp:DropDownList ID="dplEstabelecimento" runat="server" SkinID="ddlBootstrap" CssClass="selectpicker" AutoPostBack="true" OnSelectedIndexChanged="dplEstabelecimento_SelectedIndexChanged"></asp:DropDownList>
                                            </div>

                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="col-md-2">
                                                <asp:Label ID="lblValorTotal" runat="server" Text="Valor Total Limite " />
                                                <asp:TextBox ID="txtlValorTotal" runat="server" SkinID="txtBootstrap" AutoPostBack="true" OnTextChanged="txtlValorTotal_TextChanged" />
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Label ID="lblValorTotalPedidos" runat="server" Text="Valor Total Pedidos" />
                                                <asp:TextBox ID="txtValorTotalPedidos" runat="server" SkinID="txtBootstrap" Enabled="false" />
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Label ID="lblSaldoDisponivel" runat="server" Text="Saldo Disponível" />
                                                <asp:TextBox ID="txtSaldoDisponivel" runat="server" SkinID="txtBootstrap" Enabled="false" />
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="col-md-2">
                                                <asp:Label ID="lblAnoMes" runat="server" Text="Ano / Mês" />
                                                <asp:TextBox ID="txtAnoMes" runat="server" SkinID="txtBootstrap" Enabled="false" />
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Label ID="Label4" runat="server" Text="Data Início da Validade" />
                                                <asp:TextBox ID="txtInicioValidade" runat="server" SkinID="txtBootstrap" TextMode="Date" AutoPostBack="true" OnTextChanged="txtInicioValidade_TextChanged" />
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Label ID="Label5" runat="server" Text="Data Fim Validade" />
                                                <asp:TextBox ID="txtFimValidade" runat="server" SkinID="txtBootstrap" TextMode="Date" />
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="col-md-3">
                                                <asp:Label ID="lblUsuarioId" runat="server" Text="Usuário" />
                                                <asp:TextBox ID="txtUsuarioId" runat="server" SkinID="txtBootstrap" Enabled="false" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lblDataCadastro" runat="server" Text="Data Cadastro" />
                                                <asp:TextBox ID="txtDataCadastro" runat="server" SkinID="txtBootstrap" Enabled="false" />
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
</asp:Content>
