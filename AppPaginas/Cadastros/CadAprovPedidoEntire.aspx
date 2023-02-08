<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadAprovPedidoEntire.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadAprovPedidoEntire" %>

<%@ Register Src="~/AppControles/CtlDataB.ascx" TagPrefix="uc1" TagName="CtlDataB" %>
<%@ Register Src="~/AppControles/CtlPeriodoB.ascx" TagPrefix="uc1" TagName="CtlPeriodoB" %>
<%@ Register Src="~/AppControles/CtlCliente.ascx" TagPrefix="uc1" TagName="CtlCliente" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<%@ Register Src="~/AppControles/Mensagem.ascx" TagPrefix="MsgBox" TagName="Mensagem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <%--   <script src="../../Scripts/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="../../Styles/Style.css" rel="stylesheet" />
    <script src="../../Scripts/tooltip.js" type="text/javascript"></script>
    <script src="../../Scripts/popover.js" type="text/javascript"></script>--%>

    <script type="text/javascript">
        $(document).ready(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm != null) {
                prm.add_endRequest(function () {
                    Init();

                });
            }
            Init();
        });

        function Init() {
            $('.ui-tooltip').remove();
            $('[data-toggle="tooltip"]').tooltip();
        }
    </script>
    <asp:Panel ID="pnlCadastroPedido" runat="server">

        <asp:UpdatePanel ID="uppPedido" runat="server">
            <Triggers>
                <%-- CLIENTE TRIANGULAR --%>
                <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteTriangularCeck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteTriangularBusca" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbClienteTriangularTipoEndereco" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="ddlHeaderClienteTriangularTipoEndereco" EventName="SelectedIndexChanged" />

            </Triggers>
            <ContentTemplate>

                <MsgBox:Mensagem runat="server" ID="MensagemBox" />
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppPedido">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    </br>
                     </br>
                    <fieldset>
                        <div class="center">
                            <asp:Button ID="btnAprovarPedido" runat="server" SkinID="BtnSuccess-sm" Text="Aprovar" OnClick="btnAprovarPedido_Click" />
                            <asp:Button ID="btnReprovarPedido" runat="server" SkinID="BtnDanger-sm" Text="Reprovar" OnClick="btnReprovarPedido_Click" />
                            <asp:Button ID="btnCancelarPedido" runat="server" SkinID="BtnWarning-sm" Text="Cancelar" OnClick="btnCancelarPedido_Click" />
                            <asp:Button ID="btnVoltar" runat="server" SkinID="BtnDefault-sm" OnClick="btnVoltar_Click" />
                        </div>
                    </fieldset>

                    <fieldset style="margin-top: 5px; height: 100%; z-index: 1;">
                        <div style="width: 100%; display: table;">
                            <div style="width: 10%; display: table-cell; text-align: right; vertical-align: middle;">
                                <asp:Label ID="lblPrePedidoId" runat="server" Text="Pré pedido" />
                            </div>
                            <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle; margin-left: 5px;">
                                <asp:TextBox ID="txtPrePedidoId" runat="server" Enabled="false" SkinID="Filtro" />
                            </div>
                            <div style="width: 15%; display: table-cell; text-align: right; vertical-align: middle;">
                                <asp:Label ID="lblPedidoNumeroIntegracao" runat="server" Text="Pedido Laboratório" />
                            </div>
                            <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle; margin-left: 5px;">
                                <asp:TextBox ID="txtPedidoNumeroIntegracao" runat="server" Enabled="false" SkinID="Filtro" />
                            </div>
                            <div style="width: 15%; display: table-cell; text-align: right; vertical-align: middle;">
                                <asp:Label ID="lblPedidoNumeroCliente" runat="server" Text="Pedido Número Cliente" />
                            </div>
                            <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle; margin-left: 5px;">
                                <asp:TextBox ID="txtPedidoNumeroCliente" runat="server" Enabled="false" SkinID="Filtro" />
                            </div>
                            <div style="width: 10%; display: table-cell; text-align: right; vertical-align: middle;">
                                <asp:Label ID="lblPedidoKraft" runat="server" Text="Código Pedido Kraft" />
                            </div>
                            <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle; margin-left: 5px;">
                                <asp:TextBox ID="txtPedidoKraft" runat="server" Enabled="false" SkinID="Filtro" />
                            </div>
                        </div>


                    </fieldset>
                    <fieldset style="margin-top: 5px; height: 100%; z-index: 1;">
                        <div style="width: 100%; height: 100%; display: table;">
                            <div style="width: 40%; display: table-cell;">
                                <ol>
                                    <li>
                                        <asp:Label ID="lblCnpjClientePrincipal" runat="server" SkinID="LabelForm" Text="" />
                                        <asp:TextBox ID="txtCnpjClientePrincipal" runat="server" Enabled="false" />

                                        <asp:Label ID="lblRazaoSocial" runat="server" SkinID="LabelForm" Text="" />
                                        <asp:TextBox ID="txtRazaoSocial" runat="server" Enabled="false" />
                                        <asp:HiddenField ID="hdHeaderClienteIdERP" runat="server" />
                                        <asp:HiddenField ID="hdHeaderClienteIdCGC" runat="server" />
                                        <asp:HiddenField ID="hdHeaderAgrupadorId" runat="server" />
                                        <asp:HiddenField ID="hdHeaderClienteVendaES" runat="server" />
                                        <asp:HiddenField ID="hdHeaderAutoriEspecial" runat="server" />
                                        <asp:HiddenField ID="hdClienteEmail" runat="server" />
                                        <asp:HiddenField ID="hdHeaderclienteRemConsig" runat="server" />
                                        <asp:HiddenField ID="hdHeaderBloqAudicon" runat="server" />
                                        <asp:HiddenField ID="hdHeaderAutorizaVacinas" runat="server" />
                                        <asp:HiddenField ID="hdHeaderAutorizaRetinoide" runat="server" />
                                        <asp:HiddenField ID="hdHeaderBloqMisoprostol" runat="server" />
                                        <asp:HiddenField ID="hdHeaderBloqFinanceiro" runat="server" />
                                        <asp:HiddenField ID="hdHeaderAutorizaPsico" runat="server" />
                                        <asp:HiddenField ID="hdHeaderAutorizaMedic" runat="server" />
                                        <asp:HiddenField ID="hdHeaderAutoriza_Imunosupressor" runat="server" />
                                        <asp:HiddenField ID="hdHeaderAutoriza_Antibiotico" runat="server" />

                                    </li>
                                    <li>
                                        <asp:Label ID="lblCnpjclienteEntrega" runat="server" SkinID="LabelForm" Text="" />
                                        <asp:TextBox ID="txtCnpjclienteEntrega" runat="server" Enabled="false" />
                                        <asp:Label ID="lblRazaoSocialEntrega" runat="server" SkinID="LabelForm" Text="" />
                                        <asp:TextBox ID="txtclienteRazaoSocialEntrega" runat="server" Enabled="false" />

                                    </li>
                                    <li>
                                        <asp:Label ID="lblNomeArquivo" runat="server" SkinID="LabelForm" Text="Nome Arquivo" />
                                        <asp:TextBox ID="txtNomeArquivo" runat="server" Enabled="false" />
                                        <asp:Label ID="lblSistemaEntrada" runat="server" SkinID="LabelForm" Text="Sistema Entrada" />
                                        <asp:TextBox ID="txtSistemaEntrada" runat="server" Enabled="false" />
                                        <asp:Label ID="lblVerLayout" runat="server" SkinID="LabelForm" Text="Ver Layout" Visible="false" />
                                        <asp:TextBox ID="txtVerLayout" runat="server" Enabled="false" Visible="false" />
                                        <asp:Label ID="lblControleProjeto" runat="server" SkinID="LabelForm" Text="Controle Projeto" Visible="false" />
                                        <asp:TextBox ID="txtControleProjeto" runat="server" Enabled="false" Visible="false" />
                                        <asp:Label ID="lblTipoVenda" runat="server" SkinID="LabelForm" Text="Tipo Venda" Visible="false" />
                                        <asp:TextBox ID="txtTipoVenda" runat="server" Enabled="false" Visible="false" />
                                    </li>

                                </ol>
                            </div>
                        </div>
                    </fieldset>

                    <asp:Panel ID="pnlDadosEndereco" runat="server">
                        <fieldset style="margin-top: 5px; height: 100%; z-index: 1;">
                            <div style="width: 100%; height: 100%; display: table;">
                                <div style="width: 40%; display: table-cell;">
                                    <ol>
                                        <li>
                                            <asp:HiddenField ID="hdClienteEnderecoIndiceGrid" runat="server" />
                                            <asp:HiddenField ID="hdClienteEnderecoClienteId" runat="server" />
                                            <asp:HiddenField ID="hdClienteEnderecoSeq" runat="server" />
                                            <asp:HiddenField ID="hdClienteEnderecoClienteIdErp" runat="server" />
                                            <asp:Label ID="lblDadosClienteTipoEndereco" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddDadosClienteTipoEndereco" runat="server" TabIndex="1" Visible="false" />
                                            <asp:TextBox ID="txtDadosClienteTipoEndereco" runat="server" MaxLength="12" TabIndex="60" Enabled="false" />
                                        </li>
                                        <li>
                                            <asp:Panel ID="pnlCep" runat="server">
                                                <asp:Label ID="lblDadosClienteWfEnderecoCep" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtDadosClienteWfEnderecoCep" runat="server" MaxLength="9" TabIndex="61" SkinID="Data" Enabled="false" />
                                            </asp:Panel>
                                        </li>
                                        <li>
                                            <asp:Label ID="lblDadosClienteWfEndereco" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtDadosClienteWfEndereco" runat="server" TabIndex="63" MaxLength="62" Enabled="false" />
                                        </li>
                                        <li>
                                            <asp:Label ID="lblDadosClienteWfEnderecoNumero" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtDadosClienteWfEnderecoNumero" runat="server" MaxLength="30" SkinID="Pedido" Enabled="false"
                                                TabIndex="63" />
                                        </li>
                                        <li>
                                            <asp:Label ID="lblDadosClienteWfEnderecoComplemento" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtDadosClienteWfEnderecoComplemento" runat="server" MaxLength="100" Enabled="false" TabIndex="64" />
                                        </li>
                                    </ol>
                                </div>
                                <div style="width: 60%; display: table-cell;">
                                    <asp:Panel ID="pnlTeste" runat="server">
                                        <ol>
                                            <li>
                                                <asp:Label ID="lblDadosClienteWfEnderecoPais" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddlDadosClienteWfEnderecoPais" runat="server" TabIndex="65" Enabled="false"
                                                    AutoPostBack="True" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblDadosClienteWfEnderecoUf" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddDadosClienteWfEnderecoUf" runat="server" TabIndex="66" Enabled="false" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblDadosClienteWfEnderecoCidade" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtDadosClienteWfEnderecoCidade" runat="server" MaxLength="100" Enabled="false" TabIndex="67" />

                                            </li>
                                            <li>
                                                <asp:Label ID="lblDadosClienteWfEnderecoBairro" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtDadosClienteWfEnderecoBairro" runat="server" MaxLength="100" TabIndex="68" Enabled="false" />
                                            </li>

                                        </ol>
                                    </asp:Panel>
                                </div>
                        </fieldset>

                    </asp:Panel>
                    </br>

                    <asp:Panel ID="pnlFaturarPara" runat="server">
                        <fieldset>
                            <uc1:CtlCliente ID="ctlClienteFaturarPara" runat="server" 
                                ClienteLabel="Faturar para:" 
                                EnderecoLabel="Tipo Endereço Faturar Para"
                                Titulo="Selecione Cliente Faturar Para"
                                EnderecoVisible="true"
                                EnderecoEnabled="false" TipoPessoa="F" />
                        </fieldset>
                    </asp:Panel>

                    <fieldset>
                        <asp:Panel ID="pnlInfoEstabelecimento" runat="server">
                            <ol>
                                <li></li>
                                <li>
                                    <div style="width: 100%; display: table;">
                                        <asp:Panel ID="pnlLinha2" runat="server">
                                            <div style="width: 500px; display: table-cell;">
                                                <asp:Label ID="lblHeaderEstabelecimento" runat="server" Width="100px" />
                                                <asp:DropDownList ID="ddlHeaderEstabelecimento" runat="server" OnSelectedIndexChanged="ddlHeaderEstabelecimento_SelectedIndexChanged"
                                                    SkinID="DropFiltro" TabIndex="10" AutoPostBack="true" />
                                                <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator5" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderEstabelecimento" ErrorMessage="<%$ Resources:Resource, msgEstabelecimentoId %>" />
                                            </div>

                                            <div style="width: 530px; display: table-cell;">
                                                <asp:Label ID="lblHeaderCondicaoPagamento" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddlHeaderCondicaoPagamento" runat="server" SkinID="DropFiltro" Visible="false" TabIndex="13" />
                                                <asp:TextBox ID="txtCondicaoPagamento" runat="server" Enabled="false" Font-Bold="true" SkinID="Filtro" />
                                                <asp:ImageButton ID="imbCondicaoPagamento" runat="server"
                                                    ImageAlign="AbsMiddle" Width="25px" Height="25px" OnClick="imbCondicaoPagamento_Click"
                                                    ToolTip="<%$ Resources:Resource, lblPesquisar %>" ImageUrl="~/Imagens/find.png" />
                                                <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="txtCondicaoPagamento" ErrorMessage="<%$ Resources:Resource, msgCondicaoPagamentoId %>" />
                                            </div>

                                            <div style="width: 530px; display: table-cell;">
                                                <asp:Label ID="lblTipoPagamento" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="dplTipoPagamento" runat="server" SkinID="DropFiltro" Enabled="false" />
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </li>
                                <li>
                                    <div style="width: 100%; display: table;">
                                        <asp:Panel ID="pnlLinha3" runat="server">
                                            <div style="width: 500px; display: table-cell;">
                                                <asp:Label ID="lblHeaderTipoPedido" runat="server" Width="100px" />
                                                <asp:DropDownList ID="ddlHeaderTipoPedido" runat="server" SkinID="DropFiltro" AutoPostBack="true" OnSelectedIndexChanged="ddlHeaderTipoPedido_SelectedIndexChanged" />
                                                <asp:Image ID="imgInfoCfop" runat="server" Width="25px" Height="25px" Visible="false"
                                                    ImageAlign="AbsMiddle"
                                                    ToolTip="<%$ Resources:Resource, msgPedidoCfopDisponibilidade %>"
                                                    ImageUrl="~/Imagens/receita.png" />
                                                <span id="spToolTip" style="DISPLAY: none; Z-INDEX: 100; POSITION: absolute; HEIGHT: 10px; z-order: 100;"></span>
                                                <asp:CheckBox ID="chkVendaComum" runat="server" Font-Bold="true" TextAlign="Right" AutoPostBack="true" Visible="false" />
                                                <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderTipoPedido" ErrorMessage="<%$ Resources:Resource, msgPedidoTipoId %>" />
                                            </div>
                                            <div style="width: 530px; display: table-cell;">
                                                <asp:Label ID="lblHeaderUnidadeNegocio" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddlHeaderUnidadeNegocio" runat="server" AutoPostBack="true" OnTextChanged="ddlHeaderUnidadeNegocio_TextChanged"
                                                    SkinID="DropFiltro" />
                                                <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderUnidadeNegocio" ErrorMessage="<%$ Resources:Resource, msgInformeUnidadeNegocio %>" />
                                                <asp:Label ID="lblHeaderCreditoDisponivel" runat="server" Width="80px" Visible="false" />
                                                <asp:Label ID="lblHeaderCreditoDisponivelValor" runat="server" Visible="false" />
                                            </div>

                                            <div style="width: 530px; display: table-cell;">
                                                <asp:Label ID="lblHeaderUsuario" runat="server" Width="100px" />
                                                <asp:DropDownList ID="dplHeaderUsuario" runat="server"
                                                    SkinID="DropFiltro" TabIndex="10" AutoPostBack="true" />
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </li>
                                <li>
                                    <asp:Panel ID="pnlHeaderRepresentante" runat="server">

                                        <ol>
                                            <li>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblHeaderRepresentante" runat="server" Width="90px" />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtHeaderRepresentanteId" runat="server" SkinID="Pedido" MaxLength="50" Enabled="false" TabIndex="18" />

                                                        </td>

                                                        <td>
                                                            <asp:Label ID="lblHeaderRepresentanteNome" runat="server" SkinID="LabelResposta" />
                                                        </td>

                                                    </tr>
                                                </table>
                                            </li>

                                        </ol>

                                    </asp:Panel>
                                </li>
                            </ol>
                        </asp:Panel>
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
                    <asp:Panel ID="pnlItem" runat="server">
                        <fieldset>
                            <ol style="width: 100%;">
                                <li style="width: 97%;">

                                    <div style="display: table; width: 100%; height: 30px;">

                                        <div style="display: table-cell; vertical-align: middle; width: auto; height: 100%;">
                                            <div class="line" style="width: auto; text-align: left;">
                                                <div class="line_itens_left">
                                                    <asp:Label ID="lblTransportadora" runat="server" Visible="false" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:DropDownList ID="ddlTransportadora" runat="server" Visible="false" SkinID="DropFiltro" AutoPostBack="true" OnSelectedIndexChanged="ddlTransportadora_SelectedIndexChanged" />
                                                </div>
                                                <div style="margin-left: 10px;" class="line_itens_left">
                                                    <asp:Label ID="lblRedespacho" runat="server" Visible="false" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:DropDownList ID="dplRedespacho" Visible="false" Enabled="false" runat="server" SkinID="DropFiltro" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:CheckBox ID="chkPedidoReversoAcessar" runat="server" Font-Bold="true" AutoPostBack="true" Text="Integração Acessar"
                                                        OnCheckedChanged="chkPedidoReversoAcessar_CheckedChanged" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:CheckBox ID="chkEmergencial" runat="server" Visible="true" Font-Bold="true" Text="<%$ Resources:Resource, lblEmergencial %>" OnCheckedChanged="chkEmergencial_CheckedChanged" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:CheckBox ID="chkTransportadoraOrcamento" runat="server" Visible="true" Font-Bold="true" Text="<%$ Resources:Resource, lblTransportadoraOrcamento %>"  OnCheckedChanged="chkTransportadoraOrcamento_CheckedChanged" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:Label ID="lblHeaderItemDataEntregaPedido" runat="server" />
                                                </div>
                                                <div class="line_itens">
                                                    <CtlData:ControlData ID="CtlDataEntregaPedido" runat="server" ValidationGroup="Validacao" />
                                                </div>
                                                <div class="line_itens">
                                                    <div style="margin-top: 5px;">
                                                        <asp:ImageButton ID="imgAlterarDataEntrega" runat="server" Width="25px" Height="25px"
                                                            ImageAlign="AbsMiddle"
                                                            data-toggle="tooltip" data-placement="top" data-html="true" title="Alterar Data de Entrega"
                                                            ImageUrl="~/Imagens/AlteraDataEntrega.png" OnClick="imgAlterarDataEntrega_Click" />
                                                    </div>
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
                                                        <%--<asp:ListItem Value="Outros" Text="<%$ Resources:Resource, lblOutros %>" />--%>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderItemEntregaPeriodo" ErrorMessage="<%$ Resources:Resource, msgInformePeriodoPedido %>" />
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
                                                    <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlPrazoEntrega" ErrorMessage="<%$ Resources:Resource, msgInformePrazoPedido %>" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:Label ID="lblDataEntregaPedidoAlterada" runat="server" ForeColor="Red" Visible="false" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ol>
                        </fieldset>
                    </asp:Panel>

                    <asp:Panel ID="pnlGvItens" runat="server" Visible="true">
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
                                        OnRowDataBound="gvItens_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                            <asp:BoundField DataField="itemDescricao" ItemStyle-Width="150px">
                                                <ItemStyle Width="150px" />
                                            </asp:BoundField>
                                            <%--  <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrItemControlado" runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                            </asp:TemplateField>--%>
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
                                                    <asp:TextBox ID="txtQuantidade" runat="server" SkinID="Currency50" Font-Bold="true" MaxLength="9" AutoPostBack="true" OnTextChanged="txtQuantidade_TextChanged" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtQuantidadeRecebida" runat="server" SkinID="Currency50" Font-Bold="true" MaxLength="9" Enabled="false" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hfValorDesconto" runat="server"
                                                        Value='<%# Eval("valDescontoEmissao", "{0:n2}") %>' />
                                                    <asp:TextBox ID="txtValor" runat="server" SkinID="Currency100"
                                                        Font-Bold="true" MaxLength="18" />
                                                    <asp:HiddenField ID="hfValorMinimo" runat="server" Value="" />
                                                    <asp:HiddenField ID="hfValorMaximo" runat="server" Value="" />
                                                    <asp:HiddenField ID="hfPedidoId" runat="server" Value="" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" HeaderText="Desconto boleto">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtValorDescontoBoleto" runat="server" Enabled="false"
                                                        SkinID="Currency100" Font-Bold="true"
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
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblValorDesconto" runat="server"
                                                        Font-Bold="true"
                                                        ToolTip="<%$ Resources:Resource, lblValorDesconto %>"
                                                        Text='<%# Eval("valDescontoTotal", "{0:n2}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="saldo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" DataFormatString="{0:###,###,###,##0.##}">
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:BoundField>
                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px">
                                                <ItemTemplate>
                                                    <div id="dvItemTipoPedido" runat="server" style="width: 100%; display: table-cell; vertical-align: middle;">
                                                        <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                            <asp:Label ID="lblItemTipoPedido" runat="server" />
                                                        </div>
                                                    </div>
                                                    <asp:DropDownList ID="ddlItemTipoPedido" runat="server" Enabled="false" SkinID="DropSmallFilter" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlMotivoRecusaItem" runat="server" OnSelectedIndexChanged="ddlMotivoRecusa_SelectedIndexChanged" AutoPostBack="true" SkinID="DropFiltro" Visible="false">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
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

                                <div style="width: 100%; display: table-cell; margin-top: 5px; margin-bottom: 5px;">
                                    <asp:Panel ID="pnlTotais" runat="server">
                                        <div style="width: 100%; vertical-align: middle; text-align: right;">
                                            <asp:Panel ID="pnlTotalPedido" runat="server">
                                                <asp:HiddenField ID="hdfQtdTotalItens" runat="server" Value="0,00" />
                                                <asp:HiddenField ID="hdfVlrTotalItensBruto" runat="server" Value="0,00" />
                                                <asp:HiddenField ID="hdfVlrTotalItens" runat="server" Value="0,00" />
                                                <asp:HiddenField ID="hdfValorTotalPedido" runat="server" Value="0,00" />
                                                <asp:CheckBox ID="cbInformaFrete" runat="server" Font-Bold="true" Text="<%$ Resources:Resource, lblInformaFrete %>"
                                                    OnCheckedChanged="cbInformaFrete_CheckedChanged" AutoPostBack="true" />
                                                <asp:Label ID="lblFrete" runat="server" Visible="false" />
                                                <asp:TextBox ID="txtFrete" runat="server" SkinID="Currency80" MaxLength="14" Font-Bold="true" Enabled="false" />
                                                <asp:HiddenField ID="hdfFrete" runat="server" Value="0,00" />

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

                        
                </asp:Panel>

                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        <asp:UpdatePanel ID="uppFiltros" runat="server">
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnGerarExcel" />

                            </Triggers>
                            <ContentTemplate>
                                <div style="display: table; width: 100%;">
                                    <div class="navegacao">
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblCodigo" runat="server" SkinID="LabelForm" Text="Código" />
                                            <asp:TextBox ID="txtCodico" runat="server" SkinID="Filtro" />
                                        </div>
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltroPedidoId" runat="server" SkinID="LabelForm" Text="Pedido Laboratório" />
                                            <asp:TextBox ID="txtFiltroPedidoNumeroIntegracao" runat="server" SkinID="Filtro" />
                                        </div>
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblLaboratorio" runat="server" SkinID="LabelForm" Text="Laboratório" />
                                            <asp:DropDownList ID="dplLaboratorio" SkinID="DropFiltro" runat="server" />
                                        </div>
                                        <div class="boxPesquisaCurta">


                                            <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                                TabIndexDataInicio="1" TabIndexDataTermino="2"
                                                ShowHeaderLine="false" />
                                        </div>
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltroEstabelecimento" runat="server" SkinID="LabelForm" Text="Estabelecimento" />
                                            <asp:DropDownList ID="dplFiltroEstabelecimento" SkinID="DropFiltro" runat="server" />
                                        </div>

                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblStatus" runat="server" SkinID="LabelForm" Text="Status" />
                                            <asp:DropDownList ID="dplStatusPedido" SkinID="DropFiltro" runat="server" />
                                        </div>


                                    </div>
                                </div>
                                <div style="display: table; width: 100%;">
                                    <div class="navegacao">
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltroPedidoIntegracaoKraft" runat="server" SkinID="LabelForm" Text="Pedido Integração" />
                                            <asp:TextBox ID="txtFiltroPedidoIntegracaoKraft" runat="server" SkinID="Filtro" />
                                        </div>
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltroPedidoIdGerado" runat="server" SkinID="LabelForm" Text="Código Pedido Kraft" />
                                            <asp:TextBox ID="txtFiltroPedidoIdGerado" runat="server" SkinID="Filtro" />
                                        </div>
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltroUf" runat="server" Text="UF Cliente" />
                                            <asp:DropDownList ID="ddFiltroUf" SkinID="DropSmallFilter" runat="server" TabIndex="11" />
                                        </div>
                                        <div id="dvSituacao" runat="server" class="boxPesquisa">
                                            <asp:Label ID="lblFiltroSituacao" runat="server" />
                                            <asp:DropDownList ID="ddFiltroSituacao" runat="server" SkinID="DropSmallFilter" TabIndex="14" />
                                        </div>


                                        <%--  <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltroPedidoNumeroCliente" runat="server" SkinID="LabelForm" Text="Número pedido cliente" Visible="false" />
                                            <asp:TextBox ID="txtFiltroPedidoNumeroCliente" runat="server" SkinID="Filtro" Visible="false" />
                                        </div>--%>
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltrosClienteCnpj" runat="server" />
                                            <asp:TextBox ID="txtFiltrosClienteCnpj" SkinID="Filtro" runat="server" MaxLength="18" TabIndex="50" />
                                        </div>
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltrosClienteCodigoErp" runat="server" Text="" />
                                            <asp:TextBox ID="txtFiltrosClienteCodigoErp" SkinID="Filtro" runat="server" TabIndex="53" />
                                        </div>
                                        <div class="boxPesquisa" style="width: 250px">
                                            <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnSuccess"
                                                TabIndex="12" OnClick="btnFiltrosPesquisa_Click" />
                                            <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDanger"
                                                TabIndex="12" OnClick="btnFiltrosLimpar_Click" />
                                            <%--                   <asp:ImageButton ID="btnVerificaPedidos" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnVerificaPedidos_Click"
                                        ToolTip="Verificar Pedidos"
                                        ImageUrl="~/Imagens/checklist.png" TabIndex="6" />--%>
                                            <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                                ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                                ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />

                                        </div>
                                    </div>
                                </div>


                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </fieldset>


                    <fieldset style="height: 35px; width: 99%; margin-bottom: 5px;">
                        <div style="display: table; width: 100%; height: 100%;">
                            <div style="display: table-cell; width: 85%; height: 30px; vertical-align: middle; text-align: left;">
                                <div style="display: table; width: 100%; height: 100%;">
                                    <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: center;">
                                        <asp:Image ID="Image3" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/NaoValidado.png" />
                                    </div>
                                    <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: left;">
                                        <asp:Label ID="Label3" runat="server" Text="Não validado" />
                                    </div>
                                    <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: center;">
                                        <asp:Image ID="Image1" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/Liberado.png" />
                                    </div>
                                    <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: left;">
                                        <asp:Label ID="Label1" runat="server" Text="Liberado" />
                                    </div>
                                    <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: center;">
                                        <asp:Image ID="imgRed" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/erro.png" />
                                    </div>
                                    <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: left;">
                                        <asp:Label ID="lblRowDivergencia" runat="server" Text="Erro(s) Impeditivo para liberar" />
                                    </div>
                                    <%--<div style="display: table-cell; width: 5%; vertical-align: middle; text-align: center;">
                                        <asp:Image ID="imgGreen" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/ItemErro.png" />
                                    </div>
                                    <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: left;">
                                        <asp:Label ID="lblRowAguardando" runat="server" Text="Pelo menos um item com erro" />
                                    </div>--%>

                                    <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: center;">
                                        <asp:Image ID="Image2" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/Implantado.png" />
                                    </div>
                                    <div style="display: table-cell; width: 15%; vertical-align: middle; text-align: left;">
                                        <asp:Label ID="Label2" runat="server" Text="Implantado" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </fieldset>


                    <fieldset>
                        <div class="form-row">
                            <asp:GridView ID="gvRegistros" runat="server" DataKeyNames="pedidoId"
                                SkinID="GridViewTable"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="PedidoNumeroIntegracao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <%--<asp:BoundField DataField="PedidoNumeroCliente" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />--%>
                                    <asp:BoundField DataField="sistemaEntrada" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="dataRecebimentoPedido" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="clientePrincipal" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="UFCliente" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="statusPedido" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="pedidoIdGerado" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="pedidoNumeroIntegracaoKraft" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPedidoSituacao" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Alterar" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/find.png" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnHistoricoPedido" runat="server" CommandName="Historico" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblHistoricoSav %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/histPedido.png" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnVerificarPedido" runat="server" CommandName="Verificar" Width="25px" Height="25px"
                                                ToolTip="Verificar Pedido" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/checklist.png" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </asp:Panel>

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
                                            <asp:Panel ID="pnlFiltroCondicaoPagamento" runat="server" Visible="false">
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
                                            </asp:Panel>

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
                                                                                <uc1:CtlDataB ID="CtlDepositoData" runat="server" />
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
                                                        <%-- <asp:Button ID="btnSalvarCondPgtoDeposito" runat="server" SkinID="ButtonCenter" OnClick="btnSalvarCondPgtoDeposito_Click" />
                                                        <asp:Button ID="btnLimparCondPgtoDeposito" runat="server" SkinID="ButtonCenter" OnClick="btnLimparCondPgtoDeposito_Click" />--%>
                                                        <%--<asp:Button ID="btnMudarCondPgtoDeposito" runat="server" SkinID="ButtonCenter" OnClick="btnMudarCondPgtoDeposito_Click" ToolTip="<%$ Resources:Resource, lblMudarCondicaoPgtoEspecial %>" Text="<%$ Resources:Resource, lblMudar %>" />--%>
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
                            <asp:Panel ID="pnlCondicaoPgtoCartao" runat="server" Visible="false" SkinID="PnlPopUp">
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
                                                    <%-- <asp:Button ID="btnSalvarCartao" runat="server" SkinID="ButtonLeft" ValidationGroup="ValidaCartao" OnClick="btnSalvarCartao_Click" />
                                                    <asp:Button ID="btnExcluirCartao" runat="server" SkinID="ButtonCenter" OnClick="btnExcluirCartao_Click" Visible="false" />
                                                    <asp:Button ID="btnLimparCartao" runat="server" SkinID="ButtonCenter" OnClick="btnLimparCartao_Click" />
                                                    <asp:Button ID="btnMudarcondPgtoCartao" runat="server" SkinID="ButtonRight" OnClick="btnMudarcondPgtoCartao_Click" ToolTip="<%$ Resources:Resource, lblMudarCondicaoPgtoEspecial %>" Text="<%$ Resources:Resource, lblMudar %>" />--%>
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
                                                                    <uc1:CtlDataB ID="CtlEspecialCondicaoData" runat="server" />
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

                <asp:UpdatePanel ID="uppAprovaPedido" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAprovaPedidoOk" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnAprovaPedidoNOk" EventName="Click" />


                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlAprovaPedido" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround">
                            </div>
                            <div class="painel" style="width: 45%; height: 60%; left: 30%; top: 25%;">
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
                                <div class="painel_body" style="height: 80%;">
                                    <fieldset>
                                        <ol style="width: auto;">
                                            <li>
                                                <div class="line">
                                                    <asp:Label ID="lblTextoAprovacao" runat="server" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="line">
                                                    <asp:Label ID="lblMotivoRepPedido" Visible="false" runat="server" Text="Motivo da reprovação do pedido"></asp:Label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="line">
                                                    <asp:DropDownList ID="ddlMotivoReprovPedido" runat="server" SkinID="ddlBootstrap" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="line">
                                                    <asp:Label ID="lblConfirmarAprovacao" runat="server" />
                                                </div>
                                            </li>

                                            <%--          <li>
                                                <div class="line">
                                                    <asp:TextBox ID="txtMotivo" runat="server" Columns="100" Rows="5" TextMode="MultiLine" MaxLength="250" Height="100%" Width="98%" />
                                                </div>
                                            </li>--%>
                                        </ol>

                                        <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                            <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">

                                                <asp:Button ID="btnAprovaPedidoOk" runat="server" SkinID="BtnDanger-sm" OnClick="btnAprovaPedidoOk_Click" />

                                                &nbsp 
                                    <asp:Button ID="btnAprovaPedidoNOk" runat="server" SkinID="BtnSuccess-sm" OnClick="btnAprovaPedidoNOk_Click" />
                                            </div>
                                        </div>
                                </div>
                                </fieldset>
                            </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="uppCancelarPedido" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnCancelarPedidoOk" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnCancelarPedidoNOk" EventName="Click" />


                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlModalCancelarPedido" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround">
                            </div>
                            <div class="painel" style="width: 45%; height: 60%; left: 30%; top: 25%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblCancelar" runat="server" ForeColor="White" texte="Cancelamento de Pedido" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbCancelarClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbCancelarClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body" style="height: 80%;">
                                    <fieldset>
                                        <ol style="width: auto;">
                                            <li>
                                                <div class="line">
                                                    <asp:Label ID="lblTextoCancelar" runat="server" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="line">
                                                    <asp:Label ID="lblMotivoCanPedido" runat="server" Text="Motivo do cancelamento do pedido"></asp:Label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="line">
                                                    <asp:DropDownList ID="ddlMotivoCancelamentoPedido" runat="server" SkinID="ddlBootstrap" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="line">
                                                    <asp:Label ID="Label4" runat="server" />
                                                </div>
                                            </li>


                                        </ol>

                                        <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                            <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">

                                                <asp:Button ID="btnCancelarPedidoOk" runat="server" SkinID="BtnDanger-sm" OnClick="btnCancelarPedidoOk_Click" />

                                                &nbsp 
                                    <asp:Button ID="btnCancelarPedidoNOk" runat="server" SkinID="BtnSuccess-sm" OnClick="btnCancelarPedidoNOk_Click" />
                                            </div>
                                        </div>
                                </div>
                                </fieldset>
                            </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

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
                                            <asp:Label ID="lblClienteHeader" runat="server" ForeColor="White" Text="Selecionar Cliente Triangular" />
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
                                                    <asp:Label ID="lblFiltrosClienteIdERPM" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteIdERPM" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="30" />
                                                </div>
                                                <div id="dvCnpj" runat="server" class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteCnpjM" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteCnpjM" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
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
                                                                <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtRazaoSocial.Text) %>' />
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
                                                                <asp:Literal ID="ltrClienteCpf" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCPF").ToString(), Comom.Utility.FormatOption.ApplyMask, Comom.Utility.TipoDocumento.CPF), txtFiltrosClienteCnpj.Text) %>' />
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

                <%-- ENDEREÇOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppEnderecos" runat="server" UpdateMode="Conditional">
                        <%--  <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlHeaderClienteTipoEndereco" EventName="SelectedIndexChanged" />
                        </Triggers>--%>
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


                <asp:UpdatePanel ID="updModalHistoricoPedido" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlModalHistoricoPedido" runat="server" CssClass="Modal" Visible="false">
                            <%-- <div class="bs-example-modal-lg">--%>
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <asp:ImageButton ID="imgFechar" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imgFechar_Click" />
                                        <h4 class="modal-title" id="myModalLabel">Histórico Pedido</h4>
                                    </div>
                                    <div class="modal-body">
                                        <asp:Panel ID="pnlInfoHistorico" runat="server">
                                        </asp:Panel>

                                    </div>
                                    <div class="modal-footer">

                                        <%-- <asp:ImageButton ID="btnNF" runat="server" SkinID="ImgList" Width="45px" Height="45px"
                                ImageUrl="~/Imagens/list_zoom.png" ToolTip="Visualizar NF"
                                OnClick="btnNF_Click" />--%>
                                        <asp:Button Text="Fechar" SkinID="BtnDanger" CommandArgument="ModalPesquisaItem" ID="btnCancelarModal" runat="server" OnClick="btnCancelarModal_Click" />

                                    </div>
                                </div>
                            </div>
                            <%--       </div>--%>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>


</asp:Content>
