<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadConfigClienteFidelize.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadConfigClienteFidelize" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jQuery-2.1.4.min.js"></script>
    <%--<script src="../../Scripts/jquery-1.10.2.min.js"></script>--%>
<%--    <script type="text/javascript" src="../../Scripts/jquery-3.1.0.js"></script>--%>
       <script src="../../Scripts/bootstrap.js"></script>
    <link href="../../Styles/custom.css" rel="stylesheet" />

    <link href="../../Styles/font-awesome.css" rel="stylesheet" />

    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.css" />

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.js"></script>--%>


    <script type="text/javascript">
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
    <br />
    <br />
    <asp:UpdatePanel ID="updCadastro" runat="server">
        <Triggers>
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

                <%--    <legend>
                        <asp:Literal ID="ltrGridHeader" runat="server" />
                    </legend>--%>
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


                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroFabricante" runat="server" Text="Fabricante" />
                                                    <asp:DropDownList ID="dplFiltroFabricante" SkinID="DropFiltro" runat="server" TabIndex="11" />
                                                </div>

                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroStatus" runat="server" Text="Usuário Cadastro" />
                                                    <asp:DropDownList ID="dplFiltroUsuario" SkinID="DropFiltro" runat="server" TabIndex="11" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <div class="line">
                                                        <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnDefault"
                                                            TabIndex="13" OnClick="btnFiltrosPesquisa_Click" Text="Pesquisar" />
                                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault"
                                                            TabIndex="14" OnClick="btnFiltrosLimpar_Click" Text="Limpar" />
                                                        <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnDefault" TabIndex="22" Text="Novo"
                                                            OnClick="btnFiltrosNovoCadastro_Click" />

                                                        <asp:ImageButton ID="btnImportacao" runat="server" Width="25px" OnClick="btnImportacao_Click"
                                                            Height="25px" ImageAlign="AbsMiddle" TabIndex="15" ImageUrl="~/Imagens/ImportXLS.png"
                                                            ToolTip="<%$ Resources:Resource, lblImportacaoCSV %>" Visible="true" />
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
                                <asp:BoundField DataField="fabricanteId" ItemStyle-HorizontalAlign="Center" HeaderText="Código" />
                                <asp:BoundField DataField="Descricao" ItemStyle-HorizontalAlign="Center" HeaderText="Nome Fabricante" />
                                <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" HeaderText="Usuário" />
                                <asp:BoundField DataField="dataCriacao" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data Cadastro" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Atualizar" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# Eval("configId")%>'
                                            ImageUrl="~/Imagens/find.png" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbCancelar" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblExcluir %>" CommandArgument='<%# Eval("configId") + "|" + Eval("fabricanteNome") %>'
                                            ImageUrl="~/Imagens/Fechar.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </fieldset>
                <asp:Panel ID="pnlModalUpload" runat="server" Visible="false" CssClass="Modal">
                    <!-- Modal -->
                    <div id="myModal">
                        <div class="modal-dialog modal-md">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:ImageButton ID="btnCloseModal" CssClass="close" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                        Height="25px" TabIndex="28" ImageUrl="~/Imagens/Fechar.png" OnClick="btnCloseModal_Click" CommandArgument="ModalEscala" />
                                    <h4 class="modal-title">
                                        <asp:Label ID="lblModalUpload" runat="server"></asp:Label>
                                        <asp:Label ID="Lblalerta" runat="server" Visible="false" CssClass="alert alert-danger col-md-12 col-sm-12 col-xs-12" Text=""></asp:Label>
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <asp:FileUpload ID="fulArquivo" runat="server" />
                                    <asp:Button ID="btnUpload" runat="server" SkinID="BtnPrimary" Text="<%$ Resources:Resource, lblCarregar %>" OnClick="btnUpload_Click" />

                                </div>
                                <div class="modal-footer">
                                    <asp:Button Text="Cancelar" SkinID="BtnDanger" ID="btnCancelaModal" OnClick="btnCancelaModal_Click" runat="server" />

                                </div>
                            </div>

                        </div>
                    </div>
                </asp:Panel>
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
                                <h2>Configuração de Fabricante Fidelize
                                </h2>

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
                                                    <asp:Label ID="lblFabricante" runat="server" Text="Fabricante"></asp:Label></h2>
                                                <asp:DropDownList ID="dplFabricante" runat="server" SkinID="ddlBootstrap" CssClass="selectpicker" AutoPostBack="true" OnTextChanged="dplFabricante_TextChanged"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                       <%-- <h2>Fluxo Total</h2>--%>
                                                        <asp:CheckBox ID="chkFluxoTotal" runat="server" Visible="false" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <h2>Trava Venda Item </h2>
                                                        <asp:CheckBox ID="chkTestarItemSemCliente" runat="server" />&nbsp;Obrigatório vinculação do item ao cliente.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>                                    

                                    <asp:UpdatePanel ID="updGridsDados" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlGridsDados" runat="server">
                                                <div class="form-row">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>Estabelecimento não selecionados </h2>
                                                                        <div class="nav navbar-right panel_toolbox">

                                                                            <asp:LinkButton ID="btnAdcionarEstabelecimentos" data-toggle="tooltip" data-placement="top" OnClick="btnAdcionarEstabelecimentos_Click" title="Adicionar Estabelecimentos" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>

                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                    <div class="x_content">
                                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="demo-container">
                                                                                <asp:Panel ID="pnlEstabelecimentosNaoSelecionado" runat="server" DefaultButton="btnPesquisarNaoSelEstabele">
                                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                                                                        <ContentTemplate>
                                                                                            <div class="row">

                                                                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                                    <asp:Label ID="lblCodigoEstabNaoSelec" runat="server" Text="Código" />
                                                                                                    <asp:TextBox ID="txtCodigoEstabNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                                                </div>

                                                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                                    <asp:Label ID="lblNomeSelecionado" runat="server" Text="Razão Social" />
                                                                                                    <asp:TextBox ID="txtRazaoEstabNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                                </div>

                                                                                                <div class="col-md-4" style="margin-top: 10px;">
                                                                                                    <asp:LinkButton ID="btnPesquisarNaoSelEstabele" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesquisarNaoSelEstabele_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                                    <asp:LinkButton ID="btnLimparNaoSelEstabele" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparNaoSelEstabele_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                                    <%--<asp:Button ID="btnPesquisarEstabNaoSelec" runat="server" SkinID="BtnDefault-sm" TabIndex="20" OnClick="btnPesquisarEstabNaoSelec_Click"   />
                                                                                                    <asp:Button ID="btnLimparEstabNaoSelec" runat="server" SkinID="BtnDefault-sm" TabIndex="21" OnClick="btnLimparEstabNaoSelec_Click"  />--%>
                                                                                                </div>

                                                                                            </div>
                                                                                            <br />
                                                                                            <%-- <div class="row">
                                                                                                <div class="col-md-2">
                                                                                                    Estabelecimento:<br />
                                                                                                    <asp:TextBox ID="txt_NaoSelEstabelec" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do estabelecimento" />
                                                                                                  
                                                                                                </div>
                                                                                                 <div class="col-md-3">                                                                                                   
                                                                                                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do estabelecimento" />
                                                                                                        </div>
                                                                                                <div class="col-md-4">
                                                                                                    <asp:LinkButton ID="btn_NaoSelEstabelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_NaoSelEstabelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                                    <asp:LinkButton ID="btn_NaoLimpaSelEstabelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_NaoLimpaSelEstabelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                                </div>
                                                                                            </div>--%>
                                                                                            <div class="pad-10 mt-2">
                                                                                                <br />
                                                                                                <asp:GridView DataKeyNames="estabelecimentoId, estabelecimentoRazaoSocial,ufId, CNPJ"
                                                                                                    runat="server"
                                                                                                    SkinID="GridViewTable"
                                                                                                    ID="gvNaoSelEstabelec"
                                                                                                    AutoGenerateColumns="False"
                                                                                                    AllowPaging="false"
                                                                                                    OnPageIndexChanging="gvNaoSelEstabelec_PageIndexChanging"
                                                                                                    EmptyDataText="Não foi encontrado nenhum resultado!"
                                                                                                    OnRowDataBound="gvNaoSelEstabelec_RowDataBound">
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
                                                                                                <%--<div class="center">
                                                                                                    <asp:Localize ID="lblgvSelEstabelecPageInfo" runat="server"></asp:Localize>
                                                                                                </div>--%>
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
                                                                        <h2>Estabelecimento selecionados</h2>
                                                                        <div class="nav navbar-right panel_toolbox">
                                                                            <asp:LinkButton ID="btnRemoverEstabelecimentos" runat="server" data-toggle="tooltip" OnClick="btnRemoverEstabelecimentos_Click" data-placement="top" title="Remover Estabelecimentos" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                    <div class="x_content">
                                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="demo-container">
                                                                                <asp:Panel ID="pnlEstabelecimentosSelecionado" runat="server" DefaultButton="btn_SelEstabelec">
                                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                                                                        <ContentTemplate>
                                                                                            <div class="row">

                                                                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                                    <asp:Label ID="lblCodigoEstabSelecionado" runat="server" Text="Código" />
                                                                                                    <asp:TextBox ID="txtCodigoEstabSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                                                </div>

                                                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                                    <asp:Label ID="lblEstabRazaoSelecionado" runat="server" Text="Razão Social" />
                                                                                                    <asp:TextBox ID="txtEstabRazaoSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                                </div>

                                                                                                <div class="col-md-4" style="margin-top: 10px;">
                                                                                                    <asp:LinkButton ID="btn_SelEstabelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btn_SelEstabelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                                    <asp:LinkButton ID="btn_LimpaSelEstabelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btn_LimpaSelEstabelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                                    <%--<asp:Button ID="btnPesquisarEstabNaoSelec" runat="server" SkinID="BtnDefault-sm" TabIndex="20" OnClick="btnPesquisarEstabNaoSelec_Click"   />
                                                                                                    <asp:Button ID="btnLimparEstabNaoSelec" runat="server" SkinID="BtnDefault-sm" TabIndex="21" OnClick="btnLimparEstabNaoSelec_Click"  />--%>
                                                                                                </div>

                                                                                            </div>
                                                                                            <br />
                                                                                            <div class="pad-10 mt-2">
                                                                                                <br />
                                                                                                <asp:GridView DataKeyNames="estabelecimentoId,estabelecimentoRazaoSocial,ufId,CNPJ"
                                                                                                    runat="server"
                                                                                                    ID="gvSelEstabelec"
                                                                                                    AutoGenerateColumns="False"
                                                                                                    AllowPaging="True"
                                                                                                    SkinID="GridViewTable"
                                                                                                    OnPageIndexChanging="gvSelEstabelec_PageIndexChanging"
                                                                                                    OnRowDataBound="gvSelEstabelec_RowDataBound"
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
                                                                                                <div class="center">
                                                                                                    <asp:Localize ID="lblgvSelEstabelePageInfo" runat="server"></asp:Localize>
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
                                                <br />
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

                                                                                                <div class="col-md-4" style="margin-top: 10px;">
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

                                                                                                <div class="col-md-4" style="margin-top: 10px;">
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
                                                                                                    OnPageIndexChanging="gvItensSelecionados_PageIndexChanging"
                                                                                                    OnRowDataBound="gvItensSelecionados_RowDataBound"
                                                                                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                    <Columns>
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
                                                                                                    <asp:TextBox ID="txtCodigoCliNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="9" TabIndex="17" />
                                                                                                </div>

                                                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                                    <asp:Label ID="lblRazaoCliNaoSelec" runat="server" Text="Razão Social" />
                                                                                                    <asp:TextBox ID="txtRazaoCliNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                                </div>
                                                                                                <%--<div class="col-md-1 col-sm-12 col-xs-12">--%>
                                                                                                <%--<asp:Label ID="lblchkOperadora" runat="server" Text="Operadora" />--%>

                                                                                                <%--</div>--%>

                                                                                                <div class="col-md-5" style="margin-top: 10px;">
                                                                                                    <asp:CheckBox ID="chkOperadora" runat="server" Visible="true" Text="Operadora" Font-Bold="true" />
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
                                                                                                        <asp:CheckBox ID="chkOperadoraSel" runat="server" Visible="true" Text="Operadora" Font-Bold="true" />
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
                                                                                                            <ItemTemplate>
                                                                                                                <a href="JavaScript:shrinkandgrow('div<%# Eval("clienteId")   %>');">
                                                                                                                    <img alt="Itens" id='imgdiv<%# Eval("clienteId")  %>' src="../../Imagens/plus.png" />
                                                                                                                </a>
                                                                                                                <div id='div<%# Eval("clienteId")  %>' style="display: none;">
                                                                                                                    <div style="display: table; width: 100%;">
                                                                                                                        <asp:GridView DataKeyNames="itemId, itemDescricao, itemInfComplementar" runat="server"
                                                                                                                            ID="gvItensClientesDesc"
                                                                                                                            AutoGenerateColumns="False"
                                                                                                                            AllowPaging="false"
                                                                                                                            SkinID="GridViewTable"
                                                                                                                            EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                                            <Columns>
                                                                                                                                <asp:BoundField DataField="itemId" HeaderText="Código" />
                                                                                                                                <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />
                                                                                                                                <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />
                                                                                                                            </Columns>
                                                                                                                            <%--<PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />--%>
                                                                                                                        </asp:GridView>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
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
                                                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:ImageButton ID="btnAlterar" runat="server" CommandName="AlterarItens" Width="21px" Height="21px"
                                                                                                                    ToolTip="<%$ Resources:Resource, lblCadItem %>" CommandArgument='<%# Eval("clienteId") +"|" + Eval("clienteRazaoSocial")  %>'
                                                                                                                    ImageUrl="~/Imagens/btnEdit.png" />

                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
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


    <%-- <asp:UpdatePanel ID="updModalUpload" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpload" />
        </Triggers>
        <ContentTemplate>


            <asp:UpdateProgress ID="updProgUpload" runat="server" AssociatedUpdatePanelID="updModalUpload">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            
        </ContentTemplate>
    </asp:UpdatePanel>--%>



    <div style="position: absolute;">
        <asp:UpdatePanel ID="updModalClienteItem" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlModalClienteItem" runat="server" CssClass="Modal" Visible="false">

                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 80%; left: 5%; height: 80%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label11" runat="server" ForeColor="White" Text="Cadastro de Item por cliente " />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFechaClienteItem" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFechaClienteItem_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <asp:HiddenField ID="hdClienteId" runat="server" />
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblNomeCliente" runat="server" Text="Cliente" />
                                        <asp:TextBox ID="txtRazaoClienteModal" runat="server" Enabled="false" SkinID="txtBootstrap3"></asp:TextBox>
                                    </div>
                                </div>
                                </br>
                                 </br>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">

                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>Itens não selecionados  </h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnAddItensClientes" data-toggle="tooltip" data-placement="top" OnClick="btnAddItensClientes_Click" title="Adicionar Itens" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="Panel2" runat="server" DefaultButton="btnPesqItensClientesNaoSelec">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                                                    <ContentTemplate>
                                                                        <div class="row">
                                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblCodigoItensClientesNaoSelec" runat="server" Text="Código Item" />
                                                                                <asp:TextBox ID="txtCodigoItensClientesNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                            </div>

                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblDescItensClientesNaoSelec" runat="server" Text="Descrição" />
                                                                                <asp:TextBox ID="txtDescItensClientesNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>

                                                                            <div class="col-md-4" style="margin-top: 10px;">
                                                                                <asp:LinkButton ID="btnPesqItensClientesNaoSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqItensClientesNaoSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                <asp:LinkButton ID="btnLimparItensClientesNaoSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparItensClientesNaoSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                            </div>

                                                                        </div>
                                                                        <br />
                                                                        <div class="pad-10 mt-2">
                                                                            <br />
                                                                            <asp:GridView DataKeyNames="itemId,itemDescricao,itemInfComplementar,clienteId"
                                                                                runat="server"
                                                                                ID="gvitensClienteNaoSelec"
                                                                                AutoGenerateColumns="False"
                                                                                AllowPaging="True"
                                                                                SkinID="GridViewTable"
                                                                                OnPageIndexChanging="gvitensClienteNaoSelec_PageIndexChanging"
                                                                                OnRowDataBound="gvitensClienteNaoSelec_RowDataBound"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosItensCliNaoSel" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosItensCliNaoSel_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkNaoSelItensClientes" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelItensClientes_CheckedChanged" />
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
                                                                                <asp:Localize ID="Localize5" runat="server"></asp:Localize>
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
                                                        <asp:LinkButton ID="btnRemoverItensClientes" runat="server" data-toggle="tooltip" OnClick="btnRemoverItensClientes_Click" data-placement="top" title="Remover Itens" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="Panel3" runat="server" DefaultButton="btnPesqItensClientesSelec">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel7">
                                                                    <ContentTemplate>
                                                                        <div class="row">
                                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblCodigoItensClientesSelec" runat="server" Text="Código Item" />
                                                                                <asp:TextBox ID="txtCodigoItensClientesSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                            </div>

                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblDescItensClientesSelec" runat="server" Text="Descrição" />
                                                                                <asp:TextBox ID="txtDescItensClientesSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>

                                                                            <div class="col-md-4" style="margin-top: 10px;">
                                                                                <asp:LinkButton ID="btnPesqItensClientesSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqItensClientesSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                <asp:LinkButton ID="btnLimparItensClientesSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparItensClientesSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                            </div>

                                                                        </div>
                                                                        <br />
                                                                        <div class="pad-10 mt-2">
                                                                            <br />
                                                                            <asp:GridView DataKeyNames="itemId, itemDescricao, itemInfComplementar,clienteId"
                                                                                runat="server"
                                                                                ID="gvitensClienteSelec"
                                                                                AutoGenerateColumns="False"
                                                                                AllowPaging="True"
                                                                                SkinID="GridViewTable"
                                                                                OnPageIndexChanging="gvitensClienteSelec_PageIndexChanging"
                                                                                OnRowDataBound="gvitensClienteSelec_RowDataBound"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosItensCliSel" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosItensCliSel_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkSelItensClientes" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelItensClientes_CheckedChanged" />
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
                                                                                <asp:Localize ID="Localize6" runat="server"></asp:Localize>
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
                        </fieldset>
                    </div>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
