<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadRegraDistribuicaoEX.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadRegraDistribuicaoEX" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script src="../../Scripts/jquery-1.10.2.min.js"></script>--%>
    <script src="../../Scripts/jquery-3.1.0.js"></script>
    <%--   <script src="../../Scripts/bootstrap.js"></script>--%>
    <link href="../../Styles/custom.css" rel="stylesheet" />

    <link href="../../Styles/font-awesome.css" rel="stylesheet" />
    <script language="javascript">
        function shrinkandgrow(input) {
            var displayIcon = "img" + input;
            if ($("#" + displayIcon).attr("src") == "../../Imagens/plus.png") {
                $("#" + displayIcon).closest("tr")
                    .after("<tr><td></td><td colspan = '100%'>" + $("#" + input)
                        .html() + "</td></tr>");
                $("#" + displayIcon).attr("src", "../../Imagens/minus.png");
            } else {
                $("#" + displayIcon).closest("tr").next().remove();
                $("#" + displayIcon).attr("src", "../../Imagens/plus.png");
            }
        }
    </script>
    <style type="text/css">
        .borderLeft {
            border-left: solid 1px #aaaaaa;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="updCadastro" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnVoltar" />
            <asp:PostBackTrigger ControlID="btnExportacao" />
            <asp:PostBackTrigger ControlID="btnDownloadModelo" />
            <asp:PostBackTrigger ControlID="btnUpload" />
        </Triggers>
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

                                    <div class="pad-10 text-left">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <CtlPeriodo:ControlPeriodo ID="CtlPeriodoInclusao" runat="server"
                                                    TabIndexDataInicio="1" TabIndexDataTermino="2"
                                                    ShowHeaderLine="false" />
                                            </div>
                                            <div class="col-md-2">
                                                Motivo Exceção:<br />
                                                <asp:DropDownList ID="dplfiltroMotivoExcecao" runat="server" Style="width: 95%; max-width: 200px;" />
                                            </div>
                                            <div class="col-md-2">
                                                Tipo Regra:<br />
                                                <asp:DropDownList ID="dplFiltroTipoRegra" runat="server" Style="width: 95%; max-width: 200px;" />
                                            </div>
                                            <div class="col-md-2">
                                                Usuário Cadastro:<br />
                                                <asp:DropDownList ID="dplFiltroUsuario" runat="server" Style="width: 95%; max-width: 200px;" />
                                            </div>
                                            <div class="col-md-2">
                                                Id/Nome Produto:<br />
                                                <asp:TextBox ID="txtProduto" runat="server" Style="width: 95%; max-width: 200px;" />
                                            </div>
                                        </div>

                                        <div style="clear:both; min-height:10px;"></div>

                                        <div class="row">
                                            <div class="col-md-2">
                                                Código:<br />
                                                <asp:TextBox ID="txtCodigo" runat="server" MaxLength="30" Style="width: 95%; max-width: 150px;" />
                                            </div>
                                            <div class="col-md-2">
                                                Descrição Regra:<br />
                                                <asp:TextBox ID="txtDescricaoRegraFiltro" runat="server" Style="width: 95%; max-width: 200px;" />
                                            </div>
                                            <div class="col-md-2">
                                                Regra Ativa:<br />
                                                <asp:DropDownList ID="dplRegraAtivaFiltro" runat="server" Style="width: 95%; max-width: 150px;" />
                                            </div>
                                            <div class="col-md-2">
                                                Código ERP:<br />
                                                <asp:TextBox ID="txtClienteERP" runat="server" MaxLength="30" Style="width: 95%; max-width: 150px;" />
                                            </div>
                                            <div class="col-md-2">
                                                CNPJ Cliente:<br />
                                                <asp:TextBox ID="txtFiltrosClienteCnpj" runat="server" MaxLength="20" Style="width: 95%; max-width: 200px;" />
                                            </div>
                                            <div class="col-md-2">
                                                Loja:<br />
                                                <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" Style="width: 95%; max-width: 150px;" />
                                            </div>

                                        </div>

                                        <div style="clear:both; min-height:10px;"></div>

                                        <div class="row">
                                            <div class="col-md-12 text-right">
                                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnInfo" OnClick="btnFiltrosPesquisa_Click" Text="Pesquisar" />&nbsp;
                                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault" OnClick="btnFiltrosLimpar_Click" Text="Limpar" />&nbsp;
                                                <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnInfo" Text="Novo" OnClick="btnFiltrosNovoCadastro_Click" />&nbsp;
                                                <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="BtnDanger" OnClick="btnFiltrosExcluir_Click" Text="Excluir em Lote" Visible="false" />
                                                <asp:ImageButton ID="btnExportacao" runat="server" Width="25px" OnClick="btnExportacao_Click" Height="25px" ImageAlign="AbsMiddle" 
                                                    ImageUrl="~/Imagens/xlsx.png"
                                                    ToolTip="<%$ Resources:Resource, lblExportarExcel %>" Visible="true" />
                                                <asp:ImageButton ID="btnDownloadModelo" runat="server" Height="25px" Width="25px" OnClick="btnDownloadModelo_Click" ImageAlign="AbsMiddle"
                                                    ImageUrl="~/Imagens/download.png" 
                                                    ToolTip="Download Modelo Importação"/>
                                                <asp:ImageButton ID="btnImportarExcel" runat="server" Height="25px" Width="25px" OnClick="btnImportarExcel_Click" ImageAlign="AbsMiddle"
                                                    ImageUrl="~/Imagens/ImportXLS.png" 
                                                    ToolTip="Importar Excel"/>
                                            </div>
                                        </div>

                                        <div style="clear:both; min-height:10px;"></div>
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
                                <asp:BoundField DataField="RegraIDCapa" ItemStyle-HorizontalAlign="Center" HeaderText="Código" />
                                <asp:BoundField DataField="DescricaoRegra" ItemStyle-HorizontalAlign="Center" HeaderText="Descrição Regra" />
                                <asp:BoundField DataField="UsuarioId" ItemStyle-HorizontalAlign="Center" HeaderText="Usuário" />
                                <asp:BoundField DataField="TipoDescricao" ItemStyle-HorizontalAlign="Center" HeaderText="Tipo Regra" />
                                <asp:BoundField DataField="DataCadastro" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data Cadastro" />
                                <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" HeaderText="Ativo">
                                    <ItemTemplate>
                                        <asp:Literal ID="ltrRegraAtiva" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Atualizar" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# Eval("RegraIDCapa")%>'
                                            ImageUrl="~/Imagens/find.png" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbCancelar" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblExcluir %>" CommandArgument='<%# Eval("RegraIDCapa") + "|" + Eval("DescricaoRegra") %>'
                                            ImageUrl="~/Imagens/Fechar.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </fieldset>
                <asp:Panel ID="pnlModalUpload" runat="server" Visible="false" CssClass="Modal">
                    <div id="divModal">
                        <div class="modal-dialog modal-md">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:ImageButton ID="btnCloseModalUpload" CssClass="close" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                        Height="25px" TabIndex="28" ImageUrl="~/Imagens/Fechar.png" OnClick="btnCloseModalUpload_Click" />
                                    <h4 class="modal-title">
                                        <asp:Label ID="lblModalUpload" runat="server">Importar Arquivo Excel</asp:Label>
                                        <asp:Label ID="Lblalerta" runat="server" Visible="false" CssClass="alert alert-danger col-md-12 col-sm-12 col-xs-12" Text=""></asp:Label>
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <asp:FileUpload ID="fulArquivo" runat="server" />
                                    <asp:Button ID="btnUpload" runat="server" SkinID="BtnPrimary" Text="<%$ Resources:Resource, lblCarregar %>" OnClick="btnUpload_Click" />
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnCancelaUpload" runat="server" Text="Cancelar" SkinID="BtnDanger" OnClick="btnCancelaUpload_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="pnlDados" runat="server">
                <asp:UpdatePanel ID="uppDados" runat="server">
                    <ContentTemplate>
                        <div class="form-row">
                            <div class="col-lg-10"></div>
                            <div class="col-lg-2">
                                <asp:Button ID="btnSalvar" runat="server" SkinID="BtnSuccess" Text="Salvar" OnClick="btnSalvar_Click" UseSubmitBehavior="false" />
                                <asp:Button ID="btnLimpar" runat="server" SkinID="BtnDefault" Text="Limpar" OnClick="btnLimpar_Click" UseSubmitBehavior="false" />
                                <asp:Button ID="btnVoltar" runat="server" SkinID="BtnDefault" Text="Voltar" OnClick="btnVoltar_Click" UseSubmitBehavior="false" />
                            </div>
                        </div>
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Configuração de Exceção estabelecimento
                                </h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="container body">


                                    <br />

                                    <div class="form-row">
                                        <div class="form-group col-md-3">

                                            <asp:Label ID="lblDescricaoRegra" runat="server" Text="Descrição Regra Distribuição"></asp:Label>
                                            <asp:TextBox ID="txtDescricaoRegra" runat="server" SkinID="txtBootstrap" />
                                        </div>
                                        <div class="form-group col-md-3">

                                            <asp:Label ID="lblTipoRegra" runat="server" Text="Tipo de Regra"></asp:Label>
                                            <asp:DropDownList ID="dplTipoRegra" runat="server" SkinID="ddlBootstrap" CssClass="selectpicker" AutoPostBack="true" OnTextChanged="dplTipoRegra_TextChanged"></asp:DropDownList>
                                        </div>
                                        <div class="form-group col-md-3">

                                            <asp:Label ID="Label1" runat="server" Text="Motivo Exceção"></asp:Label>
                                            <asp:DropDownList ID="dplMotivoExcecao" runat="server" SkinID="ddlBootstrap" CssClass="selectpicker" AutoPostBack="true" OnTextChanged="dplMotivoExcecao_TextChanged"></asp:DropDownList>
                                        </div>

                                        <div class="form-group col-md-3">

                                            <asp:Label ID="lblRegraAtiva" runat="server" Text="Regra Ativa" />
                                            <asp:CheckBox ID="chkRegraAtiva" runat="server" TabIndex="16" />
                                        </div>
                                    </div>
                                    <asp:UpdatePanel ID="updGridsDados" runat="server">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlGridsDados" runat="server">
                                                <asp:Panel ID="pnlRegraProduto" runat="server">
                                                    <div class="form-row">
                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">

                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="x_panel">
                                                                        <div class="x_title">
                                                                            <h2>Itens não selecionados  </h2>
                                                                            <div class="nav navbar-right panel_toolbox">
                                                                                <asp:LinkButton ID="btnAdicionarItens" data-toggle="tooltip" data-placement="top" OnClick="btnAdicionarItens_Click" title="Adicionar Itens" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                                            </div>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                        <div class="x_content">
                                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                                <div class="demo-container">
                                                                                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnPesqItemNaoSelec">
                                                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                                                                            <ContentTemplate>
                                                                                                <div class="row">
                                                                                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                                        <asp:Label ID="lblCodigoItemNaoSelec" runat="server" Text="Código Item" />
                                                                                                        <asp:TextBox ID="txtCodigoItemNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                                                    </div>

                                                                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                                        <asp:Label ID="lblDescItemNaoSelec" runat="server" Text="Descrição" />
                                                                                                        <asp:TextBox ID="txtDescItemNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                                    </div>

                                                                                                    <div class="col-md-3" style="margin-top: 10px;">
                                                                                                        <asp:LinkButton ID="btnPesqItemNaoSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqItemNaoSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                                        <asp:LinkButton ID="btnLimparItemNaoSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparItemNaoSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                                    </div>

                                                                                                </div>
                                                                                                <br />
                                                                                                <div class="pad-10 mt-2">
                                                                                                    <br />
                                                                                                    <asp:GridView DataKeyNames="itemId, itemDescricao, itemInfComplementar"
                                                                                                        runat="server"
                                                                                                        ID="gvItensNaoSelecionados"
                                                                                                        AutoGenerateColumns="False"
                                                                                                        AllowPaging="True"
                                                                                                        SkinID="GridViewTable"
                                                                                                        OnPageIndexChanging="gvItensNaoSelecionados_PageIndexChanging"
                                                                                                        OnRowDataBound="gvItensNaoSelecionados_RowDataBound"
                                                                                                        EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                        <Columns>
                                                                                                            <asp:TemplateField>
                                                                                                                <HeaderTemplate>
                                                                                                                    <asp:CheckBox ID="chkTodosItensNaoSel" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosItensNaoSel_CheckedChanged" />
                                                                                                                </HeaderTemplate>
                                                                                                                <ItemTemplate>
                                                                                                                    <asp:CheckBox ID="chkNaoSelItens" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelItens_CheckedChanged" />
                                                                                                                </ItemTemplate>
                                                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                                            </asp:TemplateField>
                                                                                                            <asp:BoundField DataField="itemId" HeaderText="Código" />
                                                                                                            <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />
                                                                                                            <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />
                                                                                                        </Columns>
                                                                                                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                                    </asp:GridView>
                                                                                                    <div class="center">
                                                                                                        <asp:Localize ID="Localize1" runat="server"></asp:Localize>
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
                                                                            <h2>Itens selecionados</h2>
                                                                            <div class="nav navbar-right panel_toolbox">
                                                                                <asp:LinkButton ID="btnRemoverItens" runat="server" data-toggle="tooltip" OnClick="btnRemoverItens_Click" data-placement="top" title="Remover Itens" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                                            </div>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                        <div class="x_content">
                                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                                <div class="demo-container">
                                                                                    <asp:Panel ID="pnlItensSelecionados" runat="server" DefaultButton="btnPesqItemSelec">
                                                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                                                                                            <ContentTemplate>
                                                                                                <div class="row">
                                                                                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                                        <asp:Label ID="lblCodigoItemSelec" runat="server" Text="Código Item" />
                                                                                                        <asp:TextBox ID="txtCodigoItemSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                                                    </div>

                                                                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                                        <asp:Label ID="lblDescItemSelec" runat="server" Text="Descrição" />
                                                                                                        <asp:TextBox ID="txtDescItemSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                                    </div>

                                                                                                    <div class="col-md-3" style="margin-top: 10px;">
                                                                                                        <asp:LinkButton ID="btnPesqItemSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqItemSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                                        <asp:LinkButton ID="btnLimparItemSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparItemSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                                    </div>

                                                                                                </div>
                                                                                                <br />
                                                                                                <div class="pad-10 mt-2">
                                                                                                    <br />
                                                                                                    <asp:GridView DataKeyNames="itemId,itemDescricao,itemInfComplementar"
                                                                                                        runat="server"
                                                                                                        ID="gvItensSelecionados"
                                                                                                        AutoGenerateColumns="False"
                                                                                                        AllowPaging="True"
                                                                                                        SkinID="GridViewTable"
                                                                                                        OnRowCommand="gvItensSelecionados_RowCommand"
                                                                                                        OnPageIndexChanging="gvItensSelecionados_PageIndexChanging"
                                                                                                        OnRowDataBound="gvItensSelecionados_RowDataBound"
                                                                                                        EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                        <Columns>
                                                                                                            <asp:TemplateField>
                                                                                                                <ItemTemplate>
                                                                                                                    <a href="JavaScript:shrinkandgrow('div<%# Eval("itemId")   %>');">
                                                                                                                        <img alt="Itens" id='imgdiv<%# Eval("itemId")  %>' src="../../Imagens/plus.png" />
                                                                                                                    </a>
                                                                                                                    <div id='div<%# Eval("itemId")  %>' style="display: none;">
                                                                                                                        <div style="display: table; width: 100%;">
                                                                                                                            <asp:GridView DataKeyNames="estabelecimentoId,estabelecimentoRazaoSocial,ufId,CNPJ,itemId"
                                                                                                                                runat="server"
                                                                                                                                ID="gvSelEstabelec"
                                                                                                                                AutoGenerateColumns="False"
                                                                                                                                AllowPaging="false"
                                                                                                                                SkinID="GridViewTable_NoPages"                                                                                                                                
                                                                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                                                <Columns>
                                                                                                                                    <asp:BoundField DataField="estabelecimentoId" HeaderText="Código Loja" />
                                                                                                                                    <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Origem" />
                                                                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                                                                    <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                                                                                                                </Columns>
                                                                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                                                            </asp:GridView>
                                                                                                                            <asp:GridView DataKeyNames=""
                                                                                                                                runat="server"
                                                                                                                                ID="gvSelClienteItem"
                                                                                                                                AutoGenerateColumns="False"
                                                                                                                                AllowPaging="True"
                                                                                                                                SkinID="GridViewTable"
                                                                                                                                OnPageIndexChanging="gvSelClienteItem_PageIndexChanging"
                                                                                                                                OnRowDataBound="gvSelClienteItem_RowDataBound"
                                                                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                                                <Columns>
                                                                                                                                    <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" />
                                                                                                                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Razão Social" />
                                                                                                                                </Columns>
                                                                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                                                            </asp:GridView>
                                                                                                                            <asp:GridView DataKeyNames=""
                                                                                                                                runat="server"
                                                                                                                                ID="gvSelUF"
                                                                                                                                AutoGenerateColumns="False"
                                                                                                                                AllowPaging="false"
                                                                                                                                SkinID="GridViewTable_NoPages"
                                                                                                                                OnRowDataBound="gvSelUF_RowDataBound"
                                                                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                                                <Columns>
                                                                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                                                                    <asp:BoundField DataField="estadoNome" HeaderText="Estado" />
                                                                                                                                </Columns>
                                                                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                                                            </asp:GridView>
                                                                                                                            <div class="center">
                                                                                                                                <asp:Localize ID="lblgvSelEstabelePageInfo" runat="server"></asp:Localize>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </ItemTemplate>
                                                                                                            </asp:TemplateField>
                                                                                                            <asp:TemplateField>
                                                                                                                <HeaderTemplate>
                                                                                                                    <asp:CheckBox ID="chkTodosItensSel" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosItensSel_CheckedChanged" />
                                                                                                                </HeaderTemplate>
                                                                                                                <ItemTemplate>
                                                                                                                    <asp:CheckBox ID="chkSelItens" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelItens_CheckedChanged" />
                                                                                                                </ItemTemplate>
                                                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                                            </asp:TemplateField>
                                                                                                            <asp:BoundField DataField="itemId" HeaderText="Código" />
                                                                                                            <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />
                                                                                                            <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />
                                                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" HeaderText="Loja">
                                                                                                                <ItemTemplate>
                                                                                                                    <asp:ImageButton ID="btnCadEstab" runat="server" CommandName="CadastrarEstabelecimento" Width="21px" Height="21px" Visible="false"
                                                                                                                        ToolTip="<%$ Resources:Resource, lblCadEstabelecimento %>" CommandArgument='<%# Eval("itemId") +"|" + Eval("itemDescricao")  %>'
                                                                                                                        ImageUrl="~/Imagens/btnEdit.png" />
                                                                                                                    <asp:ImageButton ID="btnRemoveEstab" runat="server" CommandName="RemoverEstabelecimento" CommandArgument='<%# Eval("itemId") + "|" %>' Visible="false"
                                                                                                                        ToolTip="Remover Estabelecimentos" Width="21px" Height="21px"
                                                                                                                        ImageUrl="~/Imagens/recycle.png" />
                                                                                                                </ItemTemplate>
                                                                                                            </asp:TemplateField>
                                                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" HeaderText="Cliente">
                                                                                                                <ItemTemplate>
                                                                                                                    <asp:ImageButton ID="btnCadCliente" runat="server" CommandName="CadastrarCliente" Width="21px" Height="21px" Visible="false"
                                                                                                                        ToolTip="Cadastrar Cliente" CommandArgument='<%# Eval("itemId") +"|" + Eval("itemDescricao")  %>'
                                                                                                                        ImageUrl="~/Imagens/Cliente.png" />

                                                                                                                </ItemTemplate>
                                                                                                            </asp:TemplateField>
                                                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" HeaderText="UF">
                                                                                                                <ItemTemplate>
                                                                                                                    <asp:ImageButton ID="btnCadastrarUF" runat="server" CommandName="CadastrarUF" Width="21px" Height="21px" Visible="false"
                                                                                                                        ToolTip="Cadastrar UF" CommandArgument='<%# Eval("itemId") +"|" + Eval("itemDescricao")  %>'
                                                                                                                        ImageUrl="~/Imagens/Map.png" />

                                                                                                                </ItemTemplate>
                                                                                                            </asp:TemplateField>
                                                                                                        </Columns>
                                                                                                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                                    </asp:GridView>
                                                                                                    <div class="center">
                                                                                                        <asp:Localize ID="Localize2" runat="server"></asp:Localize>
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

                                                <br />

                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
            
            <asp:Panel ID="pnlExcluirLote" runat="server" Visible="false">
                <div>
                    <fieldset>
<%--                        <legend>Excluir Em Lote</legend>--%>
                        <asp:Panel ID="pnlConfirmaRemoverLote" runat="server" SkinID="PnlMenu">
                            <div class="row">
                                <div class="col-md-12 text-right">
                                    <asp:Button ID="btnConfirmaExcluirLote" runat="server" SkinID="BtnDanger" Text="Confirma Excluir Lote" OnClick="btnConfirmaExcluirLote_Click"/>
                                    <asp:Button ID="btnCancelaExcluirLote" runat="server" SkinID="BtnDefault-sm" Text="Voltar" OnClick="btnCancelaExcluirLote_Click" />
                                </div>
                            </div>
                            <div style="clear:both; min-height:10px;"></div>
                        </asp:Panel>
                    </fieldset>
                </div>
                <div class="gridRegistros">
                    <asp:GridView ID="grdExcluirLote" runat="server" 
                        OnPageIndexChanging="grdExcluirLote_PageIndexChanging"
                        OnRowDataBound="grdExcluirLote_RowDataBound" 
                        DataKeyNames="RegraIDCapa"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Selecionar">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkSelecionaTodos" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelecionaTodos_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelecionaExcluir" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelecionaExcluir_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RegraIDCapa" ItemStyle-HorizontalAlign="Center" HeaderText="Código" />
                            <asp:BoundField DataField="DescricaoRegra" ItemStyle-HorizontalAlign="Center" HeaderText="Descrição Regra" />
                            <asp:BoundField DataField="UsuarioId" ItemStyle-HorizontalAlign="Center" HeaderText="Usuário" />
                            <asp:BoundField DataField="DataCadastro" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data Cadastro" />
                            <asp:CheckBoxField DataField="RegraAtiva" ItemStyle-HorizontalAlign="Center" HeaderText="Ativo" />
                        </Columns>
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>



    <div style="position: absolute;">
        <asp:UpdatePanel ID="updModalItemEstab" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlModalItemEstab" runat="server" CssClass="Modal" Visible="false">
                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 80%; left: 5%; height: 80%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label11" runat="server" ForeColor="White" Text="Cadastro de estabelecimento por item" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFechaItemEstab" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFechaItemEstab_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <asp:HiddenField ID="hdItemId" runat="server" />
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblDescricaoItem" runat="server" Text="Item" />
                                        <asp:TextBox ID="txtDescricaoItemModal" runat="server" Enabled="false" SkinID="txtBootstrap3"></asp:TextBox>
                                    </div>
                                </div>
                                </br>
                                 </br>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">

                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>Estabelecimentos não selecionados  </h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnAddEstabItens" data-toggle="tooltip" data-placement="top" OnClick="btnAddEstabItens_Click" title="Adicionar Estabelecimentos" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlEstab" runat="server" DefaultButton="btnPesqEstabItenssNaoSelec">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                                                    <ContentTemplate>
                                                                        <div class="row">
                                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblCodigEstabItensNaoSelec" runat="server" Text="Código Loja" />
                                                                                <asp:TextBox ID="txtCodigoEstabItensNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblDescEstabItensNaoSelec" runat="server" Text="Descrição" />
                                                                                <asp:TextBox ID="txtDescEstabItensNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>
                                                                            <div class="col-md-4" style="margin-top: 10px;">
                                                                                <asp:LinkButton ID="btnPesqEstabItenssNaoSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqEstabItenssNaoSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                <asp:LinkButton ID="btnLimparEstabItensNaoSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparEstabItensNaoSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                        <br />
                                                                        <div class="pad-10 mt-2">
                                                                            <br />
                                                                            <asp:GridView DataKeyNames="estabelecimentoId, estabelecimentoRazaoSocial,ufId, CNPJ"
                                                                                runat="server"
                                                                                ID="gvEstabItensNaoSelec"
                                                                                AutoGenerateColumns="false"
                                                                                AllowPaging="false"
                                                                                SkinID="GridViewTable_NoPages"
                                                                                OnRowDataBound="gvEstabItensNaoSelec_RowDataBound"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosNaoSelEstabelec" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosNaoSelEstabelec_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkNaoSelEstabelec" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelEstabelec_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" />
                                                                                    <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />
                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                    <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                                                                </Columns>
                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                            </asp:GridView>
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
                                                    <h2>Estbelecimentos selecionados</h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnRemoverEstabItens" runat="server" data-toggle="tooltip" OnClick="btnRemoverEstabItens_Click" data-placement="top" title="Remover Estabelecimentos" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlEstabSelc" runat="server" DefaultButton="btnPesqEstabItensSelec">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel7">
                                                                    <ContentTemplate>
                                                                        <div class="row">
                                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblCodigoEstabItensSelec" runat="server" Text="Código Loja" />
                                                                                <asp:TextBox ID="txtCodigoEstabItensSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblDescEstabItensSelec" runat="server" Text="Descrição" />
                                                                                <asp:TextBox ID="txtDescEstabItensSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>
                                                                            <div class="col-md-4" style="margin-top: 10px;">
                                                                                <asp:LinkButton ID="btnPesqEstabItensSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqEstabItensSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                <asp:LinkButton ID="btnLimparEstabItensSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparEstabItensSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                        <br />
                                                                        <div class="pad-10 mt-2">
                                                                            <br />
                                                                            <asp:GridView DataKeyNames="estabelecimentoId,estabelecimentoRazaoSocial,ufId,CNPJ"
                                                                                runat="server"
                                                                                ID="gvEstabItensSelec"
                                                                                AutoGenerateColumns="False"
                                                                                AllowPaging="false"
                                                                                SkinID="GridViewTable_NoPages"
                                                                                OnPageIndexChanging="gvEstabItensSelec_PageIndexChanging"
                                                                                OnRowDataBound="gvEstabItensSelec_RowDataBound"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosSelEstabele" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelEstabele_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkSelEstabelec" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelEstabelec_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" />
                                                                                    <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />
                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                    <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                                                                </Columns>
                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                            </asp:GridView>
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
                        </fieldset>
                    </div>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div style="position: absolute;">
        <asp:UpdatePanel ID="updModalCliente" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlModalCliente" runat="server" CssClass="Modal" Visible="false">
                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 80%; left: 5%; height: 80%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Cadastro de Clientes por item" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFechaItemCli" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFechaItemCli_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <asp:HiddenField ID="hdfCliente" runat="server" />
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblDescricaoItemCliente" runat="server" Text="Item" />
                                        <asp:TextBox ID="txtDescricaoItemCliente" runat="server" Enabled="false" SkinID="txtBootstrap3"></asp:TextBox>
                                    </div>
                                </div>
                                </br>
                                 </br>
                               <%--    <div class="form-row">--%>
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
                                                                                <asp:TextBox ID="txtCodigoCliNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="9" TabIndex="17" />
                                                                            </div>

                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblRazaoCliNaoSelec" runat="server" Text="Razão Social" />
                                                                                <asp:TextBox ID="txtRazaoCliNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>

                                                                            <div class="col-md-4" style="margin-top: 10px;">
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
                                                                                            <asp:CheckBox ID="chkTodosClientesNao" AutoPostBack="true" runat="server" Visible="false" OnCheckedChanged="chkTodosClientesNao_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkClientesNaoSel" runat="server" AutoPostBack="true" OnCheckedChanged="chkClientesNaoSel_CheckedChanged" />
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

                                                                            <div class="col-md-4" style="margin-top: 10px;">
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
                                                                                    <asp:BoundField DataField="clienteIdERP" HeaderText="Código" />
                                                                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Descrição" />
                                                                                    <%--  <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:ImageButton ID="btnAlterar" runat="server" CommandName="AlterarItens" Width="21px" Height="21px"
                                                                                                                    ToolTip="<%$ Resources:Resource, lblCadItem %>" CommandArgument='<%# Eval("clienteId") +"|" + Eval("clienteRazaoSocial")  %>'
                                                                                                                    ImageUrl="~/Imagens/btnEdit.png" />

                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>--%>
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

                                <%--</div>--%>
                        </div>
                        </fieldset>
                    </div>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div style="position: absolute;">
        <asp:UpdatePanel ID="updModalItemUF" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlModalItemUF" runat="server" CssClass="Modal" Visible="false">
                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 80%; left: 5%; height: 80%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Cadastro de estabelecimento por item" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFechaItemUF" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png" OnClick="btnFechaItemUF_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <div class="col-md-12 col-sm-12 col-xs-12">

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblDescricaoItemUF" runat="server" Text="Item" />
                                        <asp:TextBox ID="txtDescricaoItemUFModal" runat="server" Enabled="false" SkinID="txtBootstrap3"></asp:TextBox>
                                    </div>
                                </div>
                                </br>
                                 </br>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">

                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>UF não selecionados  </h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnAddUFItens" data-toggle="tooltip" data-placement="top" OnClick="btnAddUFItens_Click" title="Adicionar UF" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlUF" runat="server" DefaultButton="btnPesqUFItensNaoSelec">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                                                    <ContentTemplate>
                                                                        <div class="row">
                                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblCodigUFItensNaoSelec" runat="server" Text="Código UF" />
                                                                                <asp:TextBox ID="txtCodigoUFItensNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblDescUFItensNaoSelec" runat="server" Text="Descrição UF" />
                                                                                <asp:TextBox ID="txtDescUFItensNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>
                                                                            <div class="col-md-4" style="margin-top: 10px;">
                                                                                <asp:LinkButton ID="btnPesqUFItensNaoSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqUFItensNaoSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                <asp:LinkButton ID="btnLimparUFItensNaoSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparUFItensNaoSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                        <br />
                                                                        <div class="pad-10 mt-2">
                                                                            <br />
                                                                            <asp:GridView DataKeyNames="ufId,estadoNome"
                                                                                runat="server"
                                                                                ID="gvUFItensNaoSelec"
                                                                                AutoGenerateColumns="False"
                                                                                AllowPaging="false"
                                                                                SkinID="GridViewTable_NoPages"
                                                                                OnRowDataBound="gvUFItensNaoSelec_RowDataBound"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosNaoSelUFelec" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosNaoSelUFelec_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkNaoSelUFSelec" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelUFSelec_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                    <asp:BoundField DataField="estadoNome" HeaderText="Descrição" />
                                                                                </Columns>
                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                            </asp:GridView>
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
                                                    <h2>UF selecionados</h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnRemoverUFItens" runat="server" data-toggle="tooltip" OnClick="btnRemoverUFItens_Click" data-placement="top" title="Remover UF" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlUFSelc" runat="server" DefaultButton="btnPesqUFItensSelec">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                                                    <ContentTemplate>
                                                                        <div class="row">
                                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblCodigoUFItensSelec" runat="server" Text="Código UF" />
                                                                                <asp:TextBox ID="txtCodigoUFItensSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblDescUFItensSelec" runat="server" Text="Descrição UF" />
                                                                                <asp:TextBox ID="txtDescUFItensSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>
                                                                            <div class="col-md-4" style="margin-top: 10px;">
                                                                                <asp:LinkButton ID="btnPesqUFItensSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqUFItensSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                <asp:LinkButton ID="btnLimparUFItensSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparUFItensSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                        <br />
                                                                        <div class="pad-10 mt-2">
                                                                            <br />
                                                                            <asp:GridView DataKeyNames="ufId,estadoNome"
                                                                                runat="server"
                                                                                ID="gvUFItensSelec"
                                                                                AutoGenerateColumns="False"
                                                                                AllowPaging="false"
                                                                                SkinID="GridViewTable_NoPages"
                                                                                OnRowDataBound="gvUFItensSelec_RowDataBound"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosSelUF" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelUF_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkSelUF" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelUF_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                    <asp:BoundField DataField="estadoNome" HeaderText="Descrição" />
                                                                                </Columns>
                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                            </asp:GridView>
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
                        </fieldset>
                    </div>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
