<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConMigracaoPagPedido.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConMigracaoPagPedido" %>


<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/font-awesome.css" rel="stylesheet" />
    <%--    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/bootstrap.js"></script>
    <link href="../../Styles/dataTables.bootstrap.css" rel="stylesheet" />--%>
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

            if (postBackElement.id == '<%= btnSalvar.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';
            }

            if (postBackElement.id == '<%= btnConferirEnviarCartao.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';

            }

            if (postBackElement.id == '<%= btnReenviarLinkCartao.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';
            }

            if (postBackElement.id == '<%= btnSalvarCartaoPayGo.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';
            }

        }



        function EndRequest(sender, args) {

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnSalvar.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';
            }

            if (postBackElement.id == '<%= btnConferirEnviarCartao.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';
            }

            if (postBackElement.id == '<%= btnReenviarLinkCartao.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';
            }

            if (postBackElement.id == '<%=btnSalvarCartaoPayGo.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';
            }
        }

        function ConsisteCampos() {
            var msg = '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liNomeMedico').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtDadosMedicoNome7PDV').value == '') ? "- Necessário informar nome do médico \r" : '';


            if (document.getElementById('ctl00_ContentPlaceHolder1_liConselhoProfissional').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_ddMedicoConsProfissional7PDV').value == '') ? "- Necessário selecionar o conselho profissional \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liCRM').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtDadosMedicoCRM7PDV').value == '') ? "- Necessário informar CRM ou CRO do médico \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liUFMedico').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_ddMedicoUf7PDV').value == '') ? "- Necessário selecionar UF do médico\r" : msg;

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteNomeAbreviado').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtNomeAbreviado7PDV').value == '') ? "- Necessário informar nome abreviado \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteNomeCompleto').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtNomeCompleto7PDV').value == '') ? "- Necessário informar nome completo \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteDataNascimento').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_CtlDataNascimento_txtData').value == '') ? "- Necessário informar a data de nascimento \r" : '';

            //if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteGenero').style.display != "none")
            //    msg += (document.getElementById('ctl00_ContentPlaceHolder1_rblGenero').value == '') ? "- Necessário informar nome do médico \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteCep').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEnderecoCep7PDV').value == '') ? "- Necessário informar o Cep do cliente \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteEndereco').style.display != "none") {
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEndereco7PDV').value == '') ? "- Necessário informar Endereço do cliente \r" : '';
                if (VerificaEndereco(document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEndereco7PDV').value) != 1) {
                    msg += "- Formato de endereço incorreto. \r  O formato de ser: ENDEREÇO, NÚMERO.";
                }
            }

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteBairro').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEnderecoBairro7PDV').value == '') ? "- Necessário informar Bairro do cliente \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteCidade').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEnderecoCidade7PDV').value == '') ? "- Necessário informar a Cidade do cliente \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteUF').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_ddClientUf7PDV').value == '') ? "- Necessário selecionar a UF do cliente \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteCelular').style.display != "none") {
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtDDDCelular7PDV').value == '') ? "- Necessário informar DDD do celular \r" : '';
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtNumeroCelular7PDV').value == '') ? "- Necessário informar número do Celular \r" : '';
            }

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteTelefone').style.display != "none") {
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtDDDTelefoneFixo7PDV').value == '') ? "- Necessário informar DDD do Telefone Fixo \r" : '';
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtTelefoneFixo7PDV').value == '') ? "- Necessário informar número do Telefone Fixo \r" : '';
            }

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteEmail').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEmail7PDV').value == '') ? "- Necessário informar o e-mail do cliente \r" : '';

            if (msg != '') {
                alert(msg);
                return false;
            } else {
                return true;
            }
        }

        function VerificaEndereco(enderecoCompleto) {
            if (enderecoCompleto.length > 0) {
                var x = enderecoCompleto.split("");
                var qtv = 0;

                for (i = 0; i < x.length; i++) {
                    qtv += (x[i] == ',') ? 1 : 0;
                }
                return qtv;
            } else {
                return 0;
            }
        }


        function ConsisteMotivoAprovacao() {
            var msg = '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_txtMotivo').value == '')
                msg = "- Necessário informar o motivo para a APROVAÇÃO.";

            if (msg != '') {
                alert(msg);
                return false;
            } else {

                if (confirm('Confirma APROVAR o pedido?'))
                    return true;
                else
                    return false;
            }
        }


        function ConsisteMotivoReprovacao() {
            var msg = '';
            if (document.getElementById('ctl00_ContentPlaceHolder1_txtMotivo').value == '')
                msg = "- Necessário informar o motivo para a REPROVAÇÃO.";

            if (msg != '') {
                alert(msg);
                return false;
            } else {
                if (confirm('Confirma REPROVAR o pedido?'))
                    return true;
                else
                    return false;
            }
        }


    </script>

    <asp:Panel ID="pnlPedido" runat="server">
        <asp:UpdatePanel ID="uppPedido" runat="server" UpdateMode="Conditional">
            <Triggers>
                <%-- PRINCIPAL --%>
                <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnReprovar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnVoltar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnBuscaPedidoParaCopia" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="chkHeaderReserva" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="cbVendaDireta" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="cbRetiraBalcao" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="cbInformaFrete" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="chkOrcamento" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="chkPedidoAmil" EventName="CheckedChanged" />

                <%--<asp:AsyncPostBackTrigger ControlID="chkHistorico" EventName="CheckedChanged" />--%>

                <%-- FILTROS --%>
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosPesquisa" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosLimpar" EventName="Click" />
               <%-- <asp:AsyncPostBackTrigger ControlID="btnFiltrosNovoCadastro" EventName="Click" />--%>
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosExcluir" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvRegistros" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="gvRegistros" EventName="PageIndexChanging" />
                <%-- CLIENTE --%>

                <asp:AsyncPostBackTrigger ControlID="imbHeaderHistoricoCliente" EventName="Click" />

                <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteCheck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteBusca" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbClienteTipoEndereco" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbPharmaSystem" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="ddlHeaderClienteTipoEndereco" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlHeaderTipoPedido" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="gvClientes" EventName="RowCommand" />

                <%-- CLIENTE PESQUISA --%>
                <%--btnfiltrar--%>
                <asp:AsyncPostBackTrigger ControlID="btnfiltrar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosClientePesquisa" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosClienteLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbFiltrosClose" EventName="Click" />
                <%-- ITEM --%>
                <asp:AsyncPostBackTrigger ControlID="imbFiltrosItemClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosItemPesquisa" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosItemLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvItens" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="gvItensPesquisa" EventName="RowCommand" />
                <%-- MÉDICO PESQUISA--%>
                <asp:AsyncPostBackTrigger ControlID="imbFiltrosMedicoClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosMedicoPesquisa" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosMedicoLimpar" EventName="Click" />
                <%-- MÉDICO --%>
                <asp:AsyncPostBackTrigger ControlID="imbMedicoCheck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbMedicoBusca" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbAnexoReceita" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvRegistrosMedico" EventName="RowCommand" />

                <%-- ORIGEM --%>
                <asp:AsyncPostBackTrigger ControlID="ddlOrigem" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="imbAdicionarOperadora" EventName="Click" />

                <%-- ANEXO --%>
                <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnLimparFormularioReceita" EventName="Click" />
                <%--<asp:AsyncPostBackTrigger ControlID="imbReceitaArquivo" EventName="Click" />--%>

                <%-- CONDIÇÕES DE PAGAMENTO --%>
                <asp:AsyncPostBackTrigger ControlID="imbCondicaoPagamento" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnCondicaoPagamentoBuscar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnCondicaoPagamentoLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbCondicaoPagamentoClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvCondicoesPagamento" EventName="RowCommand" />

                <%-- CLIENTE TRIANGULAR --%>
                <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteTriangularCeck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteTriangularBusca" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbClienteTriangularTipoEndereco" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="ddlHeaderClienteTriangularTipoEndereco" EventName="SelectedIndexChanged" />

                <%-- ITEM --%>
                <asp:AsyncPostBackTrigger ControlID="imbHeaderItemCheck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbHeaderItemFind" EventName="Click" />
                <%-- MOTIVOS --%>
                <asp:AsyncPostBackTrigger ControlID="btnSalvarMotivos" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFecharMotivos" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbFecharMotivos" EventName="Click" />
                <%-- INTEGRAÇÃO --%>
                <asp:AsyncPostBackTrigger ControlID="btnConfirmOk" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnConfirmNo" EventName="Click" />
                <%-- TABELA DE PREÇOS --%>
                <asp:AsyncPostBackTrigger ControlID="btnTabelaPrecoConfirmarOk" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnTabelaPrecoConfirmarNOk" EventName="Click" />
                <%-- DEPÓSITO --%>
                <asp:AsyncPostBackTrigger ControlID="imbCondicaoPagamentoDepositoClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnSalvarCondPgtoDeposito" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnLimparCondPgtoDeposito" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnMudarCondPgtoDeposito" EventName="Click" />

                <%-- CARTÃO --%>
                <asp:AsyncPostBackTrigger ControlID="imbCondicaoPgtoCartao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnSalvarCartao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnExcluirCartao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnLimparCartao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnMudarcondPgtoCartao" EventName="Click" />

                <%-- CONDIÇÃO ESPECIAL --%>
                <asp:AsyncPostBackTrigger ControlID="imbEspecialCondicaoClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnSalvarEspecialCondicao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnLimparEspecialCondicao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnMudarCondicaoPagamento" EventName="Click" />

                <%-- LOJA --%>
                <asp:AsyncPostBackTrigger ControlID="ddlHeaderEstabelecimento" EventName="SelectedIndexChanged" />
                <%-- UNIDADE DE NEGÓCIOS --%>
                <asp:AsyncPostBackTrigger ControlID="ddlHeaderUnidadeNegocio" EventName="SelectedIndexChanged" />

                <%-- EMPENHO/EMPENHO ITEM --%>
                <asp:AsyncPostBackTrigger ControlID="imbEmpenhoClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvEmpenhoPesquisa" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="imbEmpenhoItemClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvEmpenhoItens" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="btnItemAdicionar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbAlertaObsEmpenho" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbFecharPanelObsEmpenho" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="chkVendaComum" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="imbEmpenhoAnexosClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbEmpenhoDados" EventName="Click" />

                <%-- ORÇAMENTOS --%>
                <asp:AsyncPostBackTrigger ControlID="imbOrcamentoExistente" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnOrcamentoExistenteNok" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnOrcamentoExistenteOk" EventName="Click" />

                <%-- FOLLOW UP --%>
                <asp:AsyncPostBackTrigger ControlID="btnFollowUp" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imgFollowUpClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFollowUpRegistrar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFollowUpCancelar" EventName="Click" />

                <%-- RECEITAS --%>
                <asp:AsyncPostBackTrigger ControlID="btnReceitaEnderecoSalvar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnReceitaEnderecoCancelar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbReceitaEnderecoDocumento" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="lbReceitaEnderecoClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnReceitaDocumentoCancelar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbReceitaDocumentoEndereco" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbReceitaDocumentoClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvReceitaDocumento" EventName="RowCommand" />

                <%--7PDV--%>
                <asp:AsyncPostBackTrigger ControlID="btnEnviaAtivacao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteBusca" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbMedicoCheck7PDV" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbBuscaCep" EventName="Click" />

                <%-- PERFÍS ADM --%>
                <asp:AsyncPostBackTrigger ControlID="btnPerfisADMOk" EventName="Click" />

                <asp:AsyncPostBackTrigger ControlID="btnSalvarCartaoPayGo" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnConferirEnviarCartao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnReenviarLinkCartao" EventName="Click" />

            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppPedido">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa" Width="100%" Height="100%">
                    <fieldset style="margin-bottom: 10px; left: 0.1%; width: 99%; Height: 100%;">
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>

                        <asp:UpdatePanel ID="uppFiltros" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="imbFiltros" EventName="Click" />
                            </Triggers>
                            <ContentTemplate>
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
                                        <div style="display: table; text-align: center; width: 100%;">
                                            <div style="display: table; width: 100%;">
                                                <div class="navegacao">
                                                    <div class="boxPesquisa">
                                                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                                                            ShowHeaderLine="false" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroPedidoId" runat="server" />
                                                        <asp:TextBox ID="txtFiltroPedidoId" runat="server" TabIndex="3" SkinID="Size70" />
                                                    </div>
                                                    <div class="boxPesquisa" style="width: 170px;">
                                                        <asp:Label ID="lblFiltroCliente" runat="server" />
                                                        <asp:TextBox ID="txtFiltroCliente" runat="server" MaxLength="30" TabIndex="4" SkinID="Filtro" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroClienteIdErp" runat="server" />
                                                        <asp:TextBox ID="txtFiltroClienteIdErp" runat="server" MaxLength="30" TabIndex="5" SkinID="SmallFilter" />
                                                    </div>
                                               <%--     <div id="dvContrato" runat="server" class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroContratoId" runat="server" />
                                                        <asp:TextBox ID="txtFiltroContratoId" runat="server" MaxLength="50" SkinID="SmallFilter" TabIndex="6" />
                                                    </div>
                                                    <div id="dvEmpenho" runat="server" class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroEmpenhoId" runat="server" />
                                                        <asp:TextBox ID="txtFiltroEmpenhoId" runat="server" MaxLength="50" SkinID="SmallFilter" TabIndex="7" />
                                                    </div>
                                                    <div class="boxPesquisaCurta" style="display: none;">
                                                        <asp:Label ID="lblFiltroRepresentante" runat="server" />
                                                        <asp:TextBox ID="txtFiltroRepresentante" runat="server" MaxLength="50" TabIndex="8" SkinID="Size70" />
                                                    </div>
                                                    <div id="dvCpfFiltro" runat="server" class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroClienteCpf" runat="server" />
                                                        <asp:TextBox ID="txtFiltroClienteCpf" runat="server" TabIndex="9" SkinID="SmallFilter" MaxLength="14" />
                                                    </div>
                                                    <div id="dvTelefone" runat="server" class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroClienteTelefone" runat="server" />
                                                        <asp:TextBox ID="txtFiltroClienteTelefone" runat="server" TabIndex="10" SkinID="SmallFilter" MaxLength="20" />
                                                    </div>
                                                    <div class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroPedidoNotaFiscal" runat="server" />
                                                        <asp:TextBox ID="txtFiltroPedidoNotaFiscal" runat="server" TabIndex="11" SkinID="SmallFilter" MaxLength="30" />
                                                    </div>--%>
                                                     <div class="boxPesquisa">
                                                        <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind" TabIndex="20"
                                                            OnClick="btnFiltrosPesquisa_Click" />
                                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" TabIndex="21"
                                                            OnClick="btnFiltrosLimpar_Click" />
                                                      <%--  <asp:Button ID="btnFiltrosNovoCadastro" runat="server" Visible="false" SkinID="ButtonRightNew" TabIndex="22"
                                                            OnClick="btnFiltrosNovoCadastro_Click" />--%>
                                                        <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonCenterExcluir" TabIndex="23"
                                                            OnClick="btnFiltrosExcluir_Click" Visible="false" />
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div style="display: table; width: 100%;">
                                                <div class="navegacao">
                                                    <div id="dvGruUsuario" runat="server" class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroGrupoUsuario" runat="server" />
                                                        <asp:DropDownList ID="ddFiltroGrupoUsuario" runat="server" TabIndex="12" SkinID="DropSmallFilter" AutoPostBack="true" OnSelectedIndexChanged="ddFiltroGrupoUsuario_SelectedIndexChanged" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                                        <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" TabIndex="12" SkinID="DropSmallFilter" />
                                                    </div>
                                                    <div id="dvTipoPedido" runat="server" class="boxPesquisa" visible="false">
                                                        <asp:Label ID="lblFiltroTipoPedido" runat="server" Visible="false" />
                                                        <asp:DropDownList ID="ddFiltroTipoPedido" runat="server" TabIndex="13" SkinID="DropSmallFilter" Visible="false" />
                                                    </div>
                                                    <div id="dvSituacao" runat="server" visible="false" class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroSituacao" runat="server" />
                                                        <asp:DropDownList ID="ddFiltroSituacao" runat="server" SkinID="DropSmallFilter" TabIndex="14" />
                                                    </div>
                                                    <div id="dvEmissor" runat="server" visible="true" class="boxPesquisa">
                                                        <asp:Label ID="lblFiltrosPedidoEmissor" runat="server" />
                                                        <asp:DropDownList ID="ddlFiltrosPedidoEmissor" runat="server" SkinID="DropSmallFilter" TabIndex="15" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroPedidoItem" runat="server" />
                                                        <asp:DropDownList ID="ddFiltroPedidoItem" runat="server" SkinID="DropSmallFilter" TabIndex="16" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroPedidoTriangular" runat="server" Text='<%$ Resources:Resource, lblPedidoTipoTriangular %>' />
                                                        <asp:CheckBox ID="chkFiltroPedidoTriangular" runat="server" TabIndex="16" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroVendaDireta" runat="server" Text='<%$ Resources:Resource, lblVendaDireta %>' />
                                                        <asp:CheckBox ID="cbFiltroVendaDireta" runat="server" TabIndex="18" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:CheckBox ID="chkAguardaCliente" runat="server"
                                                            TabIndex="19"
                                                            Font-Bold="true"
                                                            TextAlign="Left"
                                                            Text="<%$ Resources:Resource, lblAguardaIntegracaoCliente %>"
                                                            OnCheckedChanged="chkHistorico_CheckedChanged" />
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                           --%>
                                              <%--  <div class="boxPesquisa">


                                                    <asp:Label ID="lblPedidoAmilFiltro" runat="server" Text='<%$ Resources:Resource, lblPedidoAmil %>' />
                                                    <asp:CheckBox ID="chkPedidoAmilFiltro" runat="server" />

                                                    <asp:Label ID="lblPedidoGaldermaFiltro" runat="server" Text='<%$ Resources:Resource, lblPedidoGalderma %>' />
                                                    <asp:CheckBox ID="chkPedidoGaldermaFiltro" runat="server" />
                                                </div>--%>
                                                <div class="boxPesquisa" style="display:none">
                                                    <asp:Label ID="lblRegistrosPagina" runat="server" Text="<%$ Resources:Resource, lblRegistrosPagina %>" />
                                                    <asp:DropDownList ID="ddlRegistrosPagina" runat="server" TabIndex="25" Height="20px" Width="50px">
                                                        <asp:ListItem Selected="True" Value="10" Text="10" />
                                                        <asp:ListItem Value="20" Text="20" />
                                                        <asp:ListItem Value="30" Text="30" />
                                                        <asp:ListItem Value="40" Text="40" />
                                                        <asp:ListItem Value="50" Text="50" />
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <%-- GRID REGISTROS --%>
                        <center />
                        <div class="gridRegistros" style="margin-top: 10px; margin-bottom: 10px;">
                            <fieldset style="height: 30px; width: 98%; margin-bottom: 5px;">
                                <div style="display: table; width: 100%; height: 100%;">
                                    <div style="display: table-cell; width: 85%; height: 30px; vertical-align: middle; text-align: left;">
                                        <div style="display: table; width: 100%; height: 100%;">
                                            <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgRed" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/LabelRed.png" />
                                            </div>
                                            <div style="display: table-cell; width: 20%; vertical-align: middle; text-align: left;">
                                                <asp:Label ID="lblRowDivergencia" runat="server" Text="<%$ Resources:Resource, lblPedidoLinhaDivergencia %>" />
                                            </div>
                                            <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgGreen" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/LabelOrange.png" />
                                            </div>
                                            <div style="display: table-cell; width: 80%; vertical-align: middle; text-align: left;">
                                                <asp:Label ID="lblRowAguardando" runat="server" Text="<%$ Resources:Resource, lblPedidoLinhaAguardando %>" />
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display: table-cell; width: 10%; height: 30px; vertical-align: middle; text-align: right;">
                                        <asp:Label ID="lblRegistrosQtd" runat="server" />
                                    </div>
                                    <div style="display: table-cell; width: 5%; height: 30px; vertical-align: middle; text-align: center;">
                                        <asp:Label ID="lblRegistrosQtdDescricao" runat="server" SkinID="LabelResposta" />
                                    </div>
                                </div>
                            </fieldset>

                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="24" DataKeyNames="pedidoId,representanteNome,clienteId,representanteId,estabelecimentoId,
                                              clienteTipoPessoa, clienteCNPJ, clienteCPF,clienteIdERP,clienteRazaoSocial,pedidoEfetuaReserva,tipoPedidoId,condicaoPagamentoId,pedidoTriangular,clienteValorCredito,pedidoDataEntregaPrevista,pedidoEntregaPeriodo,
                                              clienteIdTriangular,tipoEnderecoId,tipoEnderecoIdTriangular,clienteTriangularNome,pedidoUrgente,pedidoSituacao,notaFiscalNumero,tipoEnderecoIdDescricaoTriangular,
                                              UsuarioNome,condicaoPagamentoDescricao,pedidoData,pedidoObservacoes,pedidoObservacoesInternas,medicoId,medicoConsProfissional,medicoCRM,medicoUFidCRM,vendaDireta,backOfficeConferencia,backOfficeReceita,
                                              tipoEnderecoIdDescricao,BackOfficeFinanceiro,usuarioId,unidadeNegocioId,ufId,clienteEnderecoCidade,freteValorPadrao,freteValorInformado,representanteNomeAbreviado,
                                              pedidoObservacoesNotaFiscal,clienteTriangularERP,ufIdTriangular,clienteEnderecoCidadeTriangular,transportadoraId,prazoEntrega,pedidoFreteInformado,empenhoId,
                                              boConferenciaAprovador,boConferenciaAprovacaoData,boReceitaAprovador,boReceitaAprovacaoData,boFinanceiroAprovador,boFinanceiroAprovacaoData,tipoMotivoId,pedidoMotivoDescricao,usuarioIdMotivo,pedidoOrcamento,pedidoOrcamentoValidade,
                                              motivoSupervisao,pedidoSitIntegracaoMsg,pedidoSitIntegracao, bopjFinanceiroAprovador,bopjFinanceiroAprovacaoData, numeroEmbarque,tagPgto,contratoLicitacaoId,empenhoClientePrincipal,contratoLicitacaoSeq,empenhoObservacao,
                                              pedidoIdHistorico,usuarioIdHistorico,dataAlteracao,pedidoAguardaCliente,pedidoPossuiReembolso,pedidoOrdemReserva,SevenPDVNrCentral,SevenPDVPedidoIntegra,SevenPDVEfetivado,SevenPDVFinalizado,SevenPDVCartaoNro,pedidoIntegraFidelize,
                                              SevenPDVLote,SevenPDVCancelado,SevenPDVFinalizaLote,SevenPDVNrLocal,AutorizaVacinas,AutorizaRetinoide,Autoriza_Psico,Autoriza_Medic,
                                              PharmaSystemNrCentral,PharmaSystemPedidoIntegra,PharmaSystemEfetivado,PharmaSystemFinalizado,PharmaSystemCancelado,PharmaSystemCartaoNro,
                                PharmaSystemProjeto,AgrupadorId,transportadoraIdRedespacho,Bionexo,grupoGarga,pedidoIntegraEpharma,pedidoEPharmaNrCartao,pedidoEPharmaProjeto,clienteRemConsig, origemId, operadoraId, 
                                observacaoBCare,pedidoIntegraFuncional,reservaid,notaFiscalNumeroTransf,notaFiscalSerieTransf,clienteGrupoComercialNome,clienteContribuinteICMS,DataAgendamentoInteg,PedidoAgendado, clientegrupoativo,transportadoraEmergencial,transportadoraOrcamento,pedidoIntegraMerck,PedidoAmil,pedidoGalderma,RetiraBalcao,Autoriza_Antibiotico,Autoriza_Imunosupressor"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging" OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound" OnRowDeleting="gvRegistros_RowDeleting"
                                OnRowUpdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" Visible="false">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <%--visivel apenas para financeiro --%>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbPedidoId" runat="server"
                                                CommandName="FollowUp"
                                                CommandArgument='<%# Eval("pedidoId") %>'
                                                ToolTip="<%$ Resources:Resource, lblVisualizarFollowUp %>"
                                                Text='<%# Eval("pedidoId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="pedidoData" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrCliente" runat="server" Text='<%# FormataStringSaida(Eval("ClienteRazaoSocial"), txtFiltroCliente.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="pedidoItemDataReserva" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px" />
                                    <asp:BoundField DataField="numeroEmbarque" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItmNumeroNotaFiscal" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItmNumeroNotaFiscalTriangular" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="condicaoPagamentoDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPedidoSituacao" runat="server" Text='<%# GetResourceValue(Eval("pedidoSituacao").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioNome" runat="server" Text='<%# FormataStringSaida(Eval("DescricaoPedido"), string.Empty) %>' />
                                            <%--<asp:Literal ID="ltrUsuarioNome" runat="server"   
                                                         Text='<%# FormataStringSaida(Eval("usuarioId"), 
                                                                                        (ddlFiltrosPedidoEmissor.SelectedItem != null) ? 
                                                                                            !String.IsNullOrEmpty(ddlFiltrosPedidoEmissor.SelectedValue) ? 
                                                                                                ddlFiltrosPedidoEmissor.SelectedItem.Text.Split(new string[]{"-"}, StringSplitOptions.None)[1].Trim() : 
                                                                                                    string.Empty : string.Empty) %>'  />--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="pedidoValorTotal" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" DataFormatString="{0:###,###,###,##0.00}" />
                                    <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="lblEditor" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:Image ID="imgConferencia" runat="server" ImageAlign="AbsMiddle" Width="30px" Height="30px"
                                                Visible='<%# Eval("backOfficeConferencia") == null || String.IsNullOrEmpty(Eval("backOfficeConferencia").ToString()) ? false : bool.Parse(Eval("backOfficeConferencia").ToString()) ? true : false %>'
                                                ToolTip="<%$ Resources:Resource, lblBackOfficeConferencia %>"
                                                ImageUrl="~/Imagens/saveCheck_2.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgReceita" runat="server" ImageAlign="AbsMiddle"
                                                CommandName="BckReceita"
                                                SkinID="ImgGrid"
                                                CommandArgument='<%# Eval("pedidoId") %>'
                                                Visible='<%# Eval("backOfficeReceita") == null || String.IsNullOrEmpty(Eval("backOfficeReceita").ToString()) ? false : bool.Parse(Eval("backOfficeReceita").ToString()) ? true : false %>'
                                                ToolTip="<%$ Resources:Resource, lblBackOfficeReceita %>"
                                                ImageUrl="~/Imagens/saveCheck_2.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:Image ID="imgFinanceiro" runat="server" ImageAlign="AbsMiddle" Width="30px" Height="30px"
                                                Visible='<%# Eval("backOfficeFinanceiro") == null || String.IsNullOrEmpty(Eval("backOfficeFinanceiro").ToString())  ? false : bool.Parse(Eval("backOfficeFinanceiro").ToString()) ? true : false %>'
                                                ToolTip="<%$ Resources:Resource, lblBackOfficeFinanceiro %>"
                                                ImageUrl="~/Imagens/saveCheck_2.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" Visible="false">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgIntegrar" runat="server" CommandName="Integrar" SkinID="ImgGrid" Visible="false"
                                                ToolTip="<%$ Resources:Resource, lblIntegrar %>" CommandArgument='<%# Eval("pedidoId") + "|" + ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/IntegrarEMS.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgReprovar" runat="server" CommandName="Reprovar" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblReprovar %>" CommandArgument='<%# Eval("pedidoId") + "|" + ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/Reprovar.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" Visible="false">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgRevisar" runat="server" CommandName="Revisar" SkinID="ImgGrid" Visible="false"
                                                ToolTip="<%$ Resources:Resource, lblRevisar %>" CommandArgument='<%# Eval("pedidoId") + "|" + ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/Revisar.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbCancelar" runat="server" CommandName="Cancelar" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblNaoOk %>" CommandArgument='<%# Eval("pedidoId") + "|" + ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/Fechar.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnVisualizarNF" runat="server" CommandName="VisualizarNF" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblInfoEntrega %>" CommandArgument='<%# Eval("pedidoId") + "|" + Eval("ItmNumeroNotaFiscal") + "|" + Eval("clienteId") + "|" +   Eval("estabelecimentoId") + "|" + ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/truck.png" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Update" SkinID="ImgGrid"
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

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <fieldset style="margin-bottom: 80px; margin-left: 0px; left: 0.5%; height: auto; width: 99%;">
                        <%--<fieldset style="margin-bottom: 80px; margin-left: 0px;>--%>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>

                        <%-- CORPO --%>
                        <%--<div style="padding: 0 0 0 0; display: table; width: 100%; height: 100%; position: fixed; _position: relative; background-color: Green;">--%>

                        <%-- HEADER --%>
                        <div style="display: table; width: 100%;">

                            <div style="width: 100%; padding-bottom: 3px; display: table;">
                                <%--<div style="text-align: left; padding-right: 5px; display: table-cell; width: 45%;">--%>
                                <div style="text-align: left; padding-right: 5px; display: table; width: 100%;">
                                    <div style="width: 100%; display: table;">
                                        <div style="width: 5%; display: table-cell; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoId" runat="server" />
                                        </div>
                                        <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoIdDescricao" runat="server" ForeColor="Blue" />
                                        </div>
                                        <div style="width: 5%; display: table-cell; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoData" runat="server" />
                                        </div>
                                        <div style="width: 20%; display: table-cell; text-align: center; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoDataDescricao" runat="server" ForeColor="Blue" />
                                        </div>
                                        <div style="width: 5%; display: table-cell; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoSituacao" runat="server" />
                                        </div>
                                        <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoSituacaoDescricao" runat="server" SkinID="LabelResposta" />
                                        </div>
                                        <div style="width: 5%; display: table-cell; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderMotivo" runat="server" />
                                        </div>
                                        <div style="width: 40%; display: table-cell; vertical-align: middle;">
                                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 320px; margin-left: 5px;">
                                                <asp:Label ID="lblHeaderMotivoDescricao" runat="server" SkinID="LabelResposta" />
                                            </div>
                                        </div>
                                    </div>

                                    <fieldset>
                                        <div style="width: 100%; display: table;">
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderLimiteCredito" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderLimiteCreditoValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderSaldoLimite" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderSaldoLimiteValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 13%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderValorAberto" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderValorAbertoValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderValorAtraso" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderValorAtrasoValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderSaldoConsig" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderSaldoConsigValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderTransicao" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderTransicaoValor" runat="server" ForeColor="Blue" />
                                            </div>

                                        </div>
                                    </fieldset>
                                </div>

                                <fieldset>
                                    <div style="display: table; width: 100%;">
                                        <div style="display: table-cell; width: 25%;">
                                            <asp:Label ID="lblHistoricoUsuario" runat="server" Font-Bold="true" ForeColor="Blue" />
                                        </div>
                                        <div style="text-align: right; display: table-cell; width: 25%;" id="divBuscaPedidoParaCopia" runat="server">
                                            <div style="width: 100%; display: table; text-align: right; height: 100%;">
                                                <div style="display: table-cell; text-align: right; height: 100%; vertical-align: middle;">
                                                    <asp:Button ID="btnFollowUp" runat="server" Text="<%$ Resources:Resource, lblFollowUp %>" OnClick="btnFollowUp_Click" />
                                                </div>
                                                <div style="text-align: right; height: 100%; vertical-align: middle;">
                                                    <div style="display: none; text-align: right; height: 100%; vertical-align: middle;">
                                                        <div id="dvCopia" runat="server" style="vertical-align: middle;">
                                                            <asp:Panel ID="pnlCopia" runat="server" DefaultButton="btnBuscaPedidoParaCopia">
                                                                <asp:TextBox runat="server" ID="txtBuscaPedidoParaCopia" Width="50px" MaxLength="10" />
                                                                <asp:Button runat="server" ID="btnBuscaPedidoParaCopia" Width="90px" ValidationGroup="ValidaCopiaPedido" OnClick="btnBuscaPedidoParaCopia_Click" />
                                                                <asp:RequiredFieldValidator ID="rfvBuscaPedidoParaCopia" runat="server" ControlToValidate="txtBuscaPedidoParaCopia" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaCopiaPedido" />
                                                                <asp:ValidationSummary ID="vsmBuscaPedidoParaCopia" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaCopiaPedido" />
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="text-align: right; display: table-cell; width: 50%; vertical-align: middle;">
                                            <asp:ImageButton ID="imbHeaderAcessaSac" runat="server" Width="25px" Height="25px" ToolTip="<%$ Resources:Resource, lblSac %>"
                                                ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/sac.png" />
                                               <asp:Button ID="btnMigrarPagamento" runat="server" SkinID="ButtonLeftSave" TabIndex="1" ValidationGroup="Validacao" Text="Migrar Pagamento" OnClick="btnMigrarPagamento_Click" OnClientClick="this.disabled=true; __doPostBack(this.name, '');" />
                                            <asp:CheckBox ID="chkFinalizarProcesso" runat="server" TextAlign="Right" Font-Bold="true" Visible="false" Text="<%$ Resources:Resource, lblFinalizaProcesso %>" />
                                            <asp:Button ID="btnIntegrar" runat="server" SkinID="ButtonCenter" TabIndex="2" OnClick="btnIntegrar_Click" Visible="false" />
                                            <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeftSave" TabIndex="1" ValidationGroup="Validacao" OnClick="btnSalvar_Click" OnClientClick="this.disabled=true; __doPostBack(this.name, '');" />
                                            <%--OnClientClick="this.disabled=true; __doPostBack(this.name, '');" />--%>
                                            <asp:Button ID="btnCancelar" runat="server" SkinID="ButtonCenterCancel" TabIndex="3" OnClick="btnCancelar_Click" />
                                            <asp:Button ID="btnReprovar" runat="server" SkinID="ButtonCenterDisagree" TabIndex="4" OnClick="btnReprovar_Click" />
                                            <asp:Button ID="btnRevisar" runat="server" SkinID="ButtonCenter" TabIndex="5" OnClick="btnRevisar_Click" />
                                            <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonCenterClean" TabIndex="6" OnClick="btnLimpar_Click" />
                                            <asp:Button ID="btnAprovarLimite" runat="server" SkinID="ButtonCenterClean" TabIndex="7" OnClick="btnAprovarLimite_Click" Visible="false" />
                                            <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnVoltar_Click" />
                                        </div>

                                    </div>
                                </fieldset>

                                <fieldset>
                                    <table>
                                        <tr>
                                            <td>

                                                <div class="Label" style="margin: 0 10px 0 10px; text-align: left !important">
                                                    <label>Cliente Contribuinte ICMS: </label>
                                                    <asp:Label ID="lblContribuinteICMS" runat="server" />
                                                </div>

                                            </td>
                                            <td>

                                                <div class="Label" style="text-align: left !important">
                                                    <label>Grupo Cliente: </label>
                                                    <asp:Label ID="lblGrupoCliente" runat="server" />
                                                </div>
                                            </td>
                                        </tr>

                                    </table>

                                </fieldset>

                            </div>
                            <fieldset>
                                <ol>
                                    <li>
                                        <div style="width: 100%; display: table;">
                                            <asp:Panel ID="pnlLinha1" runat="server">
                                                <div style="width: 500px; display: table-cell;">
                                                    <asp:Panel ID="pnlHeaderCliente" runat="server" DefaultButton="imbHeaderClienteCheck">

                                                        <div style="width: 500px; display: table;">
                                                            <div style="display: table-cell; width: 320px;">

                                                                <asp:Label ID="lblHeaderCliente" runat="server" Width="99px" />
                                                                <asp:TextBox ID="txtHeaderClienteId" runat="server" SkinID="Pedido" MaxLength="50" TabIndex="7" />
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

                                                                <asp:ImageButton ID="imbHeaderAdicionaCliente" runat="server" Width="20px" Height="20px"
                                                                    ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/adicionar.png" OnClick="imbHeaderAdicionaCliente_Click" />

                                                                <asp:Image ID="imbInfo" runat="server" Width="20px" Height="20px" ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/info.png" />

                                                                <asp:ImageButton ID="imbHeaderHistoricoCliente" runat="server" ToolTip="Historico de Compra" Width="20px" Height="20px"
                                                                    ImageAlign="AbsMiddle" TabIndex="8" ImageUrl="~/Imagens/hourglass.png" OnClick="imbHeaderHistoricoCliente_Click" />

                                                            </div>
                                                            <div style="display: table-cell; width: 180px;">
                                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 180px;">
                                                                    <asp:Label ID="lblHeaderClienteNome" runat="server" SkinID="LabelResposta" />
                                                                </div>
                                                                <asp:TextBox ID="txtClienteIdNone" runat="server"  />
                                                            </div>

                                                        </div>
                                                    </asp:Panel>

                                                </div>

                                                <div style="width: 530px; display: table-cell; vertical-align: middle;">
                                                    <asp:Label ID="lblHeaderClienteTipoEndereco" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlHeaderClienteTipoEndereco" runat="server" SkinID="DropFiltro" TabIndex="12" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlHeaderClienteTipoEndereco_SelectedIndexChanged" />
                                                    <asp:ImageButton ID="imbClienteTipoEndereco" runat="server"
                                                        ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                        ToolTip="<%$ Resources:Resource, lblPesquisar %>" ImageUrl="~/Imagens/find.png"
                                                        OnClick="imbClienteTipoEndereco_Click" />
                                                    <asp:Label ID="lblHeaderCreditoLimite" runat="server" Width="80px" Visible="false" />
                                                    <asp:Label ID="lblHeaderCreditoLimiteValor" Visible="false" runat="server" ForeColor="Blue" />
                                                    <asp:Label ID="lblCidadeSelecionada" runat="server"> </asp:Label>

                                                </div>

                                                <div style="width: 250px; display: table-cell;">

                                                    <asp:CheckBox ID="chkHeaderReserva" runat="server" Font-Bold="true" AutoPostBack="true"
                                                        TabIndex="24" OnCheckedChanged="chkHeaderReserva_CheckedChanged" />
                                                    <asp:DropDownList ID="dllTipoReserva" Visible="false" runat="server"
                                                        SkinID="DropFiltro" TabIndex="10"
                                                        OnSelectedIndexChanged="dllTipoReserva_SelectedIndexChanged">
                                                        <asp:ListItem Value="">Selecionar</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:ImageButton ID="btnHistoricoKs" runat="server" Width="25px"
                                                        Height="25px" ImageAlign="AbsMiddle" TabIndex="15" ImageUrl="~/Imagens/historico.png"
                                                        ToolTip="<%$ Resources:Resource, lblHistoricoKs %>" />

                                                </div>
                                            </asp:Panel>
                                        </div>

                                    </li>
                                    <li>
                                        <div style="width: 100%; display: table;">
                                            <asp:Panel ID="pnlLinha2" runat="server">
                                                <div style="width: 500px; display: table-cell;">
                                                    <asp:Label ID="lblHeaderEstabelecimento" runat="server" Width="99px" />
                                                    <asp:DropDownList ID="ddlHeaderEstabelecimento" runat="server"
                                                        SkinID="DropFiltro" TabIndex="10" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlHeaderEstabelecimento_SelectedIndexChanged" />
                                                    <asp:ImageButton ID="imbEmpenhoDados" runat="server"
                                                        ImageAlign="AbsMiddle" Width="20px" Height="20px"
                                                        ToolTip="<%$ Resources:Resource, lblDadosEmpenho %>" ImageUrl="~/Imagens/find.png"
                                                        OnClick="imbEmpenhoDados_Click" />
                                                    <asp:ImageButton ID="imbPharmaSystem" runat="server" Width="25px" Height="25px"
                                                        ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/pharma.png"
                                                        title="Pharma System" OnClick="imbPharmaSystem_Click" />
                                                    <asp:ImageButton ID="imgEpharma" runat="server" Width="30px" Height="30px"
                                                        ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/epharma.png"
                                                        title="EPharma" OnClick="imgEpharma_Click" />
                                                </div>

                                                <div style="width: 530px; display: table-cell;">
                                                    <asp:Label ID="lblHeaderCondicaoPagamento" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlHeaderCondicaoPagamento" runat="server" SkinID="DropFiltro" Visible="false" TabIndex="13" />
                                                    <asp:TextBox ID="txtCondicaoPagamento" runat="server" Enabled="false" Font-Bold="true" SkinID="Filtro" />
                                                    <asp:ImageButton ID="imbCondicaoPagamento" runat="server"
                                                        ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                        ToolTip="<%$ Resources:Resource, lblPesquisar %>" ImageUrl="~/Imagens/find.png"
                                                        OnClick="imbCondicaoPagamento_Click" />
                                                    <asp:Label ID="lblHeaderCreditoValorEmAberto" runat="server" Width="80px" />
                                                    <asp:Label ID="lblHeaderCreditoValorEmAbertoValor" runat="server" ForeColor="Blue" />
                                                </div>

                                                <div style="width: 250px; display: table-cell;">
                                                    <asp:Panel ID="pnlVendaDireta" runat="server">
                                                        <div style="display: table; width: 100%;">
                                                            <div style="display: table-cell; width: 50%;">
                                                                <asp:CheckBox ID="cbVendaDireta" runat="server" Font-Bold="true" AutoPostBack="true"
                                                                    OnCheckedChanged="cbVendaDireta_CheckedChanged" />
                                                            </div>
                                                            <div style="display: table-cell; width: 50%;">
                                                                <asp:Label ID="lblOrcamentoValidadeTexto" runat="server" Text="<%$ Resources:Resource, lblValidade %>" />
                                                            </div>
                                                        </div>
                                                    </asp:Panel>

                                                    <%--<asp:CheckBox ID="cbVendaDireta" runat="server" Font-Bold="true" 
                                                                oncheckedchanged="cbVendaDireta_CheckedChanged"  AutoPostBack="true"/>--%>
                                                </div>

                                               
                                            </asp:Panel>
                                        </div>
                                    </li>
                                    <li>
                                        <div style="width: 100%; display: table;">
                                            <asp:Panel ID="pnlLinha3" runat="server">
                                                <div style="width: 500px; display: table-cell;">
                                                    <asp:Label ID="lblHeaderTipoPedido" runat="server" Width="100px" />
                                                    <asp:DropDownList ID="ddlHeaderTipoPedido" runat="server" SkinID="DropFiltro" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlHeaderTipoPedido_SelectedIndexChanged" />
                                                    <asp:Image ID="imgInfoCfop" runat="server" Width="25px" Height="25px"
                                                        ImageAlign="AbsMiddle"
                                                        ToolTip="<%$ Resources:Resource, msgPedidoCfopDisponibilidade %>"
                                                        ImageUrl="~/Imagens/receita.png" />
                                                    <span id="spToolTip" style="DISPLAY: none; Z-INDEX: 100; POSITION: absolute; HEIGHT: 10px; z-order: 100;"></span>
                                                    <asp:CheckBox ID="chkVendaComum" runat="server" Font-Bold="true" TextAlign="Right" AutoPostBack="true"
                                                        OnCheckedChanged="chkVendaComum_CheckedChanged" />
                                                </div>
                                                <div style="width: 530px; display: table-cell;">
                                                    <asp:Label ID="lblHeaderUnidadeNegocio" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlHeaderUnidadeNegocio" runat="server" AutoPostBack="true"
                                                        SkinID="DropFiltro" OnSelectedIndexChanged="ddlHeaderUnidadeNegocio_SelectedIndexChanged" />

                                                    <asp:Label ID="lblHeaderCreditoDisponivel" runat="server" Width="80px" />
                                                    <asp:Label ID="lblHeaderCreditoDisponivelValor" runat="server" />
                                                </div>
                                                  <div style="width: 140px; display: table-cell;">
                                                    <asp:Panel ID="pnlRetiraBalcao" runat="server">
                                                        <div style="display: table; width: 100%;">
                                                            <div style="display: table-cell; width: 50%;">
                                                                <asp:CheckBox ID="cbRetiraBalcao" runat="server" Font-Bold="true" AutoPostBack="true" Text="Retira Balcão"
                                                                    OnCheckedChanged="cbRetiraBalcao_CheckedChanged" />
                                                            </div>

                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div style="width: 245px; display: table-cell;">
                                                    <asp:Panel ID="pnlOrcamento" runat="server">
                                                        <div style="display: table; width: 100%;">
                                                            <div style="display: table-cell; width: 50%;">
                                                                <asp:CheckBox ID="chkHeaderUrgente" runat="server" Font-Bold="true" TabIndex="25" Visible="false" />
                                                                <asp:CheckBox ID="chkOrcamento" runat="server" Font-Bold="true" AutoPostBack="true" OnCheckedChanged="chkOrcamento_CheckedChanged" />
                                                            </div>
                                                            <div style="display: table-cell; width: 50%;">
                                                                <CtlData:ControlData ID="CtlOrcamentoValidade" runat="server" ValidationGroup="Validacao" rfvEnable="false" />
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                               
                                            </asp:Panel>
                                        </div>
                                    </li>
                                </ol>
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
                            <asp:Panel ID="pnlHeaderRepresentante" runat="server" DefaultButton="imbHeaderRepresentanteCheck">
                                <fieldset>
                                    <ol>
                                        <li>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblHeaderRepresentante" runat="server" Width="100px" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtHeaderRepresentanteId" runat="server" SkinID="Pedido" MaxLength="50" Enabled="false" TabIndex="18" />

                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ID="imbHeaderRepresentanteCheck" runat="server" Width="25px" Height="25px"
                                                            Visible="false" ImageAlign="AbsMiddle" TabIndex="19" ImageUrl="~/Imagens/check.png"
                                                            OnClick="imbHeaderRepresentanteCheck_Click" />
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ID="imbHeaderRepresentanteBusca" runat="server" Width="25px" Height="25px"
                                                            Visible="false" ImageAlign="AbsMiddle" TabIndex="20" ImageUrl="~/Imagens/find.png"
                                                            OnClick="imbHeaderRepresentanteBusca_Click" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblHeaderRepresentanteNome" runat="server" SkinID="LabelResposta" />
                                                    </td>
                                                    <td style="display: none">
                                                        <asp:Label ID="lblTransportadora" runat="server" />
                                                    </td>
                                                    <td style="display: none">
                                                        <asp:DropDownList ID="ddlTransportadora" runat="server" SkinID="DropFiltro" AutoPostBack="true" OnSelectedIndexChanged="ddlTransportadora_SelectedIndexChanged" />
                                                    </td>
                                                    <td style="display: none">
                                                        <asp:Label ID="lblRedespacho" runat="server" />
                                                    </td>
                                                    <td style="display: none">
                                                        <asp:DropDownList ID="dplRedespacho" Enabled="false" runat="server" SkinID="DropFiltro" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkEmergencial" runat="server" Visible="true" AutoPostBack="true" OnCheckedChanged="chkEmergencial_CheckedChanged" Font-Bold ="true" Text="<%$ Resources:Resource, lblEmergencial %>" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkTransportadoraOrcamento" runat="server" AutoPostBack="true" OnCheckedChanged="chkTransportadoraOrcamento_CheckedChanged" Visible="true" Font-Bold="true" Text="<%$ Resources:Resource, lblTransportadoraOrcamento %>" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </li>

                                    </ol>
                                </fieldset>
                            </asp:Panel>
                            <%-- MEDICO PRESCRITO / RECEITA--%>
                            <div style="width: 100%; display: table; height: 100%;">

                                <div style="width: 50%; display: table-cell;">
                                    <asp:Panel ID="pnlMedicoPrescritor" runat="server" DefaultButton="imbMedicoCheck" Height="100%">
                                        <fieldset>
                                            <ol>
                                                <li>
                                                    <asp:Label ID="lblMedicoPrescritor" runat="server" Width="100px" />
                                                    <asp:TextBox ID="txtMedicoPrescritor" runat="server" SkinID="Pedido" MaxLength="50" TabIndex="21" />
                                                    <asp:HiddenField ID="hdMedicoPrescritorNome" runat="server" />
                                                    <asp:HiddenField ID="hdMedicoPrescritorEndereco" runat="server" />
                                                    <asp:HiddenField ID="hdMedicoPrescritorMunicipio" runat="server" />
                                                    <asp:HiddenField ID="hdMedicoPrescritorCEP" runat="server" />

                                                    <asp:ImageButton ID="imbMedicoCheck" runat="server" Width="25px" Height="25px"
                                                        ImageAlign="AbsMiddle" TabIndex="22" ImageUrl="~/Imagens/check.png" OnClick="imbMedicoCheck_Click" />
                                                    <asp:ImageButton ID="imbMedicoBusca" runat="server" Width="25px" Height="25px" ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                        ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/find.png" OnClick="imbMedicoBusca_Click" />
                                                    <asp:LinkButton ID="SevenPDVTeste" Text="Open 7PDV" Style="color: #000" runat="server" Visible="false" />
                                                    <asp:ImageButton ID="imbAdicionarMedico" runat="server" Width="20px" Height="20px" Visible="false"
                                                        ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/adicionar.png" OnClick="imbAdicionarMedico_Click" />

                                                    <asp:Label ID="lblMedicoPrescritorNome" runat="server" SkinID="LabelResposta" />





                                                </li>

                                            </ol>
                                        </filedset>
                                    </asp:Panel>
                                </div>





                                <%-- ANEXO RECEITA--%>
                                <div style="width: 50%; display: table-cell; height: 100%;">
                                    <asp:Panel ID="pnlReceitaAnexo" runat="server">
                                        <fieldset>
                                            <ol>
                                                <li>
                                                    <asp:Label ID="lblAnexaReceita" runat="server" SkinID="LabelForm" />
                                                    <asp:ImageButton ID="imbAnexoReceita" runat="server" Width="25px" Height="25px"
                                                        ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/anexo.png" OnClick="imbAnexoReceita_Click" />

                                                    <asp:Image ID="imgExisteReceita" runat="server" Width="25px" Height="25px"
                                                        ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/receita.png" />
                                                </li>
                                            </ol>
                                        </filedset>
                                    </asp:Panel>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="uppOrigem" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <%-- ORIGEM E OPERADORA --%>
                                    <div style="width: 100%; display: table; height: 100%;">
                                        <div style="width: 50%; display: table-cell;">
                                            <asp:Panel ID="pnlOrigem" runat="server" Height="100%" Visible="false">
                                                <fieldset>
                                                    <ol>
                                                        <li>
                                                            <asp:Label ID="lblOrigem" runat="server" Width="100px" />
                                                            <asp:DropDownList ID="ddlOrigem" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlOrigem_SelectedIndexChanged" Width="400px" />
                                                        </li>
                                                    </ol>
                                                </filedset>
                                            </asp:Panel>
                                        </div>

                                        <div style="width: 50%; display: table-cell; height: 100%;">
                                            <asp:Panel ID="pnlOperadora" runat="server" Visible="false">
                                                <fieldset>
                                                    <ol>
                                                        <li>
                                                            <asp:Label ID="lblOperadora" runat="server" Width="100px" />
                                                            <asp:DropDownList ID="ddlOperadora" runat="server" AutoPostBack="true" Width="400px" />
                                                            <asp:ImageButton ID="imbAdicionarOperadora" runat="server" Width="20px" Height="20px" Visible="true"
                                                                ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/adicionar.png" OnClick="imbAdicionarOperadora_Click" />

                                                            <asp:Label ID="Label9" runat="server" SkinID="LabelResposta" />
                                                        </li>
                                                    </ol>
                                                </filedset>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div style="display: table; width: 100%;">
                                <asp:Panel ID="pnlItem" runat="server" DefaultButton="imbHeaderItemCheck">
                                    <fieldset>
                                        <ol style="width: 100%;">
                                            <li style="width: 97%;">

                                                <div style="display: table; width: 100%; height: 30px;">
                                                    <div style="display: table-cell; vertical-align: middle; width: 300px; height: 100%;">

                                                        <asp:Label ID="lblHeaderItemId" runat="server" Width="100px" />
                                                        <asp:TextBox ID="txtHeaderItemId" runat="server" SkinID="Pedido" Enabled="false" MaxLength="50" TabIndex="21" AutoPostBack="true" OnTextChanged="txtHeaderItemId_TextChanged" />
                                                        <ucc:AutoCompleteExtender ID="aceItem" runat="server"
                                                            CompletionListCssClass="autocomplete_list1"
                                                            CompletionListItemCssClass="autocomplete_listitem"
                                                            CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                            CompletionInterval="100"
                                                            EnableCaching="false"
                                                            MinimumPrefixLength="3"
                                                            UseContextKey="true"
                                                            TargetControlID="txtHeaderItemId"
                                                            ServiceMethod="GetItensPedido"
                                                            ServicePath="~/AppWs/WsGetItens.asmx" />

                                                        <asp:ImageButton ID="imbHeaderItemCheck"  Enabled="false"  runat="server" Width="25px" Height="25px" ValidationGroup="ValidaBuscaItem"
                                                            ImageAlign="AbsMiddle" TabIndex="22" ImageUrl="~/Imagens/check.png" OnClick="imbHeaderItemCheck_Click" Visible="false" />

                                                        <asp:ImageButton ID="imbHeaderItemFind" Enabled="false"  runat="server" Width="25px" Height="25px" ValidationGroup="ValidaBuscaItem"
                                                            ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/find.png" OnClick="imbHeaderItemFind_Click" />

                                                        <asp:ImageButton ID="btnEstoque" Enabled="false"  runat="server" Width="25px"
                                                            Height="25px" ImageAlign="AbsMiddle" TabIndex="15" ImageUrl="~/Imagens/estoque.png"
                                                            ToolTip="<%$ Resources:Resource, lblEstoque %>" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: auto; height: 100%;">
                                                        <div class="line" style="width: auto; text-align: left;">
                                                            <%-- <div class="line_itens_left">
                                                                <asp:Label ID="lblTransportadora" runat="server" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:DropDownList ID="ddlTransportadora" runat="server" SkinID="DropFiltro" AutoPostBack="true" OnSelectedIndexChanged="ddlTransportadora_SelectedIndexChanged" />
                                                            </div>
                                                            <div style="margin-left: 10px;" class="line_itens_left">
                                                                <asp:Label ID="lblRedespacho" runat="server" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:DropDownList ID="dplRedespacho" Enabled="false" runat="server" SkinID="DropFiltro" />
                                                            </div>--%>
                                                            <div class="line_itens">
                                                                <asp:CheckBox ID="chkPedidoAgendado" runat="server" Font-Bold="true" Enabled="false" TextAlign="Right"   OnCheckedChanged="chkPedidoAgendado_CheckedChanged" AutoPostBack="true" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:Label ID="lblDataAgendamento" runat="server" Visible="false" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <CtlData:ControlData ID="CtlDataAgendamento" runat="server" Visible="false" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:Label ID="lblHeaderItemDataEntregaPedido" runat="server" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <CtlData:ControlData ID="CtlDataEntregaPedido" runat="server" ValidationGroup="Validacao" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:Label ID="lblHeaderItemEntregaPeriodo" runat="server" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:DropDownList ID="ddlHeaderItemEntregaPeriodo" runat="server" SkinID="DropFiltro">
                                                                    <asp:ListItem Value="" Text="<%$ Resources:Resource, lblSelecione %>" Selected="True" />
                                                                    <asp:ListItem Value="E" Text="<%$ Resources:Resource, lblPeriodoEmergencial %>" />
                                                                    <asp:ListItem Value="M" Text="<%$ Resources:Resource, lblPeriodoManha %>" />
                                                                    <asp:ListItem Value="T" Text="<%$ Resources:Resource, lblPeriodoTarde %>" />
                                                                    <asp:ListItem Value="H" Text="<%$ Resources:Resource, lblPeriodoHorarioComercial %>" />
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:Label ID="lblPrazoEntrega" runat="server" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:DropDownList ID="ddlPrazoEntrega" runat="server" SkinID="DropSmallFilter">
                                                                    <asp:ListItem Value="" Text="<%$ Resources:Resource, lblSelecione %>" Selected="True" />
                                                                    <asp:ListItem Value="24" Text="<%$ Resources:Resource, lblPrazo24 %>" />
                                                                    <asp:ListItem Value="48" Text="<%$ Resources:Resource, lblPrazo48 %>" />
                                                                    <asp:ListItem Value="72" Text="<%$ Resources:Resource, lblPrazo72 %>" />
                                                                    <asp:ListItem Value="96" Text="<%$ Resources:Resource, lblPrazo96 %>" />
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ol>
                                    </fieldset>
                                </asp:Panel>
                            </div>

                            <div style="display: table; width: 100%; height: 20px;">
                                <fieldset>
                                    <div style="display: table; width: 100%; height: 100%;">
                                        <div style="display: table-cell; width: 8%; height: 30px; vertical-align: middle; text-align: right;">
                                            <asp:CheckBox ID="chkBionexo" runat="server" Font-Bold="true" TextAlign="Right" />
                                        </div>
                                        <div style="display: table-cell; width: 8%; height: 30px; vertical-align: middle; text-align: right;">
                                            <asp:CheckBox ID="chkPedidoAmil" runat="server" Font-Bold="true" TextAlign="Right" AutoPostBack="true" OnCheckedChanged="chkPedidoAmil_CheckedChanged" />
                                            <%--  </div>
                                           <div style="display: table-cell; width: 10%; height: 30px; vertical-align: middle; text-align: right;">--%>
                                            <asp:ImageButton ID="btnpedidoAmil" runat="server" Width="20px"
                                                Height="20px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/edit_find.png"
                                                ToolTip="<%$ Resources:Resource, lblHistoricoAmil %>" Visible="false" OnClick="btnpedidoAmil_Click" />
                                        </div>
                                        <div style="display: table-cell; width: 8%; height: 30px; vertical-align: middle; text-align: right;">
                                            <asp:ImageButton ID="btnAutorizacaoMerk" runat="server" Width="20px"
                                                Height="20px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/findMerck.png"
                                                ToolTip="<%$ Resources:Resource, lblAutorizacaoMerck %>" Visible="false" OnClick="btnAutorizacaoMerk_Click" />
                                        </div>
                                        <div style="display: table-cell; width: 20%; height: 30px; vertical-align: middle; text-align: right;">
                                            <asp:Label ID="lbl7PDVCupomDesconto" runat="server" />
                                        </div>
                                        <div style="display: table-cell; width: 13%; height: 30px; vertical-align: middle; text-align: center;">
                                            <asp:TextBox ID="txt7PDVCupomDesconto" runat="server" MaxLength="19" Width="130px" AutoPostBack="true" OnTextChanged="txt7PDVCupomDesconto_TextChanged" />
                                        </div>
                                        <%--<div style="display: table-cell; width: 70%; height: 30px; vertical-align: middle; text-align: right;">--%>
                                        <div style="display: table-cell; width: 10%; height: 30px; vertical-align: middle; text-align: right;">
                                            <asp:CheckBox ID="chkPossuiReembolso" runat="server"
                                                Font-Bold="true"
                                                AutoPostBack="true"
                                                OnCheckedChanged="chkPossuiReembolso_CheckedChanged"
                                                Text="<%$ Resources:Resource, lblPossuiReembolso %>" />
                                        </div>
                                        <div style="display: table-cell; width: 11%; height: 30px; vertical-align: middle; text-align: right;">
                                            <asp:Label ID="lblQtdRegistrosGrid" runat="server" />
                                        </div>
                                        <div style="display: table-cell; width: 3%; height: 30px; vertical-align: middle; text-align: center;">
                                            <asp:Label ID="lblQtdRegistrosGridDesc" runat="server" SkinID="LabelResposta" />
                                        </div>
                                        <div style="display: table-cell; width: 8%; height: 30px; vertical-align: middle; text-align: right;">
                                            <asp:Label ID="lblQtdItensGrid" runat="server" />
                                        </div>
                                        <div style="display: table-cell; width: 5%; height: 30px; vertical-align: middle; text-align: center;">
                                            <asp:DropDownList ID="ddlQtdItensGrid" runat="server"
                                                TabIndex="50" Height="20px" Width="50px"
                                                AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlQtdItensGrid_SelectedIndexChanged">
                                                <asp:ListItem Value="10" Text="10" />
                                                <asp:ListItem Value="20" Text="20" />
                                                <asp:ListItem Value="30" Text="30" />
                                                <asp:ListItem Value="40" Text="40" />
                                                <asp:ListItem Value="50" Text="50" Selected="True" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>

                        <%-- BODY --%>
                        <asp:Panel ID="pnlGvItens" runat="server" Visible="false">
                            <div style="display: table; width: 99.6%; height: 40%;">
                                <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                                    <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                        <center />

                                        <asp:GridView ID="gvItens" runat="server" TabIndex="51"
                                            DataKeyNames="itemId,itemDescricao,unidadeMedidaSigla,familiaComercialDescricao,familiaMaterialDescricao,itemControladoValidado,informado,gravado,
                                                      grupoEstoqueDescricao,fabricanteNome,pedidoId,pedidoItemSeq,itemControlado,tabelaPrecoVlrTabela,tabelaPrecoVlrMinimo,tabelaPrecoVlrMaximo,saldo,IsentoFrete,
                                                      familiaMaterialId,fabricanteId,unidadeNegocioId,estabelecimentoId,clienteIdERP,itemInfComplementar,valDescontoEmissao,itemTipoPedido"
                                            OnPageIndexChanging="gvItens_PageIndexChanging"
                                            OnRowCommand="gvItens_RowCommand"
                                            OnRowDataBound="gvItens_RowDataBound"
                                            OnRowDeleting="gvItens_RowDeleting"
                                            OnRowUpdating="gvItens_RowUpdating">
                                            <Columns>
                                                <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25px">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imbIconeIntegracao" runat="server" SkinID="ImgGrid" Enabled="false" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="itemDescricao" ItemStyle-Width="150px">
                                                    <ItemStyle Width="150px" />
                                                </asp:BoundField>
                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                    <ItemTemplate>
                                                        <asp:Literal ID="ltrItemControlado" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="unidadeMedidaSigla" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="familiaComercialDescricao" ItemStyle-Width="130px">
                                                    <ItemStyle Width="130px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="familiaMaterialDescricao" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false">
                                                    <ItemStyle Width="150px" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="grupoEstoqueDescricao" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false">
                                                    <ItemStyle Width="150px" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="fabricanteNome" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false">
                                                    <ItemStyle Width="150px" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtQuantidade" runat="server" SkinID="Currency50" Font-Bold="true" MaxLength="9" OnTextChanged="txtQuantidade_TextChanged" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="90px">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtValor" runat="server" SkinID="Currency100" Font-Bold="true" MaxLength="18" AutoPostBack="true" OnTextChanged="txtValor_TextChanged" />

                                                        <asp:HiddenField ID="hfValorDesconto" runat="server" Value='<%# Eval("valDescontoEmissao", "{0:n2}") %>' />
                                                        <asp:HiddenField ID="hfValorDescontoTrib" runat="server" Value='<%# Eval("valDescontoEmissaoTrib", "{0:n2}") %>' />





                                                        <asp:HiddenField ID="hfValorMinimo" runat="server" Value="" />
                                                        <asp:HiddenField ID="hfValorMaximo" runat="server" Value="" />
                                                        <asp:HiddenField ID="hfPedidoId" runat="server" Value="" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblValorDesconto" runat="server"
                                                            Font-Bold="true"
                                                            ToolTip="<%$ Resources:Resource, lblValorDesconto %>"
                                                            Text='<%# Eval("valDescontoTotal", "{0:n2}") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtValorDescontoBoleto" runat="server"
                                                            SkinID="Currency100" Font-Bold="true"
                                                            MaxLength="18" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtValorDescontoCom" runat="server"
                                                            SkinID="Currency100" Font-Bold="true" Enabled="false"
                                                            MaxLength="18" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblValorPrecoBruto" runat="server"
                                                            Font-Bold="true"
                                                            ToolTip="<%$ Resources:Resource, lblValorDesconto %>"
                                                            Text='<%# Eval("pedidoItemValorBruto", "{0:n2}") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtValorReembolso" runat="server"
                                                            SkinID="Currency100" Font-Bold="true"
                                                            MaxLength="18"
                                                            Text='<%# 
                                                                                (
                                                                                    Eval("valorReembolso") != null 
                                                                                        && 
                                                                                    (!decimal.Parse(Eval("valorReembolso").ToString()).Equals(0))
                                                                                ) 
                                                                                    ? 
                                                                                 Eval("valorReembolso","{0:n2}") 
                                                                                    : 
                                                                                 string.Empty 
                                                                           %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="saldo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" DataFormatString="{0:###,###,###,##0.##}">
                                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Lote">
                                                    <ItemTemplate>
                                                        <asp:ImageButton SkinID="ImgGrid" ID="imbVisualizar" runat="server" CommandName="visualizarILote" ImageUrl="~/Imagens/find.png"
                                                            CommandArgument='<%# Eval("pedidoId") + "|" + Eval("itemId") + "|" + Eval("estabelecimentoId")  + "|" +  ((GridViewRow)Container).RowIndex %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px">
                                                    <ItemTemplate>
                                                        <div id="dvItemTipoPedido" runat="server" style="width: 100%; display: table-cell; vertical-align: middle;">
                                                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                                <asp:Label ID="lblItemTipoPedido" runat="server" />
                                                            </div>
                                                        </div>
                                                        <asp:DropDownList ID="ddlItemTipoPedido" runat="server" SkinID="DropSmallFilter" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="110px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px"
                                                    ItemStyle-CssClass="hiddenColumn"
                                                    HeaderStyle-CssClass="hiddenColumn"
                                                    SortExpression="Call7PDV">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="Call7PDV" runat="server" SkinID="ImgGrid"
                                                            CommandName="Integracao7PDV"
                                                            ImageUrl="~/Imagens/find.png"
                                                            CommandArgument='<%# Eval("itemId") + "|" + Eval("itemInfComplementar") + "|" +  ((GridViewRow)Container).RowIndex %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imbDelete" runat="server" SkinID="ImgGrid" CommandName="Delete"
                                                            ImageUrl="~/Imagens/_trash.png"
                                                            ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                            CommandArgument='<%# Eval("pedidoId") + "|" + Eval("itemId") + "|" + Eval("pedidoItemSeq") + "|" +  ((GridViewRow)Container).RowIndex %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <asp:UpdatePanel ID="updBotao" runat="server" UpdateMode="Conditional">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnClickGrid" EventName="Click" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <asp:Button ID="btnClickGrid" Width="1px" Height="1px" Style="opacity: 0; margin-left: -1200px;" runat="server" Text="" OnClick="btnClickGrid_Click" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </fieldset>
                            </div>
                        </asp:Panel>




                        <%-- FOOTER --%>
                        <div style="display: table; width: 100%; height: 20%;">

                            <div style="width: 100%; display: table;">
                                <fieldset>
                                    <div style="display: table-cell; text-align: center; margin-top: 5px; margin-bottom: 5px;">
                                        <asp:Panel ID="pnlObsEmpenho" runat="server">
                                            <asp:ImageButton ID="imbAlertaObsEmpenho" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                ImageUrl="~/Imagens/_exclamationMark.gif"
                                                OnClick="imbAlertaObsEmpenho_Click"
                                                Visible="false" />
                                        </asp:Panel>
                                    </div>

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
                                                    <asp:CheckBox ID="cbInformaFrete" runat="server" Font-Bold="true" Text="<%$ Resources:Resource, lblInformaFrete %>"
                                                        OnCheckedChanged="cbInformaFrete_CheckedChanged"
                                                        AutoPostBack="true" />
                                                    <asp:Label ID="lblFrete" runat="server" Visible="false" />
                                                    <asp:TextBox ID="txtFrete" runat="server" SkinID="Currency80" MaxLength="14" Font-Bold="true" Enabled="false" AutoPostBack="true" OnTextChanged="txtFrete_TextChanged" />
                                                    <asp:HiddenField ID="hdfFrete" runat="server" Value="0" />
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
                                                    <asp:Label ID="lblTotalValor" runat="server" />
                                                    <asp:TextBox ID="txtTotalValor" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                    <asp:Label ID="lblTotalDescontoBoleto" runat="server" />
                                                    <asp:TextBox ID="txtTotalDescontoBoleto" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                </asp:Panel>
                                            </div>
                                            <%--</li>
                                            </ol>--%>
                                        </asp:Panel>
                                    </div>
                                </fieldset>
                            </div>

                            <asp:Panel ID="pnlMotivoAprovLimite" runat="server" Visible="false">
                                <div style="width: 100%; display: table-cell; margin-top: 5px; margin-bottom: 5px; float: left;">
                                    <fieldset>
                                        <legend>Motivo aprovação por limite
                                        </legend>
                                        <div class="gridRegistros">
                                            <asp:GridView ID="gridViewMotivoAprovacao" runat="server"
                                                DataKeyNames="apvMotivo,apvDataInclusao"
                                                OnRowDataBound="gridViewMotivoAprovacao_RowDataBound">
                                                <Columns>
                                                    <asp:BoundField DataField="apvMotivo" />
                                                    <asp:BoundField DataField="apvDataInclusao" />
                                                </Columns>
                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </fieldset>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="pnlObservacao" runat="server">
                                <fieldset style="height: 30%;">
                                    <%-- BODY --%>
                                    <div style="left: 0.5%; width: 100%; height: 100%; display: table; padding: 1px 1px 1px 1px;">
                                        <%-- LEFT --%>
                                        <div style="left: 0.5%; width: 25%; height: 100%; display: table-cell;">
                                            <fieldset>
                                                <legend>
                                                    <asp:Literal ID="ltrObservacoesPedido" runat="server" />
                                                </legend>
                                                <asp:TextBox ID="txtObservacaoPedido" runat="server" MaxLength="255" TextMode="MultiLine" Columns="50" Rows="6" Width="98%" />
                                            </fieldset>
                                        </div>

                                        <%-- RIGHT --%>
                                        <div style="left: 0.5%; width: 25%; height: 100%; display: table-cell;">
                                            <fieldset>
                                                <legend>
                                                    <asp:Literal ID="ltrObservacoesNota" runat="server" />
                                                </legend>
                                                <asp:TextBox ID="txtObservacoesNf" runat="server" MaxLength="255" TextMode="MultiLine" Columns="50" Rows="6" Width="98%" />
                                            </fieldset>
                                        </div>

                                        <%-- LEFT --%>
                                        <div style="left: 0.5%; width: 25%; height: 100%; display: table-cell;">
                                            <fieldset>
                                                <legend>
                                                    <asp:Literal ID="lblObservacoesEtiqueta" runat="server" />
                                                </legend>
                                                <asp:TextBox ID="txtObservacaoEtiqueta" runat="server" MaxLength="255" TextMode="MultiLine" Columns="50" Rows="6" Width="98%" />
                                            </fieldset>
                                        </div>

                                        <div id="divObservacaoBCare" style="left: 0.5%; width: 25%; height: 100%; display: table-cell;" runat="server">
                                            <fieldset>
                                                <legend>
                                                    <asp:Literal ID="lblObservacaoBCare" runat="server" />
                                                </legend>
                                                <asp:TextBox ID="txtObservacaoBCare" runat="server" MaxLength="255" TextMode="MultiLine" Columns="50" Rows="6" Width="98%" />
                                            </fieldset>
                                        </div>
                                    </div>
                                </fieldset>
                            </asp:Panel>
                        </div>

                        <%--</div>--%>
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
                                                <asp:GridView ID="gvClientes" runat="server" TabIndex="52" DataKeyNames="clienteId,clienteTipoPessoa,clienteCNPJ,clienteIsentoIE,clienteIE,clienteCPF,clienteRG,clienteRazaoSocial,clienteNomeAbreviado,clienteRGOrgao,clienteRGDataEmissao,clienteDataCadastro,matrizFinanceira,clienteTipoCredito,clienteValorCredito,medicoId,grupoFinanceiroId,clienteGrupoFinanceiroNomeAbreviado,grupoComercialId,canalVendaId,canalVendaDescricao,clienteIdERP,medicoConsProfissional,medicoCRM,medicoUFidCRM,categoriaClienteId,categoriaClienteDescricao,mercadoId,mercadoDescricao,clienteInfoAtendentes,representanteId,representanteNomeAbreviado,representanteNome,medicoEnderecoCom,medicoNome,medicoMunicCom,medicoCEPCom,clienteRemConsig,BloqAudicon,AutorizaVacinas,AutorizaRetinoide,BloqMisoprostol,BloqFinanceiro,dataAlteracao,clienteContribuinteICMS,clienteGrupoComercialNome,clienteEmailComercial,Autoriza_Medic,clienteIdSap,clientegrupoativo"
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

                <%-- PESQUISA REPRESENTANTE --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upRepresentante" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbHeaderRepresentanteBusca" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlBuscaRepresentante" runat="server" DefaultButton="btnFiltroRepresentantePesquisar" SkinID="PnlPopUp"
                                Visible="false">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblRepresentanteHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbFiltrosCloseRepresentante" runat="server" ImageAlign="AbsMiddle"
                                                Width="25px" Height="25px" TabIndex="34" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosCloseRepresentante_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrRepresentanteHeader" runat="server" />
                                            </legend>
                                            <%-- FILTROS --%>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroRepresentanteId" runat="server" />
                                                    <asp:TextBox ID="txtFiltroRepresentanteId" runat="server" SkinID="Filtro" MaxLength="50"
                                                        TabIndex="35" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroRepresentanteNomeAbrev" runat="server" />
                                                    <asp:TextBox ID="txtFiltroRepresentanteNomeAbrev" runat="server" SkinID="Filtro"
                                                        MaxLength="50" TabIndex="36" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroRepresentanteNome" runat="server" />
                                                    <asp:TextBox ID="txtFiltroRepresentanteNome" runat="server" SkinID="Filtro" MaxLength="50"
                                                        TabIndex="37" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <div class="line">
                                                        <asp:Button ID="btnFiltroRepresentantePesquisar" runat="server" SkinID="ButtonLeft"
                                                            TabIndex="38" OnClick="btnFiltroRepresentantePesquisar_Click" />
                                                        <asp:Button ID="btnFiltroRepresentanteLimpar" runat="server" SkinID="ButtonRight"
                                                            TabIndex="39" OnClick="btnFiltroRepresentanteLimpar_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                            <%-- GRID REGISTROS --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvRepresentantes" runat="server" TabIndex="53" DataKeyNames="representanteId,representanteNomeAbreviado,representanteNome"
                                                    OnPageIndexChanging="gvRepresentantes_PageIndexChanging" OnRowCommand="gvRepresentantes_RowCommand"
                                                    OnRowDataBound="gvRepresentantes_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="representanteId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                        <asp:TemplateField ItemStyle-Width="200px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentanteNomeAbrev" runat="server" Text='<%# FormataStringSaida(Eval("representanteNomeAbreviado"), txtFiltroRepresentanteNomeAbrev.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentanteNome" runat="server" Text='<%# FormataStringSaida(Eval("representanteNome"), txtFiltroRepresentanteNome.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                                            ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbSelect" runat="server" SkinID="ImgGrid"
                                                                    ImageUrl="~/Imagens/check.png" CommandName="Select"
                                                                    CommandArgument='<%# Eval("representanteId") + "|" + ((GridViewRow)Container).RowIndex %>' />
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

                <%-- PESQUISA ITEM --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppItem" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbHeaderItemFind" EventName="Click" />
                        </Triggers>
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
                                                                coeficienteDesconto,convenio87,tabelaPrecoImportacaoId,coeficienteTribEstab"
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
                                                        <asp:BoundField DataField="coeficienteDesconto" DataFormatString="{0:n4}" HeaderText="Desconto(%)" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />

                                                        <asp:BoundField DataField="coeficienteTribEstab" DataFormatString="{0:n4}" HeaderText="TribEstab(%)" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />

                                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="ddlItemTipoPedido" runat="server" SkinID="DropSmallFilter" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="110px" />
                                                        </asp:TemplateField>
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
                            <asp:RequiredFieldValidator ID="rfvClienteId" runat="server" ControlToValidate="txtHeaderClienteId" EnableClientScript="true"
                                Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                            <asp:RequiredFieldValidator ID="rfvClienteTriangularId" runat="server" ControlToValidate="txtHeaderClienteTriangularId" EnableClientScript="true"
                                Enabled="false" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                            <asp:RequiredFieldValidator ID="rfvObservacoes" runat="server" ControlToValidate="txtObservacaoPedido" Enabled="false" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                            <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- PESQUISA / CADASTRO DE OPERADORA --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="UppOperadora" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlPopUpOperadora" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblPedidoOperadora" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblPedidoOperadora %>" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbAdicionarOperadoraClose" runat="server"
                                                ImageAlign="AbsMiddle"
                                                Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbAdicionarOperadoraClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <asp:Panel ID="pnlPopUpOperadoraInfo" runat="server" DefaultButton="btnFiltrosOperadoraPesquisa">
                                            <fieldset>
                                                <legend>
                                                    <asp:Literal ID="ltTituloOperadora" runat="server" />
                                                </legend>
                                                <div class="navegacao">
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblOperadoraDescricao" runat="server" />
                                                        <asp:TextBox ID="txtOperadoraDescricao" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="8" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <div class="line">
                                                            <asp:Button ID="btnFiltrosAdicionaOperadora" runat="server" SkinID="ButtonLeft" TabIndex="12" OnClick="btnFiltrosAdicionaOperadora_Click" />
                                                            <asp:Button ID="btnFiltrosOperadoraPesquisa" runat="server" SkinID="ButtonCenter" TabIndex="12" OnClick="btnFiltrosOperadoraPesquisa_Click" />
                                                            <asp:Button ID="btnFiltrosOperadoraLimpar" runat="server" SkinID="ButtonRight" TabIndex="13" OnClick="btnFiltrosOperadoraLimpar_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <%-- GRID REGISTROS --%>
                                                <div class="gridRegistros">
                                                    <asp:GridView ID="gvOperadora" runat="server" TabIndex="16"
                                                        DataKeyNames="operadoraId, operadoraDescricao, dataCadastro"
                                                        OnPageIndexChanging="gvOperadora_PageIndexChanging"
                                                        OnRowCommand="gvOperadora_RowCommand"
                                                        OnRowDataBound="gvOperadora_RowDataBound">
                                                        <Columns>
                                                            <asp:BoundField DataField="operadoraId" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                                            <asp:BoundField DataField="operadoraDescricao" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                                            <asp:BoundField DataField="dataCadastro" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </fieldset>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%--PESQUISA MEDICO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="UppMedico" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbMedicoBusca" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlBuscaMedico" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="Label1" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblPedidoMedico %>" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbFiltrosMedicoClose" runat="server"
                                                ImageAlign="AbsMiddle"
                                                Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbFiltrosMedicoClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <asp:Panel ID="pnlPopUpMedico" runat="server" DefaultButton="btnFiltrosMedicoPesquisa">
                                            <fieldset>
                                                <legend>
                                                    <asp:Literal ID="ltrGridMedicoHeader" runat="server" />
                                                </legend>
                                                <div class="navegacao">
                                                    <div class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroMedicoId" runat="server" />
                                                        <asp:TextBox ID="txtFiltroMedicoId" runat="server" MaxLength="30" TabIndex="8" SkinID="SmallFilter" />
                                                    </div>
                                                    <div class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroMedicoCRM" runat="server" />
                                                        <asp:TextBox ID="txtFiltroMedicoCRM" SkinID="SmallFilter" runat="server" MaxLength="50" TabIndex="9" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroMedicoNome" runat="server" />
                                                        <asp:TextBox ID="txtFiltroMedicoNome" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="9" />
                                                    </div>
                                                    <div class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroMedicoPais" runat="server" />
                                                        <asp:DropDownList ID="ddFiltroMedicoPais" runat="server" TabIndex="10"
                                                            AutoPostBack="True" SkinID="DropFiltro" OnSelectedIndexChanged="ddFiltrosMedicoPais_SelectedIndexChanged" />
                                                    </div>

                                                    <div class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroMedicoUf" runat="server" />
                                                        <asp:DropDownList ID="ddFiltroMedicoUf" SkinID="DropSmallFilter" runat="server" TabIndex="11" />
                                                    </div>
                                                    <div class="boxPesquisaCurta">
                                                        <asp:CheckBox ID="chkFiltroMedicoBloqueado" runat="server"
                                                            TextAlign="Right" Font-Bold="true"
                                                            Text="<%$ Resources:Resource, lblMostrarBloqueados %>" />
                                                    </div>
                                                    <div class="boxPesquisaCurta">
                                                        <div class="line">
                                                            <asp:Button ID="btnFiltrosMedicoPesquisa" runat="server" SkinID="ButtonLeft"
                                                                TabIndex="12" OnClick="btnFiltrosMedicoPesquisa_Click" />
                                                            <asp:Button ID="btnFiltrosMedicoLimpar" runat="server" SkinID="ButtonCenter"
                                                                TabIndex="13" OnClick="btnFiltrosMedicoLimpar_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <%-- GRID REGISTROS --%>
                                                <div class="gridRegistros">
                                                    <asp:GridView ID="gvRegistrosMedico" runat="server" TabIndex="16"
                                                        DataKeyNames="medicoId,paisId,paisNome,ufId,estadoNome,medicoMedico,medicoRG,representanteId
                                                                        ,medicoUFidCRM,medicoEspecialidade1,medicoEspecialidade2,medicoDtNascto,medicoSexo
                                                                        ,medicoCEPCom,medicoEnderecoCom,medicoBairroCom,medicoMunicCom,medicoDDD,medicoFax,medicoNome
                                                                        ,medicoTelCom1,medicoDDD2,medicoTelCom2,medicoDDD4,medicoTelCelular,medicoEmail1
                                                                        ,medicoEmail2,medicoDtInclusao,medicoDtAlteracao,medicoDiaAniversario,medicoConsProfissional,medicoCRM
                                                                        ,medicoMesAniversario,medicoObservacao,medicoEspecialidadeId1,medicoEspecialidadeId2
                                                                        ,representanteNome,representanteNomeAbreviado"
                                                        OnPageIndexChanging="gvMedicoPesquisa_PageIndexChanging"
                                                        OnRowCommand="gvMedicoPesquisa_RowCommand"
                                                        OnRowDataBound="gvMedicoPesquisa_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="100px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrMedicoId" runat="server" Text='<%# FormataStringSaida(Eval("medicoId"), txtFiltroMedicoId.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrMedicoNome" runat="server" Text='<%# FormataStringSaida(Eval("medicoNome"), txtFiltroMedicoNome.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="100px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrPaisNome" runat="server" Text='<%# FormataStringSaida(Eval("paisNome"), ddFiltroMedicoPais.SelectedItem.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="estadoNome" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                                            <asp:BoundField DataField="representanteNome" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                                            <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrMedicoBloqueado" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imbSelect" runat="server"
                                                                        CommandName="Select"
                                                                        SkinID="ImgGrid"
                                                                        ImageUrl="~/Imagens/check.png"
                                                                        CommandArgument='<%# Eval("medicoId") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </fieldset>
                                        </asp:Panel>
                                    </div>

                                </div>
                            </asp:Panel>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHeaderClienteId"
                                Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHeaderClienteTriangularId"
                                Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false"
                                ValidationGroup="Validacao" />--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%--BLOCO POP UP ANEXO RECEITA--%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:PostBackTrigger ControlID="imbReceitaArquivo" />
                        </Triggers>

                        <ContentTemplate>
                            <asp:Panel ID="pnlReceita" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="Label2" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblAnexarReceitas %>" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="AbsMiddle" Width="25px" ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                Height="25px" TabIndex="40" ImageUrl="~/Imagens/Fechar.png" OnClick="imbReceitaClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrAnexarReceita" runat="server" />
                                            </legend>
                                            <div style="width: 100%; display: table">
                                                <div style="width: 50%; display: table-cell">
                                                    <ol>
                                                        <li>
                                                            <div class="line_itens_left">
                                                                <asp:Label runat="server" ID="lblDataRetiradaReceita" SkinID="LabelForm" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <CtlData:ControlData ID="CtlDataRetiradaReceita" runat="server" ValidationGroup="ValidaAnexo" />
                                                                <asp:HiddenField ID="hdReceitaId" runat="server" />
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblPeriodoRetiradaReceira" SkinID="LabelForm" />
                                                            <asp:DropDownList ID="ddPeriodoRetiradaReceira" runat="server">
                                                                <asp:ListItem Value="" Text="<%$ Resources:Resource, lblSelecione %>" />
                                                                <asp:ListItem Value="M" Text="<%$ Resources:Resource, lblPeriodoManha %>" />
                                                                <asp:ListItem Value="T" Text="<%$ Resources:Resource, lblPeriodoTarde %>" />
                                                                <asp:ListItem Value="H" Text="<%$ Resources:Resource, lblPeriodoComercial %>" />
                                                            </asp:DropDownList>
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblCepRetiradaReceita" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtCepRetiradaReceita" runat="server" />
                                                            <asp:ImageButton ID="imbBuscaCepRetiradaReceita" runat="server" ImageUrl="~/Imagens/find.png"
                                                                Width="25px" Height="25px" ImageAlign="AbsMiddle" OnClick="imbBuscaCepRetiradaReceita_Click" />
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblRuaRetiradaReceita" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtRuaRetiradaReceita" runat="server" />
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblNumeroRetiradaReceita" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtNumeroRetiradaReceita" runat="server" />
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblComplementoRetiradaReceita" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtComplementoRetiradaReceita" runat="server" />
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblBairroRetiradaReceita" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtBairroRetiradaReceita" runat="server" />
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblCidadeRetiradaReceita" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtCidadeRetiradaReceita" runat="server" />
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblPaisRetiradaReceita" SkinID="LabelForm" />
                                                            <asp:DropDownList ID="ddPaisRetiradaReceita" runat="server" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddPaisRetiradaReceita_SelectedIndexChanged" />
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblUfRetiradaReceita" SkinID="LabelForm" />
                                                            <asp:DropDownList ID="ddUfRetiradaReceita" runat="server" />
                                                        </li>

                                                    </ol>
                                                </div>
                                                <div style="width: 50%; display: table-cell">
                                                    <ol>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblNumeroReceita" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtNumeroReceita" runat="server" />
                                                        </li>
                                                        <li>
                                                            <div class="line_itens_left">
                                                                <asp:Label runat="server" ID="lblDataPrescricao" SkinID="LabelForm" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <CtlData:ControlData ID="CtlDataPRescricao" runat="server" ValidationGroup="ValidaAnexo" />
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblQuantidadePrescrita" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtQuantidadePrescrita" runat="server" />
                                                        </li>
                                                        <li>
                                                            <asp:Label runat="server" ID="lblDosagemPorDia" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDosagemPorDia" runat="server" />
                                                        </li>

                                                        <li>
                                                            <asp:Label ID="lblAnexarReceita" runat="server" SkinID="LabelForm" />
                                                            <asp:FileUpload ID="fuAnexoReceita" runat="server" />
                                                        </li>
                                                        <li>
                                                            <div class="line">
                                                                <div class="line_itens_left">
                                                                    <asp:Label ID="lblObservacaoReceita" runat="server" SkinID="LabelForm" />
                                                                </div>
                                                                <div class="line_itens">
                                                                    <asp:TextBox ID="txtObservacaoReceita" runat="server" Columns="100" Rows="5" TextMode="MultiLine" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li style="text-align: center;">
                                                            <asp:Button ID="imbReceitaArquivo" runat="server" OnClick="imbReceitaArquivo_Click" ValidationGroup="ValidaAnexo" />
                                                            <asp:Button ID="btnLimparFormularioReceita" runat="server" Text="<%$ Resources:Resource, lblLimpar %>" OnClick="btnLimparFormularioReceita_Click" />
                                                        </li>
                                                    </ol>
                                                </div>
                                            </div>


                                            <%--grid anexo--%>
                                            <div style="width: 100%; overflow-x: none;">
                                                <asp:GridView ID="gvReceitaAnexo" runat="server" TabIndex="33"
                                                    DataKeyNames="receitaId,pedidoId,receitaNomeArquivo,receitaDescricaoArquivo,receitaArquivoExtensao
                                                                            ,receitaDataInclusao,dataRetiradaReceita,periodoRetirada,cepRetiradaReceita,ruaRetiradaReceita
                                                                            ,numeroRetiradaReceita,complementoRetiradaReceita,bairroRetiradaReceita,cidadeRetiradaReceita
                                                                            ,ufRetiradaReceita,paisRetiradaReceita,numeroReceita,dataPrescricao,quantidadePrescrita,dosagemPorDia"
                                                    OnPageIndexChanging="gvReceitaArquivo_PageIndexChanging"
                                                    OnRowCommand="gvReceitaArquivo_RowCommand"
                                                    OnRowDataBound="gvReceitaArquivo_RowDataBound"
                                                    OnRowDeleting="gvReceitaArquivo_RowDeleting"
                                                    OnRowUpdating="gvReceitaArquivo_RowUpdating">
                                                    <Columns>
                                                        <%--<asp:BoundField DataField="dataRetiradaReceita" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" /> --%>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrDataRetirada" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrPeriodoRetirada" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="numeroReceita" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />

                                                        <%--<asp:BoundField DataField="dataPrescricao" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" /> --%>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrDataPrescricao" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="receitaNomeArquivo" />


                                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbDownload" runat="server" SkinID="ImgGrid" CommandName="Download"
                                                                    ToolTip="<%$ Resources:Resource, lblDownload %>"
                                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("receitaId") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" CommandName="Delete"
                                                                    ImageUrl="~/Imagens/_trash.png"
                                                                    ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                    CommandArgument='<%# Container.DataItemIndex + "|" + Eval("receitaId") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbVisualizar" runat="server" SkinID="ImgGrid" CommandName="Visualizar"
                                                                    ImageUrl="~/Imagens/Find.png"
                                                                    ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                                    CommandArgument='<%# Container.DataItemIndex %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </fieldset>

                                    </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- MOTIVO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppMotivos" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnReprovar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlMotivos" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel" style="width: 40%; height: 50%; left: 30%; top: 25%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblHeaderMotivos" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbFecharMotivos" runat="server" ImageAlign="AbsMiddle" Width="25px" Visible="false"
                                                Height="25px" TabIndex="40" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFecharMotivos_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body" style="height: 75%;">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrMotivoHeader" runat="server" />
                                            </legend>
                                            <ol style="width: auto;">
                                                <li>
                                                    <asp:Label ID="lblMotivosCategoria" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlMotivosCategoria" runat="server" Enabled="false">
                                                        <asp:ListItem Value="aprovacao" Text="<%$ Resources:Resource, lblAprovacao %>" />
                                                        <asp:ListItem Value="cancelamento" Text="<%$ Resources:Resource, lblCancelamento %>" />
                                                        <asp:ListItem Value="reprovacao" Text="<%$ Resources:Resource, lblReprovacao %>" />
                                                        <asp:ListItem Value="revisao" Text="<%$ Resources:Resource, lblRevisar %>" />
                                                    </asp:DropDownList>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblMotivosTipo" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlMotivosTipo" runat="server" />
                                                </li>
                                                <li>
                                                    <div class="line">
                                                        <div class="line_itens_left">
                                                            <asp:Label ID="lblMotivosDescricao" runat="server" SkinID="LabelForm" />
                                                        </div>
                                                        <div class="line_itens">
                                                            <asp:TextBox ID="txtMotivosDescricao" runat="server" Columns="100" Rows="2" TextMode="MultiLine"
                                                                MaxLength="500" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="line">
                                                        <asp:Button ID="btnSalvarMotivos" runat="server" SkinID="ButtonLeft" ValidationGroup="ValidacaoMotivo" OnClick="btnSalvarMotivos_Click" />
                                                        <asp:Button ID="btnFecharMotivos" runat="server" SkinID="ButtonRight" OnClick="btnFecharMotivos_Click" />
                                                    </div>
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:RequiredFieldValidator ID="rfvDescricaoMotivo" runat="server" ControlToValidate="txtMotivosDescricao"
                                Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoMotivo" />
                            <asp:ValidationSummary ID="vsmMotivo" runat="server" ShowMessageBox="true" ShowSummary="false"
                                ValidationGroup="ValidacaoMotivo" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- BLOCO CONFIRMAR INTEGRAÇÃO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upConfirmarIntegracao" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnIntegrar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlConfirmarIntegracao" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblConfirmarIntegracaoHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                                            <div style="width: 80%; height: 100%; display: table-cell; vertical-align: middle;">
                                                <asp:Label ID="lblConfirmarIntegracaoMessage" runat="server" ForeColor="Black" />
                                            </div>
                                            <div style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgAlertIntegracao" runat="server" Height="50%" Width="60%" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/question.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnConfirmOk" runat="server" SkinID="ButtonLeft" OnClick="btnConfirmOk_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnConfirmNo" runat="server" SkinID="ButtonRight" OnClick="btnConfirmNo_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- BLOCO CONFIRMAR INTEGRAÇÃO PENDENTE --%>
                <div style="position: absolute; z-index: 1;">
                    <asp:UpdatePanel ID="upConfirmarIntegracaoPendente" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlConfirmarIntegracaoPendente" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblConfirmarIntegracaoPendenteHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <asp:Label ID="lblConfirmarIntegracaoPendenteMessage" runat="server" ForeColor="Black" />
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnConfirmarIntegracaoPendenteOk" runat="server" SkinID="ButtonLeft"
                                                    OnClick="btnConfirmarIntegracaoPendenteOk_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnConfirmarIntegracaoPendenteNOK" runat="server" SkinID="ButtonRight"
                                                    OnClick="btnConfirmarIntegracaoPendenteNOK_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- ENDEREÇOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppEnderecos" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlHeaderClienteTipoEndereco" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlEnderecos" runat="server" Visible="false" DefaultButton="imbEnderecosClose" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblEnderecosHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbEnderecosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbEnderecosClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset style="height: 95%;">
                                            <legend>
                                                <asp:Literal ID="ltrEnderecosHeader" runat="server" />
                                            </legend>

                                            <ol>
                                                <li>
                                                    <asp:Label ID="lblEnderecoTipo" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoTipoDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEndereco" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoNro" runat="server" SkinID="LabelForm" Visible="false" />
                                                    <asp:Label ID="lblEnderecoNroDescricao" runat="server" SkinID="LabelResposta" Visible="false" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoCompl" runat="server" SkinID="LabelForm" Visible="false" />
                                                    <asp:Label ID="lblEnderecoComplDescricao" runat="server" SkinID="LabelResposta" Visible="false" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoCep" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoCepDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoBairro" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoBairroDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoCidadeUf" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoCidadeUfDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <div style="margin-left: 150px;">
                                                        <br />
                                                        <asp:Label ID="lblContatosLine" runat="server" SkinID="LabelResposta" Text="<%$ Resources:Resource, lblDadosContato %>" />
                                                        <hr />
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoContatoNome" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoContatoNomeDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoEmail" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoEmailDescricao" runat="server" ForeColor="#13213C" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoRamal" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoRamalDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoFone" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoFoneDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoCelular" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoCelularDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoObservacoes" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoObservacoesDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>

                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- CONFIRMAR ALTERAÇÃO TABELA PREÇO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upTabelaPrecoConfirmar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlHeaderEstabelecimento" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlHeaderUnidadeNegocio" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlTabelaPrecoConfirmar" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblTabelaPrecoConfirmarHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                                            <div style="width: 80%; height: 100%; display: table-cell; vertical-align: middle;">
                                                <asp:Label ID="lblTabelaPrecoConfirmarBody" runat="server" />
                                            </div>
                                            <div style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgAlert" runat="server" Height="50%" Width="60%" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/question.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnTabelaPrecoConfirmarOk" runat="server" SkinID="ButtonLeft"
                                                    OnClick="btnTabelaPrecoConfirmarOk_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnTabelaPrecoConfirmarNOk" runat="server" SkinID="ButtonRight"
                                                    OnClick="btnTabelaPrecoConfirmarNOk_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
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
                                                                    <asp:ImageButton ID="imbCondicaoPgtoDepositoAdd" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px"
                                                                        ToolTip="<%$ Resources:Resource, lblAdicionar %>"
                                                                        ImageUrl="~/Imagens/addSelected.png"
                                                                        ValidationGroup="ValidaDeposito"
                                                                        OnClick="imbCondicaoPgtoDepositoAdd_Click" />
                                                                    <br />
                                                                    <asp:ImageButton ID="imbCondicaoPgtoDepositoRemove" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px"
                                                                        ToolTip="<%$ Resources:Resource, lblRemover %>"
                                                                        ImageUrl="~/Imagens/removeSelected.png"
                                                                        OnClick="imbCondicaoPgtoDepositoRemove_Click" />
                                                                    <br />
                                                                    <asp:ImageButton ID="imbCondicaoPgtoDepositoRemoveAll" runat="server"
                                                                        ImageAlign="AbsMiddle" Height="50px" Width="50px"
                                                                        ToolTip="<%$ Resources:Resource, lblRemoverTodos %>"
                                                                        ImageUrl="~/Imagens/remove.png"
                                                                        OnClick="imbCondicaoPgtoDepositoRemoveAll_Click" />
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
                                                        <asp:Button ID="btnSalvarCondPgtoDeposito" runat="server" SkinID="ButtonCenter" OnClick="btnSalvarCondPgtoDeposito_Click" />
                                                        <asp:Button ID="btnLimparCondPgtoDeposito" runat="server" SkinID="ButtonCenter" OnClick="btnLimparCondPgtoDeposito_Click" />
                                                        <asp:Button ID="btnMudarCondPgtoDeposito" runat="server" SkinID="ButtonCenter" OnClick="btnMudarCondicaoPagamento_Click" ToolTip="<%$ Resources:Resource, lblMudarCondicaoPgtoEspecial %>" Text="<%$ Resources:Resource, lblMudar %>" />
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
                                            <asp:ImageButton ID="imbCondicaoPgtoCartao" runat="server"
                                                ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbCondicaoPgtoCartao_Click" />
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
                                                    <asp:Label ID="lblCondicaoPgtoCartaoTipoMaquina" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlCondicaoPgtoCartaoTipoMaquina" runat="server" SkinID="DropFiltro" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlCondicaoPgtoCartaoTipoMaquina_SelectedIndexChanged" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartaoBandeira" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlCondicaoPgtoCartaoBandeira" runat="server" SkinID="DropFiltro" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlCondicaoPgtoCartaoBandeira_SelectedIndexChanged" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartaoFormaPgto" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlCondicaoPgtoCartaoFormaPgto" runat="server" SkinID="DropFiltro" />
                                                </li>
                                                <li>
                                                    <div style="margin-left: 150px;">
                                                        <asp:CheckBox ID="chkVendaWeb" runat="server" Font-Bold="true" ForeColor="Black" TextAlign="Right"
                                                            Text="<%$ Resources:Resource, lblVendaWeb %>"
                                                            AutoPostBack="true"
                                                            OnCheckedChanged="chkVendaWeb_CheckedChanged" />
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartao" runat="server" SkinID="LabelForm" />
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
                                                    <asp:Label ID="lblCondicaoPgtoCartaoComprovante" runat="server" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtCondicaoPgtoCartaoComprovante" runat="server" SkinID="Filtro" Enabled="true" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondicaoPgtoCartaoAutorizacao" runat="server" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtCondicaoPgtoCartaoAutorizacao" runat="server" SkinID="Filtro" MaxLength="6" Enabled="true" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoHolderName" runat="server" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtCondPgtoCartaoHolderName" runat="server" MaxLength="100" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoCardNumber" runat="server" SkinID="LabelForm" Visible="false" />
                                                    <asp:TextBox ID="txtCondPgtoCartaoCardNumber" runat="server" MaxLength="20" Visible="false" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoCvc" runat="server" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtCondPgtoCartaoCvc" runat="server" MaxLength="5" SkinID="SmallFilter" />
                                                    <asp:HiddenField ID="hdfCondPgtoCartaoCvc" runat="server" Value="" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoPrc" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblCondPgtoCartaoPrcDsc" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoValor" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblCondPgtoCartaoValorDsc" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblVld" runat="server" Text="<%$ Resources:Resource, lblValidade %>" />
                                                    <hr />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblCondPgtoCartaoValidadeMonth" runat="server" SkinID="LabelForm" />
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
                                                    <asp:Label ID="lblCondPgtoCartaoValidadeYear" runat="server" SkinID="LabelForm" />
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

                <%-- EMPENHO --%>
                <asp:UpdatePanel ID="uppEmpenho" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteBusca" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="imbEmpenhoClose" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlEmpenho" runat="server" DefaultButton="btnFiltrosEmpenhoPesquisa" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblEmpenhoHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbEmpenhoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbEmpenhoClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <%-- FILTROS CLIENTES --%>
                                        <div class="navegacao">
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltrosContratoId" runat="server" />
                                                <asp:TextBox ID="txtFiltrosContratoId" runat="server" SkinID="SmallFilter" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltrosEmpenhoId" runat="server" />
                                                <asp:TextBox ID="txtFiltrosEmpenhoId" runat="server" SkinID="SmallFilter" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltrosEmpenhoClienteCnpj" runat="server" />
                                                <asp:TextBox ID="txtFiltrosEmpenhoClienteCnpj" runat="server" SkinID="SmallFilter" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltrosEmpenhoClienteRazaoSocial" runat="server" />
                                                <asp:TextBox ID="txtFiltrosEmpenhoClienteRazaoSocial" runat="server" SkinID="SmallFilter" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltrosEmpenhoEstabelecimento" runat="server" />
                                                <asp:DropDownList ID="ddlFiltrosEmpenhoEstabelecimento" runat="server" SkinID="DropSmallFilter" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Button ID="btnFiltrosEmpenhoPesquisa" runat="server" SkinID="ButtonLeft" OnClick="btnFiltrosEmpenhoPesquisa_Click" />
                                                <asp:Button ID="btnFiltrosEmpenhoLimpar" runat="server" SkinID="ButtonRight" OnClick="btnFiltrosEmpenhoLimpar_Click" />
                                            </div>
                                        </div>

                                        <%-- GRID REGISTROS CLIENTES --%>
                                        <div class="gridRegistros">
                                            <asp:GridView ID="gvEmpenhoPesquisa" runat="server"
                                                DataKeyNames="empenhoCodigoId,contratoLicitacaoId,clienteId,estabelecimentoId,tipoPedidoId,clienteIdFaturamento,empenhoStatusId,clienteCNPJ,
                                                  empenhoData,empenhoObservacao,empenhoDataLimiteEntrega,usuarioId,empenhoDataEmissao,usuarioIdAlteracao,empenhoDataAlteracao,
                                                  usuarioIdCancelamento,empenhoMotivoCancelamento,empenhoDataCancelamento,clienteIdERP,modalidadeLicitacaoDescricao,contratoLicitacaoData,
                                                  contratoLicitacaoProcesso,contratoLicitacaoValidade,contratoLicitacaoVigencia,contratoLicitacaoPrazo,contratoLicitacaoObservacoes,
                                                  contratoLicitacaoBancario,contratoLicitacaoDoctEfetivo,representanteNome,clienteRazaoSocial,lojaFormatada,contratoLicitacaoSeq,representanteNomeAbreviado,
                                                  clienteCNPJFaturamento,clienteRazaoSocialFaturamento,clienteTipoCredito,clienteTipoCreditoFaturamento,clienteIdERPFaturamento,representanteId"
                                                OnPageIndexChanging="gvEmpenhoPesquisa_PageIndexChanging"
                                                OnRowCommand="gvEmpenhoPesquisa_RowCommand"
                                                OnRowDataBound="gvEmpenhoPesquisa_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrContrato" runat="server" Text='<%# FormataStringSaida(Eval("contratoLicitacaoId"), txtFiltrosContratoId.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrEmpenho" runat="server" Text='<%# FormataStringSaida(Eval("empenhoCodigoId"), txtFiltrosEmpenhoId.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCNPJFaturamento").ToString(), Comom.Utility.FormatOption.ApplyMask), txtFiltrosEmpenhoClienteCnpj.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocialFaturamento"), txtFiltrosEmpenhoClienteRazaoSocial.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrStatus" runat="server" Text='<%# GetResourceValue(Eval("empenhoStatusId").ToString()).ToUpper() %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="empenhoDataEmissao" DataFormatString="{0:dd/MM/yyyy}"
                                                        ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrUsuario" runat="server" Text='<%# Eval("usuarioId") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="clienteTipoCreditoFaturamento" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                    <asp:TemplateField ItemStyle-Width="320px" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrEnderecoEntrega" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbSelect" runat="server" CommandName="View" SkinID="ImgGrid"
                                                                ImageUrl="~/Imagens/check.png" ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                CommandArgument='<%#  ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                       Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + Eval("empenhoCodigoId") + "|" + 
                                                                                       Eval("contratoLicitacaoSeq") + "|" + Eval("clienteIdFaturamento") %>' />
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

                <%-- EMPENHO ITEM PESQUISA --%>
                <asp:UpdatePanel ID="uppEmpenhoItens" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbHeaderItemFind" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="imbEmpenhoItemClose" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlEmpenhoItem" runat="server" DefaultButton="btnItemFiltrosPesquisar" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblEmpenhoItemHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbEmpenhoItemClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbEmpenhoItemClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div class="navegacao">
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblItemFiltrosId" runat="server" />
                                                <asp:TextBox ID="txtItemFiltrosId" runat="server" SkinID="Filtro" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblItemFiltrosDescricao" runat="server" />
                                                <asp:TextBox ID="txtItemFiltrosDescricao" runat="server" SkinID="Filtro" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <div class="line">
                                                    <asp:Button ID="btnItemFiltrosPesquisar" runat="server" SkinID="ButtonLeft" OnClick="btnItemFiltrosPesquisar_Click" />
                                                    <asp:Button ID="btnItemFiltrosLimpar" runat="server" SkinID="ButtonCenter" OnClick="btnItemFiltrosLimpar_Click" />
                                                    <asp:Button ID="btnItemAdicionar" runat="server" SkinID="ButtonRight" OnClick="btnItemAdicionar_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <%-- GRID REGISTROS --%>
                                        <div class="gridRegistros">
                                            <asp:GridView ID="gvEmpenhoItens" runat="server"
                                                DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,contratoLicitacaoSeq,empenhoCodigoId,itemId,familiaComercialDescricao,empenhoItemQtd,
                                                                        tipoEnderecoId,clienteEnderecoSeq,empenhoGradeSeq,itemSaldoContrato,itemControlado,familiaComercialId,unidadeMedidaId,itemDescricao,
                                                                        familiaMaterialDescricao,grupoEstoqueDescricao,fabricanteNome,empenhoItemQtdeValor,familiaMaterialId,fabricanteId,unidadeMedidaSigla,
                                                                        empenhoItemSaldo,coeficienteDesconto,contribuinte,contratoLicitacaoData,convenio87,itemInfComplementar"
                                                OnPageIndexChanging="gvEmpenhoItens_PageIndexChanging"
                                                OnRowCommand="gvEmpenhoItens_RowCommand"
                                                OnRowDataBound="gvEmpenhoItens_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkAll" runat="server" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrItemId" runat="server" Text='<%# FormataStringSaida(Eval("itemId"), txtItemFiltrosId.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrItemDescricao" runat="server" Text='<%# FormataStringSaida(Eval("itemDescricao"), txtItemFiltrosDescricao.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="fabricanteNome" ItemStyle-Width="150px" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtQtdEmpenho" runat="server" Width="70px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="empenhoItemQtd" DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmpenhoSaldo" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="itemSaldoContrato" DataFormatString="{0:f0}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                    <asp:BoundField DataField="empenhoItemQtdeValor" DataFormatString="{0:###,###,#00.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrEnderecoEntrega" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrContribuinte" runat="server" Text='<%# (bool.Parse(!String.IsNullOrEmpty(Eval("contribuinte").ToString()) ? Eval("contribuinte").ToString() : "False") ? GetResourceValue("lblSim") : GetResourceValue("lblNao")).ToUpper() %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="coeficienteDesconto" DataFormatString="{0:n2}" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid"
                                                                ImageUrl="~/Imagens/check.png"
                                                                ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                     Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                     Eval("estabelecimentoId") + "|" + Eval("contratoLicitacaoSeq") + "|" + 
                                                                                                     Eval("empenhoCodigoId") + "|" + Eval("itemId") + "|" + Eval("tipoPedidoId") + "|" + Eval("clienteIdFaturamento") + "|" + 
                                                                                                     Eval("tipoEnderecoId") + "|" + Eval("clienteEnderecoSeq") + "|" + Eval("empenhoGradeSeq") %>' />
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

                <%-- PANEL DE DE OBSERVACAO DE EMPENHO --%>
                <asp:UpdatePanel ID="uppFecharPanelObsEmpenho" runat="server" UpdateMode="Conditional">
                    <Triggers></Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlFecharPanelObsEmpenho" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblDescricoesHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbFecharPanelObsEmpenho" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbFecharPanelObsEmpenho_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <asp:TextBox ID="txtObservacaoEmpenho" runat="server" TextMode="MultiLine" Width="98%" Height="90%" Font-Bold="true" ForeColor="Blue" Enabled="false" />
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- PANEL DE EMPENHOS ANEXOS --%>
                <asp:UpdatePanel ID="uppEmpenhoAnexos" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbEmpenhoDados" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlEmpenhoAnexos" runat="server" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblEmpenhoAnexosHeader" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblPedidoEmpenho %>" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbEmpenhoAnexosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbEmpenhoAnexosClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div style="left: 0%; display: table; width: 100%; height: 100%; position: relative; text-align: left;">
                                            <div style="display: table; width: 100%; height: 15%; text-align: center;">
                                                <div style="display: table-cell; width: 20%; height: 100%; text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="lblEmpenhoAnexosContrato" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 30%; height: 100%; text-align: center; vertical-align: middle;">
                                                    <asp:Label ID="lblEmpenhoAnexosNroContrato" runat="server" ForeColor="Blue" />
                                                </div>
                                                <div style="display: table-cell; width: 20%; height: 100%; text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="lblEmpenhoAnexosEmpenho" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 30%; height: 100%; text-align: center; vertical-align: middle;">
                                                    <asp:Label ID="lblEmpenhoAnexosNroEmpenho" runat="server" ForeColor="Blue" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 85%; text-align: center;">
                                                <fieldset>
                                                    <div style="width: 100%; height: 100%; overflow-x: none; overflow-y: scroll;">
                                                        <%-- GRID REGISTROS --%>
                                                        <asp:GridView ID="gvEmpenhoAnexos" runat="server"
                                                            DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,contratoLicitacaoSeq,
                                                                          empenhoCodigoId,tipoPedidoId,clienteIdFaturamento,empenhoDoctoSeq"
                                                            OnRowDataBound="gvEmpenhoAnexos_RowDataBound"
                                                            OnRowCommand="gvEmpenhoAnexos_RowCommand"
                                                            OnPageIndexChanging="gvEmpenhoAnexos_PageIndexChanging"
                                                            OnRowUpdating="gvEmpenhoAnexos_RowUpdating">
                                                            <Columns>
                                                                <asp:BoundField DataField="empenhoDoctoDataInclusao" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                                                <asp:BoundField DataField="empenhoDoctoNomeArquivo" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                                                <asp:BoundField DataField="empenhoDoctObservacoes" ItemStyle-HorizontalAlign="Left" />
                                                                <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbDownload" runat="server" SkinID="ImgGrid" CommandName="Download"
                                                                            ToolTip="<%$ Resources:Resource, lblDownload %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                                              Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + 
                                                                                                              Eval("contratoLicitacaoSeq") + "|" + Eval("empenhoCodigoId") + "|" + Eval("tipoPedidoId") + "|" + 
                                                                                                              Eval("clienteIdFaturamento") + "|" + Eval("empenhoDoctoSeq") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- PAINEL ORÇAMENTOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppOrcamentoExistente" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteCheck" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="gvClientes" EventName="RowCommand" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlOrcamentoExistente" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblOrcamentoExistente" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbOrcamentoExistente" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                OnClick="imbOrcamentoExistente_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <div style="top: 0; left: 0; width: 100%; height: 100%;">
                                                <div style="display: table; width: 100%; height: 15%; vertical-align: middle;">
                                                    <div style="display: table; width: 100%; height: 50%; vertical-align: middle;">
                                                        <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblOrcamentoDescricao" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: auto; height: 100%; vertical-align: middle; text-align: left; padding-left: 5px;">
                                                            <asp:DropDownList ID="ddlOrcamentos" runat="server" />
                                                            <asp:ImageButton ID="imbOrcamentoView" runat="server"
                                                                Width="20px" Height="20px" ImageAlign="AbsMiddle"
                                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                                ImageUrl="~/Imagens/find.png"
                                                                OnClick="imbOrcamentoView_Click" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 50%; vertical-align: middle;">
                                                        <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblOrcamentoAtendente" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 25%; height: 100%; vertical-align: middle; padding-left: 5px;">
                                                            <asp:Label ID="lblOrcamentoAtendenteDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                        <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblOrcamentoData" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 15%; height: 100%; vertical-align: middle; padding-left: 5px;">
                                                            <asp:Label ID="lblOrcamentoDataDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                        <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblOrcamentoDataValidade" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 15%; height: 100%; vertical-align: middle; padding-left: 5px;">
                                                            <asp:Label ID="lblOrcamentoDataValidadeDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                        <div style="display: table-cell; width: 15%; height: 100%; vertical-align: middle;">
                                                            <asp:Label ID="lblOrcamentoDiasCorridos" runat="server" ForeColor="Red" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; height: 45%; vertical-align: middle;">
                                                    <fieldset>
                                                        <div style="display: table; width: 100%; height: 100%;">
                                                            <div style="display: table-cell; height: 98%; width: 98%; overflow-x: none; overflow-y: scroll;">
                                                                <center />

                                                                <asp:GridView ID="gvOrcamentoItens" runat="server"
                                                                    OnPageIndexChanging="gvOrcamentoItens_PageIndexChanging"
                                                                    OnRowCommand="gvOrcamentoItens_RowCommand"
                                                                    OnRowDataBound="gvOrcamentoItens_RowDataBound">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="itemId" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField DataField="itemDescricao" />
                                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtOrcamentoItemValor" runat="server" Enabled="false"
                                                                                    Font-Bold="true"
                                                                                    SkinID="Pedido"
                                                                                    Text='<%# Eval("pedidoItemPrecoTabela", "{0:###,###,###,#00.00}") %>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtOrcamentoItemQuantidade" runat="server" Enabled="false"
                                                                                    Font-Bold="true"
                                                                                    SkinID="Pedido"
                                                                                    Text='<%# Eval("pedidoItemQuantidade", "{0:f0}") %>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                                </asp:GridView>

                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <div style="display: table; width: 100%; height: 10%; vertical-align: middle;">
                                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle; text-align: right;">
                                                        <asp:Label ID="lblOrcamentoValorFrete" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; height: 100%; vertical-align: middle; padding-left: 5px;">
                                                        <asp:TextBox ID="txtOrcamentoValorFrete" runat="server" Font-Bold="true" Enabled="false" />
                                                    </div>
                                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle; text-align: right;">
                                                        <asp:Label ID="lblOrcamentoQtdTotal" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; height: 100%; vertical-align: middle; padding-left: 5px;">
                                                        <asp:TextBox ID="txtOrcamentoQtdTotal" runat="server" Font-Bold="true" Enabled="false" />
                                                    </div>
                                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle; text-align: right;">
                                                        <asp:Label ID="lblOrcamentoValorTotal" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; height: 100%; vertical-align: middle; padding-left: 5px;">
                                                        <asp:TextBox ID="txtOrcamentoValorTotal" runat="server" Font-Bold="true" Enabled="false" />
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; height: 20%; vertical-align: middle;">
                                                    <fieldset>
                                                        <div style="display: table; width: 100%; height: 100%;">
                                                            <div style="display: table-cell; width: 20%; text-align: right; vertical-align: middle;">
                                                                <asp:Label ID="lblOrcamentoObservacoes" runat="server" />
                                                            </div>
                                                            <div style="display: table-cell; width: 80%; text-align: right; vertical-align: middle;">
                                                                <asp:TextBox ID="txtOrcamentoObservacoes" runat="server" MaxLength="255" TextMode="MultiLine" Columns="50" Rows="6" Width="98%" Enabled="false" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <div style="display: table; width: 100%; height: 10%; vertical-align: middle;">
                                                    <div style="display: table; width: 100%; height: 100%;">
                                                        <div style="display: table-cell; width: 50%; text-align: right; vertical-align: middle;">
                                                            <asp:Button ID="btnOrcamentoExistenteOk" runat="server" SkinID="ButtonLeft" OnClick="btnOrcamentoExistenteOk_Click" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; text-align: left; vertical-align: middle;">
                                                            <asp:Button ID="btnOrcamentoExistenteNok" runat="server" SkinID="ButtonRight" OnClick="btnOrcamentoExistenteNok_Click" />
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

                <%-- PAINEL FOLLOW UP --%>
                <asp:UpdatePanel ID="uppFollowUp" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnFollowUp" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlFollowUp" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblHeaderFollowUp" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imgFollowUpClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            OnClick="imgFollowUpClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div style="top: 0; left: 0; width: 100%; height: 100%;">
                                            <div style="width: 100%; height: 60%; overflow-x: none; overflow-y: scroll;">
                                                <div style="display: table; width: 100%; overflow-x: none;">
                                                    <center />

                                                    <asp:GridView ID="gvFollowUp" runat="server"
                                                        OnPageIndexChanging="gvFollowUp_PageIndexChanging"
                                                        OnRowDataBound="gvFollowUp_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrContato" runat="server"
                                                                        Text='<%# DateTime.Parse(Eval("followUpDataContato").ToString()).Equals(DateTime.MinValue) ? string.Empty : 
                                                                                            Eval("followUpDataContato", "{0:dd/MM/yyyy HH:mm:ss}") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="followUpResponsavel" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                                            <asp:BoundField DataField="followUpOcorrencia" />
                                                            <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrLembrete" runat="server"
                                                                        Text='<%# DateTime.Parse(Eval("followUpDataLembrete").ToString()).Equals(DateTime.MinValue) ? string.Empty : 
                                                                                            Eval("followUpDataLembrete", "{0:dd/MM/yyyy}") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrFollowUpTipo" runat="server" Text='<%# Eval("followUpTipoDescricao").ToString().ToUpper() %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: right;">
                                                    <asp:Label ID="lblFollowUpResponsavel" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 25%; vertical-align: middle; text-align: center;">
                                                    <asp:Label ID="lblFollowUpResponsavelTexto" runat="server" SkinID="LabelResposta" />
                                                </div>
                                                <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: right;">
                                                    <asp:Label ID="lblFollowUpLembrete" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: center;">
                                                    <CtlData:ControlData ID="CtlFollowUpLembrete" runat="server" ValidationGroup="ValidaFollowUp" />
                                                </div>
                                                <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: right;">
                                                    <asp:Label ID="lblFollowUpTipo" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: center;">
                                                    <asp:DropDownList ID="ddlFollowUpTipo" runat="server" SkinID="DropFiltro" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                                <asp:TextBox ID="txtFollowUpOcorrencia" runat="server" MaxLength="255" TextMode="MultiLine" Columns="50" Rows="6" Width="98%" />
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: right;">
                                                    <asp:Button ID="btnFollowUpRegistrar" runat="server" SkinID="ButtonLeft" OnClick="btnFollowUpRegistrar_Click" />
                                                </div>
                                                <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: left;">
                                                    <asp:Button ID="btnFollowUpCancelar" runat="server" SkinID="ButtonRight" OnClick="btnFollowUpCancelar_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>

                            <asp:RequiredFieldValidator ID="rfvFollowUp" runat="server" ControlToValidate="txtFollowUpOcorrencia" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaFollowUp" />
                            <asp:ValidationSummary ID="vsmFollowUp" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaFollowUp" />
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- PAINEL RECEITAS ENDEREÇO --%>
                <asp:UpdatePanel ID="uppReceitaEndereco" runat="server" UpdateMode="Conditional">
                    <%--<Triggers>
                        <asp:AsyncPostBackTrigger ControlID="" EventName="Click" />
                    </Triggers>--%>
                    <ContentTemplate>
                        <asp:Panel ID="pnlReceitaEndereco" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 50%; left: 25%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblReceitaEnderecoHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="lbReceitaEnderecoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            OnClick="lbReceitaEnderecoClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div style="width: 100%; display: table">
                                            <ol>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEnderecoLista" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlReceitaEnderecoLista" runat="server"
                                                        AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlReceitaEnderecoLista_SelectedIndexChanged" />
                                                </li>
                                                <li>
                                                    <div class="line_itens_left">
                                                        <asp:Label runat="server" ID="lblReceitaEnderecoData" SkinID="LabelForm" />
                                                    </div>
                                                    <div class="line_itens">
                                                        <CtlData:ControlData ID="CtlReceitaEnderecoDataRetirada" runat="server" ValidationGroup="ValidaReceitaEndereco" />
                                                        <asp:HiddenField ID="hfReceitaEnderecoId" runat="server" Value="" />
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEnderecoPacienteNome" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtReceitaEnderecoPacienteNome" runat="server" MaxLength="30" />
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEnderecoPeriodoRetirada" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlReceitaEnderecoPeriodoRetirada" runat="server">
                                                        <asp:ListItem Value="" Text="<%$ Resources:Resource, lblSelecione %>" />
                                                        <asp:ListItem Value="M" Text="<%$ Resources:Resource, lblPeriodoManha %>" />
                                                        <asp:ListItem Value="T" Text="<%$ Resources:Resource, lblPeriodoTarde %>" />
                                                        <asp:ListItem Value="H" Text="<%$ Resources:Resource, lblPeriodoComercial %>" />
                                                    </asp:DropDownList>
                                                </li>
                                                <li>
                                                    <div style="display: table;">
                                                        <div style="display: table-cell; vertical-align: middle;">
                                                            <asp:Panel ID="pnlReceitaEnderecoCep" runat="server" DefaultButton="imbReceitaEnderecoCep">
                                                                <asp:Label runat="server" ID="lblReceitaEnderecoCep" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtReceitaEnderecoCep" runat="server" SkinID="Filtro" MaxLength="9" />
                                                                <asp:ImageButton ID="imbReceitaEnderecoCep" runat="server" Width="22px" Height="22px"
                                                                    ImageUrl="~/Imagens/find.png"
                                                                    ToolTip="<%$ Resources:Resource, lblBuscarCep %>"
                                                                    ImageAlign="AbsMiddle"
                                                                    OnClick="imbReceitaEnderecoCep_Click" />
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEndereco" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtReceitaEndereco" runat="server" MaxLength="100" />
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEnderecoNro" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtReceitaEnderecoNro" runat="server" MaxLength="10" />
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEnderecoComplemento" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtReceitaEnderecoComplemento" runat="server" MaxLength="50" />
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEnderecoBairro" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtReceitaEnderecoBairro" runat="server" MaxLength="50" />
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEnderecoCidade" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtReceitaEnderecoCidade" runat="server" MaxLength="50" />
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEnderecoPais" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlReceitaEnderecoPais" runat="server"
                                                        AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlReceitaEnderecoPais_SelectedIndexChanged" />
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblReceitaEnderecoUf" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlReceitaEnderecoUf" runat="server" />
                                                </li>
                                            </ol>
                                        </div>
                                        <div style="width: 100%; display: table;">
                                            <div style="width: 100%; display: table;">
                                                <div style="width: auto; display: table-cell; text-align: right;">
                                                    <asp:Button ID="btnReceitaEnderecoSalvar" runat="server" SkinID="ButtonLeft" ValidationGroup="ValidaReceitaEndereco" OnClick="btnReceitaEnderecoSalvar_Click" />
                                                </div>
                                                <div style="width: 75px; display: table-cell; text-align: right;">
                                                    <asp:Button ID="btnReceitaEnderecoLimpar" runat="server" SkinID="ButtonCenter" OnClick="btnReceitaEnderecoLimpar_Click" />
                                                </div>
                                                <div style="width: auto; display: table-cell; text-align: left;">
                                                    <asp:Button ID="btnReceitaEnderecoCancelar" runat="server" SkinID="ButtonRight" OnClick="btnReceitaEnderecoCancelar_Click" />
                                                </div>
                                            </div>
                                        </div>

                                        <div style="width: 100%; display: table; bottom: 0;">
                                            <div style="width: 100%; display: table-cell; text-align: center;">
                                                <asp:ImageButton ID="imbReceitaEnderecoDocumento" runat="server" Width="50px" Height="80px"
                                                    ImageAlign="AbsMiddle"
                                                    ImageUrl="~/Imagens/forward.png"
                                                    ToolTip="<%$ Resources:Resource, lblAnexarReceitas %>"
                                                    OnClick="imbReceitaEnderecoDocumento_Click" />
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>

                            <asp:RequiredFieldValidator ID="rfvReceitaEnderecoPacienteNome" runat="server" ControlToValidate="txtReceitaEnderecoPacienteNome" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaReceitaEndereco" />
                            <asp:RequiredFieldValidator ID="rfvReceitaEnderecoCep" runat="server" ControlToValidate="txtReceitaEnderecoCep" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaReceitaEndereco" />
                            <asp:RequiredFieldValidator ID="rfvReceitaEnderecoEndereco" runat="server" ControlToValidate="txtReceitaEndereco" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaReceitaEndereco" />
                            <asp:RequiredFieldValidator ID="rfvReceitaEnderecoBairro" runat="server" ControlToValidate="txtReceitaEnderecoBairro" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaReceitaEndereco" />
                            <asp:RequiredFieldValidator ID="rfvReceitaEnderecoCidade" runat="server" ControlToValidate="txtReceitaEnderecoCidade" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaReceitaEndereco" />
                            <asp:ValidationSummary ID="vsmReceitaEndereco" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaReceitaEndereco" />
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- PAINEL RECEITAS DOCUMENTOS --%>
                <asp:UpdatePanel ID="uppReceitaDocumentos" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnReceitaDocumentoSalvar" />
                        <asp:AsyncPostBackTrigger ControlID="btnReceitaDocumentoLimpar" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlReceitaDocumentos" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 70%; left: 15%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblReceitaDocumentosHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbReceitaDocumentoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            OnClick="imbReceitaDocumentosClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div style="width: 100%; display: table;">
                                            <ol>
                                                <li>
                                                    <div style="display: table; width: 100%;">
                                                        <div style="display: table-cell; width: 30%; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblReceitaDocumentoUtilizar" runat="server" SkinID="LabelForm" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; text-align: left; vertical-align: middle;">
                                                            <asp:DropDownList ID="ddlReceitaDocumentoUtilizar" runat="server"
                                                                AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlReceitaDocumentoUtilizar_SelectedIndexChanged" />
                                                            <asp:ImageButton ID="imbReceitaDocumentoView" runat="server" Width="22px" Height="22px"
                                                                ImageUrl="~/Imagens/find.png" Visible="false"
                                                                ToolTip="<%$ Resources:Resource, lblReceitaDocumentoView %>"
                                                                ImageAlign="AbsMiddle"
                                                                OnClick="imbReceitaDocumentoView_Click" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div style="display: table; width: 100%;">
                                                        <div style="display: table-cell; width: 30%; text-align: right;">
                                                            <asp:Label runat="server" ID="lblReceitaDocumentoNumeroReceita" SkinID="LabelForm" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; text-align: left;">
                                                            <asp:TextBox ID="txtReceitaDocumentoNumeroReceita" runat="server" MaxLength="30" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div style="display: table; width: 100%;">
                                                        <div style="display: table-cell; width: 30%; text-align: right;">
                                                            <asp:Label runat="server" ID="lblReceitaDocumentoPrescricao" SkinID="LabelForm" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; text-align: left;">
                                                            <CtlData:ControlData ID="CtlReceitaDocumentoPrescricao" runat="server" ValidationGroup="ValidaReceitaDocumento" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div style="display: table; width: 100%;">
                                                        <div style="display: table-cell; width: 30%; text-align: right;">
                                                            <asp:Label runat="server" ID="lblReceitaDocumentoQtdPrescrita" SkinID="LabelForm" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; text-align: left;">
                                                            <asp:TextBox ID="txtReceitaDocumentoQtdPrescrita" runat="server" MaxLength="30" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div style="display: table; width: 100%;">
                                                        <div style="display: table-cell; width: 30%; text-align: right;">
                                                            <asp:Label runat="server" ID="lblReceitaDocumentoDosagem" SkinID="LabelForm" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; text-align: left;">
                                                            <asp:TextBox ID="txtReceitaDocumentoDosagem" runat="server" MaxLength="30" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div style="display: table; width: 100%;">
                                                        <div style="display: table-cell; width: 30%; text-align: right;">
                                                            <asp:Label ID="lblReceitaDocumentoArquivoNome" runat="server" SkinID="LabelForm" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; text-align: left;">
                                                            <asp:TextBox ID="txtReceitaDocumentoArquivoNome" runat="server" MaxLength="30" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div style="display: table; width: 100%;">
                                                        <div style="display: table-cell; width: 30%; text-align: right;">
                                                            <asp:Label ID="lblReceitaDocumentoArquivo" runat="server" SkinID="LabelForm" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; text-align: left;">
                                                            <asp:FileUpload ID="fulReceitaDocumentoArquivo" runat="server" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div style="display: table; width: 100%;">
                                                        <div style="display: table-cell; width: 30%; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblReceitaDocumentoObservacoes" runat="server" SkinID="LabelForm" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; text-align: left;">
                                                            <asp:TextBox ID="txtReceitaDocumentoObservacoes" runat="server" Columns="100" Rows="5" TextMode="MultiLine" MaxLength="255" />
                                                        </div>
                                                    </div>
                                                </li>
                                            </ol>
                                        </div>
                                        <div style="width: 100%; display: table;">
                                            <div style="width: 100%; display: table;">
                                                <div style="width: auto; display: table-cell; text-align: right;">
                                                    <asp:Button ID="btnReceitaDocumentoSalvar" runat="server" SkinID="ButtonLeft" ValidationGroup="ValidaReceitaDocumento" OnClick="btnReceitaDocumentoSalvar_Click" />
                                                </div>
                                                <div style="width: 75px; display: table-cell; text-align: right;">
                                                    <asp:Button ID="btnReceitaDocumentoLimpar" runat="server" SkinID="ButtonCenter" OnClick="btnReceitaDocumentoLimpar_Click" />
                                                </div>
                                                <div style="width: auto; display: table-cell; text-align: left;">
                                                    <asp:Button ID="btnReceitaDocumentoCancelar" runat="server" SkinID="ButtonRight" OnClick="btnReceitaDocumentoCancelar_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div style="width: 100%; display: table; bottom: 0;">
                                            <div style="width: 100%; display: table-cell; text-align: center;">
                                                <asp:ImageButton ID="imbReceitaDocumentoEndereco" runat="server" Height="80px" Width="50px"
                                                    ImageAlign="AbsMiddle"
                                                    ImageUrl="~/Imagens/previous.png"
                                                    ToolTip="<%$ Resources:Resource, lblReceitaEnderecoTexto %>"
                                                    OnClick="imbReceitaDocumentoEndereco_Click" />
                                            </div>
                                        </div>
                                        <div style="width: 100%; overflow-x: none; overflow-y: scroll;">
                                            <div style="display: table; width: 100%; overflow-x: none;">
                                                <center />

                                                <asp:GridView ID="gvReceitaDocumento" runat="server"
                                                    OnRowDataBound="gvReceitaDocumento_RowDataBound"
                                                    OnPageIndexChanging="gvReceitaDocumento_PageIndexChanging"
                                                    OnRowCommand="gvReceitaDocumento_RowCommand"
                                                    OnRowDeleting="gvReceitaDocumento_RowDeleting">
                                                    <Columns>
                                                        <asp:BoundField DataField="pedidoReceitaNumero" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrDataPrescricao" runat="server"
                                                                    Text='<%# DateTime.Parse(Eval("pedidoReceitaDataPrescricao").ToString()).Equals(DateTime.MinValue) ? "" : 
                                                                                            Eval("pedidoReceitaDataPrescricao", "{0:dd/MM/yyyy}") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="pedidoReceitaQtdPrescrita" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="pedidoReceitaDosagemDia" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="pedidoReceitaNome" ItemStyle-Width="200px" />
                                                        <asp:TemplateField ItemStyle-Width="300px">
                                                            <ItemTemplate>
                                                                <div style="width: 100%; display: table-cell; vertical-align: middle;">
                                                                    <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 290px;">
                                                                        <asp:Label ID="ltrReceitaDocumentoObs" runat="server"
                                                                            Text='<%# Eval("pedidoReceitaObservacoes") %>'
                                                                            ToolTip='<%# Eval("pedidoReceitaObservacoes") %>' />
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbDownload" runat="server"
                                                                    SkinID="ImgGrid"
                                                                    CommandName="Download"
                                                                    ToolTip="<%$ Resources:Resource, lblDownload %>"
                                                                    CommandArgument='<%# Eval("pedidoId") + "|" + Eval("pedidoReceitaId") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbExcluir" runat="server"
                                                                    SkinID="ImgGrid"
                                                                    CommandName="Delete"
                                                                    ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                    CommandArgument='<%# Eval("pedidoId") + "|" + Eval("pedidoReceitaId") + "|" +
                                                                                                     Eval("clienteId") + "|" + Eval("tipoDocumentoId") + "|" + 
                                                                                                     Eval("clienteDocumentoSeq") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>

                            <asp:RequiredFieldValidator ID="rfvReceitaDocumentoNumeroReceita" runat="server" ControlToValidate="txtReceitaDocumentoNumeroReceita" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaReceitaDocumento" />
                            <asp:RequiredFieldValidator ID="rfvReceitaDocumentoQtdPrescrita" runat="server" ControlToValidate="txtReceitaDocumentoQtdPrescrita" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaReceitaDocumento" />
                            <asp:RequiredFieldValidator ID="rfvReceitaDocumentoDosagem" runat="server" ControlToValidate="txtReceitaDocumentoDosagem" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaReceitaDocumento" />
                            <asp:ValidationSummary ID="vsmReceitaDocumento" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaReceitaDocumento" />
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- PAINEL TRIBUTAÇÃO DE ITEM --%>
                <asp:UpdatePanel ID="uppItemTributacao" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlItemTributacao" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 80%; left: 10%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblItemTributacaoHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbItemTributacaoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            OnClick="imbItemTributacaoClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>

                                        <div style="display: table; height: 20%; width: 100%;">
                                            <div style="display: table-cell; height: 100%; width: 100%; vertical-align: middle;">
                                                <center />
                                                <asp:GridView ID="gvItemTributacao" runat="server" AllowPaging="false"
                                                    OnRowDataBound="gvItemTributacao_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="itemId" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="itemDescricao" />
                                                        <asp:BoundField DataField="unidadeMedidaSigla" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                                        <asp:BoundField DataField="familiaComercialDescricao" ItemStyle-Width="180px" />
                                                        <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrItemTributacaoControlado" runat="server"
                                                                    Text='<%# Eval("itemControlado").ToString().Equals("true") ? 
                                                                                            GetResourceValue("lblSim") : 
                                                                                                GetResourceValue("lblNao") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="pedidoItemPrecoTabela" DataFormatString="{0:n2}" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="pedidoItemQuantidade" DataFormatString="{0:###,###,#00.##}" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField ItemStyle-Width="220px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrItemTributacaoCFOP" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                        <div style="display: table; height: 75%; width: 100%;">
                                            <div style="display: table-cell; height: 75%; width: 100%; vertical-align: top;">
                                                <div style="display: table; height: 100%; width: 100%;">
                                                    <fieldset style="display: table-cell; height: 100%; width: 98%;">
                                                        <legend>
                                                            <asp:Literal ID="ltrItemTributacaoHeaderAliquotas" runat="server" Text="<%$ Resources:Resource, lblImpostos %>" />
                                                        </legend>
                                                        <ol style="margin-top: 20px;">
                                                            <li>
                                                                <asp:Label ID="lblItemIPIBase" runat="server" Width="100px" />
                                                                <asp:TextBox ID="txtItemIPIBase" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemIPIAliquota" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemIPIAliquota" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemIPIValor" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemIPIValor" runat="server" Enabled="false" SkinID="Currency150" />
                                                            </li>
                                                            <li>
                                                                <asp:Label ID="lblItemICMSBase" runat="server" Width="100px" />
                                                                <asp:TextBox ID="txtItemICMSBase" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemICMSAliquota" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemICMSAliquota" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemICMSValor" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemICMSValor" runat="server" Enabled="false" SkinID="Currency150" />
                                                            </li>
                                                            <li>
                                                                <asp:Label ID="lblItemPisBase" runat="server" Width="100px" />
                                                                <asp:TextBox ID="txtItemPisBase" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemPisAliquota" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemPisAliquota" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemPisValor" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemPisValor" runat="server" Enabled="false" SkinID="Currency150" />
                                                            </li>
                                                            <li>
                                                                <asp:Label ID="lblItemCofinsBase" runat="server" Width="100px" />
                                                                <asp:TextBox ID="txtItemCofinsBase" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemCofinsAliquota" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemCofinsAliquota" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemCofinsValor" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemCofinsValor" runat="server" Enabled="false" SkinID="Currency150" />
                                                            </li>
                                                            <li>
                                                                <asp:Label ID="lblItemSTBase" runat="server" Width="100px" />
                                                                <asp:TextBox ID="txtItemSTBase" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemSTAliquota" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemSTAliquota" runat="server" Enabled="false" SkinID="Currency150" />
                                                                <asp:Label ID="lblItemSTValor" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtItemSTValor" runat="server" Enabled="false" SkinID="Currency150" />
                                                            </li>
                                                        </ol>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>

                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

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

                <%-- PAINEL REMANEJAMENTO DE RESERVAS --%>
                <asp:UpdatePanel ID="uppRemanejaReservas" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlRemanejaReservas" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblRemanejaReservasHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbRemanejaReservasClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset style="height: 100%;">

                                        <div style="width: 100%; height: 98%; display: table;">
                                            <div style="width: 100%; height: 15%; display: table;">
                                                <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: right;">
                                                    <asp:Label ID="lblPedidoId" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 10%; vertical-align: middle; text-align: center;">
                                                    <asp:Label ID="lblPedidoIdDesc" runat="server" SkinID="LabelResposta" />
                                                </div>
                                                <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: right;">
                                                    <asp:Label ID="lblUserId" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: center;">
                                                    <asp:Label ID="lblUserIdDesc" runat="server" SkinID="LabelResposta" />
                                                </div>
                                                <div style="display: table-cell; width: 5%; vertical-align: middle;">
                                                    <asp:Label ID="lblClienteNome" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 40%; vertical-align: middle;">
                                                    <asp:Label ID="lblClienteNomeDesc" runat="server" SkinID="LabelResposta" />
                                                </div>
                                                <div style="display: table-cell; width: 10%; vertical-align: middle; text-align: right;">
                                                    <asp:Label ID="lblOrdem" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 10%; vertical-align: middle; text-align: center;">
                                                    <asp:Label ID="lblOrdemDesc" runat="server" SkinID="LabelResposta" />
                                                </div>
                                            </div>
                                            <div style="width: 100%; height: 85%; display: table;">
                                                <center />
                                                <asp:GridView ID="gvRemanejaReservas" runat="server"
                                                    OnRowDataBound="gvRemanejaReservas_RowDataBound"
                                                    OnPageIndexChanging="gvRemanejaReservas_PageIndexChanging"
                                                    OnRowCommand="gvRemanejaReservas_RowCommand">
                                                    <Columns>
                                                        <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="pedidoData" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                                        <asp:BoundField DataField="usuarioId" ItemStyle-Width="150px" />
                                                        <asp:BoundField DataField="clienteRazaoSocial" />
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRemanejar" runat="server"
                                                                    Text='<%# Eval("pedidoOrdemReserva", "{0:d2}º") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbRemanejar" runat="server"
                                                                    CommandName="Remanejar"
                                                                    SkinID="ImgGrid"
                                                                    ToolTip="<%$ Resources:Resource, lblReservaRemanejar %>"
                                                                    CommandArgument='<%# Eval("pedidoId") + "|" + Eval("pedidoOrdemReserva") %>'
                                                                    ImageUrl="~/Imagens/check.png" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%--VALIDADORES DE ANEXO --%>
                <asp:RequiredFieldValidator ID="rfvCepRetiradaReceita" runat="server" ControlToValidate="txtCepRetiradaReceita" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaAnexo" />
                <asp:RequiredFieldValidator ID="rfvRuaRetiradaReceita" runat="server" ControlToValidate="txtRuaRetiradaReceita" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaAnexo" />
                <asp:RequiredFieldValidator ID="rfvNumeroRetiradaReceita" runat="server" ControlToValidate="txtNumeroRetiradaReceita" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaAnexo" />
                <asp:RequiredFieldValidator ID="rfvBairroRetiradaReceita" runat="server" ControlToValidate="txtBairroRetiradaReceita" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaAnexo" />
                <asp:RequiredFieldValidator ID="rfvCidadeRetiradaReceita" runat="server" ControlToValidate="txtCidadeRetiradaReceita" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaAnexo" />
                <asp:RequiredFieldValidator ID="rfvNumeroReceita" runat="server" ControlToValidate="txtNumeroReceita" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaAnexo" />
                <asp:RequiredFieldValidator ID="rfvQuantidadePrescrita" runat="server" ControlToValidate="txtQuantidadePrescrita" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaAnexo" />
                <asp:RequiredFieldValidator ID="rfvDosagemPorDia" runat="server" ControlToValidate="txtDosagemPorDia" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaAnexo" />
                <asp:ValidationSummary ID="vsAnexo" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaAnexo" />
                <asp:CompareValidator ID="cpvClienteId" runat="server" ControlToValidate="txtHeaderClienteId" ControlToCompare="txtClienteIdNone" Display="None" Operator="Equal" Text="*" Type="String" SetFocusOnError="true" ValidationGroup="Validacao" />
                <asp:CompareValidator ID="cpvClienteTriangularId" runat="server" ControlToValidate="txtHeaderClienteTriangularId" ControlToCompare="txtClienteIdTriangularNone" Display="None" Operator="Equal" Text="*" Type="String" SetFocusOnError="true" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvCliente" runat="server" ControlToValidate="txtHeaderClienteId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaBuscaItem" />
                <asp:RequiredFieldValidator ID="rfvCondicaoPagamento" runat="server" ControlToValidate="txtCondicaoPagamento" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvMedicoPrescritor" runat="server" ControlToValidate="txtMedicoPrescritor" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsmValidaBuscaItem" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaBuscaItem" />
                <%-- </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>--%>

                <%-- CADASTRO 7PDV RENE --%>
                <div style="position: absolute;">
                    <asp:Panel ID="pnlAtiva7PDV" runat="server" DefaultButton="btnEnviaAtivacao" Visible="false" SkinID="PnlPopUp">
                        <div class="OpacityBackGround">
                        </div>
                        <div class="painel" style="width: 70%; height: 95%; left: 15%; top: 3%;">
                            <div class="painel_header">
                                <div class="painel_header_message">
                                    <asp:Label ID="Label3" runat="server" ForeColor="White" />
                                </div>
                                <div class="alert_header_icon">
                                    <asp:ImageButton ID="imbAtiva7PDVClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Visible="false"
                                        Height="25px" ImageUrl="~/Imagens/Fechar.png" OnClick="imbAtiva7PDVClose_Click" />
                                </div>
                            </div>
                            <div class="painel_body">
                                <fieldset style="height: 550px">
                                    <legend>
                                        <asp:Literal ID="Literal1" runat="server" />
                                        Ativação de cadastro Seven PDV
                                    </legend>
                                    <!-- Início de disposição dos campos -->
                                    <ol>
                                        <p>
                                            <li id="liTituloMedico" style="text-transform: uppercase; text-align: left; font-weight: bold;" runat="server">
                                                <asp:Label ID="lblDadosDoMedico7PDV" runat="server" />
                                                <hr>
                                            </li>
                                            <p>
                                            </p>
                                            <li id="liMedicoCodigoPrescritor" runat="server">
                                                <asp:Panel ID="pnl7PDVMedico" runat="server" DefaultButton="imbMedicoCheck7PDV">
                                                    <asp:Label ID="lblMedicoPrecritor7PDV" runat="server" Width="120px" />
                                                    <asp:TextBox ID="txtMedico7PDV" runat="server" MaxLength="50" SkinID="Pedido" />
                                                    <asp:ImageButton ID="imbMedicoCheck7PDV" runat="server" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/check.png" OnClick="imbMedicoCheck7PDV_Click" Width="25px" />
                                                    <asp:Label ID="Label5" runat="server" SkinID="LabelResposta" />
                                                </asp:Panel>
                                            </li>
                                            <li id="liNomeMedico" runat="server">
                                                <asp:Label ID="lblDadosMedicoNome7PDV" runat="server" Width="120px" />
                                                <asp:TextBox ID="txtDadosMedicoNome7PDV" runat="server" MaxLength="50" Style="width: 360px" />
                                            </li>
                                            <li id="liConselhoProfissional" runat="server">
                                                <asp:Label ID="lblMedicoConsProfissional7PDV" runat="server" Width="120px" />
                                                <asp:DropDownList ID="ddMedicoConsProfissional7PDV" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddMedicoConsProfissional7PDV_SelectedIndexChanged" SkinID="DropFiltro" />
                                            </li>
                                            <li id="liCRM" runat="server">
                                                <asp:Label ID="lblDadosMedicoCRM7PDV" runat="server" Width="120px" />
                                                <asp:TextBox ID="txtDadosMedicoCRM7PDV" runat="server" MaxLength="50" />
                                            </li>
                                            <li id="liUFMedico" runat="server">
                                                <asp:Label ID="lblMedicoUF7PDV" runat="server" Width="120px" />
                                                <asp:DropDownList ID="ddMedicoUf7PDV" runat="server" Style="width: 255px" />
                                            </li>
                                            <p>
                                                <li id="liTituloCliente" runat="server" style="text-transform: uppercase; text-align: left; font-weight: bold;">
                                                    <asp:Label ID="lblDadosDoPaciente7PDV" runat="server" />
                                                    <hr></hr>
                                                </li>
                                                <p>
                                                </p>
                                                <li id="liClienteNomeAbreviado" runat="server">
                                                    <asp:Label ID="lblNomeAbreviado7PDV" runat="server" Width="120px" />
                                                    <asp:TextBox ID="txtNomeAbreviado7PDV" runat="server" MaxLength="50" Width="360px" />
                                                </li>
                                                <li id="liClienteNomeCompleto" runat="server">
                                                    <asp:Label ID="lblNomeCompleto7PDV" runat="server" Width="120px" />
                                                    <asp:TextBox ID="txtNomeCompleto7PDV" runat="server" MaxLength="50" Width="360px" />
                                                </li>
                                                <li id="liClienteDataNascimento" runat="server">
                                                    <div class="line_itens_left">
                                                        <asp:Label ID="lblDataNascimento7PDV" runat="server" Width="116px" />
                                                    </div>
                                                    <div class="line_itens">
                                                        <CtlData:ControlData ID="CtlDataNascimento" runat="server" />
                                                    </div>
                                                </li>
                                                <li id="liClienteGenero" runat="server">
                                                    <div class="line_itens_left">
                                                        <asp:Label ID="lblDadosGenero7PDV" runat="server" Width="120px" />
                                                    </div>
                                                    <div class="line_itens">
                                                        <asp:RadioButtonList ID="rblGenero" runat="server" RepeatDirection="Horizontal">
                                                            <asp:ListItem Selected="True" Text="<%$ Resources:Resource, lblSexoMasculino %>" Value="M" />
                                                            <asp:ListItem Text="<%$ Resources:Resource, lblSexoFeminino %>" Value="F" />
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </li>
                                                <li id="liAceitaTermo" runat="server">
                                                    <div style="margin-left: 120px;">
                                                        <asp:CheckBox ID="chk7PDVAceitaTermo" runat="server" Font-Bold="true" Text="<%$ Resources:Resource, SevenPDVAceitaTermo %>" TextAlign="Right" />
                                                    </div>
                                                </li>
                                                <li id="liAceitaFone" runat="server">
                                                    <div style="margin-left: 120px;">
                                                        <asp:CheckBox ID="chk7PDVAceitaFone" runat="server" Font-Bold="true" Text="<%$ Resources:Resource, SevenPDVAceitaFone %>" TextAlign="Right" />
                                                    </div>
                                                </li>
                                                <li id="liAceitaCorreio" runat="server">
                                                    <div style="margin-left: 120px;">
                                                        <asp:CheckBox ID="chk7PDVAceitaCorreio" runat="server" Font-Bold="true" Text="<%$ Resources:Resource, SevenPDVAceitaCorreio %>" TextAlign="Right" />
                                                    </div>
                                                </li>
                                                <li id="liAceitaSMS" runat="server">
                                                    <div style="margin-left: 120px;">
                                                        <asp:CheckBox ID="chk7PDVAceitaSMS" runat="server" Font-Bold="true" Text="<%$ Resources:Resource, SevenPDVAceitaSMS %>" TextAlign="Right" />
                                                    </div>
                                                </li>
                                                <li id="liAceitaEmail" runat="server">
                                                    <div style="margin-left: 120px;">
                                                        <asp:CheckBox ID="chk7PDVAceitaEmail" runat="server" Font-Bold="true" Text="<%$ Resources:Resource, SevenPDVAceitaEmail %>" TextAlign="Right" />
                                                    </div>
                                                </li>
                                                <!--*********************************************************************************-->
                                                <li id="liClienteCep" runat="server">
                                                    <asp:Panel ID="pnlCep" runat="server" DefaultButton="imbBuscaCep">
                                                        <asp:Label ID="lblClienteEnderecoCep7PDV" runat="server" Width="120px" />
                                                        <asp:TextBox ID="txtClienteEnderecoCep7PDV" runat="server" MaxLength="9" SkinID="Data" />
                                                        <asp:ImageButton ID="imbBuscaCep" runat="server" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/find.png" OnClick="imbBuscaCep_Click" Width="25px" />
                                                    </asp:Panel>
                                                </li>
                                                <li id="liClienteEndereco" runat="server">
                                                    <asp:Label ID="lblClienteEndereco7PDV" runat="server" Width="120px" />
                                                    <asp:TextBox ID="txtClienteEndereco7PDV" runat="server" MaxLength="100" Width="360px" />
                                                </li>
                                                <li id="liClienteBairro" runat="server">
                                                    <asp:Label ID="lblClienteEnderecoBairro7PDV" runat="server" Width="120px" />
                                                    <asp:TextBox ID="txtClienteEnderecoBairro7PDV" runat="server" MaxLength="100" Width="360px" />
                                                </li>
                                                <li id="liClienteCidade" runat="server">
                                                    <asp:Label ID="lblClienteEnderecoCidade7PDV" runat="server" Width="120px" />
                                                    <asp:TextBox ID="txtClienteEnderecoCidade7PDV" runat="server" MaxLength="100" Width="360px" />
                                                </li>
                                                <li id="liClienteUF" runat="server">
                                                    <asp:Label ID="lblClienteUF7PDV" runat="server" Width="120px" />
                                                    <asp:DropDownList ID="ddClientUf7PDV" runat="server" Style="width: 255px" />
                                                </li>
                                                <li id="liClienteEmail" runat="server">
                                                    <asp:Label ID="lblClienteEmail7PDV" runat="server" Width="120px" />
                                                    <asp:TextBox ID="txtClienteEmail7PDV" runat="server" MaxLength="50" Width="360px" />
                                                </li>
                                                <li id="liClienteCelular" runat="server">
                                                    <asp:Label ID="lblDDDCelular7PDV" runat="server" Width="120px" />
                                                    <asp:TextBox ID="txtDDDCelular7PDV" runat="server" MaxLength="2" Width="35px" />
                                                    <asp:Label ID="lblCelular7PDV" runat="server" Width="46px" />
                                                    <asp:TextBox ID="txtNumeroCelular7PDV" runat="server" MaxLength="100" Width="75px" />
                                                </li>
                                                <li id="liClienteTelefone" runat="server">
                                                    <asp:Label ID="lblDDD7PDV" runat="server" Width="120px" />
                                                    <asp:TextBox ID="txtDDDTelefoneFixo7PDV" runat="server" MaxLength="2" Width="35px" />
                                                    <asp:Label ID="lblTelefone7PDV" runat="server" />
                                                    <asp:TextBox ID="txtTelefoneFixo7PDV" runat="server" MaxLength="100" Width="75px" />
                                                </li>
                                                <hr>
                                                    <div style="width: 100%; text-align: center">
                                                        <asp:Button ID="btnEnviaAtivacao" runat="server" OnClick="btnEnviaAtivacao_Click" SkinID="ButtonLeft" Text="<%$ Resources:Resource, lblEnviar %>" ToolTip="<%$ Resources:Resource, lblEnviaDados7PDV %>" />
                                                        <asp:Button ID="btnCancelarAtivacao" runat="server" OnClick="btnCancelarAtivacao_Click" SkinID="ButtonRight" Text="<%$ Resources:Resource, lblCancelar %>" Visible="True" />
                                                    </div>
                                                </hr>
                                                <p>
                                                </p>
                                                <p>
                                                </p>
                                            </p>
                                    </ol>
                                    <!-- Final de disposição dos campos -->
                            </div>
                            </fieldset>
                        </div>

                    </asp:Panel>
                </div>
                </div>
                 <div style="position: absolute;">

                     <asp:UpdatePanel ID="updDadosPacienteEpharma" runat="server" UpdateMode="Conditional">
                         <ContentTemplate>
                             <asp:Panel ID="pnlDadosPacienteEpharma" runat="server" Visible="false" SkinID="PnlPopUp">

                                 <div class="OpacityBackGround">
                                 </div>
                                 <%--<div class="painel">--%>
                                 <div class="painel" style="width: 40%; height: 55%; left: 30%; top: 20%;">
                                     <div class="painel_header">
                                         <div class="painel_header_message">
                                             <asp:Label ID="lblDadosPacienteEpharma" runat="server" ForeColor="White" />
                                         </div>

                                     </div>
                                     <div class="painel_body">
                                         <fieldset>
                                             <legend>
                                                 <asp:Literal ID="ltrDadosPacienteEpharma" runat="server" />
                                             </legend>

                                             <br />
                                             <br />
                                             <ol>
                                                 <li>
                                                     <asp:Label ID="lblPacienteEpharma" runat="server" SkinID="LabelForm" />
                                                     <asp:DropDownList ID="dplPacienteEpharma" CssClass="DropDownList" runat="server" TabIndex="12" AutoPostBack="true" />
                                                 </li>
                                                 <li>
                                                     <div style="width: 95%; margin-top: 20px; border: solid 0px; text-align: right; margin-right: 30px;">
                                                         <asp:Button ID="btnOkEpharma" runat="server" SkinID="ButtonOk" CssClass="ButtonLeft" OnClick="btnOkEpharma_Click" />
                                                         <%--<asp:Button ID="btnCancelarEpharma" runat="server" SkinID="ButtonCancel" CssClass="ButtonRight" OnClick="btnCancelarEpharma_Click" />--%>
                                                         <asp:Button ID="btnVoltarEpharma" runat="server" SkinID="ButtonCancel" Visible="false" CssClass="ButtonRight" OnClick="btnVoltarEpharma_Click" />
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>


    <%--POPUP DE PHARMASYSTEM--%>
    <div style="position: absolute;">
        <asp:UpdatePanel ID="UpdatePanelPharmaSystem" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="imbPharmaSystem" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlPharmaSystem" runat="server" Visible="false" SkinID="PnlPopUp">

                    <div class="OpacityBackGround">
                    </div>
                    <%--<div class="painel">--%>
                    <div class="painel" style="width: 40%; height: 55%; left: 30%; top: 20%;">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblEPharmaDados" runat="server" ForeColor="White" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <legend>
                                    <asp:Literal ID="ltrPharmaSystem" runat="server" />
                                </legend>

                                <br />
                                <br />
                                <ol>
                                    <li>
                                        <asp:Label ID="lblPharmaSystemProjeto" runat="server" SkinID="LabelForm" />
                                        <asp:DropDownList ID="ddlPharmaSystemProjeto" CssClass="DropDownList" runat="server" TabIndex="12" AutoPostBack="true" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblPharmaSystemCartao" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtPharmaSystemCartao" runat="server" CssClass="txtNormal" Width="258px" TabIndex="12" />
                                    </li>

                                    <li>
                                        <div style="width: 95%; margin-top: 20px; border: solid 0px; text-align: right; margin-right: 30px;">
                                            <asp:Button ID="btnPharmaSystemconfirmar" runat="server" SkinID="ButtonOk" CssClass="ButtonLeft" OnClick="btnPharmaSystemconfirmar_Click" />
                                            <asp:Button ID="btnPharmaSystemCancelar" runat="server" SkinID="ButtonCancel" CssClass="ButtonRight" OnClick="btnPharmaSystemCancelar_Click" />
                                            <asp:Button ID="btnPharmaSystemFechar" runat="server" SkinID="ButtonCancel" CssClass="ButtonRight" OnClick="btnPharmaSystemFechar_Click" />
                                        </div>
                                    </li>
                                </ol>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>


        <%-- BLOCO INFROMA PEDIDO BLOQUEADO --%>
        <%--  <div style="position: absolute;">
            <asp:UpdatePanel ID="upValorLimiteBloqueado" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInfoBloqueadoValorLimite" EventName="Click" />
                </Triggers>
                <ContentTemplate>--%>
        <asp:Panel ID="pnlInfoPedidoBloqueado" runat="server" Visible="false">
            <div class="OpacityBackGround"></div>
            <div class="alert">
                <div class="alert_header">
                    <div class="alert_header_message">
                        <asp:Label ID="Label6" runat="server" ForeColor="White" />
                    </div>
                </div>
                <div class="alert_body">
                    <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                        <div style="width: 80%; height: 100%; display: table-cell; vertical-align: middle;">
                            <asp:Label ID="Label7" runat="server" ForeColor="Black" />
                        </div>
                        <div style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                            <asp:Image ID="Image1" runat="server" Height="50%" Width="60%" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/question.png" />
                        </div>
                    </div>
                </div>
                <div class="alert_bottom">
                    <div class="alert_bottom_button">

                        <div class="alert_bottom_button_right">
                            <asp:Button ID="btnInfoBloqueadoValorLimite" runat="server" SkinID="ButtonRight" OnClick="btnInfoBloqueadoValorLimite_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <%--  </ContentTemplate>
            </asp:UpdatePanel>--%>


        <%--PAINEL DE APROVAÇÃO--%>
        <asp:UpdatePanel ID="uppAprovaLimite" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnAprovaLimiteOk" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnAprovaLimiteNOk" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnAprovarLimite" EventName="Click" />

            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlAprovaLimite" runat="server" Visible="false" SkinID="PnlPopUp">
                    <div class="OpacityBackGround">
                    </div>
                    <div class="painel" style="width: 45%; height: 60%; left: 25%; top: 25%;">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblAprovarReprovar" runat="server" ForeColor="White" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="imbAprovacaoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="imbAprovacaoClose_Click" />
                            </div>
                        </div>
                        <div class="painel_body" style="height: 75%;">
                            <fieldset>
                                <div style="left: 0%; position: relative; width: 99.5%; height: 100%;">
                                    <div style="display: table; width: 100%; height: 10%;">
                                        <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle; text-align: left;">
                                            <br />
                                            <asp:Label ID="lblTextoAprovacao" runat="server" />
                                        </div>
                                    </div>
                                    <div style="display: table; width: 100%; height: 10%;">
                                        <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle; text-align: left;">
                                            <asp:Label ID="lblConfirmarAprovacao" runat="server" />
                                        </div>
                                    </div>
                                    <div style="display: table; width: 100%; height: 60%;">
                                        <asp:TextBox ID="txtMotivo" runat="server" Columns="100" Rows="5" TextMode="MultiLine" MaxLength="250" Height="100%" Width="98%" />
                                    </div>
                                    <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                        <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                            <asp:Button ID="btnAprovaLimiteOk" runat="server" SkinID="ButtonLeft" OnClick="btnAprovaLimiteOk_Click" />
                                            <asp:Button ID="btnAprovaLimiteNOk" runat="server" SkinID="ButtonRight" OnClick="btnAprovaLimiteNOk_Click" />
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

        <%-- PAINEL PERFÍS ADM --%>
        <asp:UpdatePanel ID="uppTipoPedidoAgrup" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlTipoPedidoAgrup" runat="server" Visible="false" SkinID="PnlPopUp">
                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label8" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblTipoPedidos %>" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="imgTipoPedidoAgrupClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="imgTipoPedidoAgrupClose_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset style="height: 85%;">
                                <legend>
                                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, lblTipoPedidosDisponivel %>" />
                                </legend>

                                <div style="width: 100%; height: 98%; display: table;">
                                    <div style="width: 100%; height: 100%; display: table-cell;">
                                        <asp:RadioButtonList ID="rdlTipoPedido" runat="server"
                                            RepeatColumns="1"
                                            RepeatDirection="Vertical" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="painel_bottom">
                            <div class="painel_bottom_button">
                                <asp:Button ID="btnTipoPedidoAgrupOk" runat="server"
                                    Text="<%$ Resources:Resource, lblOk %>"
                                    OnClick="btnTipoPedidoAgrupOk_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

        <%--POPUP DE EPHARMA--%>
        <asp:UpdatePanel ID="updEpharma" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlEpharma" runat="server" Visible="false" SkinID="PnlPopUp">

                    <div class="OpacityBackGround">
                    </div>
                    <%--<div class="painel">--%>
                    <div class="painel" style="width: 40%; height: 55%; left: 30%; top: 20%;">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblEpharma" runat="server" ForeColor="White" />
                            </div>

                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <legend>
                                    <asp:Literal ID="ltrEPharma" runat="server" />
                                </legend>

                                <br />
                                <br />
                                <ol>
                                    <li>
                                        <asp:Label ID="lblEPharmaProjeto" runat="server" SkinID="LabelForm" />
                                        <asp:DropDownList ID="dplEpharmaProjeto" CssClass="DropDownList" runat="server" TabIndex="12" AutoPostBack="true" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblEPharmaCartao" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtEPharmaCartao" runat="server" CssClass="txtNormal" Width="258px" TabIndex="12" />
                                    </li>

                                    <li>
                                        <div style="width: 95%; margin-top: 20px; border: solid 0px; text-align: right; margin-right: 30px;">
                                            <asp:Button ID="btnEPharmaconfirmar" runat="server" SkinID="ButtonOk" CssClass="ButtonLeft" OnClick="btnEPharmaconfirmar_Click" />
                                            <asp:Button ID="btnEPharmaCancelar" runat="server" SkinID="ButtonCancel" CssClass="ButtonRight" OnClick="btnEPharmaCancelar_Click" />
                                            <asp:Button ID="btnEPharmaFechar" runat="server" SkinID="ButtonCancel" CssClass="ButtonRight" OnClick="btnEPharmaFechar_Click" />
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

    <asp:UpdatePanel ID="updModalTransportadora" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlModalTransportadora" runat="server" CssClass="Modal" Visible="false">
                <%-- <div class="bs-example-modal-lg">--%>
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <asp:ImageButton ID="imgFechar" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                ImageUrl="~/Imagens/Fechar.png"
                                OnClick="imgFechar_Click" />
                            <h4 class="modal-title" id="myModalLabel">Informações Transporte</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="pnlInfoTransporte" runat="server">
                            </asp:Panel>

                        </div>
                        <div class="modal-footer">

                            <asp:ImageButton ID="btnNF" runat="server" SkinID="ImgList" Width="45px" Height="45px"
                                ImageUrl="~/Imagens/list_zoom.png" ToolTip="Visualizar NF"
                                OnClick="btnNF_Click" />
                            <asp:Button Text="Fechar" SkinID="BtnDanger" CommandArgument="ModalPesquisaItem" ID="btnCancelarModal" runat="server" OnClick="btnCancelarModal_Click" />

                        </div>
                    </div>
                </div>
                <%--       </div>--%>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updModalNF" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlModalNF" runat="server" CssClass="Modal" Visible="false">
                <div class="bs-example-modal-lg">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <div class="modal-header">
                                <asp:ImageButton ID="btnFecharModalNF" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFecharModalNF_Click" />
                                <h4 class="modal-title" id="TitleEModalBNF">Informações Nota Fiscal Transporte </h4>
                            </div>
                            <div class="modal-body">

                                <asp:Panel ID="pnlPDF" runat="server" Height="250">
                                    <asp:Literal ID="ltEmbed" runat="server" />
                                </asp:Panel>

                            </div>

                            <div class="modal-footer">

                                <asp:Button Text="Fechar" SkinID="BtnDanger" CommandArgument="ModalNF" ID="btnFecharModalNF2" runat="server" OnClick="btnFecharModalNF2_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>


    <asp:UpdatePanel ID="updlLote" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlLote" runat="server" CssClass="Modal" Visible="false">
                <div class="bs-example-modal-lg">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <div class="modal-header">
                                <asp:ImageButton ID="btnFecharGridDetalhado" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFecharGridDetalhado_Click" />
                                <h1>Consulta de Lote</h1>
                            </div>
                            <div class="modal-body">

                                <asp:GridView ID="gvDetalhadoRegistros" Width="100%" AllowPaging="True" runat="server" TabIndex="7" SkinID="gvEstoquePaginadoDetalhado"
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
                                        <asp:BoundField DataField="Lote" ItemStyle-HorizontalAlign="Center" Visible="true" />
                                        <asp:BoundField DataField="Validade" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Estoque" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:###,###,###,##0.##}" />
                                        <asp:BoundField DataField="Reserva" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                        <asp:BoundField DataField="Pedido" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                        <asp:BoundField DataField="Alocada" ItemStyle-HorizontalAlign="Center" Visible="false" DataFormatString="{0:###,###,###,##0.##}" />
                                        <asp:BoundField DataField="Saldo" ItemStyle-HorizontalAlign="Center" Visible="false" DataFormatString="{0:###,###,###,##0.##}" />
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="UpdateHIstoricoCliente" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlHistorioCliente" runat="server" CssClass="Modal" Visible="false">
                <div class="bs-example-modal-lg">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div style="float: right">
                                    <asp:ImageButton ID="imgButtonFecharHistoricoCompra" runat="server" ImageUrl="~/Imagens/Fechar.png" OnClick="imgButtonFecharHistoricoCompra_Click" Width="20" Height="20" ImageAlign="Left" />
                                </div>
                                <h1>Historico de Compra</h1>

                            </div>
                            <div class="modal-body">

                                <asp:Panel ID="Panel2" runat="server" DefaultButton="btnfiltrar" SkinID="PnlMenu">
                                    <table border="0" cellspacing="1" cellpadding="1" style="vertical-align: baseline"
                                        width="100%">
                                        <tr>
                                            <td>
                                                <CtlPeriodo:ControlPeriodo ID="CtlHistoricoPeido" runat="server" TabIndexDataInicio="1" TabIndexDataTermino="2"
                                                    ShowHeaderLine="false" />
                                            </td>
                                            <td valign="bottom">
                                                <asp:Label ID="lblloja" runat="server">Loja  : </asp:Label>
                                                <asp:DropDownList ID="drpEstab" runat="server" AutoPostBack="True" Width="150px"
                                                    OnSelectedIndexChanged="btnfiltrar_Click">
                                                </asp:DropDownList>
                                                <asp:Label ID="lblproduto" runat="server">Produto  : </asp:Label>
                                                <asp:DropDownList ID="drpProd" runat="server" AutoPostBack="True" Width="150px"
                                                    OnSelectedIndexChanged="btnfiltrar_Click">
                                                </asp:DropDownList>
                                                <asp:Label ID="lblTipoBusc" runat="server">Cliente : </asp:Label>

                                            </td>
                                            <td valign="bottom">
                                                <asp:Button ID="btnfiltrar" runat="server" Text="Pequisar"
                                                    OnClick="btnfiltrar_Click" />
                                            </td>

                                            <td valign="bottom">
                                                <asp:Button ID="btxls" runat="server" Text="Excel" OnClick="btxls_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>



                                <asp:GridView ID="gvHistoricoCliente" runat="server" SkinID="GRIDVIEW" AllowPaging="True"
                                    ShowHeaderWhenEmpty="True" CellPadding="1" ForeColor="#333333" GridLines="None"
                                    OnPageIndexChanging="gvHistoricoCliente_PageIndexChanging" AutoGenerateColumns="False"
                                    Width="100%" BorderStyle="Solid" BorderWidth="1px" OnRowCommand="gvHistoricoCliente_RowCommand" OnRowDataBound="gvHistoricoCliente_RowDataBound">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="pedido" HeaderText="Pedido" />
                                        <asp:BoundField DataField="estabelecimento" HeaderText="Loja" ItemStyle-Width="70px">
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="notaFiscal" HeaderText="Nota Fiscal" ItemStyle-Width="70px"
                                            ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dataEmissao" HeaderText="Data Saida" />
                                        <asp:BoundField DataField="itemCodigo" HeaderText="Codigo" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" ItemStyle-Width="230px">
                                            <ItemStyle Width="230px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qtItemNota" HeaderText="Qt. Fatur." ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="precoUnit" HeaderText="Preço" DataFormatString="{0:c}"
                                            ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Justify">
                                            <ItemStyle Width="76px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="valorTotalNf" HeaderText="Total NF" DataFormatString="{0:c}"
                                            ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Justify">
                                            <ItemStyle Width="76px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="condpago" HeaderText="Cond. Pagto" ItemStyle-Width="150px"
                                            ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="natuOper" HeaderText="Natureza" />
                                        <asp:TemplateField HeaderText="Observação" ControlStyle-Width="100px">
                                            <ItemTemplate>
                                                <%#Eval("obsNota").ToString().Length >= 35 ? Eval("obsNota").ToString().Substring(0, 35) + "..." : Eval("obsNota").ToString()%>
                                            </ItemTemplate>
                                            <ControlStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="10px" ItemStyle-Wrap="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="InfoOBS" runat="server" ImageUrl="~/Imagens/info.png" Width="20" Height="20" ImageAlign="Left" />


                                            </ItemTemplate>
                                            <ItemStyle Width="10px" Wrap="False" />
                                        </asp:TemplateField>


                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#13213C" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" Height="2px" BorderStyle="Solid"
                                        BorderWidth="1" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div style="position: absolute;">
        <asp:UpdatePanel ID="updCondicaoPagamentoPayGo" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSalvarCartaoPayGo" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnConferirEnviarCartao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnReenviarLinkCartao" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlCondicaoPagamentoPayGo" runat="server" SkinID="PnlPopUp" Visible="false">
                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 50%; left: 20%; height: 100%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label4" runat="server" ForeColor="White" Text="Condição de pagamento X Cartão" />
                            </div>
                            <div class="alert_header_icon">

                                <asp:ImageButton ID="imgFechaModalCondicao" runat="server"
                                    ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="imgFechaModalCondicao_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <ol>


                                    <li class="text-right">
                                        <asp:ImageButton ID="btnAlterarCondicaoPagamento" runat="server" ImageAlign="AbsMiddle" Width="30px" Height="30px" CssClass="MarginTop" data-toggle="tooltip" data-placement="top" title="Alterar condição de pagamento" ImageUrl="~/Imagens/btnEdit.png" OnClick="btnAlterarCondicaoPagamento_Click" />
                                        <asp:ImageButton ID="btnHistoricoEmail" runat="server" ImageUrl="~/Imagens/email.png" Width="35px" Height="35px" data-toggle="tooltip" data-placement="top" title="Histórico de e-mails enviados " OnClick="btnHistoricoEmail_Click" />
                                        <asp:ImageButton ID="btnClienteCondicaoPagamento" runat="server" ImageUrl="~/Imagens/userProfile.png" Width="42px" Height="42px" data-toggle="tooltip" data-placement="top" title="Informações Cliente " OnClick="btnClienteCondicaoPagamento_Click" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblCondicaoPagamento" runat="server" SkinID="LabelForm" Text="Condição Pagamento:"></asp:Label>
                                        <asp:Label ID="lblCondicaoPagamentoVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>

                                    </li>
                                    <li>
                                        <asp:Label ID="lblValorTotalCartao" runat="server" SkinID="LabelForm" Text="Valor Total:"></asp:Label>
                                        <asp:Label ID="lblValorTotalCartaoVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblQuantidadeParcelas" runat="server" SkinID="LabelForm" Text="Número de parcelas:"></asp:Label>
                                        <asp:Label ID="lblQuantidadeParcelasVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblQuantidadeCartoes" runat="server" SkinID="LabelForm" Text="Quantidade de cartões:"></asp:Label>
                                        <asp:DropDownList ID="dplQuantidadeCartoes" runat="server" Width="60px" SkinID="DropSmallFilter" AutoPostBack="true" OnSelectedIndexChanged="dplQuantidadeCartoes_SelectedIndexChanged">
                                            <asp:ListItem Text="" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                        </asp:DropDownList>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblEmailCliente" runat="server" SkinID="LabelForm" Text="Email envio:"></asp:Label>
                                        <asp:TextBox ID="txtEmailCliente" runat="server" AutoPostBack="true" Enabled="false" OnTextChanged="txtEmailCliente_TextChanged"></asp:TextBox>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDDDCli" runat="server" SkinID="LabelForm" Text="DDD:"></asp:Label>
                                        <asp:TextBox ID="txtDDD" runat="server" MaxLength="2" Enabled="false"></asp:TextBox>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblTelefone" runat="server" SkinID="LabelForm" Text="Telefone:"></asp:Label>
                                        <asp:TextBox ID="txtTelefone" runat="server" MaxLength="12" Enabled="false"></asp:TextBox>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDDDCelular" runat="server" SkinID="LabelForm" Text="DDD Celular:"></asp:Label>
                                        <asp:TextBox ID="txtDDDCelular" runat="server" MaxLength="2" Enabled="false"></asp:TextBox>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblCelular" runat="server" SkinID="LabelForm" Text="Celular:"></asp:Label>
                                        <asp:TextBox ID="txtCelular" runat="server" MaxLength="12" Enabled="false"></asp:TextBox>
                                    </li>
                                    <li>
                                        <fieldset style="min-width: 200px; min-height: 210px">
                                            <%--<fieldset style="margin-bottom: 80px; margin-left: 0px;>--%>
                                            <legend>
                                                <asp:Literal ID="Literal3" runat="server" Text="Cartões" />
                                            </legend>
                                            <asp:GridView ID="gvIntencaoVenda" runat="server" OnRowDataBound="gvIntencaoVenda_RowDataBound" OnPageIndexChanging="gvIntencaoVenda_PageIndexChanging" OnRowCommand="gvIntencaoVenda_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbIconeIntegracao" runat="server" SkinID="ImgGrid" Enabled="false" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="description" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtValorTrans" runat="server" SkinID="Currency100" AutoPostBack="true" OnTextChanged="txtValorTrans_TextChanged"
                                                                Font-Bold="true" MaxLength="18" Text='<%# Eval("amount", "{0:0.00}" ) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="installments" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton SkinID="ImgGrid" ID="imbVisualizar" runat="server" CommandName="visualizarTrans" ImageUrl="~/Imagens/find.png"
                                                                CommandArgument='<%# Eval("pedidoId") + "|" + Eval("transactionId") +   "|" +  ((GridViewRow)Container).RowIndex %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>

                                                <%--<PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />--%>
                                            </asp:GridView>

                                            <asp:UpdatePanel ID="updClickCondicao" runat="server" UpdateMode="Conditional">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnClickCondicao" EventName="Click" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:Button ID="btnClickCondicao" Width="1px" Height="1px" Style="opacity: 0; margin-left: -1200px;" runat="server" Text="" OnClick="btnClickCondicao_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </fieldset>
                                    </li>
                                    <li style="text-align: right;">
                                        <asp:Label ID="lblValorTotalDesc" Font-Size="Small" runat="server" SkinID="LabelForm" Text="Total:"></asp:Label>
                                        <asp:Label ID="lblValorTotal" Font-Size="Small" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                    </li>
                                    <li style="text-align: center;">
                                        <asp:Button ID="btnSalvarCartaoPayGo" runat="server" SkinID="ButtonLeft" ValidationGroup="ValidaCartao" OnClick="btnSalvarCartaoPayGo_Click" Text="Salvar" />
                                        <asp:Button ID="btnConferirEnviarCartao" runat="server" SkinID="ButtonCenter" OnClick="btnConferirEnviarCartao_Click" Text="Conferir e Enviar" />
                                        <asp:Button ID="btnReenviarLinkCartao" runat="server" SkinID="ButtonRight" OnClick="btnReenviarLinkCartao_Click" Text="Reenviar link" />
                                    </li>
                                </ol>
                            </fieldset>
                        </div>
                    </div>


                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div style="position: absolute;">
        <asp:UpdatePanel ID="updClienteContato" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlClienteContato" runat="server" CssClass="Modal" Visible="false">

                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 50%; left: 20%; height: 100%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label10" runat="server" ForeColor="White" Text="Contatos cliente" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFechaModalClienteContato" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFechaModalClienteContato_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <asp:GridView ID="gvClienteContato" Width="100%" AllowPaging="True" runat="server" TabIndex="7" SkinID="gvEstoquePaginadoDetalhado"
                                    OnRowDataBound="gvClienteContato_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="clienteContatoNome" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="clienteContatoTelefone" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="clienteContatoRamal" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="clienteContatoCelular" ItemStyle-HorizontalAlign="Center" />
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </fieldset>
                        </div>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div style="position: absolute;">
        <asp:UpdatePanel ID="updDadosTranacao" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlDadosTransacao" runat="server" CssClass="Modal" Visible="false">

                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 50%; left: 20%; height: 100%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblDadosTransacao" runat="server" ForeColor="White" Text="Dados da Transação" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFecharModalTransacao" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFecharModalTransacao_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <legend>
                                    <asp:Literal ID="ltrDadosTransacao" runat="server" Text="Dados da transação" />
                                </legend>
                                <br></br>
                                <ol>
                                    <li>
                                        <div class="line_itens">
                                            <asp:Label ID="lblDataEnvio" runat="server" SkinID="LabelForm" Text="Data de Envio:"></asp:Label>
                                            <asp:Label ID="lblDataEnvioVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                            <asp:Label ID="lblDataExpiracao" runat="server" SkinID="LabelForm" Text="Data Expiração:"></asp:Label>
                                            <asp:Label ID="lblDataExpiracaoVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="line_itens">
                                            <asp:Label ID="lblStatusTrans" runat="server" SkinID="LabelForm" Text="Status:"></asp:Label>
                                            <asp:Label ID="lblStatusTransVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="line_itens">
                                            <asp:Label ID="lblCartaoTrans" runat="server" SkinID="LabelForm" Text="Cartão:"></asp:Label>
                                            <asp:Label ID="lblCartaoTransVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="line_itens">
                                            <asp:Label ID="lblBandeiraTrans" runat="server" SkinID="LabelForm" Text="Bandeira:"></asp:Label>
                                            <asp:Label ID="lblBandeiraTransVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="line_itens">
                                            <asp:Label ID="lblNomeCartaoTrans" runat="server" SkinID="LabelForm" Text="Nome Cartão:"></asp:Label>
                                            <asp:Label ID="lblNomeCartaoTransVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="line_itens">
                                            <asp:Label ID="lblAutorizacaoTrans" runat="server" SkinID="LabelForm" Text="Autorização:"></asp:Label>
                                            <asp:Label ID="lblAutorizacaoTransVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="line_itens">
                                            <asp:Label ID="lblComprovanteTrans" runat="server" SkinID="LabelForm" Text="Conmprovante Pagto:"></asp:Label>
                                            <asp:Label ID="lblComprovanteTransVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="line_itens">
                                            <asp:Label ID="lblTransactionId" runat="server" SkinID="LabelForm" Text="Id da Transação:"></asp:Label>
                                            <asp:Label ID="txtTransactionId" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="line_itens">
                                            <asp:Label ID="lblMensagemTrans" runat="server" SkinID="LabelForm" Text="Mensagem:"></asp:Label>
                                            <asp:Label ID="lblMensagemTransVal" runat="server" SkinID="LabelResposta" Text=""></asp:Label>
                                        </div>
                                    </li>


                                </ol>
                            </fieldset>
                            <div class="painel_bottom">
                                <div class="painel_bottom_button">
                                    <asp:Button ID="btnVoltarModalTrans" runat="server"
                                        Text="<%$ Resources:Resource, lblVoltar %>"
                                        OnClick="btnVoltarModalTrans_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div style="position: absolute;">
        <asp:UpdatePanel ID="updHistEmail" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlHistEmail" runat="server" CssClass="Modal" Visible="false">

                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 50%; left: 20%; height: 100%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label11" runat="server" ForeColor="White" Text="Histórico de e-mails" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFechaModalHistEmail" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFechaModalHistEmail_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <asp:GridView ID="gvHistoricoEmail" Width="100%" AllowPaging="True" runat="server" TabIndex="7" SkinID="gvEstoquePaginadoDetalhado"
                                    OnRowDataBound="gvHistoricoEmail_RowDataBound"
                                    OnPageIndexChanging="gvHistoricoEmail_PageIndexChanging">
                                    <Columns>
                                        <asp:BoundField DataField="transactionId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="EmailEnvio" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="DataEnvio" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                                        <asp:BoundField DataField="StatusEnvio" ItemStyle-HorizontalAlign="Center" />

                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </fieldset>
                        </div>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <asp:UpdatePanel ID="updPedidoAmil" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlPedidoAmil" runat="server" CssClass="Modal" Visible="false">
                <div class="bs-example-modal-lg">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-header">
                                <asp:ImageButton ID="imgClosePedidoAmil" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="imgClosePedidoAmil_Click" />
                                <h1>Informações Pedido Amil</h1>
                            </div>
                            <div class="modal-body">
                                <ol>
                                    <li>
                                        <div class="form-group">
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblPedidoCompraAmil" runat="server" Text="Pedido de Compra" />
                                            <asp:TextBox ID="txtPedidoCompraAmil" runat="server" Font-Bold="true" SkinID="txtBootstrap2" Width="150px" MaxLength="10" />
                                            <br></br>
                                        </div>
                                    </li>

                                    <li>

                                        <asp:GridView ID="gvItensPedidoAmil" Width="100%" AllowPaging="True" runat="server" TabIndex="7" SkinID="GridViewTable"
                                            DataKeyNames="itemId,estabelecimentoId"
                                            OnRowDataBound="gvItensPedidoAmil_RowDataBound"
                                            OnPageIndexChanging="gvItensPedidoAmil_PageIndexChanging">
                                            <Columns>
                                                <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" HeaderText="Código" />
                                                <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Center" HeaderText="Item" />
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="N° da linha">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtLinhaItem" runat="server" Width="100px"
                                                            SkinID="txtBootstrap2" Font-Bold="true" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </li>
                                </ol>

                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnSalvarPedidoAmil" runat="server" SkinID="BtnSuccess" OnClick="btnSalvarPedidoAmil_Click" Text="Salvar" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>


        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updModalMerck" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlModalMerck" runat="server" CssClass="Modal" Visible="false">
                <div class="bs-example-modal-lg">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-header">
                                <asp:ImageButton ID="imgCloseModalMerck" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="imgCloseModalMerck_Click" />
                                <h1>Informações Integração Merck</h1>
                            </div>
                            <div class="modal-body">
                                <ol>
                                    <li>

                                        <div class="col-md-4">
                                            <asp:Label ID="lblCodigoMerk" runat="server" Text="Código Merck" />
                                            <asp:TextBox ID="txtCodigo" runat="server" Font-Bold="true" SkinID="txtBootstrap2" Width="250px" MaxLength="10" Enabled="false" />
                                            <br></br>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label ID="lblProtocolo" runat="server" Text="Protocolo" />
                                            <asp:TextBox ID="txtProtocolo" runat="server" Font-Bold="true" SkinID="txtBootstrap2" Width="250px" MaxLength="10" Enabled="false" />
                                            <br></br>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label ID="lblDataValidadeMerck" runat="server" Text="Data Validade" />
                                            <asp:TextBox ID="txtDataValidadeMerck" runat="server" Font-Bold="true" SkinID="txtBootstrap2" Width="250px" MaxLength="10" Enabled="false" />
                                            <br></br>
                                        </div>
                                        <br />
                                    </li>

                                    <li>

                                        <asp:GridView ID="gvProdutosMerck" Width="100%" AllowPaging="True" runat="server" TabIndex="7" SkinID="GridViewTable"
                                            OnRowDataBound="gvProdutosMerck_RowDataBound"
                                            OnPageIndexChanging="gvProdutosMerck_PageIndexChanging">
                                            <Columns>
                                                <asp:BoundField DataField="Clinica" ItemStyle-HorizontalAlign="Center" HeaderText="Clínica" />
                                                <asp:BoundField DataField="Produto" ItemStyle-HorizontalAlign="Center" HeaderText="Produto" />
                                                <asp:BoundField DataField="Ean" ItemStyle-HorizontalAlign="Center" HeaderText="Ean" />
                                                <asp:BoundField DataField="Quantidade" ItemStyle-HorizontalAlign="Center" HeaderText="Quantidade" />
                                                  <asp:BoundField DataField="Desconto" ItemStyle-HorizontalAlign="Center" HeaderText="Desconto" />
                                            </Columns>
                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </li>
                                </ol>

                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnFecharModalMerck" runat="server" SkinID="BtnSuccess" OnClick="btnFecharModalMerck_Click" Text="Fechar" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>


        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
