<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadAprovPedidosFiscal.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadAprovPedidosFiscal" %>


<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-3.1.0.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroAprovFiscal" runat="server">
        <asp:UpdatePanel ID="uppCadastroAprovFiscal" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="imbItensExportar" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroAprovFiscal">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <%--BEGIN BLOCK--%>
                <div style="width: 100%; display: table;">
                    <fieldset style="margin-bottom: 100px;">
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroPedidoId" runat="server" />
                                <asp:TextBox ID="txtFiltrospedidoId" runat="server" SkinID="SmallFilter" MaxLength="50" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroCliente" runat="server" />
                                <asp:TextBox ID="txtFiltroCliente" runat="server" MaxLength="30" TabIndex="4" SkinID="SmallFilter" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroClienteIdErp" runat="server" />
                                <asp:TextBox ID="txtFiltroClienteIdErp" runat="server" MaxLength="30" TabIndex="5" SkinID="SmallFilter" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" TabIndex="12" SkinID="DropSmallFilter" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind" TabIndex="20" OnClick="btnFiltrosPesquisa_Click" />
                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" TabIndex="21" OnClick="btnFiltrosLimpar_Click" />
                            </div>
                            <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                                <asp:ImageButton ID="imbItensExportar" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                    ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                    ImageUrl="~/Imagens/xlsx.png" OnClick="imbItensExportar_Click" />

                            </div>
                        </div>
                        <div style="left: 0.5; width: 100%; margin-top: 5px; padding: 0 0 50px 0; overflow-x: none; overflow-y: scroll;">
                            <asp:Panel ID="pnlItens" runat="server">
                                <center />
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
                                <asp:GridView ID="gvRegistros" runat="server" DataKeyNames="pedidoId,representanteNome,clienteId,representanteId,estabelecimentoId,
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
                                observacaoBCare,pedidoIntegraFuncional,reservaid,notaFiscalNumeroTransf,notaFiscalSerieTransf,clienteGrupoComercialNome,clienteContribuinteICMS,DataAgendamentoInteg,PedidoAgendado, clientegrupoativo,transportadoraEmergencial,transportadoraOrcamento,pedidoIntegraMerck,PedidoAmil,pedidoGalderma,RetiraBalcao,statusAnteriorFiscal,Autoriza_Antibiotico,Autoriza_Imunosupressor"
                                    OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                    OnRowCommand="gvRegistros_RowCommand"
                                    OnRowDataBound="gvRegistros_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="20px">
                                            <ItemTemplate>
                                                <a href="JavaScript:shrinkandgrow('div<%# Eval("pedidoId")   %>');">
                                                    <img alt="Itens" id='imgdiv<%# Eval("pedidoId")  %>' src="../../Imagens/plus.png" />
                                                </a>
                                                <div id='div<%# Eval("pedidoId")  %>' style="display: none;">
                                                    <div style="display: table; width: 100%;">
                                                        <br />
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
                                                        <fieldset>
                                                            <ol>
                                                                <li>
                                                                    <div style="width: 100%; display: table;">
                                                                        <asp:Panel ID="pnlLinha1" runat="server" Enabled="false">
                                                                            <div style="width: 500px; display: table-cell;">
                                                                                <asp:Panel ID="pnlHeaderCliente" runat="server">

                                                                                    <div style="width: 500px; display: table;">
                                                                                        <div style="display: table-cell; width: 320px;">

                                                                                            <asp:Label ID="lblHeaderCliente" runat="server" Width="99px" />
                                                                                            <asp:TextBox ID="txtHeaderClienteId" runat="server" SkinID="Pedido" MaxLength="50" TabIndex="7" />

                                                                                        </div>
                                                                                        <div style="display: table-cell; width: 180px;">
                                                                                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 180px;">
                                                                                                <asp:Label ID="lblHeaderClienteNome" runat="server" SkinID="LabelResposta" />
                                                                                            </div>
                                                                                            <asp:TextBox ID="txtClienteIdNone" runat="server" Visible="false" />
                                                                                        </div>

                                                                                    </div>
                                                                                </asp:Panel>

                                                                            </div>

                                                                            <div style="width: 530px; display: table-cell; vertical-align: middle;">
                                                                                <asp:Label ID="lblHeaderClienteTipoEndereco" runat="server" SkinID="LabelForm" />
                                                                                <asp:DropDownList ID="ddlHeaderClienteTipoEndereco" runat="server" SkinID="DropFiltro" TabIndex="12" AutoPostBack="true" />

                                                                                <asp:Label ID="lblHeaderCreditoLimite" runat="server" Width="80px" Visible="false" />
                                                                                <asp:Label ID="lblHeaderCreditoLimiteValor" Visible="false" runat="server" ForeColor="Blue"  />
                                                                                <asp:Label ID="lblCidadeSelecionada" runat="server"> </asp:Label>

                                                                            </div>

                                                                            <div style="width: 250px; display: table-cell;">

                                                                                <asp:CheckBox ID="chkHeaderReserva" runat="server" Font-Bold="true" AutoPostBack="true"
                                                                                    TabIndex="24" />
                                                                                <asp:DropDownList ID="dllTipoReserva" Visible="false" runat="server"
                                                                                    SkinID="DropFiltro" TabIndex="10">
                                                                                    <asp:ListItem Value="">Selecionar</asp:ListItem>
                                                                                </asp:DropDownList>


                                                                            </div>
                                                                        </asp:Panel>
                                                                    </div>

                                                                </li>
                                                                <li>
                                                                    <div style="width: 100%; display: table;">
                                                                        <asp:Panel ID="pnlLinha2" runat="server" Enabled="false">
                                                                            <div style="width: 500px; display: table-cell;">
                                                                                <asp:Label ID="lblHeaderEstabelecimento" runat="server" Width="99px" />
                                                                                <asp:DropDownList ID="ddlHeaderEstabelecimento" runat="server"
                                                                                    SkinID="DropFiltro" TabIndex="10" />

                                                                            </div>

                                                                            <div style="width: 530px; display: table-cell;">
                                                                                <asp:Label ID="lblHeaderCondicaoPagamento" runat="server" SkinID="LabelForm" />
                                                                                <asp:DropDownList ID="ddlHeaderCondicaoPagamento" runat="server" SkinID="DropFiltro" Visible="false" TabIndex="13" />
                                                                                <asp:TextBox ID="txtCondicaoPagamento" runat="server" Enabled="false" Font-Bold="true" SkinID="Filtro" />
                                                                                <asp:ImageButton ID="imbCondicaoPagamento" runat="server"
                                                                                    ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                                                    ToolTip="<%$ Resources:Resource, lblPesquisar %>" ImageUrl="~/Imagens/find.png" />
                                                                                <asp:Label ID="lblHeaderCreditoValorEmAberto" runat="server" Width="80px" />
                                                                                <asp:Label ID="lblHeaderCreditoValorEmAbertoValor" runat="server" ForeColor="Blue" />
                                                                            </div>

                                                                            <div style="width: 250px; display: table-cell;">
                                                                                <asp:Panel ID="pnlVendaDireta" runat="server">
                                                                                    <div style="display: table; width: 100%;">
                                                                                        <div style="display: table-cell; width: 50%;">
                                                                                            <asp:CheckBox ID="cbVendaDireta" runat="server" Font-Bold="true" />
                                                                                        </div>

                                                                                    </div>
                                                                                </asp:Panel>

                                                                            </div>


                                                                        </asp:Panel>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div style="width: 100%; display: table;">
                                                                        <asp:Panel ID="pnlLinha3" runat="server" Enabled="false">
                                                                            <div style="width: 500px; display: table-cell;">
                                                                                <asp:Label ID="lblHeaderTipoPedido" runat="server" Width="100px" />
                                                                                <asp:DropDownList ID="ddlHeaderTipoPedido" runat="server" SkinID="DropFiltro" />
                                                                                <asp:CheckBox ID="chkVendaComum" runat="server" Font-Bold="true" TextAlign="Right" />
                                                                            </div>
                                                                            <div style="width: 530px; display: table-cell;">
                                                                                <asp:Label ID="lblHeaderUnidadeNegocio" runat="server" SkinID="LabelForm" />
                                                                                <asp:DropDownList ID="ddlHeaderUnidadeNegocio" runat="server"
                                                                                    SkinID="DropFiltro" />

                                                                                <asp:Label ID="lblHeaderCreditoDisponivel" runat="server" Width="80px" />
                                                                                <asp:Label ID="lblHeaderCreditoDisponivelValor" runat="server" />
                                                                            </div>
                                                                            <div style="width: 140px; display: table-cell;">
                                                                                <asp:Panel ID="pnlRetiraBalcao" runat="server">
                                                                                    <div style="display: table; width: 100%;">
                                                                                        <div style="display: table-cell; width: 50%;">
                                                                                            <asp:CheckBox ID="cbRetiraBalcao" runat="server" Font-Bold="true" Text="Retira Balcão" />
                                                                                        </div>

                                                                                    </div>
                                                                                </asp:Panel>
                                                                            </div>

                                                                        </asp:Panel>
                                                                    </div>
                                                                </li>
                                                            </ol>
                                                        </fieldset>
                                                        <asp:Panel ID="pnlPedidoTriangular" runat="server" Visible="true" Enabled="false">
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
                                                                                        <%--<asp:ImageButton ID="imbHeaderClienteTriangularCeck" runat="server" Width="25px"
                                                                Height="25px" ImageAlign="AbsMiddle" TabIndex="15" ImageUrl="~/Imagens/check.png"
                                                                OnClick="imbHeaderClienteTriangularCeck_Click" />
                                                            <asp:ImageButton ID="imbHeaderClienteTriangularBusca" runat="server" Width="25px"
                                                                Height="25px" ImageAlign="AbsMiddle" TabIndex="16" ImageUrl="~/Imagens/find.png"
                                                                OnClick="imbHeaderClienteTriangularBusca_Click" />
                                                            <asp:TextBox ID="txtClienteIdTriangularNone" runat="server" />--%>
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
                                                                                    SkinID="DropFiltro" AutoPostBack="true" TabIndex="17" Enabled="false" />
                                                                                <asp:ImageButton ID="imbClienteTriangularTipoEndereco" runat="server"
                                                                                    ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                                                    ToolTip="<%$ Resources:Resource, lblPesquisar %>" ImageUrl="~/Imagens/find.png" />
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
                                                        <asp:Panel ID="pnlHeaderRepresentante" runat="server" Enabled="false">
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
                                                                                        Visible="false" ImageAlign="AbsMiddle" TabIndex="19" ImageUrl="~/Imagens/check.png" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imbHeaderRepresentanteBusca" runat="server" Width="25px" Height="25px"
                                                                                        Visible="false" ImageAlign="AbsMiddle" TabIndex="20" ImageUrl="~/Imagens/find.png" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lblHeaderRepresentanteNome" runat="server" SkinID="LabelResposta" />
                                                                                </td>
                                                                                <td style="display: none">
                                                                                    <asp:Label ID="lblTransportadora" runat="server" />
                                                                                </td>
                                                                                <td style="display: none">
                                                                                    <asp:DropDownList ID="ddlTransportadora" runat="server" SkinID="DropFiltro" />
                                                                                </td>
                                                                                <td style="display: none">
                                                                                    <asp:Label ID="lblRedespacho" runat="server" />
                                                                                </td>
                                                                                <td style="display: none">
                                                                                    <asp:DropDownList ID="dplRedespacho" Enabled="false" runat="server" SkinID="DropFiltro" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="chkEmergencial" runat="server" Visible="true" Font-Bold="true" Text="<%$ Resources:Resource, lblEmergencial %>" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="chkTransportadoraOrcamento" runat="server" Visible="true" Font-Bold="true" Text="<%$ Resources:Resource, lblTransportadoraOrcamento %>" />

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
                                                                <asp:Panel ID="pnlMedicoPrescritor" runat="server" DefaultButton="imbMedicoCheck" Height="100%" Enabled="false">
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
                                                                                    ImageAlign="AbsMiddle" TabIndex="22" ImageUrl="~/Imagens/check.png" />
                                                                                <asp:ImageButton ID="imbMedicoBusca" runat="server" Width="25px" Height="25px" ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                                                    ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/find.png" />
                                                                                <asp:LinkButton ID="SevenPDVTeste" Text="Open 7PDV" Style="color: #000" runat="server" Visible="false" />
                                                                                <asp:ImageButton ID="imbAdicionarMedico" runat="server" Width="20px" Height="20px" Visible="false"
                                                                                    ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/adicionar.png" />

                                                                                <asp:Label ID="lblMedicoPrescritorNome" runat="server" SkinID="LabelResposta" />





                                                                            </li>

                                                                        </ol>
                                                                    </filedset>
                                                                </asp:Panel>
                                                            </div>
                                                            <%-- ANEXO RECEITA--%>
                                                            <div style="width: 50%; display: table-cell; height: 100%;">
                                                                <asp:Panel ID="pnlReceitaAnexo" runat="server" Enabled="false">
                                                                    <fieldset>
                                                                        <ol>
                                                                            <li>
                                                                                <asp:Label ID="lblAnexaReceita" runat="server" SkinID="LabelForm" />
                                                                                <asp:ImageButton ID="imbAnexoReceita" runat="server" Width="25px" Height="25px"
                                                                                    ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/anexo.png" />

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
                                                                                        <asp:DropDownList ID="ddlOrigem" runat="server" Width="400px" />
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
                                                                                            ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/adicionar.png" />

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
                                                            <asp:Panel ID="pnlItem" runat="server" DefaultButton="imbHeaderItemCheck" Enabled="false">
                                                                <fieldset>
                                                                    <ol style="width: 100%;">
                                                                        <li style="width: 97%;">

                                                                            <div style="display: table; width: 100%; height: 30px;">
                                                                                <div style="display: table-cell; vertical-align: middle; width: 300px; height: 100%;">

                                                                                    <asp:Label ID="lblHeaderItemId" runat="server" Width="100px" />
                                                                                    <asp:TextBox ID="txtHeaderItemId" runat="server" SkinID="Pedido" MaxLength="50" TabIndex="21" AutoPostBack="true" />


                                                                                    <asp:ImageButton ID="imbHeaderItemCheck" runat="server" Width="25px" Height="25px" ValidationGroup="ValidaBuscaItem"
                                                                                        ImageAlign="AbsMiddle" TabIndex="22" ImageUrl="~/Imagens/check.png" Visible="false" />

                                                                                    <asp:ImageButton ID="imbHeaderItemFind" runat="server" Width="25px" Height="25px" ValidationGroup="ValidaBuscaItem"
                                                                                        ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/find.png" />

                                                                                    <asp:ImageButton ID="btnEstoque" runat="server" Width="25px"
                                                                                        Height="25px" ImageAlign="AbsMiddle" TabIndex="15" ImageUrl="~/Imagens/estoque.png"
                                                                                        ToolTip="<%$ Resources:Resource, lblEstoque %>" />
                                                                                </div>
                                                                                <div style="display: table-cell; vertical-align: middle; width: auto; height: 100%;">
                                                                                    <div class="line" style="width: auto; text-align: left;">

                                                                                        <div class="line_itens">
                                                                                            <asp:CheckBox ID="chkPedidoAgendado" runat="server" Font-Bold="true" TextAlign="Right" />
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
                                                                        <asp:CheckBox ID="chkBionexo" runat="server" Font-Bold="true" TextAlign="Right" Enabled="false" />
                                                                    </div>
                                                                    <div style="display: table-cell; width: 8%; height: 30px; vertical-align: middle; text-align: right;">
                                                                        <asp:CheckBox ID="chkPedidoAmil" runat="server" Font-Bold="true" TextAlign="Right" AutoPostBack="true" Enabled="false" />

                                                                        <asp:ImageButton ID="btnpedidoAmil" runat="server" Width="20px" Enabled="false"
                                                                            Height="20px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/edit_find.png"
                                                                            ToolTip="<%$ Resources:Resource, lblHistoricoAmil %>" Visible="false" />
                                                                    </div>
                                                                    <div style="display: table-cell; width: 8%; height: 30px; vertical-align: middle; text-align: right;">
                                                                        <asp:ImageButton ID="btnAutorizacaoMerk" runat="server" Width="20px"
                                                                            Height="20px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/findMerck.png"
                                                                            ToolTip="<%$ Resources:Resource, lblAutorizacaoMerck %>" Visible="false" />
                                                                    </div>
                                                                    <div style="display: table-cell; width: 20%; height: 30px; vertical-align: middle; text-align: right;">
                                                                        <asp:Label ID="lbl7PDVCupomDesconto" runat="server" />
                                                                    </div>
                                                                    <div style="display: table-cell; width: 13%; height: 30px; vertical-align: middle; text-align: center;">
                                                                        <asp:TextBox ID="txt7PDVCupomDesconto" runat="server" MaxLength="19" Width="130px" AutoPostBack="true" Enabled="false" />
                                                                    </div>
                                                                    <%--<div style="display: table-cell; width: 70%; height: 30px; vertical-align: middle; text-align: right;">--%>
                                                                    <div style="display: table-cell; width: 10%; height: 30px; vertical-align: middle; text-align: right;">
                                                                        <asp:CheckBox ID="chkPossuiReembolso" runat="server"
                                                                            Font-Bold="true"
                                                                            AutoPostBack="true"
                                                                            Text="<%$ Resources:Resource, lblPossuiReembolso %>" Enabled="false" />
                                                                    </div>
                                                                    <div style="display: table-cell; width: 11%; height: 30px; vertical-align: middle; text-align: right;">
                                                                        <asp:Label ID="lblQtdRegistrosGrid" runat="server"  />
                                                                    </div>
                                                                    <div style="display: table-cell; width: 3%; height: 30px; vertical-align: middle; text-align: center;">
                                                                        <asp:Label ID="lblQtdRegistrosGridDesc" runat="server" SkinID="LabelResposta" />
                                                                    </div>


                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                    <%-- BODY --%>
                                                    <asp:Panel ID="pnlGvItens" runat="server" Enabled="false" >
                                                        <div style="display: table; width: 99.6%; height: 40%;">
                                                            <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                                                                <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                                                    <center />

                                                                    <asp:GridView ID="gvItens" runat="server" TabIndex="51"
                                                                        DataKeyNames="itemId,itemDescricao,unidadeMedidaSigla,familiaComercialDescricao,familiaMaterialDescricao,itemControladoValidado,informado,gravado,
                                                                        grupoEstoqueDescricao,fabricanteNome,pedidoId,pedidoItemSeq,itemControlado,tabelaPrecoVlrTabela,tabelaPrecoVlrMinimo,tabelaPrecoVlrMaximo,saldo,IsentoFrete,
                                                                         familiaMaterialId,fabricanteId,unidadeNegocioId,estabelecimentoId,clienteIdERP,itemInfComplementar,valDescontoEmissao,itemTipoPedido"
                                                                        OnPageIndexChanging="gvItens_PageIndexChanging"
                                                                        OnRowDataBound="gvItens_RowDataBound">
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
                                                                                    <asp:TextBox ID="txtQuantidade" runat="server" SkinID="Currency50" Font-Bold="true" MaxLength="9" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="90px">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtValor" runat="server" SkinID="Currency100" Font-Bold="true" MaxLength="18" AutoPostBack="true" />

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
                                                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px" Visible="false">
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

                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </asp:Panel>
                                                    <%-- FOOTER --%>
                                                    <div style="display: table; width: 100%; height: 20%;">
                                                        <div style="width: 100%; display: table;">
                                                            <fieldset>
                                                                <div style="display: table-cell; text-align: center; margin-top: 5px; margin-bottom: 5px;">
                                                                    <asp:Panel ID="pnlObsEmpenho" runat="server" Enabled="false">
                                                                        <asp:ImageButton ID="imbAlertaObsEmpenho" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                            ImageUrl="~/Imagens/_exclamationMark.gif"
                                                                            Visible="false" />
                                                                    </asp:Panel>
                                                                </div>

                                                                <div style="width: 100%; display: table-cell; margin-top: 5px; margin-bottom: 5px;">
                                                                    <asp:Panel ID="pnlTotais" runat="server" Enabled="false">
                                                                        <%--<ol style="text-align: right;">
                                                <li>--%>
                                                                        <div style="width: 100%; vertical-align: middle; text-align: right;">
                                                                            <asp:Panel ID="pnlTotalPedido" runat="server" Enabled="false">
                                                                                <asp:HiddenField ID="hdfQtdTotalItens" runat="server" Value="0,00" />
                                                                                <asp:HiddenField ID="hdfVlrTotalItensBruto" runat="server" Value="0,00" />
                                                                                <asp:HiddenField ID="hdfVlrTotalItens" runat="server" Value="0,00" />
                                                                                <asp:HiddenField ID="hdfValorTotalPedido" runat="server" Value="0,00" />
                                                                                <asp:CheckBox ID="cbInformaFrete" runat="server" Font-Bold="true" Text="<%$ Resources:Resource, lblInformaFrete %>" />
                                                                                <asp:Label ID="lblFrete" runat="server" Visible="false" />
                                                                                <asp:TextBox ID="txtFrete" runat="server" SkinID="Currency80" MaxLength="14" Font-Bold="true" Enabled="false" />
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
                                                        <asp:Panel ID="pnlObservacao" runat="server" Enabled="false">
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
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrCliente" runat="server" Text='<%#  Eval("ClienteRazaoSocial")  %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="pedidoData" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
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
                                                <asp:Literal ID="ltrPedidoSituacao" runat="server" Text='<%# Eval("pedidoSituacao") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrUsuarioNome" runat="server" Text='<%# Eval("DescricaoPedido") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="pedidoValorTotal" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" DataFormatString="{0:###,###,###,##0.00}" />
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
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbAprovar" runat="server" CommandName="Aprovar" SkinID="ImgGrid"
                                                    ImageUrl="~/Imagens/aprovar.png"
                                                    ToolTip="<%$ Resources:Resource, lblAprovarItem %>"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                          Eval("pedidoId")  + "|" +  Eval("estabelecimentoId") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbReprovar" runat="server" CommandName="Reprovar" SkinID="ImgGrid"
                                                    ImageUrl="~/Imagens/Reprovar.jpg"
                                                    ToolTip="<%$ Resources:Resource, lblReprovarItem %>"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                          Eval("pedidoId")   + "|" +  Eval("estabelecimentoId")  %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbView" Visible="false" runat="server" CommandName="View"
                                                    SkinID="ImgGrid"
                                                    ImageUrl="~/Imagens/find.png"
                                                    ToolTip="<%$ Resources:Resource, ToolTipVisualizarLog %>"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                          Eval("pedidoId")   %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </fieldset>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
      <%-- MOTIVO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppMotivos" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <%--<asp:AsyncPostBackTrigger ControlID="btnReprovar" EventName="Click" />--%>
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
</asp:Content>
