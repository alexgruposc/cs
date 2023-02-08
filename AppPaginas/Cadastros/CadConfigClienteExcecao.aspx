<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadConfigClienteExcecao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadConfigClienteExcecao" %>
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
                                <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" HeaderText="Usuário" />
                                <asp:BoundField DataField="dataCriacao" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data Cadastro" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Atualizar" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# Eval("ExcecaoIdCapa")%>'
                                            ImageUrl="~/Imagens/find.png" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbCancelar" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblExcluir %>" CommandArgument='<%# Eval("ExcecaoIdCapa") + "|" + Eval("estabelecimentoDescricao") %>'
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
                                <h2>Configuração Clientes Exceção </h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="container body">
                                    
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <div class="col-md-6">
                                                <h2>
                                                    <asp:Label ID="lblEstabelecimento" runat="server" Text="Loja"></asp:Label></h2>
                                                <asp:DropDownList ID="dplEstabelecimento" runat="server" SkinID="ddlBootstrap" CssClass="selectpicker" AutoPostBack="true" OnSelectedIndexChanged="dplEstabelecimento_SelectedIndexChanged"></asp:DropDownList>
                                            </div>

                                        </div>
                                        </div>
                                    <asp:UpdatePanel ID="updGridsDados" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlGridsDados" runat="server">

                                                <br />

                                                <div class="form-row">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">

                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>Clientes não selecionados</h2>
                                                                        <div class="nav navbar-right panel_toolbox">
                                                                            <asp:LinkButton ID="btnAdicionarClientes" data-toggle="tooltip" data-placement="top" OnClick="btnAdicionarClientes_Click" title="Adicionar Clientes" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                    <div class="x_content">
                                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="demo-container">
                                                                                <asp:Panel ID="pnlClientesNaoSelecionados" runat="server" DefaultButton="btnPesqClienteNaoSelec">
                                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                                                                                        <ContentTemplate>

                                                                                            <div class="row">
                                                                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                                    <asp:Label ID="lblCodigoCliNaoSelec" runat="server" Text="Código ERP" />
                                                                                                    <asp:TextBox ID="txtCodigoCliNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="9" />
                                                                                                </div>
                                                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                                    <asp:Label ID="lblRazaoCliNaoSelec" runat="server" Text="Razão Social" />
                                                                                                    <asp:TextBox ID="txtRazaoCliNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" />
                                                                                                </div>

                                                                                                <div class="col-md-5" style="margin-top: 10px;">

                                                                                                    <asp:LinkButton ID="btnPesqClienteNaoSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqClienteNaoSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                                    <asp:LinkButton ID="btnLimparClienteNaoSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparClienteNaoSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                                </div>

                                                                                            </div>
                                                                                            <br />
                                                                                            <div class="pad-10 mt-2">
                                                                                                <br />

                                                                                                <asp:GridView DataKeyNames="clienteId,clienteIdERP,clienteRazaoSocial"
                                                                                                    runat="server"
                                                                                                    ID="gvClientesNaoSelecionados"
                                                                                                    AutoGenerateColumns="False"
                                                                                                    AllowPaging="True"
                                                                                                    SkinID="GridViewTable"
                                                                                                    OnPageIndexChanging="gvClientesNaoSelecionados_PageIndexChanging"
                                                                                                    OnRowDataBound="gvClientesNaoSelecionados_RowDataBound"
                                                                                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                    <Columns>
                                                                                                        <asp:TemplateField>
                                                                                                            <HeaderTemplate>
                                                                                                                <asp:CheckBox ID="chkTodosClientesNao" CssClass="flat" AutoPostBack="true" runat="server" Visible="false" OnCheckedChanged="chkTodosClientesNao_CheckedChanged" />
                                                                                                            </HeaderTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkClientesNaoSel" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkClientesNaoSel_CheckedChanged" />
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" />
                                                                                                        <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Razão Social" />

                                                                                                    </Columns>
                                                                                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                                </asp:GridView>
                                                                                                <div class="center">
                                                                                                    <asp:Localize ID="Localize3" runat="server"></asp:Localize>
                                                                                                </div>

                                                                                            </div>

                                                                                        </ContentTemplate>
                                                                                    </asp:UpdatePanel>
                                                                                </asp:Panel>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>Clientes selecionados</h2>
                                                                        <div class="nav navbar-right panel_toolbox">
                                                                            <asp:LinkButton ID="btnRemoverClientes" runat="server" data-toggle="tooltip" OnClick="btnRemoverClientes_Click" data-placement="top" title="Remover Clientes" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                    <div class="x_content">
                                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="demo-container">
                                                                                <asp:Panel ID="pnlClientesSelecionados" runat="server" DefaultButton="btnPesqClienteSelec">
                                                                                    <asp:UpdatePanel runat="server" ID="updClienteSelecionado">
                                                                                        <ContentTemplate>

                                                                                            <div class="row">
                                                                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                                    <asp:Label ID="lblCodigoClienteSelec" runat="server" Text="Código ERP" />
                                                                                                    <asp:TextBox ID="txtCodigoClienteSelec" runat="server" SkinID="txtBootstrap" MaxLength="9" TabIndex="17" />
                                                                                                </div>

                                                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                                    <asp:Label ID="lblRazaoClienteSelec" runat="server" Text="Razão Social" />
                                                                                                    <asp:TextBox ID="txtRazaoClienteSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                                </div>

                                                                                                <div class="col-md-5" style="margin-top: 10px;">
                                                                                                    <asp:LinkButton ID="btnPesqClienteSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqClienteSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                                    <asp:LinkButton ID="btnLimparClienteSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparClienteSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                                </div>

                                                                                            </div>
                                                                                            <br />
                                                                                            <div class="pad-10 mt-2">
                                                                                                <br />

                                                                                                <asp:GridView DataKeyNames="clienteId,clienteIdERP,clienteRazaoSocial "
                                                                                                    runat="server"
                                                                                                    ID="gvclientesSelecionados"
                                                                                                    AutoGenerateColumns="False"
                                                                                                    AllowPaging="True"
                                                                                                    SkinID="GridViewTable"
                                                                                                    OnPageIndexChanging="gvclientesSelecionados_PageIndexChanging"
                                                                                                    OnRowDataBound="gvclientesSelecionados_RowDataBound"
                                                                                                    OnRowCommand="gvclientesSelecionados_RowCommand"
                                                                                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                    <Columns>
                                                                                                        <asp:TemplateField>
                                                                                                            <HeaderTemplate>
                                                                                                                <asp:CheckBox ID="chkTodosClientesSel" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosClientesSel_CheckedChanged" />
                                                                                                            </HeaderTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkSelClientes" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelClientes_CheckedChanged" />
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" />
                                                                                                        <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Razão Social" />
                                                                                                    </Columns>
                                                                                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                                </asp:GridView>
                                                                                                <div class="center">
                                                                                                    <asp:Localize ID="Localize4" runat="server"></asp:Localize>
                                                                                                </div>

                                                                                            </div>

                                                                                        </ContentTemplate>
                                                                                    </asp:UpdatePanel>
                                                                                </asp:Panel>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
