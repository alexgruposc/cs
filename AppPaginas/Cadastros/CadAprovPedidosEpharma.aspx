<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CadAprovPedidosEpharma.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadAprovPedidosEpharma" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/Mensagem.ascx" TagPrefix="MsgBox" TagName="Mensagem" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .GridView td {
            text-align: center;
        }
    </style>

    <script type="text/javascript">

        function OcultarControle(pControle) {
            document.getElementById("ContentPlaceHolder1_" + pControle).style.display = "none";
        }

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroEstabelecimento" runat="server">
        <asp:UpdatePanel ID="uppPedido" runat="server">
            <ContentTemplate>
                <MsgBox:Mensagem runat="server" ID="MensagemBox" />
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppPedido">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <div style="width: 100%; display: table;">
                        <fieldset style="margin-bottom: 100px;">
                            <legend>
                                <asp:Literal ID="ltrDadosHeader" runat="server" />
                            </legend>
                            <fieldset>
                                <div style="display: table; text-align: center; width: 99%;">
                                    <div style="display: table; width: 100%;">
                                        <div class="boxPesquisa">
                                            <div class="line">
                                                <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeftSave" OnClick="btnSalvar_Click" TabIndex="1" ValidationGroup="Validacao"  OnClientClick="OcultarControle('btnSalvar')" />

                                                <%-- <asp:Button ID="btnReprovar" runat="server" SkinID="ButtonCenterDisagree" TabIndex="4" Text="<%$ Resources:Resource, lblReprovacao %>" /> --%>
                                                <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnVoltar_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <%-- FORMULÁRIO --%>
                            <div style="width: 100%; display: table;">
                                <div style="width: 30%; display: table-cell; vertical-align: top;">
                                    <fieldset>
                                        <div style="width: 100%; display: table;">
                                            <div style="width: 10%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderPedidoId" runat="server" />
                                            </div>
                                            <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderPedidoIdDescricao" runat="server" ForeColor="Blue" />
                                            </div>
                                            <%-- <div style="width: 10%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderPedidoParcial" runat="server" />
                                            </div>
                                            <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderPedidoParcialDescricao" runat="server" ForeColor="Blue" />
                                            </div>--%>
                                            <%--<div style="width: 10%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderNumeroPedidoCompra" runat="server" />
                                            </div>
                                            <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderNumeroPedidoCompraDescricao" runat="server" SkinID="LabelResposta" />
                                            </div>--%>
                                            <div style="width: 10%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderPedidoIdPortal" runat="server" />
                                            </div>
                                            <div style="width: 10%; display: table-cell; vertical-align: middle;">
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 320px; margin-left: 5px;">
                                                    <asp:Label ID="lblHeaderPedidoIdPortalDescricao" runat="server" SkinID="LabelResposta" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <div style="width: 100%; display: table;">
                                            <asp:Panel ID="pnlLinha1" runat="server">

                                                <asp:Panel ID="pnlHeaderCliente" runat="server">
                                                    <fieldset>
                                                        <legend>
                                                            <asp:Literal ID="ltrHeaderCliente" runat="server" />
                                                            <%-- --%>
                                                        </legend>
                                                        <div style="width: 100%; height: 100%; display: table;">
                                                            <div style="display: table-cell; width: 30%;">
                                                                <asp:Label ID="lblHeaderCliente" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtHeaderClienteNome" runat="server" MaxLength="50" TabIndex="7" Enabled="false" />
                                                                <asp:HiddenField ID="hdHeaderClienteIdERP" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderClienteIdCGC" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAgrupadorId" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderClienteVendaES" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAutoriEspecial" runat="server" />

                                                            </div>
                                                            <div style="display: table-cell; width: 30%;">

                                                                <asp:Label ID="lblClienteCpfCnpj" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtClienteCpfCnpj" runat="server" MaxLength="50" TabIndex="7" Enabled="false" />
                                                            </div>

                                                        </div>
                                                        <div style="width: 100%; height: 80%; display: table;">
                                                            <div style="display: table-cell; width: 50%;">
                                                                <asp:Label ID="lblHeaderClienteEmail" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtHeaderClienteEmail" runat="server" TabIndex="7" Enabled="false" />
                                                            </div>
                                                            <div style="display: table-cell; width: 50%;">
                                                                <asp:Label ID="lblHeaderClienteResponsavel" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtHeaderClienteResponsavel" runat="server" MaxLength="50" TabIndex="7" Enabled="false" />
                                                            </div>
                                                            <%--<div style="display: table-cell; width: 20%;">
                                                                <asp:Label ID="lblHeaderClienteTelefone1" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtHeaderClienteTelefone1" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="7" Enabled="false" />
                                                            </div>
                                                            <div style="display: table-cell; width: 20%;">
                                                                <asp:Label ID="lblHeaderClienteTelefone2" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtHeaderClienteTelefone2" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="7" Enabled="false" />
                                                            </div>--%>
                                                        </div>
                                                        <div style="display: table-cell; width: 33%;">
                                                            <asp:Label ID="Label1" Text="Convenio" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtConvenio" runat="server" TabIndex="7" Enabled="false" />
                                                        </div>
                                                        <div style="width: 100%; height: 80%; display: table;">

                                                            <div style="display: table-cell; width: 33%;">
                                                                <asp:Label ID="lblMedicoNome" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtMedicoNome" runat="server" TabIndex="7" Enabled="false" />
                                                            </div>
                                                            <div style="display: table-cell; width: 33%;">
                                                                <asp:Label ID="lblMedidoCRM" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtMedidoCRM" runat="server" MaxLength="50" TabIndex="7" Enabled="false" />
                                                            </div>
                                                            <div style="display: table-cell; width: 33%;">
                                                                <asp:Label ID="lblMedidoUf" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtMedicoUf" runat="server" MaxLength="50" TabIndex="7" Enabled="false" />
                                                            </div>
                                                        </div>
                                                        <asp:Panel ID="pnlContatoCliente" runat="server">
                                                            <fieldset style="margin-top: 41px; height: 100%; z-index: 1;">
                                                                <div style="width: 100%; height: 100%; display: table;">
                                                                    <div style="width: 40%; display: table-cell;">
                                                                        <asp:GridView ID="gvContatoCliente" runat="server" TabIndex="51"
                                                                            DataKeyNames="DDD,Numero,Tipo"
                                                                            OnPageIndexChanging="gvContatoCliente_PageIndexChanging"
                                                                            OnRowDataBound="gvContatoCliente_RowDataBound">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="DDD" ItemStyle-HorizontalAlign="Center" />
                                                                                <asp:BoundField DataField="Numero" ItemStyle-HorizontalAlign="Center" />
                                                                                <asp:BoundField DataField="Tipo" ItemStyle-HorizontalAlign="Center" />

                                                                            </Columns>
                                                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlDadosEndereco" runat="server">
                                                            <fieldset style="margin-top: 41px; height: 100%; z-index: 1;">
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
                                                                                    <asp:TextBox ID="txtDadosClienteWfEnderecoCep" runat="server" MaxLength="9" TabIndex="61" SkinID="Data" />
                                                                                   <asp:ImageButton ID="imbBuscaCep" runat="server" Width="25px" Height="25px"
                                                                                    ImageAlign="AbsMiddle" TabIndex="62"
                                                                                    ImageUrl="~/Imagens/find.png"
                                                                                    OnClick="imbBuscaCep_Click" />
                                                                                </asp:Panel>
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblDadosClienteWfEndereco" runat="server" SkinID="LabelForm" />
                                                                                <asp:TextBox ID="txtDadosClienteWfEndereco" runat="server" TabIndex="63" MaxLength="62" />
                                                                            </li>

                                                                            <li>
                                                                                <asp:Label ID="lblDadosClienteWfEnderecoNumero" runat="server" SkinID="LabelForm" />
                                                                                <asp:TextBox ID="txtDadosClienteWfEnderecoNumero" runat="server" MaxLength="30" SkinID="Pedido"
                                                                                    TabIndex="63" />
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblDadosClienteWfEnderecoComplemento" runat="server" SkinID="LabelForm" />
                                                                                <asp:TextBox ID="txtDadosClienteWfEnderecoComplemento" runat="server" MaxLength="100" TabIndex="64" />
                                                                            </li>
                                                                        </ol>
                                                                    </div>
                                                                    <div style="width: 60%; display: table-cell;">
                                                                        <asp:Panel ID="pnlTeste" runat="server">
                                                                            <ol>
                                                                                <li>
                                                                                    <asp:Label ID="lblDadosClienteWfEnderecoPais" runat="server" SkinID="LabelForm" />
                                                                                    <asp:DropDownList ID="ddlDadosClienteWfEnderecoPais" runat="server" TabIndex="65" 
                                                                                        AutoPostBack="True" />
                                                                                </li>
                                                                                <li>
                                                                                    <asp:Label ID="lblDadosClienteWfEnderecoUf" runat="server" SkinID="LabelForm" />
                                                                                    <asp:DropDownList ID="ddDadosClienteWfEnderecoUf" runat="server" TabIndex="66"  />
                                                                                </li>
                                                                                <li>
                                                                                    <asp:Label ID="lblDadosClienteWfEnderecoCidade" runat="server" SkinID="LabelForm" />
                                                                                    <asp:TextBox ID="txtDadosClienteWfEnderecoCidade" runat="server" MaxLength="100" TabIndex="67" />
                                                                                    <ucc:AutoCompleteExtender ID="aceCidades" runat="server"
                                                                                        CompletionListCssClass="autocomplete_list"
                                                                                        CompletionListItemCssClass="autocomplete_listitem"
                                                                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                                                        CompletionInterval="100"
                                                                                        EnableCaching="false"
                                                                                        MinimumPrefixLength="1"
                                                                                        UseContextKey="true"
                                                                                        TargetControlID="txtDadosClienteWfEnderecoCidade"
                                                                                        ServiceMethod="GetCidades"
                                                                                        ServicePath="~/AppWs/WsGetCidadesKs.asmx" />
                                                                                </li>
                                                                                <li>
                                                                                    <asp:Label ID="lblDadosClienteWfEnderecoBairro" runat="server" SkinID="LabelForm" />
                                                                                    <asp:TextBox ID="txtDadosClienteWfEnderecoBairro" runat="server" MaxLength="100" TabIndex="68" />
                                                                                </li>

                                                                            </ol>
                                                                        </asp:Panel>
                                                                    </div>
                                                                </div>


                                                            </fieldset>

                                                        </asp:Panel>
                                                    </fieldset>
                                                </asp:Panel>
                                            </asp:Panel>
                                        </div>
                                    </fieldset>
                                    <fieldset>
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
                                                            <asp:Label ID="lblHeaderCreditoValorEmAberto" runat="server" Width="80px" />
                                                            <asp:Label ID="lblHeaderCreditoValorEmAbertoValor" runat="server" ForeColor="Blue" />
                                                            <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="txtCondicaoPagamento" ErrorMessage="<%$ Resources:Resource, msgCondicaoPagamentoId %>" />
                                                        </div>

                                                    </asp:Panel>
                                                </div>
                                            </li>
                                            <li>
                                                <div style="width: 100%; display: table;">
                                                    <asp:Panel ID="pnlLinha3" runat="server">
                                                        <div style="width: 500px; display: table-cell;">
                                                            <asp:Label ID="lblHeaderTipoPedido" runat="server" Width="100px" />
                                                            <asp:DropDownList ID="ddlHeaderTipoPedido" runat="server" SkinID="DropFiltro" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="ddlHeaderTipoPedido_SelectedIndexChanged" />
                                                            <asp:Image ID="imgInfoCfop" runat="server" Width="25px" Height="25px"
                                                                ImageAlign="AbsMiddle"
                                                                ToolTip="<%$ Resources:Resource, msgPedidoCfopDisponibilidade %>"
                                                                ImageUrl="~/Imagens/receita.png" />
                                                            <span id="spToolTip" style="DISPLAY: none; Z-INDEX: 100; POSITION: absolute; HEIGHT: 10px; z-order: 100;"></span>
                                                            <asp:CheckBox ID="chkVendaComum" runat="server" Font-Bold="true" TextAlign="Right" AutoPostBack="true" />
                                                            <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderTipoPedido" ErrorMessage="<%$ Resources:Resource, msgPedidoTipoId %>" />
                                                        </div>
                                                        <div style="width: 530px; display: table-cell;">
                                                            <asp:Label ID="lblHeaderUnidadeNegocio" runat="server" SkinID="LabelForm" />
                                                            <asp:DropDownList ID="ddlHeaderUnidadeNegocio" runat="server" AutoPostBack="true"
                                                                SkinID="DropFiltro" />
                                                            <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlHeaderUnidadeNegocio" ErrorMessage="<%$ Resources:Resource, msgInformeUnidadeNegocio %>" />
                                                            <asp:Label ID="lblHeaderCreditoDisponivel" runat="server" Width="80px" />
                                                            <asp:Label ID="lblHeaderCreditoDisponivelValor" runat="server" Visible="false" />
                                                        </div>


                                                    </asp:Panel>
                                                </div>
                                            </li>
                                        </ol>
                                    </fieldset>
                                    <div style="display: table; width: 100%;">
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
                                                                        <asp:DropDownList ID="dplRedespacho" Enabled="false" Visible="false" runat="server" SkinID="DropFiltro" />
                                                                    </div>
                                                                    <div class="line_itens">
                                                                        <asp:CheckBox ID="chkEmergencial" runat="server" Visible="true" Font-Bold="true" Text="<%$ Resources:Resource, lblEmergencial %>"  AutoPostBack="true" OnCheckedChanged="chkEmergencial_CheckedChanged" />
                                                                    </div>
                                                                    <div class="line_itens">
                                                                        <asp:CheckBox ID="chkTransportadoraOrcamento" runat="server" Visible="true" Font-Bold="true" Text="<%$ Resources:Resource, lblTransportadoraOrcamento %>" AutoPostBack="true" OnCheckedChanged="chkTransportadoraOrcamento_CheckedChanged" />
                                                                    </div>

                                                                    <div class="line_itens">
                                                                        <asp:Label ID="lblHeaderItemDataEntregaPedido" runat="server" />
                                                                    </div>
                                                                    <div class="line_itens">
                                                                        <CtlData:ControlData ID="CtlDataEntregaPedido" runat="server" ValidationGroup="Validacao" DataEnabled="true" />
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
                                        <div style="display: table; width: 100%; height: 20px;">
                                            <fieldset>
                                                <div style="display: table; width: 100%; height: 100%;">
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
                                                        OnRowDataBound="gvItens_RowDataBound"
                                                        OnRowDeleting="gvItens_RowDeleting"
                                                        OnRowUpdating="gvItens_RowUpdating">
                                                        <Columns>
                                                            <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                                            <%--             <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25px">
                                                                <ItemTemplate>                                                                
                                                                    <asp:ImageButton ID="imbIconeIntegracao" runat="server" SkinID="ImgGrid" Enabled="false" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                            </asp:TemplateField>--%>
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
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblValorDesconto" runat="server"
                                                                        Font-Bold="true"
                                                                        ToolTip="<%$ Resources:Resource, lblValorDesconto %>"
                                                                        Text='<%# Eval("valDescontoTotal", "{0:n2}") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--<asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtValorDescontoBoleto" runat="server"
                                                                        SkinID="Currency100" Font-Bold="true"
                                                                        MaxLength="18" />

                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblValorPrecoBruto" runat="server"
                                                                        Font-Bold="true"
                                                                        ToolTip="<%$ Resources:Resource, lblValorDesconto %>"
                                                                        Text='<%# Eval("pedidoItemValorBruto", "{0:n2}") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--  <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
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
                                                            </asp:TemplateField>--%>
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
                                                            <%--  <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imbDelete" runat="server" SkinID="ImgGrid" CommandName="Delete"
                                                                        ImageUrl="~/Imagens/_trash.png"
                                                                        ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                        CommandArgument='<%# Eval("pedidoId") + "|" + Eval("itemId") + "|" + Eval("pedidoItemSeq") + "|" +  ((GridViewRow)Container).RowIndex %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                            </asp:TemplateField>--%>
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </asp:Panel>
                                </div>

                            </div>

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
                                                <%--</li>
                                            </ol>--%>
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

                                <asp:Panel ID="pnlItensNaoEncotrados" runat="server">
                                    <fieldset style="margin-top: 41px; height: 100%; z-index: 1;">
                                        <legend>
                                            <asp:Literal ID="ltrTituloItensNaoEncont" runat="server" />
                                        </legend>
                                        <div style="width: 100%; height: 100%; display: table;">
                                            <div style="width: 40%; display: table-cell;">
                                                <asp:GridView ID="gvItensNaoEnontrados" runat="server" TabIndex="51"
                                                    DataKeyNames="Produto,Ean,Termolabil"
                                                    OnPageIndexChanging="gvItensNaoEnontrados_PageIndexChanging"
                                                    OnRowDataBound="gvItensNaoEnontrados_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="Produto" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="Ean" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="Termolabil" ItemStyle-HorizontalAlign="Center" />

                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </fieldset>
                                </asp:Panel>
                            </div>
                            <%-- <asp:ValidationSummary runat="server" ID="ValidationSummary3"
                        DisplayMode="BulletList"
                        ShowMessageBox="False" ShowSummary="True" CssClass="alert alert-danger" ValidationGroup="Validacao" />--%>
                        </fieldset>
                    </div>


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
                                                    <asp:Label ID="lblConfirmarDadosMedicoId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosMedicoIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosMedicoNome" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosMedicoNomeTexto" runat="server" SkinID="LabelResposta" />
                                                </li>

                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft"
                                                    TabIndex="6" OnClick="btnConfirmarYes_Click" OnClientClick="OcultarControle('btnConfirmarYes')" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight"
                                                    TabIndex="7" OnClick="btnConfirmarNo_Click" />
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
                        <asp:UpdatePanel ID="uppFiltros" runat="server">
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnGerarExcel" />
                                <asp:AsyncPostBackTrigger ControlID="imbFiltros" EventName="Click" />
                            </Triggers>
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

                                            <div>

                                                <div class="boxPesquisa text-left">
                                                    <asp:Label ID="Label2" Text="Data do Pedido:" runat="server" /><br />
                                                    <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                                        ShowHeaderLine="false" />
                                                </div>

                                                <div class="boxPesquisa text-left">
                                                    <asp:Label Text="Convênio:" runat="server" /><br />
                                                    <asp:DropDownList ID="cmbNomeConvenio" Enabled="true" runat="server" />
                                                </div>

                                                <div class="boxPesquisa text-left">
                                                    <asp:Label ID="lblFiltroPedidoId" runat="server" /><br />
                                                    <asp:TextBox ID="txtFiltroPedidoId" runat="server" SkinID="Size70" />
                                                </div>

                                                <div class="boxPesquisa text-left">
                                                    <asp:Label ID="Label3" Text="Status do Pedido:" runat="server" /><br />
                                                    <asp:DropDownList ID="ddlFiltroStatus" Enabled="true" runat="server" />
                                                </div>

                                                <div class="boxPesquisa text-left">
                                                    <asp:Label Text="Nome:" runat="server" /><br />
                                                    <asp:TextBox ID="txtFiltrosClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" />
                                                </div>



                                                <%--  <div class="boxPesquisa">
                                                            <asp:Label ID="lblFiltroEstabelecimentoId" Visible="false" runat="server" />
                                                            <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server"  Visible="false" 
                                                                AutoPostBack="True" SkinID="DropFiltro" />
                                                        </div>--%>
                                                <div class="boxPesquisa text-left">
                                                    <asp:Label ID="lblFiltroUf" runat="server" /><br />
                                                    <asp:DropDownList ID="ddFiltroUf" SkinID="DropFiltro" runat="server" />
                                                </div>
                                                <%-- <div class="boxPesquisa">
                                                    <asp:CheckBox ID="chkFiltroMedicoBloqueado" runat="server" Visible="false" TextAlign="Right"
                                                        Font-Bold="true"
                                                        Text="<%$ Resources:Resource, lblMostrarBloqueados %>" />
                                                </div>--%>

                                                <div class="text-right" style="margin-top: 15px">
                                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnDefault"
                                                        OnClick="btnFiltrosPesquisa_Click" />&nbsp;
                                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault"
                                                        OnClick="btnFiltrosLimpar_Click" />&nbsp;
                                                    <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                                        ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                                        ImageUrl="~/Imagens/xlsx.png" />
                                                </div>

                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"
                                DataKeyNames="pedidoId,NumeroPedido,Cnpj,NotaFiscal,ComprovanteEntrega,CodigoCliente,
                                            NomeCliente,DataHoraPedido,medicoTipo,medicoNome,medicoCodigo,medicoUf,clienteId,Cartao,CodigoCartao,Cpf,Matricula,Nome,NomeCartao,Email,pedidoIdGerado,clienteIdERP"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                OnRowDeleting="gvRegistros_RowDeleting"
                                OnRowUpdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:BoundField DataField="pedidoId" HeaderText="Código Pedido" ItemStyle-Width="5%" />
                                    <asp:BoundField DataField="NumeroPedido" HeaderText="Num. Pedido" ItemStyle-Width="5%" />
                                    <asp:BoundField DataField="Cnpj" HeaderText="CNPJ" ItemStyle-Width="10%" />
                                    <asp:BoundField DataField="Nome" HeaderText="Nome" ItemStyle-Width="20%" />

                                    <asp:BoundField DataField="CodigoCliente" HeaderText="Código Cliente" ItemStyle-Width="5%" />
                                    <asp:BoundField DataField="NomeCliente" HeaderText="Convênio" ItemStyle-Width="20%" />
                                    <asp:BoundField DataField="DataHoraPedido" HeaderText="Data Pedido" ItemStyle-Width="10%" />
                                    <asp:BoundField DataField="pedidoStatus" HeaderText="Status Pedido" ItemStyle-Width="10%" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" ItemStyle-Width="10%" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
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
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft"
                                            TabIndex="14" OnClick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight"
                                            TabIndex="15" OnClick="btnConfirmarExclusaoNo_Click" />
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
                                            OnClick="btnPerfisADMOk_Click"  OnClientClick="OcultarControle('btnPerfisADMOk')" />
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
                                                    <asp:Button ID="btnAprovaPedidoOk" runat="server" SkinID="ButtonLeft" OnClick="btnAprovaPedidoOk_Click"  OnClientClick="OcultarControle('btnAprovaPedidoOk')" />
                                                    <asp:Button ID="btnAprovaPedidoNOk" runat="server" SkinID="ButtonRight" OnClick="btnAprovaPedidoNOk_Click" />
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
                                                        <asp:Button ID="btnOkEpharma" runat="server" SkinID="ButtonOk" CssClass="ButtonLeft" OnClick="btnOkEpharma_Click"  OnClientClick="OcultarControle('btnOkEpharma')" />
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
</asp:Content>

