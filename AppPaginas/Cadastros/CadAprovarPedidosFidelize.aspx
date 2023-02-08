<%@ Page Title="Aprovar Pedidos Fidelize" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CadAprovarPedidosFidelize.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadAprovarPedidosFidelize" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<%@ Register Src="~/AppControles/Mensagem.ascx" TagPrefix="MsgBox" TagName="Mensagem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function checkTamTexto(controlNome, controlTitulo, controlInfo, tamanhoMax) {
            texto = document.getElementById("ContentPlaceHolder1_" + controlNome).value;
            tamAtual = texto.length;
            msgAlert = (tamanhoMax - tamAtual) + " caracteres restantes.";
            document.getElementById(controlInfo).value = msgAlert;
            if (tamAtual >= tamanhoMax) {
                msgAlert = "O campo " + controlTitulo + " suporta no máximo " + tamanhoMax + " caracteres.";
                alert(msgAlert);
                document.getElementById("ContentPlaceHolder1_" + controlNome).value = texto.substring(0, tamanhoMax);
                return false;
            }
            else {
                return true;
            }
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 13 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        function panel_StatusImport(pDisplay) {
            if (pDisplay == "") {
                document.getElementById("ContentPlaceHolder1_hid_modalVisible").value = "panel_StatusImport";
            }
            document.getElementById("panel_StatusImport").style.display = pDisplay;
        }

    </script>


    <style type="text/css">
        .GridView td {
            text-align: center;
        }

        .LabelInfo {
            border-style: none;
            background-color: transparent;
            width: 100%;
            /* text-align: center; */
        }


        input.imgSelect {
            width: 30px;
            height: 30px;
            padding: 3px;
            margin: 0;
        }

            input.imgSelect:hover {
                width: 36px;
                height: 36px;
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

        .bg-VermelhoClaro {
            background-color: #eec0c0;
        }

        .bg-VerdeClaro {
            background-color: #c0eec0;
        }

        /* CLASSES DO PROGRESS BAR */

        .areaTelaTransp {
            /* class = Quadro que cobre área total para boxes sobrepostos */
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            text-align: center;
            z-index: 2020;
            background-repeat: repeat;
            background-image: url('../../imagens/layout/bkb50.png');
        }

            .areaTelaTransp .b30 {
                background-image: url('../../imagens/layout/bkb30.png');
            }

        div.modal-dialogPostBack {
            width: 90%;
            max-width: 920px;
            margin: 50px auto;
            height: auto;
            max-height: 92%;
            overflow-y: auto;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroEstabelecimento" runat="server">
        <asp:UpdatePanel ID="uppGeral" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnFiltrosExportExcel" />
                <asp:PostBackTrigger ControlID="btnConfirmReprovarLote" />
                <asp:PostBackTrigger ControlID="btnCancelReprovarLote" />

            </Triggers>
            <ContentTemplate>
                <asp:HiddenField ID="hid_modalVisible" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <MsgBox:Mensagem runat="server" ID="MensagemBox" />
        <asp:UpdatePanel ID="uppCadastroEstabelecimento" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroEstabelecimento">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server">

                    <!-- ====================   CABECALHO DO PEDIDO  ==================== -->
                    <div class="pad-5 mt-2">
                        <fieldset>
                            <legend>
                                <asp:Literal ID="ltrDadosHeader" runat="server" /></legend>
                            <div class="row pad-5" style="margin-left: 5px">
                                <div class="col-lg-3">
                                    <h3 style="color: blue">
                                        <asp:Label ID="lblHeaderPedidoId" runat="server" />
                                        <asp:Label ID="lblHeaderPedidoIdDescricao" runat="server" /></h3>
                                </div>
                                <div class="col-lg-3">
                                    <h3 style="color: blue">
                                        <asp:Label ID="lblHeaderPedidoIdGerado" runat="server" />
                                        <asp:Label ID="lblHeaderPedidoIdGeradoDescricao" runat="server" /></h3>
                                </div>
                                <div class="col-lg-3">
                                    <h3>
                                        <asp:Label ID="lblHeaderPedidoSituacao" runat="server" Enabled="false" />
                                        <asp:Label ID="lblHeaderPedidoSituacaoDescricao" runat="server" /></h3>
                                </div>
                                <div class="col-lg-3 text-right">
                                    <asp:Button ID="btnAbrePainelAvaliar" runat="server" SkinID="BtnWarning-sm" Text="Prosseguir com Pedido" OnClick="btnAbrePainelAvaliar_Click" />
                                    <asp:Button ID="btnReprovarPedido" runat="server" SkinID="BtnDanger-sm" Text="Reprovar Pedido" OnClick="btnReprovarPedido_Click" />
                                    &nbsp;
                                    <asp:Button ID="btnVoltar" runat="server" SkinID="BtnDefault-sm" Text="Voltar" OnClick="btnVoltar_Click" />
                                </div>
                            </div>
                        </fieldset>
                    </div>

                    <%-- FORMULÁRIO DE DADOS DO PEDIDO SELECIONADO --%>

                    <!-- ====================   CLIENTE   ==================== -->
                    <asp:HiddenField ID="hdHeaderClienteIdERP" runat="server" />
                    <asp:HiddenField ID="hdHeaderClienteIdCGC" runat="server" />
                    <asp:HiddenField ID="hdHeaderAgrupadorId" runat="server" />
                    <asp:HiddenField ID="hdHeaderClienteVendaES" runat="server" />
                    <asp:HiddenField ID="hdHeaderAutoriEspecial" runat="server" />
                    <asp:HiddenField ID="hdClienteEnderecoIndiceGrid" runat="server" />
                    <asp:HiddenField ID="hdClienteEnderecoClienteId" runat="server" />
                    <asp:HiddenField ID="hdClienteEnderecoSeq" runat="server" />
                    <asp:HiddenField ID="hdClienteEnderecoClienteIdErp" runat="server" />

                    <asp:HiddenField ID="hdHeaderBloqAudicon" runat="server" />
                    <asp:HiddenField ID="hdHeaderAutorizaVacinas" runat="server" />
                    <asp:HiddenField ID="hdHeaderAutorizaRetinoide" runat="server" />
                    <asp:HiddenField ID="hdHeaderBloqMisoprostol" runat="server" />
                    <asp:HiddenField ID="hdHeaderBloqFinanceiro" runat="server" />
                    <asp:HiddenField ID="hdHeaderAutorizaPsico" runat="server" />
                    <asp:HiddenField ID="hdHeaderAutorizaMedic" runat="server" />

                    <asp:HiddenField ID="hdHeaderAutoriza_Imunosupressor" runat="server" />
                    <asp:HiddenField ID="hdHeaderAutoriza_Antibiotico" runat="server" />

                    <div class="pad-5">
                        <fieldset>
                            <legend>
                                <asp:Literal ID="ltrHeaderCliente" runat="server" /></legend>
                            <div class="row" style="margin-left: 5px">
                                <div class="col-md-3">
                                    <asp:Label ID="lblHeaderCliente" runat="server" /><br />
                                    <asp:TextBox ID="txtHeaderClienteNome" runat="server" Enabled="false" />
                                    <asp:TextBox ID="txtHeaderClienteId" runat="server" Visible="false" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblClienteCpfCnpj" runat="server" /><br />
                                    <asp:TextBox ID="txtClienteCpfCnpj" runat="server" Enabled="false" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblDadosClienteWfEnderecoCidade" runat="server" /><br />
                                    <asp:TextBox ID="txtDadosClienteWfEnderecoCidade" runat="server" Enabled="false" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblDadosClienteWfEnderecoUf" runat="server" /><br />
                                    <asp:DropDownList ID="ddDadosClienteWfEnderecoUf" runat="server" Enabled="false" />
                                </div>
                            </div>

                            <div class="mt-2" style="clear: both">&nbsp;</div>

                            <div class="row" style="clear: both; margin-left: 5px">
                                <div class="col-md-3">
                                    <asp:Label ID="lblDadosClienteWfEnderecoCep" runat="server" /><br />
                                    <asp:TextBox ID="txtDadosClienteWfEnderecoCep" runat="server" Enabled="false" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblDadosClienteWfEndereco" runat="server" /><br />
                                    <asp:TextBox ID="txtDadosClienteWfEndereco" runat="server" Enabled="false" />
                                </div>
                                <div class="col-md-3">
                                    <div style="float: left; margin: 0px">
                                        <asp:Label ID="lblDadosClienteWfEnderecoNumero" runat="server" /><br />
                                        <asp:TextBox ID="txtDadosClienteWfEnderecoNumero" runat="server" Enabled="false" Width="100px" />
                                    </div>
                                    <div style="float: left; margin-left: 6px">
                                        <asp:Label ID="lblDadosClienteWfEnderecoComplemento" runat="server" /><br />
                                        <asp:TextBox ID="txtDadosClienteWfEnderecoComplemento" runat="server" Enabled="false" Width="100px" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblDadosClienteWfEnderecoBairro" runat="server" /><br />
                                    <asp:TextBox ID="txtDadosClienteWfEnderecoBairro" runat="server" Enabled="false" />
                                </div>
                            </div>

                            <div class="mt-2" style="clear: both">&nbsp;</div>

                        </fieldset>
                    </div>

                    <!-- ====================   LOJA E CONDIÇÕES   ==================== -->
                    <div class="pad-5">
                        <fieldset>
                            <legend>LOJA e CONDIÇÕES</legend>
                            <div class="row pad-5" style="margin-left: 5px">
                                <div class="col-md-3">
                                    <asp:Label ID="lblHeaderEstabelecimento" runat="server" /><br />
                                    <asp:DropDownList ID="ddlHeaderEstabelecimento" runat="server" OnSelectedIndexChanged="ddlHeaderEstabelecimento_SelectedIndexChanged"
                                        SkinID="DropFiltro" AutoPostBack="true" />
                                    <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator5" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderEstabelecimento" ErrorMessage="<%$ Resources:Resource, msgEstabelecimentoId %>" />
                                </div>

                                <div class="col-md-3">
                                    <asp:Label ID="lblHeaderTipoPedido" runat="server" /><br />
                                    <asp:DropDownList ID="ddlHeaderTipoPedido" runat="server" SkinID="DropFiltro" AutoPostBack="true" />
                                    &nbsp;&nbsp;
                                    <asp:CheckBox ID="chkVendaComum" runat="server" Font-Bold="true" TextAlign="Right" AutoPostBack="true" />
                                    <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderTipoPedido" ErrorMessage="<%$ Resources:Resource, msgPedidoTipoId %>" />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label ID="lblHeaderCondicaoPagamento" runat="server" /><br />
                                    <asp:DropDownList ID="ddlHeaderCondicaoPagamento" runat="server" SkinID="DropFiltro" Visible="false" TabIndex="13" />
                                    <asp:TextBox ID="txtCondicaoPagamento" runat="server" Enabled="false" Font-Bold="true" SkinID="Filtro" />
                                    <asp:ImageButton ID="imbCondicaoPagamento" runat="server"
                                        ImageAlign="AbsMiddle" Width="25px" Height="25px" OnClick="imbCondicaoPagamento_Click"
                                        ToolTip="<%$ Resources:Resource, lblPesquisar %>" ImageUrl="~/Imagens/find.png" />
                                    <asp:Label ID="lblHeaderCreditoValorEmAberto" runat="server" />
                                    <asp:Label ID="lblHeaderCreditoValorEmAbertoValor" runat="server" ForeColor="Blue" />
                                    <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="txtCondicaoPagamento" ErrorMessage="<%$ Resources:Resource, msgCondicaoPagamentoId %>" />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label ID="lblHeaderUnidadeNegocio" runat="server" /><br />
                                    <asp:DropDownList ID="ddlHeaderUnidadeNegocio" runat="server" AutoPostBack="true"
                                        SkinID="DropFiltro" />
                                    <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderUnidadeNegocio" ErrorMessage="<%$ Resources:Resource, msgInformeUnidadeNegocio %>" />
                                    <asp:Label ID="lblHeaderCreditoDisponivel" runat="server" />
                                    <asp:Label ID="lblHeaderCreditoDisponivelValor" runat="server" Visible="false" />
                                </div>
                                <div class="col-md-2">
                                    <div style="width: 530px; display: table-cell;">
                                        <asp:Label ID="lblUsuario" runat="server" />
                                        <asp:DropDownList ID="dplUsuario" runat="server" SkinID="DropFiltro" TabIndex="10" />
                                    </div>
                                </div>
                            </div>

                            <div style="clear: both"></div>

                        </fieldset>

                        <asp:Panel ID="pnlPedidoTriangular" runat="server" DefaultButton="imbHeaderClienteTriangularCeck" Visible="true">
                            <fieldset>
                                <ol>
                                    <li>
                                        <div style="width: 100%; display: table;">
                                            <div style="width: 500px; display: table-cell;">
                                                <div style="width: 500px; display: table;">
                                                    <div style="width: 260px; display: table-cell;">
                                                        <asp:Label ID="lblHeaderClienteTriangular" runat="server" Width="100px" />
                                                        <asp:TextBox ID="txtHeaderClienteTriangularId" runat="server" SkinID="Pedido" MaxLength="50"
                                                            TabIndex="14" />
                                                        <asp:ImageButton ID="imbHeaderClienteTriangularCeck" runat="server" Width="25px"
                                                            Height="25px" ImageAlign="AbsMiddle" TabIndex="15" ImageUrl="~/Imagens/check.png"
                                                            OnClick="imbHeaderClienteTriangularCeck_Click" />
                                                        <asp:ImageButton ID="imbHeaderClienteTriangularBusca" runat="server" Width="25px"
                                                            Height="25px" ImageAlign="AbsMiddle" TabIndex="16" ImageUrl="~/Imagens/find.png"
                                                            OnClick="imbHeaderClienteTriangularBusca_Click" />
                                                        <asp:TextBox ID="txtClienteIdTriangularNone" runat="server" />
                                                    </div>
                                                    <div style="width: 240px; display: table-cell;">
                                                        <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 240px;">
                                                            <asp:Label ID="lblHeaderClienteTriangularNome" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="width: auto; display: table-cell; display: block;">
                                                <asp:Label ID="lblHeaderClienteTriangularTipoEndreco" runat="server" />
                                                <asp:DropDownList ID="ddlHeaderClienteTriangularTipoEndereco" runat="server"
                                                    SkinID="DropFiltro" AutoPostBack="true" TabIndex="17" Enabled="false"
                                                    OnSelectedIndexChanged="ddlHeaderClienteTriangularTipoEndereco_SelectedIndexChanged" />
                                                <asp:ImageButton ID="imbClienteTriangularTipoEndereco" runat="server"
                                                    ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                    ToolTip="<%$ Resources:Resource, lblPesquisar %>" ImageUrl="~/Imagens/find.png"
                                                    OnClick="imbClienteTriangularTipoEndereco_Click" />
                                                <asp:Label ID="lblcidadeSelecionadaTriangular" runat="server"></asp:Label>
                                            </div>

                                        </div>
                                        <div style="display: none;" class="Label" display style="margin: 0 0px 0 0px; text-align: left !important">
                                            <label>Cliente Contribuinte ICMS: </label>
                                            <asp:Label ID="lblTriangularContribuinteICMS" runat="server" />
                                        </div>
                                    </li>
                                </ol>
                            </fieldset>
                        </asp:Panel>
                    </div>

                    <!-- ====================   ENTREGA  ==================== -->
                    <div class="pad-5">
                        <fieldset>
                            <legend>ENTREGA</legend>
                            <div class="row pad-5" style="margin-left: 5px">

                                <div class="col-md-2">
                                    <asp:CheckBox ID="chkEmergencial" runat="server" Text="<%$ Resources:Resource, lblEmergencial %>" Font-Bold="true" AutoPostBack="true" OnCheckedChanged="chkEmergencial_CheckedChanged" />
                                </div>

                                <div class="col-md-1">
                                    <asp:CheckBox ID="chkTransportadoraOrcamento" runat="server" Visible="true" Text="<%$ Resources:Resource, lblTransportadoraOrcamento %>" Font-Bold="true" AutoPostBack="true" OnCheckedChanged="chkTransportadoraOrcamento_CheckedChanged" />
                                </div>

                                <div class="col-md-2">
                                    <div class="line_itens">
                                        <asp:Label ID="lblHeaderItemDataEntregaPedido" runat="server" /><br />
                                        <CtlData:ControlData ID="CtlDataEntregaPedido" runat="server" ValidationGroup="Validacao" />
                                    </div>
                                    <div class="line_itens">
                                        <div style="margin-top:10px;">
                                            <asp:ImageButton ID="imgAlterarDataEntrega" runat="server" Width="25px" Height="25px"
                                                ImageAlign="AbsMiddle"
                                                data-toggle="tooltip" data-placement="top" data-html="true" title="Alterar Data de Entrega"
                                                ImageUrl="~/Imagens/AlteraDataEntrega.png" OnClick="imgAlterarDataEntrega_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblHeaderItemEntregaPeriodo" runat="server" /><br />
                                    <asp:DropDownList ID="ddlHeaderItemEntregaPeriodo" runat="server" SkinID="DropFiltro">
                                        <asp:ListItem Value="" Text="<%$ Resources:Resource, lblSelecione %>" Selected="True" />
                                        <asp:ListItem Value="E" Text="<%$ Resources:Resource, lblPeriodoEmergencial %>" />
                                        <asp:ListItem Value="M" Text="<%$ Resources:Resource, lblPeriodoManha %>" />
                                        <asp:ListItem Value="T" Text="<%$ Resources:Resource, lblPeriodoTarde %>" />
                                        <asp:ListItem Value="H" Text="<%$ Resources:Resource, lblPeriodoHorarioComercial %>" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderItemEntregaPeriodo" ErrorMessage="<%$ Resources:Resource, msgInformePeriodoPedido %>" />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label ID="lblPrazoEntrega" runat="server" /><br />
                                    <asp:DropDownList ID="ddlPrazoEntrega" runat="server" SkinID="DropSmallFilter">
                                        <asp:ListItem Value="" Text="<%$ Resources:Resource, lblSelecione %>" Selected="True" />
                                        <asp:ListItem Value="24" Text="<%$ Resources:Resource, lblPrazo24 %>" />
                                        <asp:ListItem Value="48" Text="<%$ Resources:Resource, lblPrazo48 %>" />
                                        <asp:ListItem Value="72" Text="<%$ Resources:Resource, lblPrazo72 %>" />
                                        <asp:ListItem Value="96" Text="<%$ Resources:Resource, lblPrazo96 %>" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlPrazoEntrega" ErrorMessage="<%$ Resources:Resource, msgInformePrazoPedido %>" />
                                </div>

                                <div class="col-md-1" style="display: none;">
                                    <asp:Label ID="lblTransportadora" runat="server" Visible="false" />
                                    <asp:DropDownList ID="ddlTransportadora" Visible="false" runat="server" SkinID="DropFiltro" AutoPostBack="true" OnSelectedIndexChanged="ddlTransportadora_SelectedIndexChanged" />
                                </div>

                                <div class="col-md-1">
                                    <asp:Label ID="lblRedespacho" runat="server" Visible="false" />
                                    <asp:DropDownList ID="dplRedespacho" Visible="false" Enabled="false" runat="server" SkinID="DropFiltro" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblDataEntregaPedidoAlterada" runat="server" ForeColor="Red" Visible="false" />
                                </div>
                            </div>

                            <div style="clear: both"></div>
                        </fieldset>
                    </div>

                    <!-- ====================   ITENS  ==================== -->
                    <div class="pad-5">
                        <fieldset>
                            <legend>ITENS</legend>
                            <div class="row pad-5" style="margin-left: 5px">
                                <div class="col-md-3">
                                    <asp:Label ID="lblQtdRegistrosGrid" runat="server" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblQtdRegistrosGridDesc" runat="server" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblQtdItensGrid" runat="server" />
                                </div>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlQtdItensGrid" runat="server" AutoPostBack="true">
                                        <asp:ListItem Value="10" Text="10" />
                                        <asp:ListItem Value="20" Text="20" />
                                        <asp:ListItem Value="30" Text="30" />
                                        <asp:ListItem Value="40" Text="40" />
                                        <asp:ListItem Value="50" Text="50" Selected="True" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div style="clear: both"></div>

                            <div>

                                <asp:GridView ID="gvItens" runat="server" TabIndex="51" OnRowDataBound="gvItens_OnRowDataBound" OnPageIndexChanging="gvItens_PageIndexChanging"
                                    DataKeyNames="itemId,itemDescricao,unidadeMedidaSigla,familiaComercialDescricao,familiaMaterialDescricao,itemControladoValidado,informado,gravado,
                                                      grupoEstoqueDescricao,fabricanteNome,pedidoId,pedidoItemSeq,itemControlado,tabelaPrecoVlrTabela,tabelaPrecoVlrMinimo,tabelaPrecoVlrMaximo,saldo,IsentoFrete,
                                                      familiaMaterialId, fabricanteId,unidadeNegocioId,estabelecimentoId,clienteIdERP,itemInfComplementar,valDescontoEmissao,itemTipoPedido"
                                    AllowPaging="false">
                                    <Columns>

                                        <asp:BoundField DataField="itemId" HeaderText="Item ID" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />
                                        <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Item Controlado">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrItemControlado" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="unidadeMedidaSigla" HeaderText="Unid. Medida" />
                                        <asp:BoundField DataField="familiaComercialDescricao" HeaderText="Familia Comercial" />
                                        <asp:BoundField DataField="familiaMaterialDescricao" ItemStyle-Wrap="true" HeaderText="Familia Material" Visible="false" />
                                        <asp:BoundField DataField="grupoEstoqueDescricao" ItemStyle-Wrap="true" HeaderText="Grupo Estoque" Visible="false" />
                                        <asp:BoundField DataField="fabricanteNome" ItemStyle-Wrap="true" HeaderText="Fabricante" Visible="false" />

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Qtde">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtQuantidade" runat="server" Enabled="false" SkinID="Currency50" Font-Bold="true" MaxLength="9" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Valor">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hfValorDesconto" runat="server"
                                                    Value='<%# Eval("valDescontoEmissao", "{0:n2}") %>' />
                                                <asp:TextBox ID="txtValor" runat="server" Enabled="false" SkinID="Currency100"
                                                    Font-Bold="true" MaxLength="18" />
                                                <asp:HiddenField ID="hfValorMinimo" runat="server" Value="" />
                                                <asp:HiddenField ID="hfValorMaximo" runat="server" Value="" />
                                                <asp:HiddenField ID="hfPedidoId" runat="server" Value="" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="saldo" HeaderText="Saldo Estoque" DataFormatString="{0:###,###,###,##0.##}" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" HeaderText="Desconto boleto">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtValorDescontoBoleto" runat="server" Enabled="false"
                                                    SkinID="Currency100" Font-Bold="true" Text='<%# Eval("pedidoItemValorDescontoBoleto", "{0:n2}") %>'
                                                    MaxLength="18" />

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" HeaderText="OD%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPercentualOD" runat="server" Enabled="false"
                                                    Font-Bold="true"
                                                    Text='<%# Eval("itemPercentualOD", "{0:n2}") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                            </div>

                        </fieldset>
                    </div>

                    <!-- ====================   OUTRAS INFORMAÇÕES  ==================== -->

                    <div style="width: 100%; display: table;">
                        <fieldset style="margin-bottom: 100px;">

                            <%-- FOOTER --%>
                            <div style="display: table; width: 100%; height: 20%;">

                                <div style="width: 100%; display: table;">
                                    <fieldset>

                                        <div style="width: 100%; display: table-cell; margin-top: 5px; margin-bottom: 5px;">
                                            <asp:Panel ID="pnlTotais" runat="server">
                                                <%--<ol style="text-align: right;">
                                                <li>--%>
                                                <div style="width: 100%; vertical-align: middle; text-align: right;">
                                                    <asp:Panel ID="pnlTotalPedido" runat="server">
                                                        <asp:HiddenField ID="hdfQtdTotalItens" runat="server" Value="0,00" />
                                                        <asp:HiddenField ID="hdfVlrTotalItensBruto" runat="server" Value="0,00" />
                                                        <asp:HiddenField ID="hdfVlrTotalItens" runat="server" Value="0,00" />
                                                        <asp:HiddenField ID="hdfValorTotalPedido" runat="server" Value="0,00" />
                                                        <div style="display: none;">
                                                            <asp:Label ID="lblICMSBase" runat="server" Visible="true" />
                                                            <asp:TextBox ID="txtICMSBase" runat="server" SkinID="Currency80" Font-Bold="true" Enabled="false" Visible="true" />
                                                            <asp:Label ID="lblICMSValor" runat="server" Visible="true" />
                                                            <asp:TextBox ID="txtICMSValor" runat="server" SkinID="Currency80" Font-Bold="true" Enabled="false" Visible="true" />
                                                            <asp:Label ID="lblICMSSTBase" runat="server" Visible="true" />
                                                            <asp:TextBox ID="txtICMSSTBase" runat="server" SkinID="Currency80" Font-Bold="true" Enabled="false" Visible="true" />
                                                            <asp:Label ID="lblICMSSTValor" runat="server" Visible="true" />
                                                            <asp:TextBox ID="txtICMSSTValor" runat="server" SkinID="Currency80" Font-Bold="true" Enabled="false" Visible="true" />
                                                        </div>
                                                        <asp:Label ID="lblQuantidadeTotal" runat="server" />
                                                        <asp:TextBox ID="txtQuantidadeTotal" runat="server" SkinID="Currency80" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                        <asp:Label ID="lblTotalValorItensBruto" runat="server" />
                                                        <asp:TextBox ID="txtTotalValorItensBruto" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                        <asp:Label ID="lblTotalValorItens" runat="server" />
                                                        <asp:TextBox ID="txtTotalValorItens" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                        <asp:Label ID="lblTotalDescontoPedido" runat="server" />
                                                        <asp:TextBox ID="txtTotalDescontoPedido" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                        <asp:Label ID="lblTotalValor" runat="server" />
                                                        <asp:TextBox ID="txtTotalValor" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                        <asp:Label ID="lblTotalDescontoBoleto" runat="server" />
                                                        <asp:TextBox ID="txtTotalDescontoBoleto" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                    </asp:Panel>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </fieldset>
                                </div>

                                <asp:Panel ID="pnlObservacao" runat="server">
                                    <fieldset style="height: 30%;">
                                        <%-- BODY --%>
                                        <div style="left: 0.5%; width: 100%; height: 100%; display: table; padding: 1px 1px 1px 1px;">
                                            <%-- LEFT --%>
                                            <div style="left: 0.5%; width: 50%; height: 100%; display: table-cell;">
                                                <fieldset>
                                                    <legend>
                                                        <asp:Literal ID="ltrObservacoesPedido" runat="server" />
                                                    </legend>
                                                    <asp:TextBox ID="txtObservacaoPedido" runat="server" MaxLength="255" TextMode="MultiLine" Columns="50" Rows="6" Width="98%" />
                                                </fieldset>
                                            </div>
                                            <%-- RIGHT --%>
                                            <div style="left: 0.5%; width: 50%; height: 100%; display: table-cell;">
                                                <fieldset>
                                                    <legend>
                                                        <asp:Literal ID="ltrObservacoesNota" runat="server" />
                                                    </legend>
                                                    <asp:TextBox ID="txtObservacoesNf" runat="server" MaxLength="255" TextMode="MultiLine" Columns="50" Rows="6" Width="98%" />
                                                </fieldset>
                                            </div>
                                        </div>
                                    </fieldset>
                                </asp:Panel>

                                <asp:Panel ID="pnlItensInvalidos" runat="server" CssClass="mt-2">
                                    <fieldset class="pad-5">
                                        <legend>Itens não encontrados, duplicados ou divergentes</legend>
                                        <asp:GridView ID="gvItensInvalidos" runat="server"
                                            AllowPaging="false">
                                            <Columns>
                                                <asp:BoundField DataField="infoValidacao" HeaderText="Motivo" />
                                                <asp:BoundField DataField="ean" HeaderText="EAN" />
                                                <asp:BoundField DataField="amount" HeaderText="Qtde" />
                                                <asp:BoundField DataField="net_value" HeaderText="Valor Unitario" />
                                                <asp:BoundField DataField="itemId" HeaderText="Item ID" />
                                                <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />
                                                <asp:BoundField DataField="unidadeMedidaSigla" HeaderText="Unid. Medida" />
                                                <asp:BoundField DataField="familiaComercialDescricao" HeaderText="Familia Comercial" />
                                                <asp:BoundField DataField="fabricanteNome" HeaderText="Fabricante" />
                                            </Columns>
                                        </asp:GridView>
                                    </fieldset>
                                </asp:Panel>

                            </div>
                        </fieldset>
                    </div>

                    <asp:UpdatePanel ID="updModalDataEntrega" runat="server" UpdateMode="Conditional">
                        <contenttemplate>
                            <asp:Panel ID="pnlDataEntrega" runat="server" CssClass="Modal" Visible="false">
                                <div class="bd-example-modal-sm">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <asp:ImageButton ID="btnFechaModalData" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                    ImageUrl="~/Imagens/Fechar.png"
                                                    OnClick="btnFechaModalData_Click" />
                                                <h4 class="modal-title" id="TitleModalDataEntrega">Alteração data de entrega </h4>
                                            </div>
                                            <div class="modal-body">

                                                <div class="form-group">
                                                    <div class="col-12">
                                                        <asp:Label ID="lblNovaDataEntrega" runat="server" Text="Nova Data Entrega"></asp:Label>
                                                    </div>
                                                    <CtlData:ControlData ID="CtlNovaDataEntregaPedido" runat="server" />
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-12">
                                                        <asp:Label ID="Label12" runat="server" Text="Motivo Alteração"></asp:Label>
                                                    </div>

                                                    <asp:TextBox ID="txtMotivoAlteracaoData" runat="server" Columns="100" Rows="5" TextMode="MultiLine" MaxLength="250" Height="100%" Width="50%" />

                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <asp:Button Text="Salvar" SkinID="BtnSuccess" CommandArgument="SalvarDataEntrega" ID="btnAlterarData" runat="server" OnClick="btnAlterarData_Click" />
                                                <asp:Button Text="Fechar" SkinID="BtnDanger" CommandArgument="ModalDataEntrega" ID="btnVoltarData" runat="server" OnClick="btnVoltarData_Click" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </contenttemplate>
                    </asp:UpdatePanel>

                </asp:Panel>

                <%-- CONFIRMAR DADOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upDadosConfirmar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <%--  
                            <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />--%>
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
                                                    <asp:Label ID="lblConfirmarDadosMedicoId" runat="server" />
                                                    <asp:Label ID="lblConfirmarDadosMedicoIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosMedicoNome" runat="server" />
                                                    <asp:Label ID="lblConfirmarDadosMedicoNomeTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <%--  <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft"
                                                    TabIndex="6" OnClick="btnConfirmarYes_Click" />--%>
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <%--<asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight"
                                                    TabIndex="7" OnClick="btnConfirmarNo_Click" />--%>
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
                    <p>&nbsp;</p>
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" Text="Pedidos Fidelize" runat="server" />
                        </legend>
                        <asp:UpdatePanel ID="uppFiltros" runat="server">
                            <ContentTemplate>
                                <div class="pad-10 text-left">
                                    <h4>Seleção de Pedidos</h4>

                                    <div class="row">

                                        <div class="col-md-4">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    Data de Importação de:<br />
                                                    <CtlData:ControlData ID="dt_FiltroDataImportDe" runat="server" />
                                                </div>
                                                <div class="col-md-6">
                                                    Até<br />
                                                    <CtlData:ControlData ID="dt_FiltroDataImportAte" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            Order Fidelize:<br />
                                            <asp:TextBox ID="txtFiltroPedidoId" runat="server" Style="width: 96%; max-width: 200px" />
                                        </div>

                                        <div class="col-md-2">
                                            Razão Social:<br />
                                            <asp:TextBox ID="txtFiltrosClienteRazaoSocial" Style="width: 96%; max-width: 200px" runat="server" MaxLength="50" />
                                        </div>
                                        <div class="col-md-2">
                                            CNPJ/CPF:<br />
                                            <asp:TextBox ID="txtFiltroCNPJCliente" Style="width: 96%; max-width: 200px" runat="server" MaxLength="25" />
                                        </div>
                                        <div class="col-md-2">
                                            Cliente ID ERP:<br />
                                            <asp:TextBox ID="txtFiltroClienteERP" Style="width: 96%; max-width: 200px" runat="server" MaxLength="20" />
                                        </div>
                                    </div>

                                    <div class="mt-2" style="clear: both">&nbsp;</div>

                                    <div class="row">

                                        <div class="col-md-2">
                                            Status:<br />
                                            <asp:DropDownList ID="dplFiltroStatus" runat="server" Style="width: auto; max-width: 96%" />
                                        </div>

                                        <div class="col-md-2">
                                            Código da Indústria:<br />
                                            <asp:DropDownList ID="dplTipoIndustria" runat="server" Style="width: auto; max-width: 96%" />
                                        </div>

                                        <div class="col-md-2">
                                            Código do Produto:<br />
                                            <asp:TextBox ID="txtFiltroItemId" Style="width: 96%; max-width: 200px" runat="server" MaxLength="20" />
                                        </div>

                                        <div class="col-md-2">
                                            Nome Produto:<br />
                                            <asp:TextBox ID="txtFiltroItemDescr" Style="width: 96%; max-width: 200px" runat="server" MaxLength="20" />
                                        </div>

                                        <div class="col-md-4">
                                        </div>

                                    </div>

                                    <div class="mt-2" style="clear: both">&nbsp;</div>

                                    <div class="text-right pad-5">
                                        <asp:Button ID="btnFiltrosPesquisa" runat="server" Text="Pesquisar" SkinID="BtnInfo" OnClick="btnFiltrosPesquisa_Click" />
                                        &nbsp;
                                                <asp:Button ID="btnFiltrosLimpar" runat="server" Text="Limpar" SkinID="BtnDefault" OnClick="btnFiltrosLimpar_Click" />
                                        &nbsp;
                                                <asp:Button ID="btnFiltrosExportExcel" runat="server" Text="Exportar para Excel" SkinID="BtnWarning" OnClick="btnFiltrosExportExcel_Click" />
                                        &nbsp;
                                                <asp:Button ID="btnReprovarLote" runat="server" Text="Reprovar Em Lote" SkinID="BtnDanger" OnClick="btnReprovarLote_Click" />
                                    </div>
                                </div>

                                <%-- GRID REGISTROS --%>
                                <div class="gridRegistros">
                                    <asp:GridView ID="grdPedidosFidelize" runat="server" TabIndex="16"
                                        DataKeyNames="cod_fidelize, codPedido, CodIndustria, cnpj, email, codigoPedidoCliente, order_payment_term,
                               tipoCodigoCliente, statusPedido, nomeClienteAbreviado, clienteId, representanteId, pedidoIdGerado,destination_customer,ZZCNAE"
                                        OnPageIndexChanging="grdPedidosFidelize_PageIndexChanging"
                                        OnRowCommand="grdPedidosFidelize_RowCommand"
                                        OnRowDataBound="grdPedidosFidelize_RowDataBound"
                                        OnRowUpdating="grdPedidosFidelize_RowUpdating"
                                        AutoGenerateColumns="False">
                                        <EmptyDataTemplate>
                                            <h3 style="text-align: center; color: red">Nenhum registro encontrado.</h3>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:BoundField DataField="codPedido" HeaderText="Order Fidelize" />
                                            <asp:BoundField DataField="imported_at" HeaderText="Data Import." DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                                            <asp:BoundField DataField="CodIndustria" HeaderText="Codigo Industria" />
                                            <asp:BoundField DataField="cnpj" HeaderText="CNPJ/CPF" />
                                            <asp:BoundField DataField="razao" HeaderText="Razão Social Cliente" />
                                            <asp:BoundField DataField="ufId" HeaderText="UF" />
                                            <asp:BoundField DataField="statusPedido" HeaderText="Status" />
                                            <asp:BoundField DataField="tipoCodigoCliente" HeaderText="Tipo Cliente" />
                                            <asp:BoundField DataField="pedidoIdGerado" HeaderText="Pedido Oncoprod" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Update" SkinID="ImgGrid"
                                                        ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                        ImageUrl="~/Imagens/find.png" />

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                    </asp:GridView>
                                    <div class="center">
                                        <asp:Localize ID="lblgrdPedidosFidelizePageInfo" runat="server"></asp:Localize>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </fieldset>
                </asp:Panel>

                <%-- REPROVAÇÃO EM LOTE --%>
                <asp:UpdatePanel ID="updReprovarLote" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="pnlReprovarLote" runat="server">
                            <p>&nbsp;</p>
                            <fieldset>
                                <div class="pad-10 text-left">
                                    <h3>Reprovar Pedidos em Lote</h3>
                                    <div class="row">
                                        <div class="col-md-4">
                                            Motivo de Reprovação do Pedido:<br />
                                            <asp:DropDownList ID="ddlMotivoReprovPedidoLote" runat="server" SkinID="ddlBootstrap"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-4">
                                            Motivo de Reprovação dos Itens:<br />
                                            <asp:DropDownList ID="ddlMotivoReprovItensLote" runat="server" SkinID="ddlBootstrap"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="text-right pad-5">
                                                Pedidos selecionados para Reprovação: 
                                                <b>
                                                    <asp:Localize ID="lblTotalPedidosReprovarLote" runat="server" /></b>
                                            </div>
                                            <div class="text-right pad-5">
                                                <asp:Button ID="btnConfirmReprovarLote" Text="Confirmar Reprovação em Lote" runat="server" SkinID="BtnDanger" OnClick="btnConfirmReprovarLote_Click"
                                                    UseSubmitBehavior="false" OnClientClick="panel_StatusImport('')" />
                                                &nbsp;
                                                <asp:Button ID="btnCancelReprovarLote" Text="Voltar" runat="server" SkinID="BtnDefault" OnClick="btnCancelReprovarLote_Click" />
                                            </div>

                                        </div>
                                    </div>
                                    <%-- GRID REPROVAÇÃO EM LOTE 
                                         Incluir datakeys: industry_code as CodIndustria, order_code as codPedido, distribution_center_code as centroDistribuicao, 
                                    --%>

                                    <div class="gridRegistros">
                                        <asp:GridView ID="grvReprovarLote" runat="server"
                                            DataKeyNames="cod_fidelize, codPedido, CodIndustria, centroDistribuicao, chkReprovar"
                                            AllowPaging="true"
                                            OnPageIndexChanging="grvReprovarLote_PageIndexChanging"
                                            OnRowCommand="grvReprovarLote_RowCommand"
                                            OnRowDataBound="grvReprovarLote_RowDataBound"
                                            AutoGenerateColumns="False">
                                            <EmptyDataTemplate>
                                                <h3 style="text-align: center; color: red">Nenhum registro encontrado.</h3>
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField HeaderText="Reprovar" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkReprovar" runat="server" CssClass="flat"
                                                            AutoPostBack="true" OnCheckedChanged="chkReprovar_CheckedChanged" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="codPedido" HeaderText="Order Fidelize" ItemStyle-Width="10%" />
                                                <asp:BoundField DataField="imported_at" HeaderText="Data Import." DataFormatString="{0:dd/MM/yyyy HH:mm}" ItemStyle-Width="10%" />
                                                <asp:BoundField DataField="CodIndustria" HeaderText="Cod. Industria" ItemStyle-Width="5%" />
                                                <asp:BoundField DataField="cnpj" HeaderText="CNPJ/CPF" ItemStyle-Width="15%" />
                                                <asp:BoundField DataField="razao" HeaderText="Razão Social Cliente" ItemStyle-Width="20%" />
                                                <asp:BoundField DataField="ufId" HeaderText="UF" ItemStyle-Width="5%" />
                                                <asp:BoundField DataField="tipoCodigoCliente" HeaderText="Tipo Cliente" ItemStyle-Width="5%" />
                                                <asp:BoundField DataField="resultado" HeaderText="Resultado" ItemStyle-Width="25%" />

                                            </Columns>
                                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                        </asp:GridView>
                                        <div class="center">
                                            <asp:Localize ID="lblgrvReprovarLotePageInfo" runat="server"></asp:Localize>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

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
                                        <%--<asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft"
                                            TabIndex="14" OnClick="btnConfirmarExclusaoYes_Click" />--%>
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <%--<asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight"
                                            TabIndex="15" OnClick="btnConfirmarExclusaoNo_Click" />--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

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
                                            <legend>
                                                <asp:Literal ID="ltrCondicaoPagamentoHeader" runat="server" />
                                            </legend>

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
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrCondicaoPagamentoId" runat="server" Text='<%# FormataStringSaida(Eval("condicaoPagamentoId"), txtCondicaoPagamentoFiltroId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrCondicaoPagamentoDescricao" runat="server" Text='<%# FormataStringSaida(Eval("condicaoPagamentoDescricao"), txtCondicaoPagamentoFiltroDescricao.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="25%">
                                                            <ItemTemplate>
                                                                <div style="clear: both">
                                                                    <asp:ImageButton ID="imbSelect" runat="server" CssClass="imgSelect"
                                                                        ImageUrl="~/Imagens/check.png" CommandName="Select"
                                                                        ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                        CommandArgument='<%# Eval("condicaoPagamentoId") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                                </div>
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

                <%-- CONDIÇÕES DE PAGAMENTO - DEPÓSITO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppCondicaoPagamentoDepositoHeader" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbCondicaoPagamento" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="imbCondicaoPagamentoDepositoClose" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlCondicaoPagamentoDeposito" runat="server" DefaultButton="imbCondicaoPgtoDepositoAdd" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblCondicaoPagamentoDepositoHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbCondicaoPagamentoDepositoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbCondicaoPagamentoDepositoClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <asp:Panel ID="pnlCondicaoPagamentoDepositoBody" runat="server" Width="100%" Height="100%">
                                            <fieldset>
                                                <div style="width: 100%; display: table; height: 90%;">
                                                    <div style="display: table-cell; width: 45%; height: 100%;">
                                                        <asp:Panel ID="pnlCondicaoPagamentoDepositoDados" runat="server">
                                                            <fieldset style="position: fixed; _position: relative; height: 60%;">
                                                                <legend>
                                                                    <asp:Literal ID="ltrDepositoHeader" runat="server" Text="<%$ Resources:Resource, lblDadosDeposito %>" />
                                                                </legend>
                                                                <ol>
                                                                    <li>
                                                                        <div class="line">
                                                                            <div class="line_itens_left">
                                                                                <asp:Label ID="lblDepositoData" runat="server" Width="100px" />
                                                                            </div>
                                                                            <div class="line_itens">
                                                                                <CtlData:ControlData ID="CtlDepositoData" runat="server" />
                                                                            </div>
                                                                            <div class="line_itens">
                                                                                <asp:Label ID="lblDepositoBanco" runat="server" />
                                                                            </div>
                                                                            <div class="line_itens">
                                                                                <asp:TextBox ID="txtDepositoBanco" runat="server" SkinID="Pedido" MaxLength="10" />
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <asp:Label ID="lblDepositoAgencia" runat="server" Width="100px" />
                                                                        <asp:TextBox ID="txtDepositoAgencia" runat="server" SkinID="Pedido" MaxLength="10" />
                                                                        <asp:Label ID="lblDepositoContaCorrente" runat="server" Width="72px" />
                                                                        <asp:TextBox ID="txtDepositoContaCorrente" runat="server" SkinID="Pedido" MaxLength="30" />
                                                                    </li>
                                                                    <li>
                                                                        <asp:Label ID="lblDepositoValor" runat="server" Width="100px" />
                                                                        <asp:TextBox ID="txtDepositoValor" runat="server" SkinID="Pedido" MaxLength="18" />
                                                                    </li>
                                                                    <li>
                                                                        <asp:Label ID="lblDepositoValorTotalPedido" runat="server" Width="100px" />
                                                                        <asp:Label ID="lblDepositoValorTotalPedidoDescricao" runat="server" SkinID="LabelResposta" />
                                                                    </li>
                                                                    <li>
                                                                        <div style="margin-left: 100px;">
                                                                            <asp:CheckBox ID="chkDeposito" runat="server" Font-Bold="true" TextAlign="Right" Visible="false" Checked="true" Text="<%$ Resources:Resource, lblDepositoPadrao %>" />
                                                                        </div>
                                                                    </li>
                                                                </ol>
                                                            </fieldset>
                                                        </asp:Panel>
                                                    </div>
                                                    <%--Botões--%>
                                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle; text-align: left;">
                                                        <asp:Panel ID="pnlCondicaoPagamentoDepositoBotoes" runat="server">
                                                            <ol>
                                                                <li>
                                                                    <%--  <asp:ImageButton ID="imbCondicaoPgtoDepositoAdd" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px"
                                                                        ToolTip="<%$ Resources:Resource, lblAdicionar %>"
                                                                        ImageUrl="~/Imagens/addSelected.png"
                                                                        ValidationGroup="ValidaDeposito"
                                                                        OnClick="imbCondicaoPgtoDepositoAdd_Click" />--%>
                                                                    <br />
                                                                    <%--    <asp:ImageButton ID="imbCondicaoPgtoDepositoRemove" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px"
                                                                        ToolTip="<%$ Resources:Resource, lblRemover %>"
                                                                        ImageUrl="~/Imagens/removeSelected.png"
                                                                        OnClick="imbCondicaoPgtoDepositoRemove_Click" />--%>
                                                                    <br />
                                                                    <%-- <asp:ImageButton ID="imbCondicaoPgtoDepositoRemoveAll" runat="server"
                                                                        ImageAlign="AbsMiddle" Height="50px" Width="50px"
                                                                        ToolTip="<%$ Resources:Resource, lblRemoverTodos %>"
                                                                        ImageUrl="~/Imagens/remove.png"
                                                                        OnClick="imbCondicaoPgtoDepositoRemoveAll_Click" />--%>
                                                                </li>
                                                            </ol>
                                                        </asp:Panel>
                                                    </div>
                                                    <%--item adicionados --%>
                                                    <div style="display: table-cell; width: 100%; height: 100%;">
                                                        <asp:Panel ID="pnlCondicaoPagamentoDepositoValores" runat="server" Height="200px">
                                                            <div style="display: table; width: 100%; height: 80%;">
                                                                <asp:ListBox ID="lbxCondicaoPagamentoDeposito" runat="server" SelectionMode="Multiple" />
                                                            </div>
                                                        </asp:Panel>
                                                        <div style="display: table; width: 100%; height: 20%;">
                                                            <div style="display: table-cell; vertical-align: middle; text-align: right;">
                                                                <ol>
                                                                    <li style="text-align: right;">
                                                                        <asp:Label ID="lblDepositoParcelaSaldo" runat="server" />
                                                                        <asp:Label ID="lblDepositoPacelasSaldoDescricao" runat="server" Text="0.00" />
                                                                    </li>
                                                                </ol>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div style="width: 100%; display: table; height: 10%;">
                                                    <div style="display: table-cell; vertical-align: middle; text-align: center;">
                                                        <%--                                                        <asp:Button ID="btnSalvarCondPgtoDeposito" runat="server" SkinID="ButtonCenter" OnClick="btnSalvarCondPgtoDeposito_Click" />
                                                        <asp:Button ID="btnLimparCondPgtoDeposito" runat="server" SkinID="ButtonCenter" OnClick="btnLimparCondPgtoDeposito_Click" />
                                                        <asp:Button ID="btnMudarCondPgtoDeposito" runat="server" SkinID="ButtonCenter" OnClick="btnMudarCondicaoPagamento_Click" ToolTip="<%$ Resources:Resource, lblMudarCondicaoPgtoEspecial %>" Text="<%$ Resources:Resource, lblMudar %>" />--%>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:RequiredFieldValidator ID="rfvDepositoBanco" runat="server" ControlToValidate="txtDepositoBanco" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaDeposito" />
                            <asp:RequiredFieldValidator ID="rfvDepositoAgencia" runat="server" ControlToValidate="txtDepositoAgencia" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaDeposito" />
                            <asp:RequiredFieldValidator ID="rfvDepositoContaCorrente" runat="server" ControlToValidate="txtDepositoContaCorrente" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaDeposito" />
                            <asp:RequiredFieldValidator ID="rfvDepositoValor" runat="server" ControlToValidate="txtDepositoValor" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaDeposito" />
                            <asp:ValidationSummary ID="vsmDeposito" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaDeposito" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- CONDIÇÕES DE PAGAMENTO - CARTÃO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppCondicaoPgtoCartao" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbCondicaoPagamento" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="chkMaquinaManual" EventName="CheckedChanged" />
                            <asp:AsyncPostBackTrigger ControlID="chkVendaWeb" EventName="CheckedChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlCondicaoPgtoCartao" runat="server" DefaultButton="btnSalvarCartao" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="painel" style="width: 40%; left: 30%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblCondicaoPgtoCartaoHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <%--<asp:ImageButton ID="imbCondicaoPgtoCartao" runat="server"
                                                ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbCondicaoPgtoCartao_Click" />--%>
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <ol>
                                                <li style="text-transform: uppercase; text-align: center;">
                                                    <asp:Label ID="lblCondicaoPgtoCartaoHeaderForm" runat="server" Text="<%$ Resources:Resource, lblCartaoMensagem %>" />
                                                    <hr />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartaoTipoMaquina" runat="server" />
                                                    <asp:DropDownList ID="ddlCondicaoPgtoCartaoTipoMaquina" runat="server" SkinID="DropFiltro" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlCondicaoPgtoCartaoTipoMaquina_SelectedIndexChanged" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartaoBandeira" runat="server" />
                                                    <asp:DropDownList ID="ddlCondicaoPgtoCartaoBandeira" runat="server" SkinID="DropFiltro" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlCondicaoPgtoCartaoBandeira_SelectedIndexChanged" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartaoFormaPgto" runat="server" />
                                                    <asp:DropDownList ID="ddlCondicaoPgtoCartaoFormaPgto" runat="server" SkinID="DropFiltro" />
                                                </li>
                                                <li>
                                                    <div style="margin-left: 150px;">
                                                        <asp:CheckBox ID="chkVendaWeb" runat="server" Font-Bold="true" ForeColor="Black" TextAlign="Right"
                                                            Text="<%$ Resources:Resource, lblVendaWeb %>"
                                                            AutoPostBack="true" />
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartao" runat="server" />
                                                    <asp:TextBox ID="txtCondicaoPgtoCartao" runat="server" SkinID="Filtro" MaxLength="16" />
                                                    <asp:HiddenField ID="hdfCondicaoPgtoCartao" runat="server" Value="" />
                                                </li>
                                                <li>
                                                    <div style="margin-left: 150px;">
                                                        <asp:CheckBox ID="chkMaquinaManual" runat="server" Font-Bold="true" ForeColor="Black" TextAlign="Right"
                                                            Text="<%$ Resources:Resource, lblMaquinaManual %>" />
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartaoComprovante" runat="server" />
                                                    <asp:TextBox ID="txtCondicaoPgtoCartaoComprovante" runat="server" SkinID="Filtro" Enabled="true" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartaoAutorizacao" runat="server" />
                                                    <asp:TextBox ID="txtCondicaoPgtoCartaoAutorizacao" runat="server" SkinID="Filtro" MaxLength="6" Enabled="true" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoHolderName" runat="server" />
                                                    <asp:TextBox ID="txtCondPgtoCartaoHolderName" runat="server" MaxLength="100" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoCardNumber" runat="server" Visible="false" />
                                                    <asp:TextBox ID="txtCondPgtoCartaoCardNumber" runat="server" MaxLength="20" Visible="false" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoCvc" runat="server" />
                                                    <asp:TextBox ID="txtCondPgtoCartaoCvc" runat="server" MaxLength="5" SkinID="SmallFilter" />
                                                    <asp:HiddenField ID="hdfCondPgtoCartaoCvc" runat="server" Value="" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoPrc" runat="server" />
                                                    <asp:Label ID="lblCondPgtoCartaoPrcDsc" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoValor" runat="server" />
                                                    <asp:Label ID="lblCondPgtoCartaoValorDsc" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblVld" runat="server" Text="<%$ Resources:Resource, lblValidade %>" />
                                                    <hr />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoValidadeMonth" runat="server" />
                                                    <asp:DropDownList ID="ddlCondPgtoCartaoValidadeMonth" runat="server" SkinID="DropSmallFilter">
                                                        <asp:ListItem Value="01" Text="01" Selected="True" />
                                                        <asp:ListItem Value="02" Text="02" />
                                                        <asp:ListItem Value="03" Text="03" />
                                                        <asp:ListItem Value="04" Text="04" />
                                                        <asp:ListItem Value="05" Text="05" />
                                                        <asp:ListItem Value="06" Text="06" />
                                                        <asp:ListItem Value="07" Text="07" />
                                                        <asp:ListItem Value="08" Text="08" />
                                                        <asp:ListItem Value="09" Text="09" />
                                                        <asp:ListItem Value="10" Text="10" />
                                                        <asp:ListItem Value="11" Text="11" />
                                                        <asp:ListItem Value="12" Text="12" />
                                                    </asp:DropDownList>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoValidadeYear" runat="server" />
                                                    <asp:DropDownList ID="ddlCondPgtoCartaoValidadeYear" runat="server" SkinID="DropSmallFilter" />
                                                </li>
                                                <li>
                                                    <hr />
                                                    <asp:TextBox ID="txtTagPgtoDesc" runat="server" MaxLength="255" TextMode="MultiLine" Columns="50" Rows="3" Width="98%" Enabled="false" />
                                                </li>
                                                <li style="text-align: center;">
                                                    <asp:Button ID="btnSalvarCartao" runat="server" SkinID="ButtonLeft" ValidationGroup="ValidaCartao" OnClick="btnSalvarCartao_Click" />
                                                    <asp:Button ID="btnExcluirCartao" runat="server" SkinID="ButtonCenter" OnClick="btnExcluirCartao_Click" Visible="false" />
                                                    <asp:Button ID="btnLimparCartao" runat="server" SkinID="ButtonCenter" OnClick="btnLimparCartao_Click" />
                                                    <asp:Button ID="btnMudarcondPgtoCartao" runat="server" SkinID="ButtonRight" OnClick="btnMudarCondicaoPagamento_Click" ToolTip="<%$ Resources:Resource, lblMudarCondicaoPgtoEspecial %>" Text="<%$ Resources:Resource, lblMudar %>" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                </div>
                                <%--validadores de range--%>
                                <asp:RegularExpressionValidator ID="revCondicaoPgtoCartao" ControlToValidate="txtCondicaoPgtoCartao" runat="server" ValidationGroup="ValidaCartao" EnableClientScript="true" />
                                <asp:RegularExpressionValidator ID="revCondicaoPgtoCartaoComprovante" ControlToValidate="txtCondicaoPgtoCartaoComprovante" runat="server" ValidationGroup="ValidaCartao" EnableClientScript="true" />
                                <asp:RegularExpressionValidator ID="revCondicaoPgtoCartaoAutorizacao" ControlToValidate="txtCondicaoPgtoCartaoAutorizacao" runat="server" ValidationGroup="ValidaCartao" EnableClientScript="true" />
                                <asp:RequiredFieldValidator ID="rfvCondicaoPgtoCartao" runat="server" ControlToValidate="txtCondicaoPgtoCartao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaCartao" EnableClientScript="true" />
                                <asp:RequiredFieldValidator ID="rfvCondicaoPgtoCartaoComprovante" runat="server" ControlToValidate="txtCondicaoPgtoCartaoComprovante" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaCartao" EnableClientScript="true" Enabled="true" />
                                <asp:RequiredFieldValidator ID="rfvCondicaoPgtoCartaoAutorizacao" runat="server" ControlToValidate="txtCondicaoPgtoCartaoAutorizacao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaCartao" EnableClientScript="true" Enabled="true" />
                                <asp:RequiredFieldValidator ID="rfvCondPgtoCartaoHolderName" runat="server" ControlToValidate="txtCondPgtoCartaoHolderName" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaCartao" EnableClientScript="true" />
                                <asp:RequiredFieldValidator ID="rfvCondPgtoCartaoCvc" runat="server" ControlToValidate="txtCondPgtoCartaoCvc" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaCartao" EnableClientScript="true" />
                                <asp:ValidationSummary ID="vsmCartao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaCartao" />
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- CONDIÇÕES DE PAGAMENTO - ESPECIAL --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upEspecialCondicao" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbCondicaoPagamento" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlEspecialCondicao" runat="server" DefaultButton="" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="painel" style="width: 50%; left: 25%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblEspecialCondicaoHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbEspecialCondicaoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbEspecialCondicaoClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <div style="display: table; width: 100%; height: 90%;">
                                                <div style="display: table-cell; width: 40%; height: 100%; vertical-align: middle;">
                                                    <ol>
                                                        <li>
                                                            <div style="display: table; width: 100%;">
                                                                <div style="display: table-cell; vertical-align: middle;">
                                                                    <asp:Label ID="lblEspecialCondicaoData" runat="server" />
                                                                </div>
                                                                <div style="display: table-cell; vertical-align: middle;">
                                                                    <CtlData:ControlData ID="CtlEspecialCondicaoData" runat="server" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ol>
                                                </div>
                                                <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle; text-align: center;">
                                                    <asp:ImageButton ID="imbEspecialCondicaoAdd" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px"
                                                        ToolTip="<%$ Resources:Resource, lblAdicionar %>"
                                                        ImageUrl="~/Imagens/addSelected.png"
                                                        ValidationGroup="ValidaCondicaoEspecial"
                                                        OnClick="imbEspecialCondicaoAdd_Click" />
                                                    <br />
                                                    <asp:ImageButton ID="imbEspecialCondicaoRemove" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px"
                                                        ToolTip="<%$ Resources:Resource, lblRemover %>"
                                                        ImageUrl="~/Imagens/removeSelected.png"
                                                        OnClick="imbEspecialCondicaoRemove_Click" />
                                                    <br />
                                                    <asp:ImageButton ID="imbEspecialCondicaoRemoveAll" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px"
                                                        ToolTip="<%$ Resources:Resource, lblRemoverTodos %>"
                                                        ImageUrl="~/Imagens/remove.png"
                                                        OnClick="imbEspecialCondicaoRemoveAll_Click" />
                                                </div>
                                                <div style="display: table-cell; width: 50%; height: 100%; vertical-align: middle;">
                                                    <asp:ListBox ID="lbxEspecialCondicao" runat="server" SelectionMode="Multiple" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 100%; text-align: center; vertical-align: middle;">
                                                    <asp:Button ID="btnSalvarEspecialCondicao" runat="server" SkinID="ButtonLeft" OnClick="btnSalvarEspecialCondicao_Click" Text="<%$ Resources:Resource, lblSalvar %>" />
                                                    <asp:Button ID="btnLimparEspecialCondicao" runat="server" SkinID="ButtonCenter" OnClick="btnLimparEspecialCondicao_Click" Text="<%$ Resources:Resource, lblLimpar %>" />
                                                    <asp:Button ID="btnMudarCondicaoPagamento" runat="server" SkinID="ButtonRight" OnClick="btnMudarCondicaoPagamento_Click" ToolTip="<%$ Resources:Resource, lblMudarCondicaoPgtoEspecial %>" Text="<%$ Resources:Resource, lblMudar %>" />
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:ValidationSummary ID="vsmCondicaoEspecial" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaCondicaoEspecial" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- PAINEL APROVAR / REPROVAR PEDIDOS --%>
                <asp:UpdatePanel ID="updAvalPedido" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="pnlAvalPedido" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <h3 style="color: #ffffff">Aprovar/Reprovar: Pedido
                                            <asp:Localize ID="lblAvalPedidoId" runat="server"></asp:Localize></h3>
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbAvalPedido" runat="server" ImageAlign="AbsMiddle" Width="32px" Height="32px" OnClick="btnFecharAvalPedido_Click"
                                            ToolTip="Fechar"
                                            ImageUrl="~/Imagens/Fechar.png" />
                                    </div>
                                </div>
                                <div class="painel_body">

                                    <div class="pad-5 center">
                                        <p>
                                            <b>
                                                <asp:Localize ID="lblInfoAvalPedido" runat="server"></asp:Localize></b>
                                            <br />
                                            <asp:TextBox ID="txtNotasAval" TextMode="MultiLine" Style="width: 50%; height: 90px; resize: none;" runat="server"
                                                onkeyup="return checkTamTexto('txtNotasAval', 'Observações', 'lblInfoTamNotasAval', 255)" /><br />
                                            <input type="text" class="LabelInfo" id="lblInfoTamNotasAval" style="text-align: center" />
                                        </p>
                                    </div>

                                    <div class="pad-5">
                                        <asp:GridView DataKeyNames="itemId"
                                            runat="server"
                                            ID="gvAvalItens"
                                            AutoGenerateColumns="False"
                                            AllowPaging="false"
                                            OnRowDataBound="gvAvalItens_RowDataBound" OnPageIndexChanging="gvAvalItens_PageIndexChanging">
                                            <Columns>
                                                <asp:BoundField DataField="itemId" HeaderText="Item ID" />

                                                <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />

                                                <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />

                                                <asp:BoundField DataField="saldo" HeaderText="Saldo Estoque" />

                                                <asp:BoundField DataField="valorLiquido" HeaderText="Valor Liquido" DataFormatString="{0:N2}" />

                                                <asp:BoundField DataField="pedidoItemQuantidade" HeaderText="Qtde Solicitada" />

                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Qtde Atendida">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtQtdeAtendida" runat="server" Width="80px" MaxLength="6"
                                                            onkeypress="return isNumberKey(event)" AutoPostBack="true" OnTextChanged="txtQtdeAtendida_TextChanged"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Aprovação do Item">
                                                    <ItemTemplate>
                                                        Motivo:<br />
                                                        <asp:DropDownList ID="ddlMotivoItemAprov" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMotivoItemAprov_SelectedIndexChanged"></asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Reprovação do Item">
                                                    <ItemTemplate>
                                                        <asp:Localize ID="lblMotivoItemReprov" runat="server">Motivo:</asp:Localize><br />
                                                        <asp:DropDownList ID="ddlMotivoItemReprov" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMotivoItemReprov_SelectedIndexChanged"></asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>

                                    <div class="pad-5">
                                        <asp:Localize ID="lblMsgAvisoAvalPedido" runat="server"></asp:Localize>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <asp:Panel ID="pnlAprovarPedido" runat="server" CssClass="pad-5 center">
                                                    <h3>Aprovação do Pedido</h3>
                                                    <p>
                                                        <asp:DropDownList ID="ddlMotivoPedidoAprov" runat="server"></asp:DropDownList>
                                                    </p>
                                                    <p>
                                                        <asp:Button ID="btnPedidoAprovar" runat="server" SkinID="BtnSuccess" Text="Aprovar Pedido" OnClick="btnPedidoAprovar_Click" />
                                                    </p>
                                                </asp:Panel>
                                            </div>
                                            <div class="col-lg-6">
                                                <asp:Panel ID="pnlReprovarPedido" runat="server" CssClass="pad-5 center">
                                                    <h3>Reprovação do Pedido</h3>
                                                    <p>
                                                        <asp:DropDownList ID="ddlMotivoPedidoReprov" runat="server"></asp:DropDownList>
                                                    </p>
                                                    <p>
                                                        <asp:Button ID="btnPedidoReprovar" runat="server" SkinID="BtnDanger" Text="Reprovar Pedido" OnClick="btnPedidoReprovar_Click" />
                                                    </p>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="painel_bottom">
                                    <div class="center mt-1">
                                        <asp:Button ID="btnFecharAvalPedido" runat="server" Text="Fechar" OnClick="btnFecharAvalPedido_Click" />
                                    </div>
                                </div>

                            </div>
                        </asp:Panel>

                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- PAINEL REPROVAR PEDIDO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="updReprovarPedido" runat="server" UpdateMode="Conditional">

                        <ContentTemplate>
                            <asp:Panel ID="pnlModalReprovarPedido" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel" style="width: 60%; height: 60%; left: 25%; top: 25%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblHeaderMotivos" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="btnFecharModalReprov" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                                Height="25px" TabIndex="40" ImageUrl="~/Imagens/Fechar.png" OnClick="btnFecharModalReprov_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body" style="height: 80%;">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrMotivoHeader" runat="server" Text="Reprovar Pedido" />
                                            </legend>
                                            <ol style="width: auto;">
                                                <li>
                                                    <div class="line">
                                                        <asp:Label ID="lblMotivoRepPedido" runat="server" Text="Motivo da reprovação do pedido"></asp:Label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="line">
                                                        <asp:DropDownList ID="ddlMotivoReprovPedido" runat="server" SkinID="ddlBootstrap" AutoPostBack="true"></asp:DropDownList>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="line">
                                                        <asp:Label ID="lblMotivoRepItem" runat="server" Text="Motivo da reprovação dos itens"></asp:Label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="line">
                                                        <asp:DropDownList ID="dplMotivoRepItem" runat="server" SkinID="ddlBootstrap" AutoPostBack="true"></asp:DropDownList>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="line">

                                                        <asp:Button ID="btnSalvarMotivos" runat="server" SkinID="BtnDanger-sm" Text="Reprovar" ValidationGroup="ValidacaoMotivo" OnClick="btnSalvarMotivos_Click" />

                                                        &nbsp 
                                                            <asp:Button ID="btnFecharMotivos" runat="server" SkinID="BtnDefault-sm" Text="Fechar" OnClick="btnFecharMotivos_Click" />

                                                    </div>
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>


                <%-- PAINEL PERFÍS ADM --%>
                <asp:UpdatePanel ID="uppPerfisADM" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlPerfisADM" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblPerfisADMHeader" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblSelecaoPerfil %>" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbPerfisADMClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbPerfisADMClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset style="height: 85%;">
                                        <legend>
                                            <asp:Literal ID="ltrHeaderPerfilADM" runat="server" Text="<%$ Resources:Resource, lblPerfilDisponivel %>" />
                                        </legend>

                                        <div style="width: 100%; height: 98%; display: table;">
                                            <div style="width: 100%; height: 100%; display: table-cell;">
                                                <asp:RadioButtonList ID="rblPerfisADM" runat="server"
                                                    RepeatColumns="1"
                                                    RepeatDirection="Vertical" />
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="painel_bottom">
                                    <div class="painel_bottom_button">
                                        <asp:Button ID="btnPerfisADMOk" runat="server"
                                            Text="<%$ Resources:Resource, lblOk %>"
                                            OnClick="btnPerfisADMOk_Click" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="updFuncional" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlFuncional" runat="server" Visible="false" SkinID="PnlPopUp">

                            <div class="OpacityBackGround">
                            </div>
                            <div class="painel" style="width: 40%; height: 55%; left: 30%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblFuncional" runat="server" ForeColor="White" />
                                    </div>

                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <legend>
                                            <asp:Literal ID="ltrFuncional" runat="server" />
                                        </legend>

                                        <br />
                                        <br />
                                        <ol>
                                            <li>
                                                <asp:Label ID="lblFuncionalCartao" runat="server" />
                                                <asp:TextBox ID="txtFuncionalCartao" runat="server" CssClass="txtNormal" Width="258px" TabIndex="12" />
                                            </li>

                                            <li>
                                                <div style="width: 95%; margin-top: 20px; border: solid 0px; text-align: right; margin-right: 30px;">
                                                </div>
                                            </li>
                                        </ol>
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>

                    </ContentTemplate>
                </asp:UpdatePanel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    <%-- PESQUISA CLIENTE --%>
    <div style="position: absolute;">
        <asp:UpdatePanel ID="upCliente" runat="server" UpdateMode="Conditional">
            <Triggers>
                <%--  <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteBusca" EventName="Click" />--%>
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
                                        <asp:Label ID="Label1" runat="server" />
                                        <asp:TextBox ID="TextBox1" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="31" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltrosClientePesquisa" runat="server" SkinID="ButtonLeft" TabIndex="32" OnClick="btnFiltrosClientePesquisa_Click" />
                                        <asp:Button ID="btnFiltrosClienteLimpar" runat="server" SkinID="ButtonRight" TabIndex="33" OnClick="btnFiltrosClienteLimpar_Click" />
                                    </div>
                                </div>
                                <%-- GRID CLIENTES --%>
                                <div class="gridRegistros">
                                    <asp:GridView ID="gvClientes" runat="server" TabIndex="52"
                                        DataKeyNames="clienteId,clienteTipoPessoa,clienteCNPJ,clienteIsentoIE,clienteIE,clienteCPF,clienteRG,clienteRazaoSocial,clienteNomeAbreviado,clienteRGOrgao,
                                        clienteRGDataEmissao,clienteDataCadastro,matrizFinanceira,clienteTipoCredito,clienteValorCredito,medicoId,grupoFinanceiroId,clienteGrupoFinanceiroNomeAbreviado,
                                        grupoComercialId,canalVendaId,canalVendaDescricao,clienteIdERP,medicoConsProfissional,medicoCRM,medicoUFidCRM,categoriaClienteId,categoriaClienteDescricao,
                                        mercadoId,mercadoDescricao,clienteInfoAtendentes,representanteId,representanteNomeAbreviado,representanteNome,medicoEnderecoCom,medicoNome,medicoMunicCom,medicoCEPCom,
                                        clienteRemConsig,BloqAudicon,AutorizaVacinas,AutorizaRetinoide,BloqMisoprostol,BloqFinanceiro,dataAlteracao,clienteContribuinteICMS,clienteGrupoComercialNome,clienteEmailComercial,
                                        Autoriza_Medic,clienteIdSap,clientegrupoativo,Autoriza_Antibiotico,Autoriza_Imunosupressor"
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

    <asp:UpdatePanel ID="updStatusImport" runat="server">
        <%-- 
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" />
            <asp:PostBackTrigger ControlID="btn_CancelarTarefa" />
        </Triggers> --%>
        <ContentTemplate>
            <%-- <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Enabled="false" /> --%>
            <div id="panel_StatusImport" class="areaTelaTransp" style="display: <%= StatusImportDisplay %>">
                <!-- MODAL - Aguardando... -->
                <div class="modal-dialogPostBack" style="margin-top: 150px">
                    <div class="modal-content">
                        <h3>PROCESSANDO DADOS. AGUARDE...</h3>
                        <div class="m-2 pad-10">
                            <div class="text-center">
                                <img alt="" src="../../Imagens/animProcessando.gif" />
                            </div>
                            <%-- CONTROLES DA BARRA PROGRESSO (não funciona nesta página)
                            <p>
                                <asp:Localize ID="lbl_InfoStatusImport" runat="server"></asp:Localize>
                            </p>
                            <div class="progress" style="height: 40px">
                                <asp:Localize ID="lbl_BarraStatusImport" runat="server"></asp:Localize>
                            </div>
                            <div class="m-3 pad12">
                                <asp:Button ID="btn_CancelarTarefa" runat="server" Text="Cancelar" SkinID="BtnDefault" OnClick="btn_CancelarTarefa_Click" />
                            </div> 
                            --%>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

