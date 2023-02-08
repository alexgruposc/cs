<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadGestaoEstoqueCliente.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadGestaoEstoqueCliente" %>


<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<%@ Register Src="~/AppControles/Mensagem.ascx" TagPrefix="MsgBox" TagName="Mensagem" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="../../Styles/Style.css" rel="stylesheet" />
    <script src="../../Scripts/tooltip.js" type="text/javascript"></script>
    <script src="../../Scripts/popover.js" type="text/javascript"></script>

    <script type="text/javascript">

        function postbackButtonClick() {
            updateProgress = $find("<%= upLoading.ClientID %>");
            window.setTimeout("updateProgress.set_visible(true)", updateProgress.get_displayAfter());
            return true;
        };

        $(document).ready(function () {

            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm != null) {

                prm.add_endRequest(function () {
                    Init();
                });

                prm.add_initializeRequest(InitializeRequest);
                prm.add_endRequest(EndRequest);
                var postBackElement;
            }

            Init();

        });

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

        function Init() {
            $('.ui-tooltip').remove();
            $('[data-toggle="tooltip"]').tooltip();
        }
    </script>

    <style type="text/css">
        .colorAzulKs {
            color: #14293E;
        }

        .GridPager a {
            margin: 3px;
            color: #ffffff;
        }

            .GridPager a:hover, .GridPager a:active {
                color: #00ffff;
            }

            .GridPager a:visited {
                color: #e4e4e4;
            }

        .GridPager td, .GridPager span {
            margin: 3px;
            color: #00ffff;
        }

        .borderLeft {
            border-left: solid 1px #aaaaaa;
        }

        div.TabBar {
            margin: 14px auto 0px 20px;
            min-height: 18px;
        }

            div.TabBar a.LinkButton {
                padding: 6px 12px 6px 12px;
                text-align: center;
                color: #333333;
                background-color: #ffffff;
                border: solid 1px #777777;
                border-radius: 5px 5px 0px 0px;
                /* border-bottom: none; */
            }

            div.TabBar a.LinkButtonAt {
                padding: 8px 12px 8px 12px;
                text-align: center;
                color: #333333;
                background-color: #ffffff;
                border: solid 1px #777777;
                border-radius: 5px 5px 0px 0px;
                border-bottom: none;
            }

            div.TabBar a.LinkButton:hover {
                background-color: #d0d0d0;
            }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlCadastroItem" runat="server">
        <asp:UpdatePanel ID="uppCadastroItem" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
                <asp:PostBackTrigger ControlID="btnUpload" />
                <asp:PostBackTrigger ControlID="txtHeaderItemId" />
                <asp:PostBackTrigger ControlID="gvRegistros" />
                <asp:PostBackTrigger ControlID="lnk_panelEditBloqueio" />
                <asp:PostBackTrigger ControlID="lnk_panelPedidosNoMes" />
            </Triggers>
            <ContentTemplate>

                <h2>Cadastro de Bloqueio de Estoques</h2>


                <MsgBox:Mensagem runat="server" ID="MensagemBox" />
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroItem">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>



                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <fieldset>
                        <%-- FORMULÁRIO --%>

                        <div style="border-bottom: solid 1px #777777;">
                            <div class="TabBar">
                                <asp:LinkButton ID="lnk_panelEditBloqueio" runat="server" OnClick="lnk_panelEditBloqueio_Click">Bloqueio de Estoque</asp:LinkButton>
                                <asp:LinkButton ID="lnk_panelPedidosNoMes" runat="server" OnClick="lnk_panelPedidosNoMes_Click">Pedidos no Mês</asp:LinkButton>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <asp:Panel ID="panel_EditBloqueio" runat="server" CssClass="x_panel">

                                <div class="row">
                                    <div class="col-md-6">
                                        <h2>Bloqueio de Estoque</h2>
                                    </div>
                                    <div class="col-md-6 text-center">
                                        <asp:Button ID="btnSalvar" runat="server" TabIndex="14" SkinID="BtnSuccess" ValidationGroup="Validacao" OnClick="btnSalvar_Click" Text="Salvar" />&nbsp;
                                        <asp:Button ID="btnVoltar1" runat="server" TabIndex="15" SkinID="BtnDefault" OnClick="btnVoltar_Click" Text="Voltar" />
                                    </div>
                                </div>

                                <div class="x_content">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <asp:Label ID="lblHeaderCliente" runat="server" />
                                                <div class="form-row">
                                                    <%--<asp:Panel ID="pnlHeaderCliente" runat="server" DefaultButton="imbHeaderClienteCheck">--%>

                                                    <%--   <div style="width: 500px; display: table;">
                                                        <div style="display: table-cell; width: 320px;">--%>

                                                    <div class="col-md-2 col-sm-2 col-xs-2">
                                                        <asp:TextBox ID="txtHeaderClienteId" runat="server" SkinID="txtBootstrap4" MaxLength="50" />
                                                    </div>
                                                    <asp:HiddenField ID="hdHeaderClienteIdERP" runat="server" />
                                                    <asp:HiddenField ID="hdClienteEmail" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderclienteRemConsig" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderClienteIdCGC" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderAgrupadorId" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderClienteVendaES" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderAutoriEspecial" runat="server" />

                                                    <asp:HiddenField ID="hdHeaderBloqAudicon" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderAutorizaVacinas" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderAutorizaRetinoide" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderBloqMisoprostol" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderBloqFinanceiro" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderAutorizaPsico" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderAutorizaMedic" runat="server" />

                                                    <asp:HiddenField ID="hdHeaderAutoriza_Imunosupressor" runat="server" />
                                                    <asp:HiddenField ID="hdHeaderAutoriza_Antibiotico" runat="server" />


                                                    <asp:ImageButton ID="imbHeaderClienteCheck" runat="server" Width="25px" Height="25px"
                                                        ImageAlign="AbsMiddle" TabIndex="8" ImageUrl="~/Imagens/check.png" OnClick="imbHeaderClienteCheck_Click" />

                                                    <asp:ImageButton ID="imbHeaderClienteBusca" runat="server" Width="25px" Height="25px"
                                                        ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/find.png" OnClick="imbHeaderClienteBusca_Click" />

                                                    <div style="display: table-cell; width: 180px;">
                                                        <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 280px;">
                                                            <asp:Label ID="lblHeaderClienteNome" runat="server" SkinID="LabelResposta" />
                                                        </div>

                                                    </div>

                                                    <%--</div>--%>
                                                    <%--    </asp:Panel>--%>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <asp:Label ID="lblHeaderItemId" runat="server" />
                                                <div class="form-row">

                                                    <div class="form-group col-md-2">

                                                        <asp:TextBox ID="txtHeaderItemId" runat="server" SkinID="txtBootstrap4" OnTextChanged="txtHeaderItemId_TextChanged" AutoPostBack="true" />
                                                        <ucc:AutoCompleteExtender ID="aceItem" runat="server"
                                                            CompletionListCssClass="autocomplete_list1"
                                                            CompletionListItemCssClass="autocomplete_listitem"
                                                            CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                            CompletionInterval="100"
                                                            EnableCaching="false"
                                                            MinimumPrefixLength="3"
                                                            UseContextKey="true"
                                                            TargetControlID="txtHeaderItemId"
                                                            ServiceMethod="GetItens"
                                                            ServicePath="~/AppWs/WsGetItens.asmx" />
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <asp:TextBox ID="txtItemDescricao" Enabled="false" runat="server" SkinID="txtBootstrap4" />
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <asp:ImageButton ID="imbHeaderItemFind" runat="server" Width="25px" Height="25px"
                                                            ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/find.png" OnClick="imbHeaderItemFind_Click" />


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">
                                            <div class="form-group col-md-2">
                                                <asp:Label ID="lblSaldoDisponivel" runat="server" />
                                                <asp:TextBox ID="txtSaldoDisponivel" runat="server" SkinID="txtBootstrap4" Enabled="false" />
                                            </div>
                                            <%--   <div class="form-row">--%>
                                            <div class="form-group col-md-2">
                                                <asp:Label ID="lblSaldoItem" runat="server" />
                                                <asp:TextBox ID="txtSaldoItem" runat="server" SkinID="txtBootstrap4" />
                                            </div>
                                            <div class="form-group col-md-2">
                                                <asp:Label ID="lblSaldoAdicional" runat="server" />
                                                <asp:TextBox ID="txtSaldoAdicional" runat="server" SkinID="txtBootstrap4" Enabled="false" />
                                            </div>
                                            <div class="form-group col-md-2">
                                                </br>
                                           <asp:ImageButton ID="btnAdicionarSaldo" runat="server" Width="25px" Height="25px" data-toggle="tooltip" data-placement="top" data-html="true" title="Incluir Saldo Adicional"
                                               ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/adicionar.png" OnClick="btnAdicionarSaldo_Click" />
                                            </div>
                                            <%--      </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">

                                           
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblDataImportacao" runat="server" AssociatedControlID="txtDataImportacao" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtDataImportacao" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                                   <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblDataAlteracao" runat="server" AssociatedControlID="txtDataImportacao" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtDataAlteracao" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                      <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">

                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblUsuarioNome" runat="server" AssociatedControlID="txtUsuarioNome" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtUsuarioNome" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                                   <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblUsuarioAlteracao" runat="server" AssociatedControlID="txtUsuarioAlteracao" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtUsuarioAlteracao" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    

                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Histórico Saldo Adicional</h2>
                                            <div class="nav navbar-right panel_toolbox">
                                                <br />
                                                <br />
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvHistoricoSaldoAdicional" runat="server" TabIndex="32" OnRowDataBound="gvHistoricoSaldoAdicional_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                        <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                        <asp:BoundField DataField="SaldoAdicional" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" ItemStyle-Width="70px" />
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrDataCadastro" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>

                                        </div>
                                    </div>

                                </div>

                            </asp:Panel>

                            <asp:Panel ID="panel_PedidosNoMes" runat="server" CssClass="x_panel">

                                <div>
                                    <h2>Pedidos no Mês</h2>
                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        Cliente: <b>
                                            <asp:Localize ID="lbl_infoCliente" runat="server"></asp:Localize></b>
                                    </div>
                                    <div class="col-md-5">
                                        Item: <b>
                                            <asp:Localize ID="lbl_infoItem" runat="server"></asp:Localize></b>
                                    </div>
                                    <div class="col-lg-2 text-right">
                                        <asp:Button ID="btnVoltar2" runat="server" TabIndex="15" SkinID="BtnDefault" OnClick="btnVoltar_Click" Text="Voltar" />
                                    </div>
                                </div>

                                <div class="x_content">
                                    <!-- ped.pedidoId, ped.pedidoData, pdi.pedidoItemQuantidade, ped.pedidoSituacao, ped.usuarioId -->
                                    <asp:GridView ID="grv_PedidosNoMes" runat="server"
                                        AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
                                        OnPageIndexChanging="grv_PedidosNoMes_PageIndexChanging"
                                        EmptyDataText="Não foi encontrado nenhum resultado!">
                                        <Columns>
                                            <asp:BoundField DataField="pedidoId" HeaderText="Pedido" />
                                            <asp:BoundField DataField="pedidoData" HeaderText="Data" DataFormatString="{0: dd/MM/yyyy}" />
                                            <asp:BoundField DataField="pedidoItemQuantidade" HeaderText="Qtde" />
                                            <asp:BoundField DataField="pedidoSituacao" HeaderText="Status" />
                                            <asp:BoundField DataField="usuarioId" HeaderText="Usuário" />
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                                    </asp:GridView>
                                    <div class="text-center">
                                        <asp:Localize ID="lbl_grv_PedidosNoMes_PageInfo" runat="server" />
                                    </div>

                                </div>


                            </asp:Panel>

                        </div>
                    </fieldset>
                </asp:Panel>

                <%-- PESQUISA CLIENTE --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upCliente" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteBusca" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlBuscaCliente" runat="server" DefaultButton="btnFiltrosClientePesquisa" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblClienteHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbFiltrosClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                                Height="25px" TabIndex="28" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrClienteHeader" runat="server" />
                                            </legend>
                                            <%-- FILTROS --%>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteId" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="29" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteIdERP" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteIdERP" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="30" />
                                                </div>
                                                <div id="dvCnpj" runat="server" class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteCnpj" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteCnpj" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
                                                </div>
                                                <div id="dvCpf" runat="server" class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteCpf" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteCpf" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteRazaoSocial" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="31" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Button ID="btnFiltrosClientePesquisa" runat="server" SkinID="ButtonLeft" TabIndex="32" OnClick="btnFiltrosClientePesquisa_Click" />
                                                    <asp:Button ID="btnFiltrosClienteLimpar" runat="server" SkinID="ButtonRight" TabIndex="33" OnClick="btnFiltrosClienteLimpar_Click" />
                                                </div>
                                            </div>
                                            <%-- GRID REGISTROS --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvClientes" runat="server" TabIndex="52" DataKeyNames="clienteId,clienteTipoPessoa,clienteCNPJ,clienteIsentoIE,clienteIE,clienteCPF,clienteRG,clienteRazaoSocial,clienteNomeAbreviado,clienteRGOrgao,clienteRGDataEmissao,clienteDataCadastro,matrizFinanceira,clienteTipoCredito,clienteValorCredito,medicoId,grupoFinanceiroId,clienteGrupoFinanceiroNomeAbreviado,grupoComercialId,canalVendaId,canalVendaDescricao,clienteIdERP,medicoConsProfissional,medicoCRM,medicoUFidCRM,categoriaClienteId,categoriaClienteDescricao,mercadoId,mercadoDescricao,clienteInfoAtendentes,representanteId,representanteNomeAbreviado,representanteNome,medicoEnderecoCom,medicoNome,medicoMunicCom,medicoCEPCom,clienteRemConsig,BloqAudicon,AutorizaVacinas,AutorizaRetinoide,BloqMisoprostol,BloqFinanceiro,dataAlteracao,clienteContribuinteICMS,clienteGrupoComercialNome,clienteEmailComercial,Autoriza_Medic,clienteIdSap,clientegrupoativo,Autoriza_Antibiotico,Autoriza_Imunosupressor"
                                                    OnPageIndexChanging="gvClientes_PageIndexChanging" OnRowCommand="gvClientes_RowCommand"
                                                    OnRowDataBound="gvClientes_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteId" runat="server" Text='<%# FormataStringSaida(Eval("clienteId"), txtFiltrosClienteId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteIdErp" runat="server" Text='<%# FormataStringSaida(Eval("clienteIdERP"), txtFiltrosClienteId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Wrap="true">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltrosClienteRazaoSocial.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Wrap="true" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteNomeFantasia" runat="server" Text='<%# Eval("clienteNomeAbreviado") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCNPJ").ToString(), Comom.Utility.FormatOption.ApplyMask), txtFiltrosClienteCnpj.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCpf" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCPF").ToString(), Comom.Utility.FormatOption.ApplyMask, Comom.Utility.TipoDocumento.CPF), txtFiltrosClienteCpf.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentante" runat="server" Text='<%# Eval("representanteNome") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteGrupoComercial" runat="server" Text='<%# Eval("clienteGrupoComercialNome") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCanalVenda" runat="server" Text='<%# Eval("canalVendaDescricao") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCategoria" runat="server" Text='<%# Eval("categoriaClienteDescricao") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteMercado" runat="server" Text='<%# Eval("mercadoDescricao") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="clienteTipoCredito" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />

                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbClienteCheckInGrid" runat="server" SkinID="ImgGrid"
                                                                    ImageAlign="AbsMiddle" ImageUrl="~/Imagens/check.png" CommandName="Select"
                                                                    CommandArgument='<%# Eval("clienteId") + "|" + ((GridViewRow)Container).RowIndex %>' />
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
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="BtnSuccess" TabIndex="17" OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="BtnDanger" TabIndex="18" OnClick="btnConfirmarNo_Click" />
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
                                <asp:Label ID="lblFiltroClienteIdErp" runat="server" />
                                <asp:TextBox ID="txtFiltroClienteIdErp" runat="server" MaxLength="30" TabIndex="5" SkinID="SmallFilter" />
                            </div>

                            <%--  <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroEstabelecimento" runat="server" AssociatedControlID="ddlFiltroEstabelecimento" />
                                <asp:DropDownList ID="ddlFiltroEstabelecimento" runat="server" SkinID="ddlBootstrap1" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroTipoVenda" runat="server" AssociatedControlID="ddlFiltroTipoVenda" />
                                <asp:DropDownList ID="ddlFiltroTipoVenda" runat="server" SkinID="ddlBootstrap1" />
                            </div>--%>

                            <div class="boxPesquisa">
                                <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                    TabIndexDataInicio="1" TabIndexDataTermino="2"
                                    ShowHeaderLine="false" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnSuccess" TabIndex="26" OnClick="btnFiltrosPesquisa_Click" />&nbsp;
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault" TabIndex="27" OnClick="btnFiltrosLimpar_Click" />&nbsp;
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="BtnDanger" TabIndex="29" OnClick="btnFiltrosExcluir_Click" />&nbsp;
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnWarning" TabIndex="28" OnClick="btnFiltrosNovoCadastro_Click" />&nbsp;
                                    <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                        ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                        ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />
                                </div>
                            </div>
                        </div>



                        <div style="border: solid 0px; margin-top: 21px;">
                            <div class="boxPesquisa">
                                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                    <asp:FileUpload ID="fulArquivo" runat="server" Style="width: 93%; margin-right: 3%; margin-left: 3%; background-color: white;" />
                                </div>
                            </div>

                            <div class="boxPesquisa">
                                <asp:Button ID="btnUpload" runat="server" Width="160px" SkinID="BtnSuccess" OnClientClick="return postbackButtonClick();" Text="<%$ Resources:Resource, lblCarregar %>" OnClick="btnUpload_Click" />
                            </div>

                        </div> 

                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="32"
                                DataKeyNames="ConfigId,clienteId,itemId,SaldoItem,SaldoAdicional,usuarioId,dataImportacao,itemDescricao,clienteIdERP,clienteRazaoSocial,itemAtualizado,itemInserido,dataAlteracaoCadastro,usuarioIdCadastro"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" AutoPostBack="true" OnCheckedChanged="chlAll_CheckedChanged" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="SaldoItem" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="SaldoAdicional" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" ItemStyle-Width="70px" />
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrSaldoDisponivel" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                                    <%--<asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
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
                <%--<asp:RequiredFieldValidator ID="rfvItemId" runat="server" ControlToValidate="txtDadosItemId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />--%>

                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <div style="position: absolute;">
        <asp:UpdatePanel ID="uppItem" runat="server" UpdateMode="Conditional">
            <%--<Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbHeaderItemFind" EventName="Click" />
                        </Triggers>--%>
            <ContentTemplate>
                <asp:Panel ID="pnlBuscaItem" runat="server" DefaultButton="btnFiltrosItemPesquisa" SkinID="PnlPopUp"
                    Visible="false">
                    <div class="OpacityBackGround">
                    </div>
                    <div class="painel">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblItemHeader" runat="server" ForeColor="White" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="imbFiltrosItemClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                    Height="25px" TabIndex="40" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosItemClose_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <legend>
                                    <asp:Literal ID="ltrItemHeader" runat="server" />
                                </legend>
                                <div class="navegacao">
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltroFabricante" runat="server" />
                                        <asp:DropDownList ID="ddFabricante" runat="server" SkinID="DropFiltro"
                                            TabIndex="3" OnSelectedIndexChanged="ddFabricante_SelectedIndexChanged" AutoPostBack="true" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosNomeQuimico" runat="server" />
                                        <asp:DropDownList ID="ddNomeQuimico" runat="server" SkinID="DropFiltro"
                                            TabIndex="2" OnSelectedIndexChanged="ddNomeQuimico_SelectedIndexChanged" AutoPostBack="true" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosNomeComercial" runat="server" />
                                        <asp:DropDownList ID="ddNomeComercial" runat="server" SkinID="DropFiltro"
                                            TabIndex="1" />
                                    </div>

                                    <div class="boxPesquisa">
                                        <div class="line">
                                            <asp:Button ID="btnFiltrosItemPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="48"
                                                OnClick="btnFiltrosItemPesquisa_Click" />
                                            <asp:Button ID="btnFiltrosItemLimpar" runat="server" SkinID="ButtonRight" TabIndex="49"
                                                OnClick="btnFiltrosItemLimpar_Click" />
                                        </div>
                                    </div>
                                </div>
                                <%-- GRID REGISTROS --%>
                                <div class="gridRegistros">
                                    <asp:GridView ID="gvItensPesquisa" runat="server" TabIndex="55"
                                        DataKeyNames="itemId,itemDescricao,itemInfComplementar,itemPesoBruto,itemPesoLiquido,itemRefrigerado,itemControlado,
                                                                familiaComercialId,familiaComercialDescricao,familiaMaterialId,familiaMaterialDescricao,grupoEstoqueId,grupoEstoqueDescricao,
                                                                fabricanteId,fabricanteNome,fabricanteNomeAbreviado,classificacaoFiscalId,classificacaoFiscalDescricao,informado,gravado,saldo,
                                                                unidadeMedidaId,unidadeMedidaSigla,tabelaPrecoVlrTabela,tabelaPrecoVlrMinimo,tabelaPrecoVlrMaximo,IsentoFrete,
                                                                coeficienteDesconto"
                                        OnPageIndexChanging="gvItensPesquisa_PageIndexChanging"
                                        OnRowCommand="gvItensPesquisa_RowCommand"
                                        OnRowDataBound="gvItensPesquisa_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                                            <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                            <asp:BoundField DataField="unidadeMedidaSigla" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                                            <asp:BoundField DataField="familiaComercialDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                            <asp:BoundField DataField="familiaMaterialDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                            <asp:BoundField DataField="grupoEstoqueDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                            <asp:BoundField DataField="fabricanteNome" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                            <asp:BoundField DataField="classificacaoFiscalDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false" />
                                            <%--<asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrContribuinte" runat="server" Text='<%# (bool.Parse(!String.IsNullOrEmpty(Eval("contribuinte").ToString()) ? Eval("contribuinte").ToString() : "False") ? GetResourceValue("lblSim") : GetResourceValue("lblNao")).ToUpper() %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                            <%--                 <asp:BoundField DataField="coeficienteDesconto" DataFormatString="{0:n4}" HeaderText="Desconto(%)" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />

                                            <asp:BoundField DataField="coeficienteTribEstab" DataFormatString="{0:n4}" HeaderText="TribEstab(%)" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />

                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlItemTipoPedido" runat="server" SkinID="DropSmallFilter" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="110px" />
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid"
                                                        ImageUrl="~/Imagens/check.png" CommandArgument='<%# Eval("itemId") + "|" + ((GridViewRow)Container).RowIndex %>' />
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

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="position: absolute;">
        <asp:UpdatePanel ID="updModalSaldoADD" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlModalSaldoADD" runat="server" CssClass="Modal" Visible="false">

                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 40%; left: 20%; height: 40%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label11" runat="server" ForeColor="White" Text="Incluir Saldo Adicional" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="imgCloseModalSaldoADD" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="imgCloseModalSaldoADD_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <div class="form-group">
                                    <label for="txtSaldoAdicionalAnterior">Saldo Adicional Anterior</label>
                                    <asp:TextBox ID="txtSaldoAdicionalAnterior" runat="server" Font-Bold="true" SkinID="txtBootstrap2" Enabled="false" Width="150px" />
                                </div>
                                <div class="form-group">
                                    <label for="txtModalSaldoADD">Informe o saldo que deseja incluir</label>
                                    <asp:TextBox ID="txtModalSaldoADD" runat="server" Font-Bold="true" SkinID="txtBootstrap2" TextMode="Number" Width="150px" />

                                </div>
                            </fieldset>
                        </div>
                        <div class="painel_bottom">
                            <asp:Button ID="btnSalvarModalSaldoADD" runat="server" SkinID="BtnSuccess" OnClick="btnSalvarModalSaldoADD_Click" Text="Adicionar" />
                            <asp:Button ID="btnFecharModalSalddo" runat="server" SkinID="BtnWarning" OnClick="btnFecharModalSalddo_Click" Text="Fechar" />
                        </div>
                    </div>
                </asp:Panel>


            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
