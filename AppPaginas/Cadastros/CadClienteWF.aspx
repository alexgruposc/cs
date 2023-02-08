<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"
    CodeBehind="CadClienteWF.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadClienteWF" %>

<%-- CONTROLES --%>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>


<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_initializeRequest(InitializeRequest);
        prm.add_endRequest(EndRequest);
        var postBackElement;
        postBackElement = args.get_postBackElement();

        function InitializeRequest(sender, args) {
            if (prm.get_isInAsyncPostBack()) {
                args.set_cancel(true);
            }

            postBackElement = args.get_postBackElement();

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnSalvar.ClientID %>') {
                document.getElementById('<%= btnSalvar.ClientID %>').disabled = true;
            }
        }
        function EndRequest(sender, args) {
            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnSalvar.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').disabled = false;
            }
        }


        function MontaLayoutFiltros(rbl) {

            if (rbl == "F") {
                document.getElementById('ContentPlaceHolder1_lblFiltrosClienteRne').style.display = "none"
                document.getElementById('ContentPlaceHolder1_pnlFiltrosCnpj').style.display = "none"
                document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCnpj').value = "";
                document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCpf').value = "";
                document.getElementById('ContentPlaceHolder1_pnlFiltrosCpf').style.display = "block"
                document.getElementById('ContentPlaceHolder1_lblFiltrosClienteCpf').style.display = "block"
            }
            else if (rbl == "E") {
                document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCpf').value = "";
                document.getElementById('ContentPlaceHolder1_lblFiltrosClienteCpf').style.display = "none"
                document.getElementById('ContentPlaceHolder1_pnlFiltrosCnpj').style.display = "none"
                document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCnpj').value = "";
                document.getElementById('ContentPlaceHolder1_pnlFiltrosCpf').style.display = "block"
                document.getElementById('ContentPlaceHolder1_lblFiltrosClienteRne').style.display = "block"
            }
            else if (rbl == "J") {
                document.getElementById('ContentPlaceHolder1_pnlFiltrosCnpj').style.display = "block"
                document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCpf').value = "";
                document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCnpj').value = "";
                document.getElementById('ContentPlaceHolder1_pnlFiltrosCpf').style.display = "none"
            }
            else if (rbl == "I") {
                document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCpf').value = "";
                document.getElementById('ContentPlaceHolder1_pnlFiltrosCpf').style.display = "none"
                document.getElementById('ContentPlaceHolder1_pnlFiltrosCnpj').style.display = "none"
                document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCnpj').value = "";
            }
        }

    </script>
    <%-- CONTROLE ALERT --%>
    <CtlAlert:ControlAlert ID="CtlAlert" runat="server" />

    <asp:UpdatePanel ID="uppCadastroClienteWF" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlCadastroClienteWF" runat="server">
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroClienteWF">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <asp:Panel runat="server" ID="pnlDados" Visible="false">
                    <div class="navegacao">
                        <div class="boxPesquisa">
                            <asp:Button runat="server" ID="btnForcarIntegracao" SkinID="ButtonLeft" Text="Forçar Integração" OnClick="btnForcarIntegracao_Click" />
                            <asp:Button runat="server" ID="btnSalvar" SkinID="ButtonCenterSave" OnClick="btn_salvar_Click" ValidationGroup="Validacao" />
                            <asp:Button runat="server" ID="btnLimparFormularioCliente" SkinID="ButtonCenterClean" OnClick="btnLimparFormularioCliente_Click" />
                            <asp:Button runat="server" ID="btnNaoAprovar" ValidationGroup="Validacao" OnClick="btn_naoAprovar_Click" />
                            <asp:Button runat="server" ID="btnVoltar" SkinID="ButtonRightVoltar" OnClick="btn_voltar_Click" />
                        </div>
                    </div>
                    <div style="display: table; width: 100%; height: 100%">
                        <div>
                            <asp:Panel ID="pnlRbl" runat="server" CssClass="tabStripContainer">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                    RepeatLayout="Flow" AutoPostBack="True" SkinID="radioAbas" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                    <asp:ListItem Text="<%$ Resources:Resource, lblInformacoesGerais %>" Selected="True" />
                                    <asp:ListItem Text="<%$ Resources:Resource, lblEndereco %>" />
                                    <asp:ListItem Text="<%$ Resources:Resource, lblContato %>" />
                                    <%--<asp:ListItem Text="<%$ Resources:Resource, lblTipoPedido %>"   />--%>
                                    <asp:ListItem Text="<%$ Resources:Resource, lblDocumentos %>" />
                                    <asp:ListItem Text="<%$ Resources:Resource, lblFiscal%>" />
                                    <asp:ListItem Text="<%$ Resources:Resource, lblFinanceiro %>" />
                                    <asp:ListItem Text="<%$ Resources:Resource, lblGrupoRestritos %>" />
                                    <asp:ListItem Text="SAC" />
                                </asp:RadioButtonList>
                            </asp:Panel>
                        </div>
                        <%--Painel para selecionar o tipo de cliente--%>
                        <div style="width: 98%; height: 40px; display: table; position: absolute; _position: fixed; z-index: 1; left: 1%; margin-top: 3px;">
                            <asp:Panel ID="pnlTipoCliente" runat="server">
                                <fieldset>
                                    <div class="line">
                                        <div class="line_itens_left">
                                            <asp:Label ID="lblTipoCliente" runat="server" SkinID="LabelForm" />
                                        </div>
                                        <div class="line_itens" style="width: 400px;">
                                            <asp:RadioButtonList ID="rbClienteTipoPessoa" runat="server" RepeatDirection="Horizontal"
                                                TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="rbClienteTipoPessoa_SelectedIndexChanged">
                                                <asp:ListItem Value="J" Text="<%$ Resources:Resource, lblTipoPessoaJuridica %>" Selected="True" />
                                                <asp:ListItem Value="F" Text="<%$ Resources:Resource, lblTipoPessoaFisica %>" />
                                                <asp:ListItem Value="E" Text="<%$ Resources:Resource, lblTipoPessoaEstrangeira %>" />
                                            </asp:RadioButtonList>
                                        </div>
                                        <div class="line_itens">
                                            <asp:ImageButton ID="imbAcessaSac" Visible="false" runat="server" Width="25px" Height="25px" ToolTip="<%$ Resources:Resource, lblSac %>"
                                                ImageAlign="AbsMiddle" TabIndex="2" ImageUrl="~/Imagens/sac.png" />
                                            <asp:ImageButton ID="imgHistoricoSac" runat="server" Width="20px" Height="20px" ToolTip="<%$ Resources:Resource, lblHistSac %>"
                                                ImageAlign="AbsMiddle" TabIndex="3" ImageUrl="~/Imagens/HistSac.png" OnClick="imgHistoricoSac_Click" />

                                            <asp:ImageButton ID="imbSaldoConsignado" runat="server" Width="25px" Height="25px" Visible="true" ToolTip="<%$ Resources:Resource, lblSaldoConsig %>"
                                                ImageAlign="AbsMiddle" TabIndex="4" ImageUrl="~/Imagens/estoque.png" OnClick="imbSaldoConsignado_Click" />
                                        </div>

                                    </div>
                                </fieldset>
                            </asp:Panel>
                        </div>

                        <%--ABA INFORMAÇÕES GERAIS--%>
                        <asp:Panel ID="pnlInformacoesGerais" runat="server" CssClass="tabStripPanel" Width="100%"
                            Height="550px">


                            <div style="width: 99%; display: table; left: 0%; height: 100%; z-index: 0;">
                                <fieldset style="margin-top: 30px; height: 4%;">
                                    <div class="line">
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
                                <fieldset style="height: 5%; width: 100%;">
                                    <div style="height: 100%; overflow-x: none; overflow-y: none;">
                                        <asp:Panel ID="Panel7" runat="server">
                                            <%--   <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                                <asp:Label ID="lblGRPCM" runat="server" SkinID="LabelForm" />
                                                            </div>--%>
                                            <%--<div style="width: 5%; display: table-cell; text-align: left; vertical-align: middle;">
                                                                <asp:CheckBox ID="chkGRPCM" runat="server" Font-Bold="true" TabIndex="8" Enabled="false" />
                                                            </div>--%>
                                            <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblRGSAP" runat="server" Style="display: inline-block; width: 150px;" />
                                            </div>
                                            <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                <asp:CheckBox ID="chkRGSAP" runat="server" Font-Bold="true" TabIndex="8" Enabled="false" />
                                            </div>
                                            <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblOPPIX" runat="server" Style="display: inline-block; width: 150px;" />
                                            </div>
                                            <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                <asp:CheckBox ID="chkOPPIX" runat="server" Font-Bold="true" Enabled="false" />
                                            </div>
                                              <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblTRPIX" runat="server" Style="display: inline-block; width: 150px;" />
                                            </div>
                                               <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                   <asp:Label ID="lblTRPIXValor" runat="server" ForeColor="Blue" />
                                            </div>
                                                 <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblLaudo" runat="server" Style="display: inline-block; width: 150px;" />
                                            </div>
                                            <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                <asp:CheckBox ID="chkLaudo" runat="server" Font-Bold="true" Enabled="false" />
                                            </div>
                                                 <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblTermometro" runat="server" Style="display: inline-block; width: 150px;" />
                                            </div>
                                            <div style="width: 8%; display: table-cell; text-align: left; vertical-align: middle;">
                                                <asp:CheckBox ID="chkTermometro" runat="server" Font-Bold="true" Enabled="false" />
                                            </div>
                                            <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                   <asp:Label ID="lblCNAE" runat="server" SkinID="LabelForm" />
                                            </div>
                                               <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                   <asp:Label ID="lblCNAETexto" runat="server" SkinID="LabelResposta" />
                                            </div>
                                     
                                        </asp:Panel>
                                    </div>
                                </fieldset>

                                <fieldset style="margin-top: 10px; height: 100%;">

                                    <div style="width: 40%; display: table-cell; vertical-align: top;">
                                        <asp:Panel ID="pnlDadosEsquerda" runat="server">
                                            <div class="alert_bottom_button">
                                                <ol>
                                                    <li>
                                                        <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 400px;">
                                                            <asp:Label ID="lblMotivoIntegracao" runat="server" SkinID="LabelForm" />

                                                            <asp:Label ID="lblMotivoIntegracaoTexto" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <asp:Label ID="lblClienteId" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblClienteIdTexto" runat="server" SkinID="LabelResposta" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblClienteIdERP" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblClienteIdERPTexto" runat="server" SkinID="LabelResposta" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteRazaoSocial" runat="server" SkinID="LabelForm" />
                                                        <asp:TextBox ID="txtDadosClienteRazaoSocial" runat="server" MaxLength="50" TabIndex="3" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteCNPJ" runat="server" SkinID="LabelForm" />
                                                        <asp:TextBox ID="txtDadosClienteCNPJ" runat="server" MaxLength="20" AutoPostBack="true"
                                                            TabIndex="4" OnTextChanged="txtDadosClienteCNPJ_TextChanged" />
                                                    </li>
                                                    <li>
                                                        <%--campo CPF usado como RNE em caso de cliente estrangeiro--%>
                                                        <asp:Label ID="lblDadosClienteCPF" runat="server" SkinID="LabelForm" />
                                                        <asp:TextBox ID="txtDadosClienteCPF" runat="server" MaxLength="14" TabIndex="4" AutoPostBack="true"
                                                            OnTextChanged="txtDadosClienteCPF_TextChanged" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteRG" runat="server" SkinID="LabelForm" />
                                                        <asp:TextBox ID="txtDadosClienteRG" runat="server" MaxLength="20" TabIndex="5" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteRGOrgao" runat="server" SkinID="LabelForm" />
                                                        <asp:TextBox ID="txtDadosClienteRGOrgao" runat="server" MaxLength="20" TabIndex="6"
                                                            SkinID="Data" />
                                                    </li>
                                                    <li id="DadosClienteRGDataEmissao" runat="server">
                                                        <div class="line">
                                                            <asp:Panel ID="Panel1" runat="server">
                                                                <div class="line_itens_left">
                                                                    <asp:Label ID="lblDadosClienteRGDataEmissao" runat="server" SkinID="LabelForm" />
                                                                </div>
                                                                <div class="line_itens">
                                                                    <CtlData:ControlData ID="CtlClienteRGDataEmissao" runat="server" TabIndex="7" TabIndexBtn="8" />
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteCategoria" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddDadosClienteCategoria" runat="server" TabIndex="8" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteMercado" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddDadosClienteMercado" runat="server" TabIndex="9" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteNomeAbrev" runat="server" SkinID="LabelForm" />
                                                        <asp:TextBox ID="txtDadosClienteNomeAbrev" runat="server" TabIndex="10" MaxLength="12"
                                                            AutoPostBack="true" OnTextChanged="txtDadosClienteNomeAbrev_TextChanged" />
                                                    </li>
                                                    <li>
                                                        <asp:Panel ID="panelMatriz" runat="server" DefaultButton="imbDadosMatrizBusca">
                                                            <asp:Label ID="lblDadosClienteNomeMatriz" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteNomeMatriz" runat="server" TabIndex="11" MaxLength="12" />
                                                            <asp:ImageButton ID="imbDadosMatrizBusca" runat="server" Width="25px" Height="25px"
                                                                ImageAlign="AbsMiddle" TabIndex="12" ImageUrl="~/Imagens/find.png" OnClick="imbDadosMatrizBusca_Click" />
                                                        </asp:Panel>
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="Label9" runat="server" SkinID="LabelForm" Text="Tipo Boleto" />
                                                        <asp:DropDownList ID="ddlTipoBoleto" runat="server" TabIndex="19">
                                                            <asp:ListItem Value="0" Text="Selecione..." />
                                                            <asp:ListItem Value="1" Text="1-Mail" />
                                                            <asp:ListItem Value="2" Text="2-Impressao" Selected="True" />
                                                            <asp:ListItem Value="3" Text="3-Ambos" />
                                                        </asp:DropDownList>
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteCanalVenda" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddDadosClienteCanalVenda" runat="server" TabIndex="13" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteGrupoComercial" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddlDadosClienteGrupoComercial" runat="server" TabIndex="14" />
                                                    </li>
                                                    <li style="display: none;">
                                                        <asp:Label ID="lblDadosClienteCondicaoPagamento" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddDadosClienteCondicaoPagamento" runat="server" TabIndex="15" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteRepresentante" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddDadosClienteRepresentante" runat="server" TabIndex="16" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblClienteOperadorPadraoId" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddlClienteOperadorPadraoId" runat="server" TabIndex="17" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteTransportadora" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddlDadosClienteTransportadora" runat="server" TabIndex="18" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteEmiteBoleto" runat="server" SkinID="LabelForm" />
                                                        <asp:CheckBox ID="cbDadosClienetEmiteBoleto" runat="server" TabIndex="18" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblVendaES" runat="server" SkinID="LabelForm" />
                                                        <asp:CheckBox ID="chkVendaES" runat="server" Font-Bold="true" TabIndex="8" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblAutorizacaoEspecial" runat="server" SkinID="LabelForm" />
                                                        <asp:CheckBox ID="chkAutorizacaoEspecial" runat="server" Font-Bold="true" TabIndex="8" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblRemConsig" runat="server" SkinID="LabelForm" />
                                                        <asp:CheckBox ID="chkRemConsig" runat="server" Font-Bold="true" TabIndex="8" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblOperadora" runat="server" SkinID="LabelForm" />
                                                        <asp:CheckBox ID="chkOperadora" runat="server" Font-Bold="true" TabIndex="8" />
                                                    </li>

                                                </ol>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div style="width: 30%; display: table-cell; vertical-align: top;">
                                        <asp:Panel ID="pnlDadosDireita" runat="server">
                                            <div class="alert_bottom_button">
                                                <div id="pnlEmails" runat="server">
                                                    <ol>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteEmailComercial" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteEmailComercial" runat="server" TabIndex="19" />
                                                        </li>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteEmailNFE" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteEmailNFE" runat="server" MaxLength="50" TabIndex="19" />
                                                        </li>
                                                        <li>
                                                            <asp:Label ID="lblDadosMailBloqueto" runat="server" SkinID="LabelForm" Text="E-Mail Boleto" />
                                                            <asp:TextBox ID="txtMailBloqueto" runat="server" TabIndex="19" />
                                                        </li>

                                                    </ol>
                                                </div>
                                                <div id="pnlInfoGeraisContatos" runat="server" visible="false">
                                                    <ol>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteEmail2" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteEmail2" runat="server" TabIndex="10" />
                                                        </li>

                                                        <li>
                                                            <asp:Label ID="lblDadosClienteTelefone1" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteTelefone1" runat="server" MaxLength="50" TabIndex="11" SkinID="Data" />
                                                            <asp:Label ID="lblDadosClienteRamal1" runat="server" />
                                                            <asp:TextBox ID="txtDadosClienteRamal1" runat="server" MaxLength="10" TabIndex="12" Width="70" />
                                                        </li>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteTelefone2" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteTelefone2" runat="server" MaxLength="50" TabIndex="13" SkinID="Data" />
                                                            <asp:Label ID="lblDadosClienteRamal2" runat="server" />
                                                            <asp:TextBox ID="txtDadosClienteRamal2" runat="server" MaxLength="10" TabIndex="14" Width="70" />
                                                        </li>
                                                    </ol>
                                                </div>
                                                <div runat="server">
                                                    <ol>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteNomePaciente" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteNomePaciente" runat="server" TabIndex="18" MaxLength="50" />
                                                        </li>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteNomeResponsavel" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteNomeResponsavel" runat="server" TabIndex="19" MaxLength="50" />
                                                        </li>
                                                        <li>
                                                            <asp:Label ID="lblDadosClientePosologia" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClientePosologia" runat="server" TabIndex="20" MaxLength="50" />
                                                        </li>
                                                    </ol>
                                                </div>
                                                <div>
                                                    <ol>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteInscricaoMunicipal" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteInscricaoMunicipal" runat="server" MaxLength="50" TabIndex="21" />
                                                        </li>
                                                        <li>
                                                            <asp:UpdatePanel ID="pnlIE" runat="server" UpdateMode="Conditional">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="cbDadosClienteIEIsento" EventName="CheckedChanged" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <asp:Label ID="lblDadosClienteIE" runat="server" SkinID="LabelForm" />
                                                                    <asp:TextBox ID="txtDadosClienteIE" runat="server" MaxLength="50"
                                                                        Width="170px" Style="margin: 0 10px 0 0" />
                                                                    <asp:CheckBox ID="cbDadosClienteIEIsento" runat="server" AutoPostBack="True"
                                                                        OnCheckedChanged="cbDadosClientesIEIsento_CheckedChanged" />
                                                                    <asp:Label ID="lblDadosClienteIEIsento" runat="server" Width="25px" Height="25px" />
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </li>
                                                        <li>
                                                            <asp:Panel ID="pnlMedicoPrescritor" runat="server" DefaultButton="imbMedicoCheck">
                                                                <asp:Label ID="lblMedicoPrescritor" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtMedicoPrescritor" runat="server" SkinID="Pedido" MaxLength="50" TabIndex="24" />
                                                                <asp:HiddenField ID="hdfMedicoRepresentanteId" runat="server" Value="true" Visible="false" />
                                                                <asp:ImageButton ID="imbMedicoCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                    TabIndex="25" ImageUrl="~/Imagens/check.png" OnClick="imbMedicoCheck_Click" />
                                                                <asp:ImageButton ID="imbMedicoBusca" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                    TabIndex="26" ImageUrl="~/Imagens/find.png" OnClick="imbMedicoBusca_Click" />
                                                                <%--<asp:Label ID="lblMedicoPrescritorNome" runat="server" SkinID="LabelResposta" />--%>
                                                                <asp:HiddenField ID="hdfCRMMedico" runat="server" Value="true" Visible="false" />
                                                            </asp:Panel>
                                                        </li>
                                                        <li style="text-align: right;">
                                                            <asp:Label ID="lblMedicoPrescritorNome" runat="server" SkinID="LabelResposta" />
                                                        </li>
                                                        <li>
                                                            <div class="line">
                                                                <div class="line_itens_left">
                                                                    <asp:Label ID="lblDadosClienteObservacao" runat="server" SkinID="LabelForm" />
                                                                </div>
                                                                <div class="line_itens">
                                                                    <asp:TextBox ID="txtDadosClienteObservacao" runat="server" MaxLength="500" TabIndex="27" TextMode="MultiLine" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="line">
                                                                <div class="line_itens_left">
                                                                    <asp:Label ID="lblClienteInfoAtendentes" runat="server" SkinID="LabelForm" />
                                                                </div>
                                                                <div class="line_itens">
                                                                    <asp:TextBox ID="txtClienteInfoAtendentes" runat="server" MaxLength="150" TabIndex="28" TextMode="MultiLine" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li style="margin-bottom: 2px;">
                                                            <asp:Label ID="lblUsuarioCadastraNome" runat="server" SkinID="LabelForm" />
                                                            <asp:Label ID="lblUsuarioCadastraNomeTexto" runat="server" SkinID="LabelResposta" />
                                                        </li>
                                                        <li style="margin-bottom: 2px;">
                                                            <asp:Label ID="lblDataCadastro" runat="server" SkinID="LabelForm" />
                                                            <asp:Label ID="lblDataCadastroTexto" runat="server" SkinID="LabelResposta" />
                                                        </li>
                                                        <li style="margin-bottom: 2px;">
                                                            <asp:Label ID="lblUsuarioAlteraCadastroNome" runat="server" SkinID="LabelForm" />
                                                            <asp:Label ID="lblUsuarioAlteraCadastroNomeTexto" runat="server" SkinID="LabelResposta" />
                                                        </li>
                                                        <li style="margin-bottom: 2px;">
                                                            <asp:Label ID="lblDataCadastroAlteracao" runat="server" SkinID="LabelForm" />
                                                            <asp:Label ID="lblDataCadastroAlteracaoTexto" runat="server" SkinID="LabelResposta" />
                                                        </li>
                                                        
                                                    </ol>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div style="width: 30%; height: 100%; display: table-cell; vertical-align: top;">
                                        <asp:Panel ID="pnlCondicoesPagamento" Height="100%" runat="server">
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <ol>
                                                    <li>
                                                        <asp:ImageButton ID="imbCondicoesPgto" runat="server"
                                                            Width="25px" Height="25px"
                                                            ImageAlign="AbsMiddle"
                                                            ToolTip="<%$ Resources:Resource, lblCondicoesPagamento %>"
                                                            ImageUrl="~/Imagens/find.png"
                                                            OnClick="imbCondicoesPgto_Click" />
                                                        <asp:Label ID="lbCondicoesPgto" runat="server" Text="<%$ Resources:Resource, lblCondicoesPagamento %>" />
                                                    </li>
                                                </ol>
                                            </div>
                                            <div style="display: table; width: 100%; height: 300px;">
                                                <fieldset style="height: 100%;">
                                                    <div style="width: 100%; height: 290px; overflow-x: none; overflow-y: scroll;">
                                                        <center />

                                                        <asp:GridView ID="gvCondicoesPgto" runat="server"
                                                            DataKeyNames="clienteId,condicaoPagamentoId"
                                                            OnRowCommand="gvCondicoesPgto_RowCommand"
                                                            OnRowDataBound="gvCondicoesPgto_RowDataBound"
                                                            OnPageIndexChanging="gvCondicoesPgto_PageIndexChanging"
                                                            OnRowDeleting="gvCondicoesPgto_RowDeleting">
                                                            <Columns>
                                                                <asp:BoundField DataField="condicaoPagamentoId" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField DataField="condicaoPagamentoDescricao" />
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbDelete" runat="server"
                                                                            SkinID="ImgGrid"
                                                                            CommandName="Delete"
                                                                            CommandArgument='<%# Eval("condicaoPagamentoId") %>'
                                                                            ImageUrl="~/Imagens/_trash.png" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                        </asp:GridView>

                                                    </div>
                                                </fieldset>
                                            </div>
                                        </asp:Panel>
                                    </div>

                                    <div style="left: 1%; width: 100%; height: 35%; top: 3%; display: table;">
                                        <div style="left: 0%; display: table-row;">
                                            <center />
                                            <asp:Panel ID="pnlInfoSap" runat="server">
                                                <fieldset style="height: 32%; width: 95.7%;">
                                                    <div style="height: 100%; overflow-x: none; overflow-y: none;">
                                                        <div style="width: 9%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblBloqAudicon" runat="server" />
                                                        </div>
                                                        <div style="width: 3%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkBloqAudicon" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>
                                                        <div style="width: 9%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblAutorizaVacinas" runat="server" />
                                                        </div>
                                                        <div style="width: 3%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkAutorizaVacinas" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>
                                                        <div style="width: 9%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblAutorizaRetinoide" runat="server" />
                                                        </div>
                                                        <div style="width: 3%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkAutorizaRetinoide" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>
                                                        <%-- <div style="width: 10%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblBloqMisoprostol" runat="server" />
                                                        </div>
                                                        <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkBloqMisoprostol" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>--%>
                                                        <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblBloqFinanceiro" runat="server" />
                                                        </div>

                                                        <div style="width: 8%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkBloqFinanceiro" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>
                                                        <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblAutorizaPsico" runat="server" />
                                                        </div>
                                                        <div style="width: 3%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkAutorizaPsico" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>
                                                        <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblAutorizaMedic" runat="server" />
                                                        </div>
                                                        <div style="width: 3%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkAutorizaMedic" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>
                                                        <%--  <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblAutorizaAntibiotico" runat="server" />
                                                        </div>
                                                        <div style="width: 3%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkAutorizaAntibiotico" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>
                                                         <div style="width: 10%; display: table-cell; text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="lblAutorizaImunosupressor" runat="server" />
                                                        </div>
                                                        <div style="width: 3%; display: table-cell; text-align: left; vertical-align: middle;">
                                                            <asp:CheckBox ID="chkAutorizaImunosupressor" Font-Bold="true" runat="server" Enabled="false" />
                                                        </div>--%>
                                                    </div>
                                                </fieldset>
                                                <fieldset style="height: 32%; width: 95.7%;">
                                                    <div style="height: 100%; overflow-x: none; overflow-y: none;">
                                                        <asp:Panel ID="pnlAceite" runat="server" Visible="false">
                                                            <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                                <asp:Label ID="lblAceiteLGPD" runat="server" SkinID="LabelForm" />
                                                            </div>
                                                            <div style="width: 5%; display: table-cell; text-align: left; vertical-align: middle;">
                                                                <asp:CheckBox ID="chkAceiteLGPD" runat="server" Font-Bold="true" TabIndex="8" Enabled="false" />
                                                            </div>
                                                            <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                                <asp:Label ID="lblDataHoraAceite" runat="server" />
                                                            </div>
                                                            <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                                <asp:Label ID="lblDataHoraAceiteValue" runat="server" ForeColor="Blue" />
                                                            </div>
                                                            <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                                <asp:Label ID="lblIPCliente" runat="server" />
                                                            </div>
                                                            <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                                <asp:Label ID="lblIPClienteValue" runat="server" ForeColor="Blue" />
                                                            </div>
                                                            <div style="width: 8%; display: table-cell; text-align: left; vertical-align: middle;">
                                                                <asp:ImageButton ID="btnEnviaAceiteLGPD" runat="server" Width="35px" Height="35px" Visible="false" ToolTip="<%$ Resources:Resource, lblEmailAceiteLGPD %>"
                                                                    ImageAlign="AbsMiddle" TabIndex="4" ImageUrl="~/Imagens/SendEmail.png" OnClick="btnEnviaAceiteLGPD_Click" />
                                                            </div>
                                                            <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                                <asp:Label ID="lblDataEnvioLGPD" runat="server" />
                                                            </div>
                                                            <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                                <asp:Label ID="lblDataEnvioLGPDValue" runat="server" ForeColor="Blue" />
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </fieldset>
                                                <fieldset style="height: 5%; width: 100%;">
                                                    <div style="height: 100%; overflow-x: none; overflow-y: none;">
                                                        <asp:Panel ID="Panel8" runat="server">

                                                            <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                                <asp:Label ID="lblFLIMU" runat="server" />
                                                            </div>
                                                            <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                                <asp:CheckBox ID="chkFLIMU" runat="server" Font-Bold="true" TabIndex="8" Enabled="false" />
                                                            </div>
                                                            <div style="width: 8%; display: table-cell; text-align: right; vertical-align: middle;">
                                                                <asp:Label ID="lblFLANT" runat="server" />
                                                            </div>
                                                            <div style="width: 10%; display: table-cell; text-align: left; vertical-align: middle;">
                                                                <asp:CheckBox ID="chkFLANT" runat="server" Font-Bold="true" TabIndex="8" Enabled="false" />
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </fieldset>

                                            </asp:Panel>
                                        </div>
                                    </div>



                                    <div style="left: 1%; width: 100%; height: 35%; top: 3%; display: table;">
                                        <div style="left: 0%; display: table-row;">
                                            <center />
                                            <asp:Panel ID="pnlAceiteLGPD" runat="server">
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </asp:Panel>
                        <%--PESQUISA MATRIZ / aba informações gerais--%>
                        <div style="position: absolute; width: 100%; height: 20%;">
                            <asp:Panel ID="upMatriz" runat="server">
                                <asp:Panel ID="pnlBuscaMatriz" runat="server" DefaultButton="btnFiltroPesquisar" SkinID="PnlPopUp" Visible="false">
                                    <div class="OpacityBackGround">
                                    </div>
                                    <div class="painel">
                                        <div class="painel_header">
                                            <div class="painel_header_message">
                                                <asp:Label ID="lblMatrizHeader" runat="server" ForeColor="White" />
                                            </div>
                                            <div class="alert_header_icon">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                                    Height="25px" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosMatrizClose_Click" />
                                            </div>
                                        </div>
                                        <div class="painel_body">
                                            <fieldset>
                                                <%-- FILTROS MATRIZ --%>
                                                <div class="navegacao">
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroClienteId" runat="server" />
                                                        <asp:TextBox ID="txtFiltroClienteId" runat="server" SkinID="Filtro" MaxLength="50"
                                                            TabIndex="10" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroClienteIdERP" runat="server" />
                                                        <asp:TextBox ID="txtFiltroClienteIdERP" runat="server" SkinID="Filtro" MaxLength="50"
                                                            TabIndex="10" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroClienteRazaoSocial" runat="server" />
                                                        <asp:TextBox ID="txtFiltroClienteRazaoSocial" runat="server" SkinID="Filtro" MaxLength="50"
                                                            TabIndex="11" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroClienteCNPJ" runat="server" />
                                                        <asp:TextBox ID="txtFiltroClienteCNPJ" runat="server" SkinID="Filtro" MaxLength="50"
                                                            TabIndex="13" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <div class="line">
                                                            <asp:Button ID="btnFiltroPesquisar" runat="server" SkinID="ButtonLeft" TabIndex="14"
                                                                OnClick="btnFiltroMatrizPesquisar_Click" />
                                                            <asp:Button ID="btnFiltroLimpar" runat="server" SkinID="ButtonRight" TabIndex="15"
                                                                OnClick="btnFiltroMatrizLimpar_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <%-- GRID REGISTROS MATRIZ --%>
                                                <div class="gridRegistros">
                                                    <asp:GridView ID="gvRegistrosMatriz" runat="server" TabIndex="16" DataKeyNames="clienteId,clienteRazaoSocial,ClienteCNPJ"
                                                        OnPageIndexChanging="gvRegistrosMatriz_PageIndexChanging" OnRowCommand="gvRegistrosMatriz_RowCommand"
                                                        OnRowDataBound="gvRegistrosMatriz_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="200px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrClienteId" runat="server" Text='<%# FormataStringSaida(Eval("clienteId"), txtFiltroClienteId.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="200px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltroClienteRazaoSocial.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrClienteCNPJ" runat="server" Text='<%# FormataStringSaida(Eval("clienteCNPJ"), txtFiltroClienteCNPJ.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                                                ItemStyle-Width="70px">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imbSelect" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                        ImageUrl="~/Imagens/check.png" CommandName="Select" CommandArgument='<%# Eval("clienteId") + "|" + ((GridViewRow)Container).RowIndex %>' />
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
                            </asp:Panel>
                        </div>
                        <%--PESQUISA MEDICO / aba informações gerais --%>
                        <div style="position: absolute;">
                            <asp:UpdatePanel ID="UppMedico" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="imbMedicoBusca" EventName="Click" />
                                </Triggers>
                                <ContentTemplate>
                                    <asp:Panel ID="pnlBuscaMedico" runat="server" Visible="false">
                                        <div class="OpacityBackGround">
                                        </div>
                                        <div class="painel">
                                            <div class="painel_header">
                                                <div class="painel_header_message">
                                                    <asp:Label ID="Label2" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblClienteMedicos %>" />
                                                </div>
                                                <div class="alert_header_icon">
                                                    <asp:ImageButton ID="imbFiltrosMedicoClose" runat="server"
                                                        ImageAlign="AbsMiddle"
                                                        ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                        Width="25px" Height="25px"
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
                                                            <div class="boxPesquisa">
                                                                <asp:Label ID="lblFiltroMedicoCrm" runat="server" />
                                                                <asp:TextBox ID="txtFiltroMedicoCrm" runat="server" SkinID="Filtro" MaxLength="30"
                                                                    TabIndex="40" />
                                                            </div>
                                                            <div class="boxPesquisa">
                                                                <asp:Label ID="lblFiltroMedicoNome" runat="server" />
                                                                <asp:TextBox ID="txtFiltroMedicoNome" SkinID="Filtro" runat="server" MaxLength="50"
                                                                    TabIndex="41" />
                                                            </div>
                                                            <div class="boxPesquisa">
                                                                <asp:Label ID="lblFiltroMedicoPais" runat="server" />
                                                                <asp:DropDownList ID="ddFiltroMedicoPais" runat="server" TabIndex="42" AutoPostBack="True"
                                                                    SkinID="DropFiltro" OnSelectedIndexChanged="ddFiltrosMedicoPais_SelectedIndexChanged" />
                                                            </div>
                                                            <div class="boxPesquisa">
                                                                <asp:Label ID="lblFiltroMedicoUf" runat="server" />
                                                                <asp:DropDownList ID="ddFiltroMedicoUf" SkinID="DropFiltro" runat="server" TabIndex="43" />
                                                            </div>
                                                            <div class="boxPesquisa">
                                                                <asp:CheckBox ID="chkFiltroMedicoBloqueado" runat="server"
                                                                    TextAlign="Right" Font-Bold="true"
                                                                    TabIndex="12"
                                                                    Text="<%$ Resources:Resource, lblMostrarBloqueados %>" />
                                                            </div>
                                                            <div class="boxPesquisa">
                                                                <div class="line">
                                                                    <asp:Button ID="btnFiltrosMedicoPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="44"
                                                                        OnClick="btnFiltrosMedicoPesquisa_Click" />
                                                                    <asp:Button ID="btnFiltrosMedicoLimpar" runat="server" SkinID="ButtonCenter" TabIndex="45"
                                                                        OnClick="btnFiltrosMedicoLimpar_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%-- GRID REGISTROS --%>
                                                        <div class="gridRegistros">
                                                            <asp:GridView ID="gvRegistrosMedico" runat="server" DataKeyNames="medicoId,medicoNome,paisId,paisNome,ufId,estadoNome,medicoMedico,medicoRG,medicoCRM
                                                                ,medicoUFidCRM,medicoEspecialidade1,medicoEspecialidade2,medicoDtNascto,medicoSexo
                                                                ,medicoCEPCom,medicoEnderecoCom,medicoBairroCom,medicoMunicCom,medicoDDD,medicoFax
                                                                ,medicoTelCom1,medicoDDD2,medicoTelCom2,medicoDDD4,medicoTelCelular,medicoEmail1
                                                                ,medicoEmail2,medicoDtInclusao,medicoDtAlteracao,medicoDiaAniversario,medicoMesAniversario
                                                                ,medicoConsProfissional,medicoObservacao,medicoEspecialidadeId1,medicoEspecialidadeId2, representanteId"
                                                                OnPageIndexChanging="gvMedicoPesquisa_PageIndexChanging" OnRowCommand="gvMedicoPesquisa_RowCommand"
                                                                OnRowDataBound="gvMedicoPesquisa_RowDataBound">
                                                                <Columns>
                                                                    <asp:BoundField DataField="medicoId" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                                                    <asp:TemplateField ItemStyle-Width="100px">
                                                                        <ItemTemplate>
                                                                            <asp:Literal ID="ltrMedicoCRM" runat="server" Text='<%# FormataStringSaida(Eval("medicoCrm"), txtFiltroMedicoCrm.Text) %>' />
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
                                                                                SkinID="ImgGrid"
                                                                                CommandName="Select"
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
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <%--ABA ENDEREÇO--%>
                        <asp:Panel ID="pnlEndereco" runat="server" CssClass="tabStripPanel" Height="500px">
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
                                                    <asp:TextBox ID="txtDadosClienteTipoEndereco" runat="server" MaxLength="12" TabIndex="60" />
                                                </li>
                                                <li>
                                                    <asp:Panel ID="pnlCep" runat="server" DefaultButton="imbBuscaCep">
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
                                                    <asp:Label ID="lblDadosClienteWfEnderecoExemploPadrao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblDadosClienteWfEnderecoExemploPadraoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Panel ID="pnlGetRepresentante" runat="server" DefaultButton="imbCheckRepresentante">
                                                        <asp:Label ID="lblRepresentanteIdBody" runat="server" SkinID="LabelForm" />
                                                        <asp:TextBox ID="txtRepresentanteIdBody" runat="server" SkinID="Data" MaxLength="5" />
                                                        <asp:ImageButton ID="imbCheckRepresentante" runat="server"
                                                            Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                            ImageUrl="~/Imagens/check.png"
                                                            ToolTip="<%$ Resources:Resource, lblBuscar %>"
                                                            OnClick="imbCheckRepresentante_Click" />
                                                        <asp:ImageButton ID="imbBuscaRepresentante" runat="server"
                                                            Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                            ImageUrl="~/Imagens/find.png"
                                                            ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                            OnClick="imbBuscaRepresentante_Click" />
                                                    </asp:Panel>
                                                </li>
                                                <li>
                                                    <div style="margin-left: 150px;">
                                                        <asp:Label ID="lblRepresentanteDescricao" runat="server" SkinID="LabelResposta" />
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblDadosClienteWfEnderecoNumero" runat="server" SkinID="LabelForm" Visible="false" />
                                                    <asp:TextBox ID="txtDadosClienteWfEnderecoNumero" runat="server" MaxLength="30" SkinID="Pedido" Visible="false"
                                                        TabIndex="63" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblDadosClienteWfEnderecoComplemento" runat="server" SkinID="LabelForm" Visible="false" />
                                                    <asp:TextBox ID="txtDadosClienteWfEnderecoComplemento" runat="server" MaxLength="100" Visible="false" TabIndex="64" />
                                                </li>
                                            </ol>
                                        </div>
                                        <div style="width: 60%; display: table-cell;">
                                            <asp:Panel ID="pnlTeste" runat="server">
                                                <ol>

                                                    <li>
                                                        <asp:Label ID="lblDadosClienteWfEnderecoPais" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddlDadosClienteWfEnderecoPais" runat="server" TabIndex="65"
                                                            AutoPostBack="True" OnSelectedIndexChanged="ddDadosClienteEnderecoPais1_SelectedIndexChanged" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteWfEnderecoUf" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddDadosClienteWfEnderecoUf" runat="server" TabIndex="66" />
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
                                                    <li>
                                                        <div class="line">
                                                            <div class="line_itens_left">
                                                                <asp:Label ID="lblDadosClientesWfEnderecoObs1" runat="server" SkinID="LabelForm" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:TextBox ID="txtDadosClientesWfEnderecoObs1" runat="server" MaxLength="500" TabIndex="69" TextMode="MultiLine" />
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <%--<div style="margin-left: 150px; margin-bottom: 10px; margin-top: 10px; display: table; background-color: red;">--%>
                                    <div style="display: table; width: 100%; text-align: center; margin-top: 10px; margin-bottom: 10px;">
                                        <asp:Button ID="btnIncluirEnderecos" runat="server" Text="Incluir" OnClick="btnSalvarEndereco_Click" SkinID="ButtonLeft"
                                            ValidationGroup="ValidacaoEndereco" TabIndex="70" />

                                        <asp:Button ID="btnLimparFormularioEndereco" runat="server" Text="limpar" SkinID="ButtonRight"
                                            OnClick="btnLimparFormularioEnderecos_Click" TabIndex="71" />
                                    </div>
                                    <div style="left: 1%; width: 100%; height: 35%; display: table;">
                                        <div style="left: 0%; display: table-row;">
                                            <center />
                                            <asp:Panel ID="Panel5" runat="server">
                                                <fieldset style="height: 32%; width: 95.7%;">
                                                    <div style="height: 100%; overflow-x: none; overflow-y: scroll;">
                                                        <asp:GridView ID="gvEnderecos" runat="server" DataKeyNames="clienteId,tipoEnderecoId,clienteIdERP,clienteEnderecoSeq
                                                                        ,clienteEndereco,clienteEnderecoNumero,clienteEnderecoComplemento,clienteEnderecoCEP,paisNome
                                                                        ,ufId,clienteEnderecoObservacoes,clienteEnderecoCidade,clienteEnderecoBairro,representanteId,representanteNome"
                                                            SkinID="gvEstoquePaginado" OnRowDeleting="gvEnderecos_RowDeleting" OnPageIndexChanging="gvEnderecos_PageIndexChanging"
                                                            OnRowCommand="gvEnderecos_RowCommand" OnRowDataBound="gvEnderecos_RowDataBound">
                                                            <Columns>
                                                                <asp:BoundField DataField="clienteEnderecoSeq" ItemStyle-HorizontalAlign="Center"
                                                                    ItemStyle-Width="100px" Visible="false" />
                                                                <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrTipoEndereco" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--<asp:BoundField DataField="clienteEnderecoCEP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />--%>
                                                                <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrCep" runat="server"
                                                                            Text='<%# Comom.Utility.FormataDocumentos
                                                                                                (
                                                                                                    Eval("clienteEnderecoCEP").ToString(), 
                                                                                                    Comom.Utility.FormatOption.ApplyMask, 
                                                                                                    Comom.Utility.TipoDocumento.CEP
                                                                                                ) %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="clienteEndereco" ItemStyle-HorizontalAlign="Left" />
                                                                <asp:BoundField DataField="clienteEnderecoNumero" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" Visible="false" />
                                                                <asp:BoundField DataField="clienteEnderecoComplemento" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" Visible="false" />
                                                                <asp:BoundField DataField="clienteEnderecoBairro" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150px" />
                                                                <asp:BoundField DataField="clienteEnderecoCidade" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                                                <asp:BoundField DataField="ufId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                                                <asp:BoundField DataField="paisNome" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="80px" />
                                                                <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Image ID="imbObservacao" runat="server" ImageUrl="~/Imagens/Find.png" Width="25px"
                                                                            Height="25px" ToolTip='<%# Eval("clienteEnderecoObservacoes") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="representanteNome" ItemStyle-Width="150px" />
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" CommandName="Delete"
                                                                            ImageUrl="~/Imagens/_trash.png" ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("clienteEnderecoSeq") + "|" + Eval("clienteId") + "|" + Eval("tipoEnderecoId")  %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbEditar" runat="server"
                                                                            ImageUrl="~/Imagens/find.png"
                                                                            ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                                            CommandName="Editar"
                                                                            SkinID="ImgGrid"
                                                                            Text="<%$ Resources:Resource, lblEditar %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex +  "|" + Eval("clienteId") %>' />
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
                                </fieldset>


                            </asp:Panel>
                        </asp:Panel>
                        <%--ABA DE CONTATOS--%>
                        <asp:Panel ID="pnlContatos" runat="server" CssClass="tabStripPanel" Width="100%"
                            Height="400px">
                            <fieldset style="margin-top: 41px; height: 100%;">
                                <div style="width: 100%; display: table;">
                                    <div style="width: 40%; display: table-cell; z-index: 1;">
                                        <ol>
                                            <li>
                                                <asp:HiddenField ID="hdClienteContatoIndiceGrid" runat="server" />
                                                <asp:HiddenField ID="hdClienteContatoClienteId" runat="server" />
                                                <asp:HiddenField ID="hdClienteContatoContatoSeq" runat="server" />
                                                <asp:HiddenField ID="hdClienteContatoContatoClienteIdErp" runat="server" />
                                                <asp:Label ID="lblclienteArea" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtclienteArea" runat="server" TabIndex="80" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblClienteContatoNome" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtClienteContatoNome" runat="server" TabIndex="81" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblClienteContatoEmail" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtClienteContatoEmail" runat="server" TabIndex="82" />
                                            </li>
                                            <li>
                                                <div class="line">
                                                    <div class="line_itens_left">
                                                        <asp:Label ID="lblClienteContatoObservacoes" runat="server" SkinID="LabelForm" />
                                                    </div>
                                                    <div class="line_itens">
                                                        <asp:TextBox ID="txtClienteContatoObservacoes" runat="server" TabIndex="83" TextMode="MultiLine" />
                                                    </div>
                                                </div>
                                            </li>
                                        </ol>
                                    </div>
                                    <div style="width: 50%; display: table-cell;">
                                        <ol>
                                            <li>
                                                <asp:Label ID="lblClienteContatoTelefone" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtClienteContatoTelefone" runat="server" TabIndex="84" MaxLength="15" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblClienteContatoRamal" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtClienteContatoRamal" runat="server" TabIndex="85" MaxLength="6" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblClienteContatoCelular" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtClienteContatoCelular" runat="server" TabIndex="86" MaxLength="15" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblClienteContatoPrincipal" runat="server" SkinID="LabelForm" />
                                                <asp:CheckBox ID="cbClienteContatoPrincipal" runat="server" TabIndex="87" />
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                                <div style="margin-left: 150px; margin-bottom: 10px; margin-top: 10px;">
                                    <asp:Button ID="btnIncluirContatos" runat="server" Text="Incluir" OnClick="btnSalvarContatos_Click"
                                        ValidationGroup="ValidacaoContato" TabIndex="88" />

                                    <asp:Button ID="btnLimpar" runat="server" Text="limpar" OnClick="btnLimparFormularioContato_Click" TabIndex="89" />
                                </div>
                                <div style="left: 1%; width: 100%; height: 35%; display: table;">
                                    <div style="left: 0%; display: table-row;">
                                        <center />
                                        <asp:Panel ID="pnlGrade" runat="server">
                                            <fieldset style="height: 32%; width: 95.7%;">
                                                <div style="height: 100%; overflow-x: none; overflow-y: scroll;">
                                                    <center />
                                                    <asp:GridView ID="gvContatos" runat="server" DataKeyNames="clienteId,clienteContatoSeq,clienteIdERP 
                                                                    ,clienteArea,clienteContatoNome,clienteContatoEmail,clienteContatoObservacoes,clienteContatoPrincipal
                                                                    ,clienteContatoTelefone,clienteContatoRamal,clienteContatoCelular"
                                                        SkinID="gvEstoquePaginado" OnRowDeleting="gvContatos_RowDeleting" OnPageIndexChanging="gvContatos_PageIndexChanging"
                                                        OnRowCommand="gvContatos_RowCommand" OnRowDataBound="gvContatos_RowDataBound">
                                                        <Columns>
                                                            <asp:BoundField DataField="clienteContatoSeq" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" Visible="false" />
                                                            <asp:BoundField DataField="clienteArea" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="clienteContatoNome" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="clienteContatoEmail" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                            <%--<asp:BoundField DataField="clienteContatoTelefone" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />--%>

                                                            <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrContatoTelefone" runat="server" Text='<%#  Eval("clienteContatoTelefone").ToString().Length > 10?Comom.Utility.FormataTelefone(Eval("clienteContatoTelefone").ToString(), Comom.Utility.FormatOption.ApplyMask, Comom.Utility.TipoTelefone.CELULAR) : Comom.Utility.FormataTelefone(Eval("clienteContatoTelefone").ToString(), Comom.Utility.FormatOption.ApplyMask, Comom.Utility.TipoTelefone.TELEFONE) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="clienteContatoRamal" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                            <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrContatoCelular" runat="server" Text='<%# Comom.Utility.FormataTelefone(Eval("clienteContatoCelular").ToString(), Comom.Utility.FormatOption.ApplyMask, Comom.Utility.TipoTelefone.CELULAR) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <%--<asp:BoundField DataField="clienteContatoCelular" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />--%>




                                                            <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrClienteContatoPrincipal" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="imbObservacao" runat="server" ImageUrl="~/Imagens/Find.png" Width="25px"
                                                                        Height="25px" ToolTip='<%# Eval("clienteContatoObservacoes") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" CommandName="Delete"
                                                                        ImageUrl="~/Imagens/_trash.png" ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                        CommandArgument='<%# Container.DataItemIndex + "|" + Eval("clienteContatoSeq") + "|" + Eval("clienteId") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="imbEditar" runat="server" CommandName="Editar" Text="<%$ Resources:Resource, lblEditar %>"
                                                                        CommandArgument='<%# Container.DataItemIndex +  "|" + Eval("clienteId") %>' />
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
                            </fieldset>
                        </asp:Panel>
                        <%--ABA DE TIPO DE PEDIDO--%>
                        <asp:Panel ID="pnlTipoPedido" runat="server" CssClass="tabStripPanel" Width="100%"
                            Height="500px" Visible="false">
                            <fieldset style="margin-top: 41px; height: 100%; z-index: 1;">
                                <div style="width: 100%; display: table;">
                                    <div style="width: 40%; display: table-cell;">
                                        <ol>
                                            <li>
                                                <asp:Label ID="lblDadosClienteTipoPedido" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddDadosClienteTipoPedido" runat="server" TabIndex="9" />
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                                <div style="margin-left: 150px; margin-bottom: 10px; margin-top: 10px;">
                                    <asp:Button ID="btnIncluirTipoPedido" runat="server" Text="Incluir" OnClick="btnIncluirTipoPedido_Click" />
                                    <asp:Button ID="btnLimparFormularioTipoPedido" runat="server" Text="limpar" OnClick="btnLimparFormularioTipoPedido_Click" />
                                </div>
                                <div style="left: 1%; width: 100%; height: 35%; display: table;">
                                    <div style="left: 0%; display: table-row;">
                                        <center />
                                        <asp:Panel ID="Panel6" runat="server">
                                            <fieldset style="height: 32%; width: 95.7%;">
                                                <div style="height: 100%; overflow-x: none; overflow-y: scroll;">
                                                    <center />
                                                    <asp:GridView ID="gvTipoPedido" runat="server" TabIndex="2" DataKeyNames="tipoPedidoId,tipoPedidoDescricao,tipoPedidotriangular"
                                                        SkinID="gvEstoquePaginado" OnRowDeleting="gvTipoPedido_RowDeleting" OnPageIndexChanging="gvTipoPedido_PageIndexChanging"
                                                        OnRowCommand="gvTipoPedido_RowCommand" OnRowDataBound="gvTipoPedido_RowDataBound">
                                                        <Columns>
                                                            <asp:BoundField DataField="tipoPedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" />
                                                            <asp:BoundField DataField="tipoPedidoDescricao" ItemStyle-HorizontalAlign="Center"
                                                                ItemStyle-Width="100px" />
                                                            <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" CommandName="Delete"
                                                                        ImageUrl="~/Imagens/_trash.png" ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                        CommandArgument='<%# Container.DataItemIndex + "|" + Eval("tipoPedidoId") + "|" + Eval("clienteId") %>' />
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
                            </fieldset>
                        </asp:Panel>

                        <%--ABA DE DOCUMENTOS--%>
                        <asp:UpdatePanel ID="upDocumentos" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnAnexar" />
                            </Triggers>

                            <ContentTemplate>
                                <asp:Panel ID="pnlDocumentos" runat="server" CssClass="tabStripPanel" Width="100%" Height="500px">
                                    <fieldset style="margin-top: 41px; height: 100%; z-index: 1;">
                                        <div style="width: 100%; display: table;">
                                            <div style="width: 50%; display: table-cell;">
                                                <ol>
                                                    <li>
                                                        <asp:Label ID="lblClienteWfDocumentoTipo" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddlClienteWfDocumentoTipo" runat="server" TabIndex="1" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblClienteWfDocumentoNome" runat="server" SkinID="LabelForm" />
                                                        <asp:TextBox ID="txtClienteWfDocumentoNome" runat="server" MaxLength="30" TabIndex="3" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblClienteWfDocumento" runat="server" SkinID="LabelForm" />
                                                        <asp:FileUpload ID="fulClienteWfDocumento" runat="server" TabIndex="4" />
                                                        <%--ucc:AsyncFileUpload ID="fulClienteWfDocumento" runat="server" TabIndex="4" />--%>
                                                        <%--<ucc:AsyncFileUpload ID="fulClienteWfDocumento" runat="server" Width="400px" UploaderStyle="Traditional"
                                                                         UploadingBackColor="#CCFFFF" ThrobberID="myThrobber" />--%>
                                                    </li>
                                                    <li>
                                                        <div class="line">
                                                            <div class="line_itens_left">
                                                                <asp:Label ID="lblClienteDocumentoValidade" runat="server" SkinID="LabelForm" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <CtlData:ControlData ID="CtlClienteDocumentoValidade" runat="server" TabIndex="5" TabIndexBtn="6" />
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="line">
                                                            <div class="line_itens_left">
                                                                <asp:Label ID="lblClienteWfDocumentoObs" runat="server" SkinID="LabelForm" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:TextBox ID="txtClienteWfDocumentoObs" runat="server" MaxLength="500" TextMode="MultiLine" Columns="100" Rows="5" TabIndex="7" />
                                                            </div>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div style="margin-left: 150px;">
                                                            <asp:CheckBox ID="chkClienteWfDocumentoValido" runat="server" Font-Bold="true" TabIndex="8" Enabled="false"
                                                                Text="<%$ Resources:Resource, lblDocumentoValido %>" />
                                                        </div>
                                                    </li>
                                                    <asp:Panel ID="pnlDocumentoObrigatorios" runat="server">
                                                        <li>
                                                            <div style="margin-left: 150px;">
                                                                <asp:CheckBox ID="chkDocumentoObrigatorio" runat="server" Font-Bold="true" TabIndex="8"
                                                                    Text="<%$ Resources:Resource, lblDocumentoObrigatorio %>" />
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="line">
                                                                <div class="line_itens_left">
                                                                    <asp:Label ID="lblTipoAcao" runat="server" SkinID="LabelForm" />
                                                                </div>
                                                                <div class="line_itens">
                                                                    <asp:DropDownList ID="dplTipoAcao" runat="server" TabIndex="1" />
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li>
                                                            <div class="line">
                                                                <div class="line_itens_left">
                                                                    <asp:Label ID="lblMensagemAcao" runat="server" SkinID="LabelForm" />
                                                                </div>
                                                                <div class="line_itens">
                                                                    <asp:TextBox ID="txtMensagemAcao" runat="server" MaxLength="500" TextMode="MultiLine" Columns="100" Rows="5" TabIndex="7" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </asp:Panel>
                                                    <li>
                                                        <div style="width: 100%; text-align: center;">
                                                            <%--<asp:Button ID="btnAnexar" runat="server" ValidationGroup="Validacao" OnClick="btnAnexar_Click" />--%>
                                                            <asp:Button ID="btnAnexar" runat="server" OnClick="btnAnexar_Click" />
                                                        </div>
                                                    </li>
                                                </ol>
                                            </div>
                                            <div style="width: 50%; display: table-cell;">
                                                <asp:Panel ID="pnlLinks" runat="server">
                                                    <ol>
                                                        <li>
                                                            <div class="div_a">
                                                                <a id="lnkFazenda" runat="server" href="http://www.receita.fazenda.gov.br" target="_blank">http://www.receita.fazenda.gov.br</a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="div_a">
                                                                <a id="lnkSintegra" runat="server" href="http://www.sintegra.gov.br" target="_blank">http://www.sintegra.gov.br</a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="div_a">
                                                                <a id="lnkSimples" runat="server" href="http://www8.receita.fazenda.gov.br/SimplesNacional"
                                                                    target="_blank">http://www8.receita.fazenda.gov.br/SimplesNacional</a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="div_a">
                                                                <a id="lnkSuframa" runat="server" href="http://www.suframa.gov.br" target="_blank">http://www.suframa.gov.br</a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="div_a">
                                                                <a id="lnkEquifax" runat="server" href="https://consulta.equifax.com.br/Default.asp"
                                                                    target="_blank">https://consulta.equifax.com.br/Default.aspx</a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="div_a">
                                                                <a id="lnkCisp" runat="server" href="http://www.cisp.com.br" target="_blank">http://www.cisp.com.br</a>
                                                            </div>
                                                        </li>
                                                    </ol>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div style="width: 100%; vertical-align: middle; margin-bottom: 100px;">
                                            <asp:GridView ID="gvDocumentos" runat="server" TabIndex="15" PageSize="2" DataKeyNames="tipoDocumentoId,clienteDocumentoDataCadastro,clienteDocumentoNomeArquivo,clienteId,
                                        clienteDocumentoObservacoes,clienteDocumentoSeq,clienteDocumentoValidade,
                                        clienteDocumentoValido,clienteDocumentoArquivoExtensao,usuarioCadastrador"
                                                OnPageIndexChanging="gvDocumentos_PageIndexChanging" OnRowCommand="gvDocumentos_RowCommand"
                                                OnRowDataBound="gvDocumentos_RowDataBound" OnRowDeleting="gvDocumentos_RowDeleting"
                                                OnRowUpdating="gvDocumentos_RowUpdating">
                                                <Columns>
                                                    <asp:BoundField DataField="tipoDocumentoId" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="clienteDocumentoSeq" DataFormatString="{0:d3}" ItemStyle-Width="80px"
                                                        ItemStyle-HorizontalAlign="Center" />
                                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrDataCadastro" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="clienteDocumentoNomeArquivo" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrDocValido" runat="server" Text='<%# bool.Parse(Eval("clienteDocumentoValido").ToString()) ? GetResourceValue("lblSim") : GetResourceValue("lblNao") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="clienteDocumentoObservacoes" />
                                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrValidade" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbDownload" runat="server" SkinID="ImgGrid" CommandName="Download"
                                                                CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("clienteId") %>'
                                                                ToolTip="<%$ Resources:Resource, lblDownload %>" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" ImageUrl="~/Imagens/_trash.png"
                                                                CommandName="ItemDelete" CommandArgument='<%# Container.DataItemIndex + "|" + Eval("clienteId") %>'
                                                                ToolTip="<%$ Resources:Resource, lblExcluir %>" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </fieldset>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <%--ABA DE FISCAL --%>
                        <asp:Panel ID="pnlFiscal" runat="server" CssClass="tabStripPanel" Width="100%" Height="500px">
                            <div style="width: 100%; display: table;">
                                <fieldset style="margin-top: 41px; height: 100%; z-index: 1;">
                                    <div style="width: 40%; display: table-cell; vertical-align: top;">
                                        <asp:Panel ID="Panel2" runat="server">
                                            <div class="alert_bottom_button">
                                                <ol>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteContribuinteICMS" runat="server" SkinID="LabelForm" />
                                                        <asp:CheckBox ID="cbDadosClienteContribuinteICMS" runat="server" TabIndex="1" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteSimplesNacional" runat="server" SkinID="LabelForm" />
                                                        <asp:CheckBox ID="cbDadosClienteSimplesNacional" runat="server" TabIndex="2" />
                                                    </li>
                                                    <li>
                                                        <div class="line">
                                                            <div class="line_itens_left">
                                                                <asp:Label ID="lblDadosClienteObservacaoFiscal" runat="server" SkinID="LabelForm" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:TextBox ID="txtDadosClienteObservacaoFiscal" runat="server" MaxLength="500"
                                                                    TabIndex="3" TextMode="MultiLine" />
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div style="width: 60%; display: table-cell; vertical-align: top;">
                                        <asp:Panel ID="Panel3" runat="server" Visible="false">
                                            <div class="alert_bottom_button">
                                                <ol>
                                                    <li>
                                                        <asp:Label ID="Label4" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblDadosClienteRazaoSocialTexto" runat="server" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="Label5" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblDadosClienteCNPJTexto" runat="server" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="Label6" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblDadosClienteIETexto" runat="server" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="Label7" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblDadosClienteEmailNFETeste" runat="server" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="Label8" runat="server" SkinID="LabelForm" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteEndereco" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblDadosClienteEnderecoTexto" runat="server" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteEnderecoComplemento" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblDadosClienteEnderecoComplementoTexto" runat="server" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteEnderecoNumero" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblDadosClienteEnderecoNumeroTexto" runat="server" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteEnderecoBairro" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblDadosClienteEnderecoBairroTexto" runat="server" />
                                                    </li>
                                                    <li>
                                                        <asp:Label ID="lblDadosClienteEnderecoEstado" runat="server" SkinID="LabelForm" />
                                                        <asp:Label ID="lblDadosClienteEnderecoEstadoTexto" runat="server" />
                                                    </li>
                                                </ol>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </fieldset>
                            </div>
                        </asp:Panel>
                        <%--ABA DE FINANCEIRO --%>
                        <asp:Panel ID="pnlFinanceiro" runat="server" CssClass="tabStripPanel" Width="100%"
                            Height="500px">
                            <fieldset style="margin-top: 41px; height: 100%;">
                                <div style="width: 100%; display: table-cell; vertical-align: top; z-index: 1;">
                                    <asp:Panel ID="Panel4" runat="server">
                                        <div class="alert_bottom_button">
                                            <ol>
                                                <li>
                                                    <asp:Label ID="lblDadosClientePortador" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddDadosClientePortador" runat="server" TabIndex="4" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblDadosClientePortadorPreferencial" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddDadosClientePortadorPreferencial" runat="server" TabIndex="5">
                                                        <asp:ListItem Text="Selecione..." Value="" Selected="True" />
                                                        <asp:ListItem Text="Portador pref teste 1" Value="portPref1" />
                                                        <asp:ListItem Text="Portador pref teste 2" Value="portPref2" />
                                                        <asp:ListItem Text="Portador pref teste 3" Value="portPref3" />
                                                    </asp:DropDownList>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblDadosClienteLimiteCredito" runat="server" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtDadosClienteLimiteCredito" runat="server" TabIndex="6" SkinID="Data" />
                                                </li>
                                                <li>
                                                    <div class="line">
                                                        <div class="line_itens_left">
                                                            <asp:Label ID="lblDadosClienteDataLimiteCredito" runat="server" SkinID="LabelForm" />
                                                        </div>
                                                        <div class="line_itens">
                                                            <CtlData:ControlData ID="dataDadosClienteDataLimiteCredito" runat="server" TabIndex="7" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblDadosClienteTipoCredito" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddDadosClienteTipoCredito" runat="server" TabIndex="8">
                                                        <asp:ListItem Text="Selecione..." Value="" Selected="True" />
                                                        <asp:ListItem Value="autom" Text="<%$ Resources:Resource, lblTipoCreditoAutomatico %>" />
                                                        <asp:ListItem Value="normal" Text="<%$ Resources:Resource, lblTipoCreditoNormal %>" />
                                                        <asp:ListItem Value="so imp ped" Text="<%$ Resources:Resource, lblTipoCreditoSoImplantapedido %>" />
                                                        <asp:ListItem Value="suspenso" Text="<%$ Resources:Resource, lblTipoCreditoSuspenso %>" />
                                                        <asp:ListItem Value="pagto a vista" Text="<%$ Resources:Resource, lblTipoCreditoAVista %>" />
                                                    </asp:DropDownList>
                                                </li>
                                                <li>
                                                    <div class="line">
                                                        <div class="line_itens_left">
                                                            <asp:Label ID="lblDadosClienteObservacoes" runat="server" SkinID="LabelForm" />
                                                        </div>
                                                        <div class="line_itens">
                                                            <asp:TextBox ID="txtDadosClienteObservacoes" runat="server" TabIndex="9" TextMode="MultiLine" />
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblClienteAvaliacao" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddClienteAvaliacao" runat="server" TabIndex="6" SkinID="Data">
                                                        <asp:ListItem Value="0" Text="<%$ Resources:Resource, lblSelecione %>" Selected="True" />
                                                        <asp:ListItem Value="1" Text="<%$ Resources:Resource, lblNaoAvalia %>" />
                                                        <asp:ListItem Value="2" Text="<%$ Resources:Resource, lblSomenteAtrasoDuplicata %>" />
                                                        <asp:ListItem Value="3" Text="<%$ Resources:Resource, lblLimitesAtrasosDuplicata %>" />
                                                    </asp:DropDownList>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblClienteAvaliacaoEmbarque" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddClienteAvaliacaoEmbarque" runat="server" TabIndex="6" SkinID="Data">
                                                        <asp:ListItem Value="0" Text="<%$ Resources:Resource, lblSelecione %>" Selected="True" />
                                                        <asp:ListItem Value="1" Text="<%$ Resources:Resource, lblNaoAvalia %>" />
                                                        <asp:ListItem Value="2" Text="<%$ Resources:Resource, lblSomenteAtrasoDuplicata %>" />
                                                        <asp:ListItem Value="3" Text="<%$ Resources:Resource, lblLimitesAtrasosDuplicata %>" />
                                                    </asp:DropDownList>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblClientePeriodoAtraso" runat="server" SkinID="LabelForm" />
                                                    <asp:TextBox ID="txtClientePeriodoAtraso" runat="server" TabIndex="6" SkinID="Data" />
                                                </li>

                                            </ol>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </fieldset>
                        </asp:Panel>

                        <%--ABA GRUPOS RESTRITOS --%>
                        <asp:UpdatePanel ID="updGruposRestritos" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>

                                <asp:Panel ID="pnlGruposRestritos" runat="server" CssClass="tabStripPanel" Width="100%" Height="500px">

                                    <div style="width: 100%; display: table;">
                                        <fieldset style="margin-top: 41px; height: 100%; z-index: 1;">
                                            <%--   <legend>
                                                <asp:Label ID="lblDadosGruposHeader" runat="server" ></asp:Label>
                                            </legend>--%>
                                            <div style="width: 40%; display: table-cell; vertical-align: top;">


                                                <%--BEGIN GRIDVIEW--%>
                                                <div class="gridRegistrosGrupos" style="margin-top: 10px;">
                                                    <asp:GridView ID="gvRegistrosPesquisa" runat="server" TabIndex="36"
                                                        DataKeyNames="grupoEstoqueId,grupoEstoqueDescricao"
                                                        OnPageIndexChanging="gvRegistrosPesquisa_PageIndexChanging"
                                                        OnRowDataBound="gvRegistrosPesquisa_RowDataBound">
                                                        <Columns>

                                                            <asp:BoundField DataField="grupoEstoqueId" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="grupoEstoqueDescricao" ItemStyle-Width="150px" />
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelectFlagGruposRest" runat="server" OnCheckedChanged="chkSelectFlagGruposRest_CheckedChanged" AutoPostBack="true" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                                <%--END GRIDVIEW--%>
                                            </div>
                                        </fieldset>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="updSAC" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="pnlSAC" runat="server" CssClass="tabStripPanel" Width="100%" Height="500px">
                                    <div style="width: 100%; display: table;">
                                        <fieldset style="margin-top: 41px; height: 100%; z-index: 1;">
                                            <div style="width: 40%; display: table-cell; vertical-align: top;">
                                                <div class="gridRegistrosGrupos" style="margin-top: 10px;">
                                                    <asp:GridView ID="grdSAC" runat="server"
                                                        OnPageIndexChanging="grdSAC_PageIndexChanging"
                                                        EmptyDataText="Nenhum registro encontrado">
                                                        <Columns>
                                                            <asp:BoundField DataField="ID_PEDIDO_ONCO" HeaderText="Pedido" DataFormatString="{0:#}" ItemStyle-HorizontalAlign="Center" />
                                                            <asp:BoundField DataField="DATA_CONTATO" HeaderText="Data Contato" ItemStyle-HorizontalAlign="Center"/>
                                                            <asp:BoundField DataField="DESCRICAO_ACAO" HeaderText="Ação" />
                                                            <asp:BoundField DataField="DESCRICAO_RESULTADO" HeaderText="Resultado" />
                                                            <asp:BoundField DataField="COMPLEMENTO_RESULTADO" HeaderText="Complemento" />
                                                            <asp:BoundField DataField="ATENDENTE" HeaderText="Atendente" />
                                                            <asp:BoundField DataField="DETALHE" HeaderText="Detalhe" />
                                                            <asp:BoundField DataField="SEQHISTORICO" HeaderText="Seq Historico" DataFormatString="{0:#}" ItemStyle-HorizontalAlign="Center"/>
                                                            <asp:BoundField DataField="CPF" HeaderText="CPF" ItemStyle-HorizontalAlign="Center"/>
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </asp:Panel>

                <%-- filtro e  GRID PRINCIPAL CLIENTE--%>
                <asp:Panel ID="pnlGrid" runat="server">
                    <fieldset>
                        <div class="navegacao">
                            <div style="text-align: left; width: 230px;">
                                <asp:RadioButtonList ID="rblFiltrosTipoPessoa" runat="server" RepeatDirection="Horizontal" TabIndex="26">
                                    <asp:ListItem Selected="True" onclick="MontaLayoutFiltros('J');" Value="<%$ Resources:Resource, lblTipoPessoaJuridicaValue %>"
                                        Text="<%$ Resources:Resource, lblTipoPessoaJuridica %>" />
                                    <asp:ListItem onclick="MontaLayoutFiltros('F');" Value="<%$ Resources:Resource, lblTipoPessoaFisicaValue %>"
                                        Text="<%$ Resources:Resource, lblTipoPessoaFisica %>" />
                                    <asp:ListItem onclick="MontaLayoutFiltros('E');" Value="<%$ Resources:Resource, lblTipoPessoaEstrangeiraValue %>"
                                        Text="<%$ Resources:Resource, lblTipoPessoaEstrangeira %>" />
                                </asp:RadioButtonList>
                            </div>
                            <div class="boxPesquisaCurta" style="width: 40px;">
                                <asp:Label ID="lblCodigo" runat="server" />
                                <asp:TextBox ID="txtCodigo" SkinID="SmallFilter" runat="server" MaxLength="50" TabIndex="52" />
                            </div>
                            <div class="boxPesquisaCurta" style="width: 80px;">
                                <asp:Panel ID="pnlFiltrosCnpj" runat="server">
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltrosClienteCnpj" runat="server" />
                                        <asp:TextBox ID="txtFiltrosClienteCnpj" SkinID="Filtro" runat="server" MaxLength="18" TabIndex="50" />
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlFiltrosCpf" runat="server">
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltrosClienteCpf" runat="server" />
                                        <asp:Label ID="lblFiltrosClienteRne" runat="server" />
                                        <asp:TextBox ID="txtFiltrosClienteCpf" SkinID="Filtro" runat="server" MaxLength="14" TabIndex="51" />
                                    </div>
                                </asp:Panel>
                            </div>

                            <div class="boxPesquisaCurta" style="width: 70px;">
                                <asp:Label ID="lblFiltrosClienteRazaoSocial" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="52" />
                            </div>

                            <div class="boxPesquisaCurta" style="width: 70px;">
                                <asp:Label ID="lblFiltrosClienteCodigoErp" runat="server" Text="aa" />
                                <asp:TextBox ID="txtFiltrosClienteCodigoErp" SkinID="SmallFilter" runat="server" TabIndex="53" />
                            </div>

                            <div class="boxPesquisaCurta" style="width: 80px;">
                                <asp:Label ID="lblFiltrosClienteTelefone" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteTelefone" SkinID="SmallFilter" runat="server" MaxLength="50" TabIndex="53" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroSituacao" runat="server" />
                                <asp:DropDownList ID="ddFiltroSituacao" runat="server" SkinID="DropSmallFilter" TabIndex="14" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblOperadorFidelizeFiltro" runat="server" />
                                <asp:CheckBox ID="chkOperadorFidelizeFiltro" runat="server" Font-Bold="true" TabIndex="8" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind" TabIndex="54" OnClick="btnFiltrosPesquisa_Click" />
                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" TabIndex="55" OnClick="btnFiltrosLimpar_Click" />
                                <asp:Button ID="btnNovoClienteWf" runat="server" SkinID="ButtonRightNew" TabIndex="56" OnClick="btnNovoClienteWf_Click" />
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="2" DataKeyNames="clienteId,clienteSitIntegracao"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging" OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound" OnRowDeleting="gvRegistros_RowDeleting"
                                OnRowUpdating="gvRegistros_RowUpdating"
                                OnSelectedIndexChanged="gvRegistros_SelectedIndexChanged" OnSelectedIndexChanging="gvRegistros_SelectedIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="clienteId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                    <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                    <asp:BoundField DataField="clienteIdSap" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCNPJ").ToString(), Comom.Utility.FormatOption.ApplyMask), txtFiltrosClienteCnpj.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteCpf" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCPF").ToString(), Comom.Utility.FormatOption.ApplyMask, Comom.Utility.TipoDocumento.CPF), txtFiltrosClienteCpf.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Left">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" Visible="false">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrTipoPessoa" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="clienteGrupoComercialNome" ItemStyle-Width="250px" />
                                    <asp:BoundField DataField="representanteNome" ItemStyle-Width="250px" />
                                    <asp:BoundField DataField="clienteStatus" ItemStyle-HorizontalAlign="Center">
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgMudaStatusImplantado" ImageUrl="~/Imagens/IntegrarEMS.png" SkinID="ImgGrid"
                                                Width="30px" Height="30px" runat="server" CommandName="MudaStatus" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnVisualizar" runat="server"
                                                SkinID="ImgGrid"
                                                CommandName="Visualizar"
                                                ImageUrl="~/Imagens/find.png"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </asp:Panel>

                <%-- bloco pop up muda status --%>
                <div style="position: absolute; z-index: 1;">
                    <asp:UpdatePanel ID="upMudaStatus" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnMudaSim" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnMudaNao" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlMudaStatus" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblConfirmacao" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <asp:Label ID="lblConfirmarMudaStatusNaoImplantado" runat="server" ForeColor="Black" />
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnMudaSim" runat="server" SkinID="ButtonLeft" OnClick="btnMudaSim_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnMudaNao" runat="server" SkinID="ButtonRight" OnClick="btnMudaNao_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- POP UP NÃO APROVAR--%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upNaoAprovar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnNaoAprovar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlNaoAprovar" runat="server" Visible="false">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel" style="width: 40%; height: 50%; left: 30%; top: 25%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblConfirmarNaoAprovarHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbFiltrosClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                                Height="25px" TabIndex="16" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body" style="height: 80%;">
                                        <fieldset>
                                            <div class="line">
                                                <div class="line_itens_left">
                                                    <asp:Label ID="lblMotivoNaoAprova" runat="server" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:TextBox ID="txtMotivoNaoAprova" runat="server" Rows="10" Columns="700" MaxLength="500"
                                                        TabIndex="17" TextMode="MultiLine" />
                                                </div>
                                            </div>
                                            <div class="line">
                                                <asp:Button ID="btnConfirmarNaoAprovar" runat="server" OnClick="btnConfirmarNaoAprovar_Click" />
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- POP UP escolhe tipo cliente (pf ou pj) --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upEscolheTipoCliente" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnNaoAprovar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlEscolheTipoCliente" runat="server" Visible="false">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel" style="width: 30%; height: 30%; left: 35%; top: 35%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="Label1" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imgSelecionaTipoClose" runat="server" ImageAlign="AbsMiddle"
                                                Width="25px" Height="25px" TabIndex="16" ImageUrl="~/Imagens/Fechar.png" OnClick="imgSelecionaTipoClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body" style="height: 50%;">
                                        <fieldset>
                                            <div class="line">
                                                <asp:RadioButtonList ID="rblTipoCliente" runat="server" RepeatDirection="Horizontal"
                                                    TabIndex="30">
                                                    <asp:ListItem Value="J" Text="<%$ Resources:Resource, lblTipoPessoaJuridica %>" Selected="True" />
                                                    <asp:ListItem Value="F" Text="<%$ Resources:Resource, lblTipoPessoaFisica %>" />
                                                </asp:RadioButtonList>
                                                <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" TabIndex="31" />
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- PANEL REPRESENTANTES --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppRepresentantes" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlRepresentantes" runat="server" DefaultButton="btnRepresentanteBuscar" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblRepresentantesHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbRepresentantesClose" runat="server"
                                                ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbRepresentantesClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <%-- FILTROS --%>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblRepresentanteId" runat="server" />
                                                    <asp:TextBox ID="txtRepresentanteIdFiltro" runat="server" SkinID="Filtro" MaxLength="5" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblRepresentanteNome" runat="server" />
                                                    <asp:TextBox ID="txtRepresentanteNomeFiltro" runat="server" SkinID="Filtro" MaxLength="30" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Button ID="btnRepresentanteBuscar" runat="server" SkinID="ButtonLeft" OnClick="btnRepresentanteBuscar_Click" />
                                                    <asp:Button ID="btnRepresentanteLimpar" runat="server" SkinID="ButtonRight" OnClick="btnRepresentanteLimpar_Click" />
                                                </div>
                                            </div>

                                            <%-- GRID REGISTROS --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvRepresentantes" runat="server"
                                                    DataKeyNames="representanteId,representanteNome,representanteAtivo"
                                                    OnRowCommand="gvRepresentantes_RowCommand"
                                                    OnRowDataBound="gvRepresentantes_RowDataBound"
                                                    OnPageIndexChanging="gvRepresentantes_PageIndexChanging">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentanteId" runat="server" Text='<%# FormataStringSaida(Eval("representanteId"), txtRepresentanteIdFiltro.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentanteNome" runat="server" Text='<%# FormataStringSaida(Eval("representanteNome"), txtRepresentanteNomeFiltro.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentanteAtivo" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbSelect" runat="server"
                                                                    SkinID="ImgGrid"
                                                                    ImageUrl="~/Imagens/check.png"
                                                                    CommandName="Select"
                                                                    ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                    CommandArgument='<%# Eval("representanteId") %>' />
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

                <%-- CONDIÇÕES DE PAGAMENTO --%>
                <asp:UpdatePanel ID="uppCondicaoPagamento" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbCondicoesPgto" EventName="Click" />
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
                                                <asp:Button ID="btnCondicaoPagamentoLimpar" runat="server" SkinID="ButtonCenter" OnClick="btnCondicaoPagamentoLimpar_Click" />
                                                <asp:Button ID="btnCondicaoPagamentoAdd" runat="server" SkinID="ButtonRight" OnClick="btnCondicaoPagamentoAdd_Click" />
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
                                                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkAll" runat="server" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                                            <asp:ImageButton ID="imbSelect" runat="server"
                                                                SkinID="ImgGrid"
                                                                ImageUrl="~/Imagens/check.png"
                                                                CommandName="Select"
                                                                ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                CommandArgument='<%# Eval("condicaoPagamentoId") %>' />
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

                <%--Histórico Sac --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppHistoricoSac" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlHistoricoSac" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel" style="width: 80%; height: 80%; left: 10%; top: 20%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblHistoricoSacHeader" runat="server" Text="<%$ Resources:Resource, lblHistSac %>" ForeColor="White" />

                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imgHistoricoSacClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imgHistoricoSacClose_Click" />
                                        </div>
                                    </div>

                                    <div class="painel_body" style="height: 80%;">

                                        <div style="display: table; width: 100%; height: 50%; text-align: center;">
                                            <fieldset>
                                                <div style="width: 100%; height: 50%; overflow-x: none; overflow-y: scroll;">
                                                    <%-- GRID REGISTROS --%>
                                                    <asp:GridView ID="gvViewHistoricoSac" runat="server"
                                                        DataKeyNames="ID,Data,Assunto,STATUS,Pedido,Tipo,Historico,Resolu,Origem,clienteId"
                                                        OnRowDataBound="gvViewHistoricoSac_RowDataBound"
                                                        OnRowCommand="gvViewHistoricoSac_RowCommand"
                                                        OnPageIndexChanging="gvViewHistoricoSac_PageIndexChanging">
                                                        <Columns>
                                                            <asp:BoundField DataField="Pedido" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="Data" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="Assunto" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="STATUS" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="Tipo" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150px" />
                                                            <asp:BoundField DataField="Historico" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="Resolu" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="Origem" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
                                                            <%--<asp:BoundField DataField="clienteId" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />--%>
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>


                <%--Saldo Consignado --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="updSaldoConsig" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlSaldoConsig" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel" style="width: 80%; height: 80%; left: 10%; top: 20%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, lblSaldoConsig %>" ForeColor="White" />

                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imgSaldoConsigClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imgSaldoConsigClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body" style="height: 80%;">
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
                                                        <div style="display: table; text-align: center; width: 99%;">
                                                            <div style="display: table; width: 100%;">
                                                                <div class="navegacao">
                                                                    <div class="boxPesquisa">
                                                                        <asp:Label ID="lblVencNF" runat="server" />
                                                                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                                                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                                                                            ShowHeaderLine="false" />
                                                                    </div>

                                                                    <div class="boxPesquisa">
                                                                        <asp:Label ID="lblFiltroPedidoNotaFiscal" runat="server" />
                                                                        <asp:TextBox ID="txtFiltroPedidoNotaFiscal" runat="server" TabIndex="11" SkinID="SmallFilter" MaxLength="30" />
                                                                    </div>
                                                                    <div class="boxPesquisa">
                                                                        <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                                                        <asp:TextBox ID="txtEstabelecimentoId" runat="server" TabIndex="12" SkinID="SmallFilter" MaxLength="30" />
                                                                    </div>

                                                                    <div class="boxPesquisa">
                                                                        <asp:Label ID="lblFiltroPedidoItem" runat="server" />
                                                                        <asp:DropDownList ID="ddFiltroPedidoItem" runat="server" SkinID="DropSmallFilter" TabIndex="16" />
                                                                    </div>

                                                                    <div class="boxPesquisa">
                                                                        <asp:Button ID="btnPesquisarSaldoConsig" runat="server" SkinID="ButtonLeftFind" TabIndex="20"
                                                                            OnClick="btnPesquisarSaldoConsig_Click" />
                                                                        <asp:Button ID="btnLimparSaldoConsig" runat="server" SkinID="ButtonRightVoltar" TabIndex="21"
                                                                            OnClick="btnLimparSaldoConsig_Click" />
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <div style="display: table; width: 100%; text-align: right;">

                                                                <div class="boxPesquisa" style="width: 200px;">
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
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div style="display: table; width: 100%; height: 50%; text-align: center;">
                                            <fieldset>
                                                <div style="width: 100%; height: 50%; overflow-x: none; overflow-y: scroll;">
                                                    <%-- GRID REGISTROS --%>
                                                    <asp:GridView ID="gvViewSaldoConsig" runat="server"
                                                        DataKeyNames="Emp,Est,CodItem,DescItem,NrNotafiscal,Serie,Saldo,VlUnitario,DtVencto,Lote,
                                                                      ValidLote,Localizacao,NatOper,DtEmissNF,CodCli,RazaoSocial,Fabricante,
                                                                      UsuarioImplant,Representante,Grupo"
                                                        OnRowDataBound="gvViewSaldoConsig_RowDataBound"
                                                        OnRowCommand="gvViewSaldoConsig_RowCommand"
                                                        OnPageIndexChanging="gvViewSaldoConsig_PageIndexChanging">
                                                        <Columns>


                                                            <asp:BoundField DataField="DescItem" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                                            <asp:BoundField DataField="NrNotafiscal" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="Serie" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="Saldo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="VlUnitario" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="DtVencto" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="Lote" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="ValidLote" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="Localizacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="NatOper" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="DtEmissNF" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="CodCli" Visible="false" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="RazaoSocial" Visible="false" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="Fabricante" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="UsuarioImplant" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="Representante" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <asp:BoundField DataField="Grupo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                            <%--<asp:BoundField DataField="Emp" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />--%>
                                                            <asp:BoundField DataField="Est" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>



                <div style="position: absolute;">
                    <asp:UpdatePanel ID="updModalAceiteLGPB" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlModalAceiteLGPB" runat="server" CssClass="Modal" Visible="false" DefaultButton="btnEnviarEmail">

                                <div class="OpacityBackGround"></div>
                                <div class="painel" style="width: 50%; left: 20%; height: 50%">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="Label11" runat="server" ForeColor="White" Text="Enviar Email LGPD para o cliente" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imgCloseModalAceiteLGPB" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imgCloseModalAceiteLGPB_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <ol>
                                                <li>

                                                    <div class="col-md-12">
                                                        <asp:Label ID="lblEmailCliente" runat="server" Text="Email cliente" />
                                                        <asp:TextBox ID="txtEmailCliente" runat="server" Font-Bold="true" SkinID="txtBootstrap2" />
                                                        <br></br>
                                                    </div>

                                                    <br />
                                                </li>
                                                <li>
                                                    <div class="col-md-12">
                                                        <asp:Label ID="Label13" runat="server" Text="Deseja enviar email para o cliente com  os termos de aceite da Lei Geral de Proteção de Dados (LGPD)?" />

                                                        <br></br>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="col-md-12 text-center">
                                                        <asp:Button ID="btnEnviarEmail" runat="server" SkinID="BtnSuccess" OnClick="btnEnviarEmail_Click" Text="Enviar" />
                                                        <asp:Button ID="btnFecharModal" runat="server" SkinID="BtnDanger" OnClick="btnFecharModal_Click" Text="Fechar" />
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


                <%--Validadores --%>
                <asp:RequiredFieldValidator ID="rfvClienteRazaoSocial" ControlToValidate="txtDadosClienteRazaoSocial"
                    runat="server" Display="None" SetFocusOnError="false" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteCNPJ" ControlToValidate="txtDadosClienteCNPJ"
                    runat="server" Display="None" SetFocusOnError="false" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteCPF" ControlToValidate="txtDadosClienteCPF"
                    runat="server" Display="None" SetFocusOnError="false" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteNomeAbrev" ControlToValidate="txtDadosClienteNomeAbrev"
                    runat="server" Display="None" SetFocusOnError="false" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteNomeMatriz" ControlToValidate="txtDadosClienteNomeMatriz"
                    runat="server" Display="None" SetFocusOnError="false" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteEmailComercial" ControlToValidate="txtDadosClienteEmailComercial"
                    runat="server" Display="None" SetFocusOnError="false" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteTelefone1" ControlToValidate="txtDadosClienteTelefone1"
                    runat="server" Display="None" SetFocusOnError="false" Text="*" ValidationGroup="Validacao" />


                <%--<asp:RequiredFieldValidator ID="rfvClienteIE" ControlToValidate="txtDadosClienteIE"
                                            runat="server" Display="None" SetFocusOnError="false" Text="*" ValidationGroup="Validacao" />--%>


                <asp:RequiredFieldValidator ID="rfvEmailNfe" ControlToValidate="txtDadosClienteEmailNFE"
                    runat="server" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false"
                    ValidationGroup="Validacao" />

                <%--Validadores do endereço --%>
                <asp:RequiredFieldValidator ID="rfvEnderecoTipoEndereco" runat="server" ControlToValidate="txtDadosClienteTipoEndereco"
                    Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                <asp:RequiredFieldValidator ID="rfvEnderecoCep" runat="server" ControlToValidate="txtDadosClienteWfEnderecoCep"
                    Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                <asp:RequiredFieldValidator ID="rfvEnderecoRua" runat="server" ControlToValidate="txtDadosClienteWfEndereco"
                    Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                <asp:RequiredFieldValidator ID="rfvEnderecoNumero" runat="server" ControlToValidate="txtDadosClienteWfEnderecoNumero"
                    Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                <asp:RequiredFieldValidator ID="rfvEnderecoBairro" runat="server" ControlToValidate="txtDadosClienteWfEnderecoBairro"
                    Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                <asp:RequiredFieldValidator ID="rfvEnderecoCidade" runat="server" ControlToValidate="txtDadosClienteWfEnderecoCidade"
                    Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                <asp:ValidationSummary ID="vsValidacaoEndereco" runat="server" ShowMessageBox="true"
                    ShowSummary="false" ValidationGroup="ValidacaoEndereco" />


                <%--Validadores de contato --%>
                <asp:RequiredFieldValidator ID="rfvClienteContatoNome" runat="server" ControlToValidate="txtClienteContatoNome"
                    Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoContato" />
                <asp:RequiredFieldValidator ID="rfvClienteContatoTelefone" runat="server" ControlToValidate="txtClienteContatoTelefone"
                    Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoContato" />
                <asp:ValidationSummary ID="vsValidacaoContato" runat="server" ShowMessageBox="true"
                    ShowSummary="false" ValidationGroup="ValidacaoContato" />

                <asp:HiddenField ID="hdfValidaCampos" runat="server" Value="true" Visible="false" />
                <asp:HiddenField ID="hdStatusCliente" runat="server" Value="true" Visible="false" />
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
