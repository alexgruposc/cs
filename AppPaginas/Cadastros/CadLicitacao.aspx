<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadLicitacao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadLicitacao" %>

<%-- CONTROLES --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>

<%-- NAMESPACES --%>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">


        function JSFunction() {
            __doPostBack('<%= pnlItens.ClientID  %>', '');
        }

        function texboxchange(id) {
            var txtBox = document.getElementById(id);
            var count = txtBox.value.length;
            if (count == 2) {
                document.getElementById(id).focus();
                return true; // this will call textbox changed event.
            }
        }

        function ConsisteMotivoAprovacao() {
            var msg = '';
            if (document.getElementById('ContentPlaceHolder1_txtMotivo').value == '')
                msg = "- Necessário informar o motivo para a APROVAÇÃO.";

            if (msg != '') {
                alert(msg);
                return false;
            } else {

                if (confirm('Confirma APROVAR o contrato?'))
                    return true;
                else
                    return false;
            }
        }


        function ConsisteMotivoReprovacao() {
            var msg = '';
            if (document.getElementById('ContentPlaceHolder1_txtMotivo').value == '')
                msg = "- Necessário informar o motivo para a REPROVAÇÃO.";

            if (msg != '') {
                alert(msg);
                return false;
            } else {
                if (confirm('Confirma REPROVAR o contrato?'))
                    return true;
                else
                    return false;
            }
        }
    </script>

    <asp:Panel ID="pnlLicitacao" runat="server">
        <asp:UpdatePanel ID="uppLicitacao" runat="server" UpdateMode="Conditional">
            <Triggers>
                <%-- FILTROS --%>
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosPesquisar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosNovo" EventName="Click" />
                <%-- HEADER BUTTONS --%>
                <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnVoltar" EventName="Click" />
                <%-- ANEXO --%>
                <asp:PostBackTrigger ControlID="btnContratoDocumentosAnexar" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoHeaderCondicoes" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbDocumentosClose" EventName="Click" />
                <%-- CLIENTE --%>
                <asp:AsyncPostBackTrigger ControlID="imbContratoHeaderCnpjCheck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoHeaderCnpjFind" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvClientes" EventName="RowCommand" />
                <%-- CLIENTES DE FATURAMENTO --%>
                <asp:AsyncPostBackTrigger ControlID="imbContratoBodyCnpjFaturamentoFind" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoBodyCnpjFaturamentoAdd" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoBodyCnpjFaturamentoRemove" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoBodyCnpjFaturamentoRemoveAll" EventName="Click" />
                <%-- ENDEREÇOS --%>
                <asp:AsyncPostBackTrigger ControlID="btnContratoBodyEnderecosAdd" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoBodyEnderecosRemove" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoBodyEnderecosRemoveAll" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvEnderecos" EventName="RowCommand" />
                <%-- ITENS --%>
                <asp:AsyncPostBackTrigger ControlID="imbContratoItensCheck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoItensFind" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvItensPesquisa" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="imbItemClose" EventName="Click" />
                <%-- PESQUISA DE CLIENTES --%>
                <asp:AsyncPostBackTrigger ControlID="imbClienteClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnClienteBuscar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnClienteLimpar" EventName="Click" />
                <%-- MOTIVO CANCELAMENTO --%>
                <asp:AsyncPostBackTrigger ControlID="btnSalvarMotivos" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFecharMotivos" EventName="Click" />
                <%-- CONFIRMAR CANCELAMENTO OU CANCELAR E INCLUIR UM NOVO CONTRATO COM DADOS ANTIGO  --%>
                <asp:AsyncPostBackTrigger ControlID="btnConfirmarCancelamentoLicitacaoSim" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnConfirmarCancelamentoLicitacaoNao" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoCnpjAlteradoCheck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoCnpjAlteradoFind" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnSalvarChavesContrato" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFecharPnlChavesCotrato" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnAprovaContratoOk" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnAprovaContratoNOk" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppLicitacao">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlFiltros" runat="server" Height="100%">
                    <%-- BACKGROUND - BODY --%>
                    <div style="left: 0.5%; width: 99%; height: 100%; position: fixed; overflow-x: none;">
                        <fieldset style="left: 0.5%; width: 99%;">
                            <legend>
                                <asp:Literal ID="ltrContratoFiltrosHeader" runat="server" />
                            </legend>
                            <div class="navegacao">
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosContratoId" runat="server" />
                                    <asp:TextBox ID="txtFiltrosContratoId" runat="server" SkinID="Filtro" MaxLength="50" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosCnpj" runat="server" />
                                    <asp:TextBox ID="txtFiltrosCnpj" runat="server" SkinID="Filtro" MaxLength="18" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosRazaoSocial" runat="server" />
                                    <asp:TextBox ID="txtFiltrosRazaoSocial" runat="server" SkinID="Filtro" MaxLength="50" />
                                </div>
                                <div class="boxPesquisa" style="display: block;">
                                    <asp:Label ID="lblFiltrosContratoStatus" runat="server" />
                                    <asp:DropDownList ID="ddlFiltrosContratoStatus" runat="server" SkinID="DropFiltro" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosEstabelecimentoId" runat="server" />
                                    <asp:DropDownList ID="ddlFiltrosEstabelecimentoId" runat="server" SkinID="DropFiltro" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Button ID="btnFiltrosPesquisar" runat="server" SkinID="ButtonLeftFind" OnClick="btnFiltrosPesquisar_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovo" runat="server" SkinID="ButtonRightNew" OnClick="btnFiltrosNovo_Click" />
                                </div>
                            </div>

                            <%-- GRID REGISTROS --%>
                            <div class="gridRegistros">
                                <asp:GridView ID="gvContratoPesquisa" runat="server"
                                    DataKeyNames="contratoLicitacaoId,contratoLicitacaoDataEmissao,modalidadeLicitacaoId,contratoStatusId,contratoLicitacaoProcesso,contratoLicitacaoVigencia,
		                                           contratoLicitacaoValidade,contratoLicitacaoPrazo,contratoLicitacaoBancario,contratoLicitacaoDoctEfetivo,contratoLicitacaoObservacoes,estabelecimentoId,
		                                           estabelecimentoRazaoSocial,clienteCNPJ,clienteRazaoSocial,usuarioId,clienteId,contratoLicitacaoData,usuarioIdCancelamento,
                                                   contratoLicitacaoMotivoCancelamento,contratoLicitacaoDataCancelamento,contratoLicitacaoDataEncerramento,contratoLicitacaoSeq,AcaoJudicial"
                                    OnPageIndexChanging="gvContratoPesquisa_PageIndexChanging"
                                    OnRowCommand="gvContratoPesquisa_RowCommand"
                                    OnRowDataBound="gvContratoPesquisa_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrContratoId" runat="server" Text='<%# FormataStringSaida(Eval("contratoLicitacaoId"), txtFiltrosContratoId.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="290px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrEstabelecimento" runat="server" Text='<%# FormataStringSaida(Eval("lojaFormatada"), ddlFiltrosEstabelecimentoId.SelectedItem.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCNPJ").ToString(), Comom.Utility.FormatOption.ApplyMask), txtFiltrosCnpj.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltrosRazaoSocial.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrContratoStatus" runat="server" Text='<%# FormataStringSaida(GetResourceValue(Eval("contratoStatusId").ToString()), ddlFiltrosContratoStatus.SelectedItem.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="contratoLicitacaoData" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="contratoLicitacaoDataEmissao" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid"
                                                    ImageUrl="~/Imagens/find.png"
                                                    ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" +
                                                                                      Eval("clienteId") + "|" + Eval("estabelecimentoId")  %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>

                <%-- PAINEL BODY --%>
                <asp:Panel ID="pnlBody" runat="server" Height="100%" Visible="false">
                    <div style="left: 0.4%; display: table; width: 99%; height: 100%; position: fixed;">
                        <fieldset style="left: 0.4%; width: 98%; height: 100%; position: fixed;">
                            <legend>
                                <asp:Literal ID="ltrContratoBodyHeader" runat="server" />
                            </legend>
                            <%-- BACKGROUND - BODY --%>
                            <div style="left: 0.5%; width: 99%; height: 100%; position: fixed; overflow-x: none;">
                                <%-- BUTTONS --%>
                                <div style="left: 0.5%; width: 99%; padding-bottom: 10px; position: relative; overflow-x: none;">
                                    <%-- HEADER BUTTONS --%>
                                    <div style="width: 100%; display: table; margin-top: 2px;">
                                        <asp:Panel ID="pnlInformacoesGerais" runat="server" Visible="false">
                                            <div class="dv_form" style="width: 60%; text-align: left;">
                                                <div style="display: table; width: 100%; height: 100%;">
                                                    <div class="dv_form" style="text-align: left;">
                                                        <asp:Label ID="lblContratoHeaderInformacao" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; width: 80%; text-align: left;">
                                                        <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 550px;">
                                                            <asp:Label ID="lblContratoHeaderInformacaoDescricao" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div style="display: table-cell; width: 40%; text-align: right; vertical-align: middle;">
                                            <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeftSave" ValidationGroup="ValidaContrato" OnClick="btnSalvar_Click" />
                                            <asp:Button ID="btnCancelar" runat="server" SkinID="ButtonCenterCancel" OnClick="btnCancelar_Click" />
                                            <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnLimpar_Click" />
                                            <asp:Button ID="btnAprovar" runat="server" SkinID="ButtonCenterClean" OnClick="btnAprovar_Click" />
                                            <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonRightVoltar" OnClick="btnVoltar_Click" />
                                        </div>
                                    </div>
                                </div>

                                <%-- CONTRATO BODY --%>
                                <div style="left: 0.5%; width: 99%; height: 100%; position: relative; overflow-x: none; overflow-y: scroll;">
                                    <%-- HEADER --%>
                                    <fieldset style="height: 25%;">
                                        <legend class="legend_normal">
                                            <asp:Literal ID="ltrHeader" runat="server" />
                                        </legend>
                                        <%-- BODY HEADER --%>
                                        <div style="left: 0.5%; width: 100%; display: table; padding: 1px 1px 1px 1px;">
                                            <%-- LEFT --%>
                                            <div style="width: 60%; height: 30%; display: table-cell; vertical-align: top;">
                                                <div style="display: table; width: 100%; height: 25px;">
                                                    <div class="dv_form" style="width: 20%;">
                                                        <asp:Label ID="lblContratoHeaderLoja" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 80%; text-align: left;">
                                                        <asp:DropDownList ID="ddlContratoLoja" runat="server" SkinID="DropFiltro" />
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; height: 25px;">
                                                    <div class="dv_form" style="width: 20%;">
                                                        <asp:Label ID="lblContratoHeaderLicitacao" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 20%;">
                                                        <asp:TextBox ID="txtContratoHeader" runat="server" SkinID="Filtro" MaxLength="50" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 60%; text-align: left;">
                                                        <div style="display: table; width: 100%; height: 100%;">
                                                            <div style="display: table-cell; width: 8%; text-align: center; vertical-align: middle;">
                                                                <asp:ImageButton ID="imbContratoHeaderCondicoes" runat="server" Width="20px" Height="20px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblAnexar %>"
                                                                    ImageUrl="~/Imagens/anexo.png"
                                                                    OnClick="imbContratoHeaderCondicoes_Click" />
                                                            </div>
                                                            <div style="display: table-cell; width: 92%; text-align: center; vertical-align: middle;"><%-- COLUNA --%></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:Panel ID="pnlContratoHeaderCnpj" runat="server" DefaultButton="imbContratoHeaderCnpjCheck">
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div class="dv_form" style="width: 20%;">
                                                            <asp:Label ID="lblContratoHeaderCnpj" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; vertical-align: middle; width: 20%;">
                                                            <asp:TextBox ID="txtContratoHeaderCnpj" runat="server" SkinID="Filtro" MaxLength="18" />
                                                            <asp:HiddenField ID="hdfContratoHeaderClienteId" runat="server" Value="" />
                                                        </div>
                                                        <div style="display: table-cell; vertical-align: middle; width: 60%; text-align: left;">
                                                            <div style="display: table; width: 100%; height: 100%;">
                                                                <div style="display: table-cell; width: 8%; text-align: center; vertical-align: middle;">
                                                                    <asp:ImageButton ID="imbContratoHeaderCnpjCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                        ToolTip="<%$ Resources:Resource, lblBuscar %>"
                                                                        ImageUrl="~/Imagens/check.png"
                                                                        OnClick="imbContratoHeaderCnpjCheck_Click" />
                                                                </div>
                                                                <div style="display: table-cell; width: 8%; text-align: center; vertical-align: middle;">
                                                                    <asp:ImageButton ID="imbContratoHeaderCnpjFind" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                        ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                                        ImageUrl="~/Imagens/find.png"
                                                                        OnClick="imbContratoHeaderCnpjFind_Click" />
                                                                </div>
                                                                <div style="display: table-cell; width: 84%; text-align: left; vertical-align: middle;">
                                                                    <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 300px;">
                                                                        <asp:Label ID="lblContratoHeaderCnpjDescricao" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div class="dv_form" style="width: 20%;">
                                                            <asp:Label ID="lblContratoHeaderModalidade" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; vertical-align: middle; width: 80%; text-align: left;">
                                                            <asp:DropDownList ID="ddlContratoHeaderModalidade" runat="server" SkinID="DropFiltro" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div class="dv_form" style="width: 20%;">
                                                            <asp:Label ID="lblContratoHeaderProcesso" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; vertical-align: middle; width: 80%; text-align: left;">
                                                            <asp:TextBox ID="txtContratoHeaderProcesso" runat="server" SkinID="Filtro" MaxLength="30" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div class="dv_form" style="width: 20%;">
                                                            <asp:Label ID="lblContratoHeaderRepresentante" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; vertical-align: middle; width: 80%; text-align: left;">
                                                            <asp:Label ID="lblContratoHeaderRepresentanteDescricao" runat="server" />
                                                            <asp:HiddenField ID="hdfContratoHeaderRepresentanteId" runat="server" Value="" />
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>

                                            <%-- RIGHT --%>
                                            <div style="width: 40%; height: 30%; display: table-cell; vertical-align: top;">

                                                <div style="display: table; width: 100%; height: 25px;">
                                                    <div class="dv_form" style="width: 25%;">
                                                        <asp:Label ID="lblAcaoJudicial" runat="server" Text="Ação Judicial" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 25%; text-align: left;">
                                                        <asp:CheckBox ID="chkAcaoJudicial" runat="server" TabIndex="18" />
                                                    </div>
                                                    <div class="dv_form" style="width: 25%;">
                                                        <asp:Label ID="lblContratoHeaderStatus" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 25%; text-align: left;">
                                                        <asp:Label ID="lblContratoHeaderStatusDescricao" runat="server" SkinID="LabelResposta" />
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; height: 25px;">
                                                    <div class="dv_form" style="width: 25%;">
                                                        <asp:Label ID="lblContratoHeaderData" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 25%; text-align: left;">
                                                        <CtlData:ControlData ID="CtlContratoHeaderData" runat="server" ValidationGroup="ValidaContrato" />
                                                    </div>
                                                    <div class="dv_form" style="width: 25%;">
                                                        <%--<asp:Label ID="lblContratoHeaderValidadeExigida" runat="server" />--%>
                                                        <asp:Label ID="lblContratoHeaderPrazoEntrega" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 25%; text-align: left;">
                                                        <%--<asp:TextBox ID="txtContratoHeaderValidadeExigida" runat="server" SkinID="SmallFilter" MaxLength="50" />--%>
                                                        <asp:TextBox ID="txtContratoHeaderPrazoEntrega" runat="server" SkinID="SmallFilter" MaxLength="4" />
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; height: 25px;">
                                                    <div class="dv_form" style="width: 25%;">
                                                        <asp:Label ID="lblContratoHeaderVigencia" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 25%; text-align: left;">
                                                        <CtlData:ControlData ID="CtlContratoHeaderVigencia" runat="server" ValidationGroup="ValidaContrato" />
                                                    </div>
                                                    <div class="dv_form" style="width: 25%;">
                                                        <%--<asp:Label ID="lblContratoHeaderPrazoEntrega" runat="server" />--%>
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 25%; text-align: left;">
                                                        <%--<asp:TextBox ID="txtContratoHeaderPrazoEntrega" runat="server" SkinID="SmallFilter" MaxLength="4" />--%>
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; height: 25px;">
                                                    <div class="dv_form" style="width: 25%;">
                                                        <asp:Label ID="lblContratoHeaderDadosBancarios" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 75%; text-align: left;">
                                                        <asp:TextBox ID="txtContratoHeaderDadosBancarios" runat="server" MaxLength="100" Width="92.5%" />
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; height: 25px;">
                                                    <div class="dv_form" style="width: 25%;">
                                                        <asp:Label ID="lblContratoHeaderDoctoEfetivoEntrega" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; vertical-align: middle; width: 75%; text-align: left;">
                                                        <asp:TextBox ID="txtContratoHeaderDoctoEfetivoEntrega" runat="server" MaxLength="100" Width="92.5%" />
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; height: 25px;"><%-- LINHA --%></div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <%-- BODY --%>
                                    <div style="left: 0.5; height: 25%; width: 100%; display: table; margin-top: 2px;">
                                        <%-- FATURAMENTO --%>
                                        <div style="width: 50%; height: 100%; display: table-cell;">
                                            <fieldset style="height: 100%; width: auto;">
                                                <legend class="legend_normal">
                                                    <asp:Literal ID="ltrFaturamento" runat="server" />
                                                </legend>
                                                <asp:Panel ID="pnlContratoBodyCnpjFaturamento" runat="server" Height="100%" DefaultButton="imbContratoBodyCnpjFaturamentoAdd">
                                                    <div style="height: 100%; width: 100%;">
                                                        <div style="display: table; width: 100%; height: 20%;">
                                                            <div class="dv_form" style="width: 20%;">
                                                                <asp:Label ID="lblContratoBodyCnpjFaturamento" runat="server" />
                                                            </div>
                                                            <div style="display: table-cell; vertical-align: middle; width: 20%;">
                                                                <asp:TextBox ID="txtContratoBodyCnpjFaturamento" runat="server" SkinID="Filtro" MaxLength="18" />
                                                            </div>
                                                            <div style="display: table-cell; vertical-align: middle; width: 5%; text-align: center;">
                                                                <asp:ImageButton ID="imbContratoBodyCnpjFaturamentoFind" runat="server" Width="20px" Height="20px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                                    ImageUrl="~/Imagens/find.png"
                                                                    OnClick="imbContratoBodyCnpjFaturamentoFind_Click" />
                                                            </div>
                                                            <div style="display: table-cell; vertical-align: middle; width: 5%; text-align: center;">
                                                                <asp:ImageButton ID="imbContratoBodyCnpjFaturamentoAdd" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblAdicionar %>"
                                                                    ImageUrl="~/Imagens/addSelected.png"
                                                                    OnClick="imbContratoBodyCnpjFaturamentoAdd_Click" />
                                                            </div>
                                                            <div style="display: table-cell; vertical-align: middle; width: 5%; text-align: center;">
                                                                <asp:ImageButton ID="imbContratoBodyCnpjFaturamentoRemove" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblRemover %>"
                                                                    ImageUrl="~/Imagens/removeSelected.png"
                                                                    OnClick="imbContratoBodyCnpjFaturamentoRemove_Click" />
                                                            </div>
                                                            <div style="display: table-cell; vertical-align: middle; width: 5%;">
                                                                <asp:ImageButton ID="imbContratoBodyCnpjFaturamentoRemoveAll" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblRemoverTodos %>"
                                                                    ImageUrl="~/Imagens/remove.png"
                                                                    OnClick="imbContratoBodyCnpjFaturamentoRemoveAll_Click" />
                                                            </div>
                                                            <div style="display: table-cell; vertical-align: middle; width: 40%;">
                                                                <asp:ImageButton ID="imbContratoBodySetEnderecos" runat="server" Width="20px" Height="20px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblEnderecosVincular %>"
                                                                    ImageUrl="~/Imagens/arrow.png"
                                                                    OnClick="imbContratoBodySetEnderecos_Click" />
                                                            </div>
                                                        </div>
                                                        <div style="display: table; width: 100%; height: 60%;">
                                                            <asp:ListBox ID="lbxContratoBodyCnpj" runat="server" SelectionMode="Multiple" />
                                                        </div>
                                                        <div style="display: table; width: 100%; height: 10%;">
                                                            <div style="display: table-cell; width: 20%; height: 100%;">
                                                                <asp:Image ID="imgCnpjGreen" runat="server" ImageAlign="AbsMiddle" Height="20px" Width="20px" ImageUrl="~/Imagens/LabelGreen.png" />
                                                                <asp:Label ID="lblCnpjGreen" runat="server" />
                                                            </div>
                                                            <div style="display: table-cell; width: 20%; height: 100%;">
                                                                <asp:Image ID="imgCnpjOrange" runat="server" ImageAlign="AbsMiddle" Height="20px" Width="20px" ImageUrl="~/Imagens/LabelOrange.png" />
                                                                <asp:Label ID="lblCnpjOrange" runat="server" />
                                                            </div>
                                                            <div style="display: table-cell; width: 20%; height: 100%;">
                                                                <asp:Image ID="imgCnpjRed" runat="server" ImageAlign="AbsMiddle" Height="20px" Width="20px" ImageUrl="~/Imagens/LabelRed.png" />
                                                                <asp:Label ID="lblCnpjRed" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>

                                        <%-- ENDEREÇOS --%>
                                        <div style="width: 50%; height: 100%; display: table-cell;">
                                            <fieldset style="height: 100%; width: auto;">
                                                <legend class="legend_normal">
                                                    <asp:Literal ID="ltrEnderecos" runat="server" />
                                                </legend>
                                                <asp:Panel ID="pnlContratoBodyEnderecos" runat="server" Height="100%">
                                                    <div style="height: 100%; width: 100%;">
                                                        <div style="display: table; height: 20%; width: 100%;">
                                                            <div class="dv_form" style="width: 15%;">
                                                                <asp:Label ID="lblContratoBodyEnderecos" runat="server" />
                                                            </div>
                                                            <div class="dv_form" style="width: 70%; text-align: center;">
                                                                <div style="display: table; width: 100%; height: 100%;">
                                                                    <div style="display: table-cell; vertical-align: middle;">
                                                                        <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 480px;">
                                                                            <asp:Label ID="lblContratoBodyEnderecosCliente" runat="server" ForeColor="Blue" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="display: table-cell; vertical-align: middle; width: 5%; text-align: center;">
                                                                <asp:ImageButton ID="imbContratoBodyEnderecosFind" runat="server" Width="20px" Height="20px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                                    ImageUrl="~/Imagens/find.png"
                                                                    OnClick="imbContratoBodyEnderecosFind_Click" />
                                                            </div>
                                                            <div style="display: table-cell; vertical-align: middle; width: 5%; text-align: center;">
                                                                <asp:ImageButton ID="imbContratoBodyEnderecosRemove" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblRemover %>"
                                                                    ImageUrl="~/Imagens/removeSelected.png"
                                                                    OnClick="imbContratoBodyEnderecosRemove_Click" />
                                                            </div>
                                                            <div style="display: table-cell; vertical-align: middle; width: 5%;">
                                                                <asp:ImageButton ID="imbContratoBodyEnderecosRemoveAll" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblRemoverTodos %>"
                                                                    ImageUrl="~/Imagens/remove.png"
                                                                    OnClick="imbContratoBodyEnderecosRemoveAll_Click" />
                                                            </div>
                                                        </div>
                                                        <div style="display: table; height: 60%; width: 100%;">
                                                            <asp:ListBox ID="lbxContratoBodyEderecos" runat="server" SelectionMode="Multiple" />
                                                        </div>
                                                        <div style="display: table; height: 10%; width: 100%;">
                                                            <div style="display: table-cell; width: 20%; height: 100%;">
                                                                <asp:Image ID="imgEnderecoGreen" runat="server" ImageAlign="AbsMiddle" Height="20px" Width="20px" ImageUrl="~/Imagens/LabelGreen.png" />
                                                                <asp:Label ID="lblEnderecoGreen" runat="server" />
                                                            </div>
                                                            <div style="display: table-cell; width: 20%; height: 100%;">
                                                                <asp:Image ID="imgEnderecoRed" runat="server" ImageAlign="AbsMiddle" Height="20px" Width="20px" ImageUrl="~/Imagens/LabelRed.png" />
                                                                <asp:Label ID="lblEnderecoRed" runat="server" />
                                                            </div>
                                                            <div style="display: table-cell; width: 20%; height: 100%;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>

                                    <%-- GET ITENS --%>
                                    <fieldset style="height: 15%; margin-top: 3px;">
                                        <legend class="legend_normal">
                                            <asp:Literal ID="ltrItensBusca" runat="server" />
                                        </legend>
                                        <asp:Panel ID="pnlItemBusca" runat="server" DefaultButton="imbContratoItensCheck">
                                            <div style="display: table; width: 100%; height: 100%;">
                                                <div class="dv_form" style="width: 10%;">
                                                    <asp:Label ID="lblContratoItens" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 12%; vertical-align: middle;">
                                                    <asp:TextBox ID="txtContratoItens" runat="server" MaxLength="30" SkinID="Filtro" AutoPostBack="true" OnTextChanged="txtContratoItens_TextChanged" />
                                                        <asp:HiddenField ID="hdPerfilUsuario" runat="server" />
                                                    <ucc:AutoCompleteExtender ID="aceItem" runat="server"
                                                        CompletionListCssClass="autocomplete_list1"
                                                        CompletionListItemCssClass="autocomplete_listitem"
                                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                        CompletionInterval="100"
                                                        EnableCaching="false"
                                                        MinimumPrefixLength="4"
                                                        UseContextKey="true"
                                                        TargetControlID="txtContratoItens"
                                                        ServiceMethod="GetItens"
                                                        ServicePath="~/AppWs/WsGetItens.asmx" />
                                                </div>
                                                <div style="display: table-cell; width: 3%; vertical-align: middle; text-align: center;">
                                                    <asp:ImageButton ID="imbContratoItensCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                        ToolTip="<%$ Resources:Resource, lblBuscar %>"
                                                        ImageUrl="~/Imagens/check.png"
                                                        OnClick="imbContratoItensCheck_Click" />
                                                </div>
                                                <div style="display: table-cell; width: 3%; vertical-align: middle; text-align: center;">
                                                    <asp:ImageButton ID="imbContratoItensFind" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                        ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                        ImageUrl="~/Imagens/find.png"
                                                        OnClick="imbContratoItensFind_Click" />
                                                </div>
                                                <%--</div>
                                                 <div style="display: table; width: 100%; height: 100%;">
                                                 <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">--%>
                                                <div class="dv_form" style="width: 10%;">
                                                    <asp:Label ID="lblContratoHeaderValidadeExigida" runat="server" />
                                                </div>
                                                <div style="display: table-cell; vertical-align: middle; width: 70%; text-align: left;">
                                                    <asp:TextBox ID="txtContratoHeaderValidadeExigida" runat="server" Style="resize: none" TextMode="MultiLine" Rows="5" Width="70%" />
                                                </div>
                                                <div style="display: table-cell; width: 27%; vertical-align: middle;"><%-- COLUNA --%></div>
                                            </div>
                                        </asp:Panel>
                                    </fieldset>

                                    <%-- ITEM --%>
                                    <asp:UpdatePanel ID="updateGridItem" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlItens" runat="server" Visible="false">
                                                <fieldset style="height: auto; margin-top: 3px;">
                                                    <legend class="legend_normal">
                                                        <asp:Literal ID="ltrItens" runat="server" />
                                                    </legend>
                                                    <div style="left: 0.5%; width: 100%; height: auto; display: table; padding: 2px 2px 2px 2px;">
                                                        <div style="left: 0.5%; width: 100%; display: table-cell; vertical-align: middle; overflow: none;">
                                                            <center />
                                                            <asp:GridView ID="gvContratoItens" runat="server"
                                                                DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,itemId,fabricanteId,itemQuantidade,itemQuantidadeVinculada,
                                                                   itemValorNegociado,itemPrecoFabrica,itemValorDesconto,itemQuantidadeFaturada,itemSaldoContrato,
                                                                   itemDescricao,itemRefrigerado,itemControlado,fabricanteNome,Vinculado,gravado,contratoLicitacaoSeq"
                                                                OnPageIndexChanging="gvContratoItens_PageIndexChanging"
                                                                OnRowCommand="gvContratoItens_RowCommand"
                                                                OnRowDataBound="gvContratoItens_RowDataBound"
                                                                OnRowDeleting="gvContratoItens_RowDeleting"
                                                                OnRowUpdating="gvContratoItens_RowUpdating">
                                                                <Columns>
                                                                    <asp:BoundField DataField="itemId" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                                                                    <asp:BoundField DataField="itemDescricao" />
                                                                    <asp:BoundField DataField="fabricanteNome" ItemStyle-Width="200px" />
                                                                    <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContratoItemQuantidade" runat="server" SkinID="Currency80" MaxLength="8" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContratoItemValorNegociado" runat="server" SkinID="Currency80" MaxLength="18" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>


                                                                    <%--<asp:BoundField DataField="itemPrecoFabrica" DataFormatString="{0:#,###,##0.00}" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />--%>


                                                               <%--     <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContratoItemPrecoFabrica" runat="server" OnBlur=" return JSFunction()" SkinID="Currency80" AutoPostBack="true" onclientclick="return texboxchange(this)" OnTextChanged="txtContratoItemPrecoFabrica_TextChanged" MaxLength="18" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContratoItemPrecoFabrica" runat="server" OnBlur=" return JSFunction()" SkinID="Currency80" 
                                                                                onclientclick="return texboxchange(this)"  MaxLength="18" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                <%--    <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContratoItemValorDesconto" AutoPostBack="true" OnBlur=" return JSFunction()" OnTextChanged="txtContratoItemValorDesconto_TextChanged" onclientclick="return texboxchange(this)" runat="server" SkinID="Currency80" MaxLength="18" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                        <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContratoItemValorDesconto"  OnBlur=" return JSFunction()" 
                                                                                 onclientclick="return texboxchange(this)" runat="server" SkinID="Currency80" MaxLength="18" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                        <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContratoItemValorDescontoCAP" 
                                                                                 OnBlur=" return JSFunction()" onclientclick="return texboxchange(this)" runat="server" SkinID="Currency80" MaxLength="18" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                   <%-- <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContratoItemValorDescontoCAP" AutoPostBack="true" OnBlur=" return JSFunction()" OnTextChanged="txtContratoItemValorDescontoCAP_TextChanged" onclientclick="return texboxchange(this)" runat="server" SkinID="Currency80" MaxLength="18" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField ItemStyle-Width="80px" HeaderText="Preço Compra" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <%--<asp:Label ID="lblContratoItemValorDesconto" runat="server" />--%>
                                                                            <asp:TextBox ID="txtPrecoCompra" runat="server" SkinID="Currency80" MaxLength="18" />

                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--<asp:BoundField DataField="itemQuantidadeFaturada" DataFormatString="{0:f0}"  ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />--%>
                                                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lbQtdFaturada" runat="server"
                                                                                CommandName="ViewFaturados"
                                                                                Text='<%# Eval("itemQuantidadeFaturada", "{0:f0}") %>'
                                                                                CommandArgument='<%# Eval("contratoLicitacaoId") + "|" + 
                                                                                                             Eval("clienteId") + "|" + 
                                                                                                             Eval("estabelecimentoId") + "|" + 
                                                                                                             Eval("contratoLicitacaoSeq") + "|" + 
                                                                                                             Eval("itemId") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblContratoSaldo" runat="server" Text='<%# Eval("itemSaldoContrato", "{0:f0}") %>' />
                                                                            <asp:HiddenField ID="hdfContratoSaldo" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Literal ID="ltrContratoItemTipoProduto" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Literal ID="ltrContratoItemControlado" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imbDelete" runat="server" SkinID="ImgGrid" CommandName="Delete"
                                                                                ImageUrl="~/Imagens/_trash.png"
                                                                                ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                                CommandArgument='<%# Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" + 
                                                                                                      Eval("estabelecimentoId") + "|" + Eval("itemId") + "|" + Eval("contratoLicitacaoSeq") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <%--GRID DE LOGS DE APROVAÇÃO--%>
                                    <fieldset style="height: auto; margin-top: 10px;">
                                        <legend class="legend_normal">
                                            <asp:Literal ID="lblLogsAprovacao" runat="server" />
                                        </legend>
                                        <div class="gridRegistros">
                                            <asp:GridView ID="gridViewAprovacao" runat="server"
                                                DataKeyNames="usuarioId,apvMotivo, apvStatus,apvDataInclusao"
                                                OnRowDataBound="gridViewAprovacao_RowDataBound"
                                                OnPageIndexChanging="gridViewAprovacao_PageIndexChanging">
                                                <Columns>
                                                    <asp:BoundField DataField="usuarioId" />
                                                    <asp:BoundField DataField="apvMotivo" />
                                                    <asp:BoundField DataField="apvStatus" />
                                                    <asp:BoundField DataField="apvDataInclusao" />
                                                </Columns>
                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </fieldset>


                                    <%-- FOOTER --%>
                                    <fieldset style="height: 25%; margin-top: 2px; margin-bottom: 250px;">
                                        <legend class="legend_normal">
                                            <asp:Literal ID="ltrObservacoes" runat="server" />
                                        </legend>
                                        <div style="display: table; width: 100%; height: 10%; text-align: right;">
                                            <div class="dv_form">
                                                <asp:Label ID="lblFooterTotalContratoItens" runat="server" />
                                            </div>
                                            <div class="dv_form" style="width: 180px;">
                                                <asp:TextBox ID="txtFooterTotalContratoItens" runat="server" Enabled="false" Font-Bold="true" SkinID="Currency150" />
                                            </div>
                                            <div class="dv_form" style="width: 180px;">
                                                <asp:Label ID="lblFooterTotalContratoValor" runat="server" />
                                            </div>
                                            <div class="dv_form" style="width: 180px;">
                                                <asp:TextBox ID="txtFooterTotalContratoValor" runat="server" Enabled="false" Font-Bold="true" SkinID="Currency150" />
                                            </div>
                                        </div>
                                        <div style="display: table; width: 100%; height: 90%;">
                                            <div class="dv_form" style="width: 20%;">
                                                <asp:Label ID="lblContratoFooterObservacoes" runat="server" />
                                            </div>
                                            <div style="display: table-cell; vertical-align: middle; text-align: center; width: 80%;">
                                                <asp:TextBox ID="txtContratoFooterObservacoes" runat="server" TextMode="MultiLine" Rows="3" Height="80%" Width="99%" MaxLength="500" />
                                            </div>


                                        </div>
                                    </fieldset>
                                </div>
                            </div>




                        </fieldset>
                    </div>
                </asp:Panel>

                <%-- ANEXOS --%>
                <asp:UpdatePanel ID="uppContratoDocumentos" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbContratoHeaderCondicoes" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlContratoDocumentos" runat="server" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblContratoDocumentosHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbDocumentosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbContratoDocumentosClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div style="left: 0%; display: table; width: 100%; height: 100%; position: relative; text-align: left;">
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                                    <asp:Label ID="lblContratoDocumentosNome" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                                    <asp:TextBox ID="txtContratoDocumentosNome" runat="server" MaxLength="100" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                                    <asp:Label ID="lblContratoDocumentosArquivo" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                                    <asp:FileUpload ID="fulContratoDocumentos" runat="server" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                    <asp:Label ID="lblContratoDocumentosObservacoes" runat="server" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 20%;">
                                                <asp:TextBox ID="txtContratoDocumentosObservacoes" runat="server" TextMode="MultiLine" Width="98.5%" Height="100%" />
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%; text-align: center;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                    <asp:Button ID="btnContratoDocumentosAnexar" runat="server" SkinID="ButtonLeft" OnClick="btnContratoDocumentosAnexar_Click" />
                                                    <asp:Button ID="btnContratoDocumentosLimpar" runat="server" SkinID="ButtonRight" OnClick="btnContratoDocumentosLimpar_Click" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 120px; text-align: center;">
                                                <fieldset>
                                                    <div style="width: 100%; height: 100px; overflow-x: none; overflow-y: scroll;">
                                                        <%-- GRID REGISTROS --%>
                                                        <asp:GridView ID="gvContratoDocumentos" runat="server"
                                                            DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,contratoDoctoSeq,contratoDoctoNomeArquivo,contratoDoctoExtensao,
                                                                          contratoDoctoDataEmissao,usuarioId,contratoDoctoObservacoes,contratoLicitacaoSeq"
                                                            OnRowDataBound="gvContratoDocumentos_RowDataBound"
                                                            OnRowCommand="gvContratoDocumentos_RowCommand"
                                                            OnPageIndexChanging="gvContratoDocumentos_PageIndexChanging"
                                                            OnRowDeleting="gvContratoDocumentos_RowDeleting"
                                                            OnRowUpdating="gvContratoDocumentos_RowUpdating">
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrDataCadastro" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="contratoDoctoNomeArquivo" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                                                <asp:BoundField DataField="contratoDoctoObservacoes" ItemStyle-HorizontalAlign="Left" />
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbDownload" runat="server" SkinID="ImgGrid" CommandName="Download"
                                                                            ToolTip="<%$ Resources:Resource, lblDownload %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                                              Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + Eval("contratoDoctoSeq") + "|" + Eval("contratoLicitacaoSeq") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid"
                                                                            ImageUrl="~/Imagens/_trash.png"
                                                                            CommandName="Delete"
                                                                            ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                                              Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + Eval("contratoDoctoSeq") + "|" + Eval("contratoLicitacaoSeq") %>' />
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

                <%-- CLIENTES --%>
                <asp:UpdatePanel ID="upCliente" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbContratoHeaderCnpjFind" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="imbContratoBodyCnpjFaturamentoFind" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlCliente" runat="server" DefaultButton="btnClienteBuscar" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblClienteHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbClienteClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbClienteClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <%-- FILTROS CLIENTES --%>
                                        <div class="navegacao">
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblClienteId" runat="server" />
                                                <asp:TextBox ID="txtClienteId" runat="server" SkinID="Filtro" MaxLength="30" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblClienteERP" runat="server" />
                                                <asp:TextBox ID="txtClienteERP" runat="server" SkinID="Filtro" MaxLength="30" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblClienteCnpj" runat="server" />
                                                <asp:TextBox ID="txtClienteCnpj" SkinID="Filtro" runat="server" MaxLength="20" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblClienteRazaoSocial" runat="server" />
                                                <asp:TextBox ID="txtClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Button ID="btnClienteBuscar" runat="server" SkinID="ButtonLeft" OnClick="btnClienteBuscar_Click" />
                                                <asp:Button ID="btnClienteLimpar" runat="server" SkinID="ButtonRight" OnClick="btnClienteLimpar_Click" />
                                            </div>
                                        </div>

                                        <%-- GRID REGISTROS CLIENTES --%>
                                        <div class="gridRegistros">
                                            <asp:GridView ID="gvClientes" runat="server"
                                                DataKeyNames="clienteId,clienteCNPJ,clienteIdERP,clienteRazaoSocial,representanteNome,representanteId,clienteTipoCredito"
                                                OnPageIndexChanging="gvClientes_PageIndexChanging"
                                                OnRowCommand="gvClientes_RowCommand" OnRowDataBound="gvClientes_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrClienteId" runat="server" Text='<%# FormataStringSaida(Eval("clienteId"), txtClienteId.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrClienteIdErp" runat="server" Text='<%# FormataStringSaida(Eval("clienteIdERP"), txtClienteERP.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtClienteRazaoSocial.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCNPJ").ToString(), Comom.Utility.FormatOption.ApplyMask), txtClienteCnpj.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrClienteGrupoComercial" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="clienteTipoCredito" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbClienteCheckInGrid" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle"
                                                                ImageUrl="~/Imagens/check.png"
                                                                CommandName="Select"
                                                                ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("clienteId") %>' />
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

                <%-- ITEM --%>
                <asp:UpdatePanel ID="uppItem" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbContratoItensFind" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlItem" runat="server" DefaultButton="btnItemPesquisa" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblItemHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbItemClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbItemClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div class="navegacao">
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltroFabricante" runat="server" />
                                                <asp:DropDownList ID="ddlFabricante" runat="server" SkinID="DropFiltro" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlFabricante_SelectedIndexChanged" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltrosNomeQuimico" runat="server" />
                                                <asp:DropDownList ID="ddlNomeQuimico" runat="server" SkinID="DropFiltro" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlNomeQuimico_SelectedIndexChanged" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltrosNomeComercial" runat="server" />
                                                <asp:DropDownList ID="ddlNomeComercial" runat="server" SkinID="DropFiltro" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <div class="line">
                                                    <asp:Button ID="btnItemPesquisa" runat="server" SkinID="ButtonLeft" OnClick="btnItemPesquisa_Click" />
                                                    <asp:Button ID="btnItemLimpar" runat="server" SkinID="ButtonRight" OnClick="btnItemLimpar_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <%-- GRID REGISTROS --%>
                                        <div class="gridRegistros">
                                            <asp:GridView ID="gvItensPesquisa" runat="server"
                                                DataKeyNames="itemId,itemDescricao,itemInfComplementar,itemPesoBruto,itemPesoLiquido,itemRefrigerado,itemControlado,
                                                          familiaComercialId,familiaComercialDescricao,familiaMaterialId,familiaMaterialDescricao,grupoEstoqueId,grupoEstoqueDescricao,
                                                          fabricanteId,fabricanteNome,fabricanteNomeAbreviado,classificacaoFiscalId,classificacaoFiscalDescricao,informado,gravado,saldo,
                                                          unidadeMedidaId,unidadeMedidaSigla,tabelaPrecoVlrTabela,tabelaPrecoVlrMinimo,tabelaPrecoVlrMaximo,IsentoFrete,precoFabrica"
                                                OnPageIndexChanging="gvItensPesquisa_PageIndexChanging"
                                                OnRowCommand="gvItensPesquisa_RowCommand"
                                                OnRowDataBound="gvItensPesquisa_RowDataBound">
                                                <Columns>
                                                    <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" ItemStyle-Wrap="true" />
                                                    <asp:BoundField DataField="itemDescricao" />
                                                    <asp:BoundField DataField="unidadeMedidaSigla" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px" ItemStyle-Wrap="true" />
                                                    <asp:BoundField DataField="familiaComercialDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false" />
                                                    <asp:BoundField DataField="familiaMaterialDescricao" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                                    <asp:BoundField DataField="grupoEstoqueDescricao" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                                    <asp:BoundField DataField="fabricanteNome" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false" />
                                                    <asp:BoundField DataField="classificacaoFiscalDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false" />

                                                    <asp:TemplateField ItemStyle-Width="250px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrFabricante" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                   <%-- <asp:TemplateField ItemStyle-Width="250px" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrEstabelecimento" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <%--thiago mandou tirar 07/01/2019--%>
                                                    <%--                 <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" Visible="true">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrValidade" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrPrecoFabrica" runat="server"
                                                                Text='<%# string.Format("{0:n2}", decimal.Parse(Eval("precoFabrica").ToString())) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid"
                                                                ImageUrl="~/Imagens/check.png"
                                                                ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                CommandArgument='<%# Eval("itemId") + "|" + ((GridViewRow)Container).RowIndex %>' />
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

                <%-- ENDEREÇOS --%>
                <asp:UpdatePanel ID="uppEnderecos" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbContratoBodyCnpjFaturamentoFind" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlEnderecos" runat="server" DefaultButton="btnEnderecosIncluir" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblEnderecosHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbEnderecosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            OnClick="imbEnderecosClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <asp:Panel ID="pnlEnderecosDados" runat="server">
                                            <%-- CAMPOS --%>
                                            <div style="left: 0%; width: 100%; display: table; height: 50%;">
                                                <div style="width: 40%; display: table-cell;">
                                                    <ol>
                                                        <li>
                                                            <asp:HiddenField ID="hdClienteEnderecoIndiceGrid" runat="server" />
                                                            <asp:HiddenField ID="hdClienteEnderecoClienteId" runat="server" />
                                                            <asp:HiddenField ID="hdClienteEnderecoSeq" runat="server" />
                                                            <asp:Label ID="lblDadosClienteTipoEndereco" runat="server" SkinID="LabelForm" />
                                                            <asp:DropDownList ID="ddDadosClienteTipoEndereco" runat="server" Visible="false" />
                                                            <asp:TextBox ID="txtDadosClienteTipoEndereco" runat="server" MaxLength="12" />
                                                        </li>
                                                        <li>
                                                            <asp:Panel ID="pnlContratoEnderecosCep" runat="server" DefaultButton="imbBuscaCep">
                                                                <asp:Label ID="lblDadosClienteWfEnderecoCep" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtDadosClienteWfEnderecoCep" runat="server" MaxLength="9" SkinID="Pedido" />
                                                                <asp:ImageButton ID="imbBuscaCep" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                    ImageUrl="~/Imagens/find.png"
                                                                    ToolTip="<%$ Resources:Resource, lblBuscar %>"
                                                                    OnClick="imbBuscaCep_Click" />
                                                            </asp:Panel>
                                                        </li>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteWfEndereco" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteWfEndereco" runat="server" MaxLength="40" />
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
                                                            <asp:TextBox ID="txtDadosClienteWfEnderecoNumero" runat="server" MaxLength="30" SkinID="Pedido" Visible="false" />
                                                        </li>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteWfEnderecoComplemento" runat="server" SkinID="LabelForm" Visible="false" />
                                                            <asp:TextBox ID="txtDadosClienteWfEnderecoComplemento" runat="server" MaxLength="100" Visible="false" />
                                                        </li>
                                                    </ol>
                                                </div>
                                                <div style="width: 60%; display: table-cell;">
                                                    <ol>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteWfEnderecoPais" runat="server" SkinID="LabelForm" />
                                                            <asp:DropDownList ID="ddlDadosClienteWfEnderecoPais" runat="server" AutoPostBack="True"
                                                                OnSelectedIndexChanged="ddDadosClienteEnderecoPais1_SelectedIndexChanged" />
                                                        </li>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteWfEnderecoUf" runat="server" SkinID="LabelForm" />
                                                            <asp:DropDownList ID="ddDadosClienteWfEnderecoUf" runat="server" />
                                                        </li>
                                                        <li>
                                                            <asp:Label ID="lblDadosClienteWfEnderecoCidade" runat="server" SkinID="LabelForm" />
                                                            <asp:TextBox ID="txtDadosClienteWfEnderecoCidade" runat="server" MaxLength="100" />
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
                                                            <asp:TextBox ID="txtDadosClienteWfEnderecoBairro" runat="server" MaxLength="100" />
                                                        </li>
                                                        <li>
                                                            <div class="line">
                                                                <div class="line_itens_left">
                                                                    <asp:Label ID="lblDadosClientesWfEnderecoObs1" runat="server" SkinID="LabelForm" />
                                                                </div>
                                                                <div class="line_itens">
                                                                    <asp:TextBox ID="txtDadosClientesWfEnderecoObs1" runat="server" MaxLength="500" TabIndex="69"
                                                                        TextMode="MultiLine" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <%-- BOTÕES --%>
                                            <div style="display: table; width: 100%; text-align: center; height: 40px;">
                                                <div style="display: table-cell; height: 100%; vertical-align: middle;">
                                                    <asp:Button ID="btnEnderecosIncluir" runat="server" SkinID="ButtonLeft" OnClick="btnEnderecosIncluir_Click" ValidationGroup="ValidacaoEndereco" />
                                                    <asp:Button ID="btnEnderecosLimpar" runat="server" SkinID="ButtonCenter" OnClick="btnEnderecosLimpar_Click" />
                                                    <asp:Button ID="btnContratoBodyEnderecosAdd" runat="server" SkinID="ButtonRight" OnClick="btnContratoBodyEnderecosAdd_Click" />
                                                </div>
                                            </div>
                                            <%-- GRID --%>
                                            <div style="left: 0%; display: table; width: 100%; text-align: center;">
                                                <div style="width: 100%; height: 290px; overflow-x: none; overflow-y: scroll;">
                                                    <center />
                                                    <asp:GridView ID="gvEnderecos" runat="server"
                                                        DataKeyNames="clienteId,tipoEnderecoId,clienteIdERP,clienteEnderecoSeq,clienteEndereco,
                                                                            clienteEnderecoNumero,clienteEnderecoComplemento,clienteEnderecoCEP,paisNome,representanteId,
                                                                            ufId,clienteEnderecoObservacoes,clienteEnderecoCidade,clienteEnderecoBairro,representanteNome"
                                                        OnPageIndexChanging="gvEnderecos_PageIndexChanging"
                                                        OnRowCommand="gvEnderecos_RowCommand"
                                                        OnRowDataBound="gvEnderecos_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkAll" runat="server" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="clienteEnderecoSeq" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" Visible="false" />
                                                            <asp:TemplateField ItemStyle-Width="110px" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrTipoEndereco" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrCep" runat="server" Text='<%# Comom.Utility.FormataDocumentos(Eval("clienteEnderecoCEP").ToString(), Comom.Utility.FormatOption.ApplyMask, Comom.Utility.TipoDocumento.CEP) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="clienteEndereco" ItemStyle-HorizontalAlign="Left" />
                                                            <asp:BoundField DataField="clienteEnderecoNumero" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" Visible="false" />
                                                            <asp:BoundField DataField="clienteEnderecoComplemento" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" Visible="false" />
                                                            <asp:BoundField DataField="clienteEnderecoBairro" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
                                                            <asp:BoundField DataField="clienteEnderecoCidade" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                                            <asp:BoundField DataField="ufId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                                            <asp:BoundField DataField="paisNome" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                                            <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="imbObservacao" runat="server" Height="25px" Width="25px" ImageAlign="AbsMiddle"
                                                                        ImageUrl="~/Imagens/Find.png"
                                                                        ToolTip='<%# Eval("clienteEnderecoObservacoes") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="representanteNome" ItemStyle-Width="150px" />
                                                            <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imbSelecionar" runat="server" SkinID="ImgGrid" CommandName="Select"
                                                                        ImageUrl="~/Imagens/check.png"
                                                                        ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("clienteEnderecoSeq") + "|" + Eval("clienteId") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>

                        <%--VALIDADORES DO ENDEREÇO --%>
                        <asp:RequiredFieldValidator ID="rfvEnderecoTipoEndereco" runat="server" ControlToValidate="txtDadosClienteTipoEndereco" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                        <asp:RequiredFieldValidator ID="rfvEnderecoCep" runat="server" ControlToValidate="txtDadosClienteWfEnderecoCep" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                        <asp:RequiredFieldValidator ID="rfvEnderecoRua" runat="server" ControlToValidate="txtDadosClienteWfEndereco" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                        <asp:RequiredFieldValidator ID="rfvEnderecoNumero" runat="server" ControlToValidate="txtDadosClienteWfEnderecoNumero" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                        <asp:RequiredFieldValidator ID="rfvEnderecoBairro" runat="server" ControlToValidate="txtDadosClienteWfEnderecoBairro" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                        <asp:RequiredFieldValidator ID="rfvEnderecoCidade" runat="server" ControlToValidate="txtDadosClienteWfEnderecoCidade" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoEndereco" />
                        <asp:ValidationSummary ID="vsValidacaoEndereco" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidacaoEndereco" />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- MOTIVO CANCELAMENTO --%>
                <asp:UpdatePanel ID="uppMotivos" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
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
                                </div>
                                <div class="painel_body" style="height: 75%;">
                                    <fieldset>
                                        <div style="left: 0%; position: relative; width: 99.5%; height: 100%;">
                                            <div style="display: table; width: 100%; height: 20%;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle; text-align: left;">
                                                    <asp:Label ID="lblMotivosDescricao" runat="server" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 60%;">
                                                <asp:TextBox ID="txtMotivosDescricao" runat="server" Columns="100" Rows="5" TextMode="MultiLine" MaxLength="250" Height="100%" Width="98%" />
                                            </div>
                                            <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                    <asp:Button ID="btnSalvarMotivos" runat="server" SkinID="ButtonLeft" ValidationGroup="ValidacaoMotivo" OnClick="btnSalvarMotivos_Click" />
                                                    <asp:Button ID="btnFecharMotivos" runat="server" SkinID="ButtonRight" OnClick="btnFecharMotivos_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:RequiredFieldValidator ID="rfvDescricaoMotivo" runat="server" ControlToValidate="txtMotivosDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoMotivo" />
                        <asp:ValidationSummary ID="vsmMotivo" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidacaoMotivo" />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- CONFIRMAR CANCELAMENTO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upConfirmarCancelamentoLicitacao" runat="server" UpdateMode="Conditional">
                        <Triggers></Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlConfirmarCancelamentoLicitacao" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblConfirmarCancelamentoLicitacaoHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                                            <div style="width: 80%; height: 100%; display: table-cell; vertical-align: middle;">
                                                <asp:Label ID="lblConfirmarCancelamentoLicitacaoBody" runat="server" />
                                            </div>
                                            <div style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgAlert" runat="server" Height="50%" Width="60%" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/question.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnConfirmarCancelamentoLicitacaoSim" runat="server" SkinID="ButtonLeft"
                                                    OnClick="btnConfirmarCancelamentoLicitacaoSim_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnConfirmarCancelamentoLicitacaoNao" runat="server" SkinID="ButtonRight"
                                                    OnClick="btnConfirmarCancelamentoLicitacaoNao_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%--PEGA NOVOS DADOS PARA NOVO CONTRATO COM DADOS DE CONTRATO ANTIGO--%>
                <asp:UpdatePanel ID="upNovasChavesContratoCancelado" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlNovasChavesContratoCancelado" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround">
                            </div>
                            <div class="painel" style="width: 54%; height: 50%; left: 23%; top: 25%; z-index: 1;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="Label1" runat="server" ForeColor="White" />
                                    </div>
                                </div>
                                <div class="painel_body" style="height: 75%;">
                                    <fieldset>
                                        <div style="left: 0%; position: relative; width: 99.5%; height: 100%;">

                                            <div style="display: table; width: 100%; height: 25px;">
                                                <div class="dv_form">
                                                    <asp:Label ID="lblContratoLojaAlteracao" runat="server" />
                                                </div>
                                                <div style="display: table-cell; vertical-align: middle; width: 75%; text-align: left;">
                                                    <asp:DropDownList ID="ddlContratoLojaAlteracao" runat="server" SkinID="DropFiltro" />
                                                </div>
                                            </div>

                                            <div style="display: table; width: 100%; height: 25px;">
                                                <div class="dv_form">
                                                    <asp:Label ID="lblContratoAlteracao" runat="server" />
                                                </div>
                                                <div style="display: table-cell; vertical-align: middle; width: 75%;">
                                                    <asp:TextBox ID="txtContratoAlteracao" runat="server" SkinID="Filtro" MaxLength="50" />
                                                </div>
                                            </div>

                                            <div style="display: table; width: 100%; height: 25px;">
                                                <div class="dv_form">
                                                    <asp:Label ID="lblContratoCnpjAlteracao" runat="server" />
                                                </div>

                                                <div style="display: table-cell; vertical-align: middle; width: 25%;">
                                                    <asp:TextBox ID="txtContratoCnpjAlteracao" runat="server" SkinID="Filtro" MaxLength="18" />
                                                    <asp:HiddenField ID="hdfContratoAlteracaoClienteId" runat="server" Value="" />
                                                    <asp:HiddenField ID="hdfContratoAlteracaoRepresentanteId" runat="server" Value="" />
                                                </div>

                                                <div style="display: table-cell; vertical-align: middle; text-align: left; width: 50%;">
                                                    <div style="display: table;">
                                                        <div style="display: table-cell; text-align: center; vertical-align: middle;">
                                                            <asp:ImageButton ID="imbContratoCnpjAlteradoCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                ToolTip="<%$ Resources:Resource, lblBuscar %>"
                                                                ImageUrl="~/Imagens/check.png"
                                                                OnClick="imbContratoCnpjAlteradoCheck_Click" />
                                                        </div>
                                                        <div style="display: table-cell; text-align: center; vertical-align: middle;">
                                                            <asp:ImageButton ID="imbContratoCnpjAlteradoFind" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                                ImageUrl="~/Imagens/find.png"
                                                                OnClick="imbContratoCnpjAlteradoFind_Click" />
                                                        </div>

                                                        <div style="display: table-cell; margin-left: 100px; text-align: left; vertical-align: middle;">
                                                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 250px;">
                                                                <asp:Label ID="lblContratoCnpjDescricaoAlteracao" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                    <asp:Button ID="btnSalvarChavesContrato" runat="server" SkinID="ButtonLeft" ValidationGroup="ValidacaoAlteraChaves"
                                                        OnClick="btnSalvarChavesContrato_Click" />
                                                    <asp:Button ID="btnFecharPnlChavesCotrato" runat="server" SkinID="ButtonRight"
                                                        OnClick="btnFecharPnlChavesCotrato_Click" />
                                                </div>
                                            </div>

                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>

                        <asp:RequiredFieldValidator ID="rfvContratoHeaderAlteracao" runat="server" ControlToValidate="txtContratoAlteracao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoAlteraChaves" />
                        <asp:RequiredFieldValidator ID="rfvContratoHeaderCnpjAlteracao" runat="server" ControlToValidate="txtContratoCnpjAlteracao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoAlteraChaves" />
                        <asp:ValidationSummary ID="vsmValidacaoAlteraChaves" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidacaoAlteraChaves" />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- PANEL REPRESENTANTES --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppRepresentantes" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbBuscaRepresentante" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="imbCheckRepresentante" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlRepresentantes" runat="server" DefaultButton="btnRepresentanteBuscar" Visible="false" SkinID="PnlPopUpNv1">
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

                <%-- POP UP PEDIDOS VINCULADOS --%>
                <asp:UpdatePanel ID="upPedidos" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="pnlPedidos" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround">
                            </div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblPedido" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblContratoXItemFaturado %>" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbPedidoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbPedidoClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <asp:GridView ID="gvPedido" runat="server"
                                        OnRowDataBound="gvPedido_RowDataBound"
                                        OnPageIndexChanging="gvPedido_PageIndexChanging">
                                        <Columns>
                                            <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" />
                                            <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                            <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="pedidoItemQuantidade" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:###,###,###,#00.##}" ItemStyle-Width="40px" />
                                            <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                            <asp:BoundField DataField="pedidoData" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px" />
                                            <asp:BoundField DataField="transportadoraNome" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="250px" />
                                            <asp:BoundField DataField="pedidoSituacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imbView" runat="server"
                                                        CommandName="View"
                                                        SkinID="ImgGrid"
                                                        ImageUrl="~/Imagens/find.png"
                                                        ToolTip="<%$ Resources:Resource, lblVisualizar %>" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>







                <%--PAINEL DE APROVAÇÃO--%>
                <asp:UpdatePanel ID="uppAprovaContrato" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAprovaContratoOk" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnAprovaContratoNOk" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlAprovaContrato" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround">
                            </div>
                            <div class="painel" style="width: 60%; height: 60%; left: 20%; top: 25%;">
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
                                                    <asp:Button ID="btnAprovaContratoOk" runat="server" SkinID="ButtonLeft" OnClick="btnAprovaContratoOk_Click" />
                                                    <asp:Button ID="btnAprovaContratoNOk" runat="server" SkinID="ButtonRight" OnClick="btnAprovaContratoNOk_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>





                <%-- VALIDADORES --%>
                <asp:RequiredFieldValidator ID="rfvContratoId" runat="server" ControlToValidate="txtContratoHeader" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaContrato" />
                <asp:RequiredFieldValidator ID="rfvContratoClienteCnpj" runat="server" ControlToValidate="txtContratoHeaderCnpj" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaContrato" />
                <asp:RequiredFieldValidator ID="rfvContratoProcesso" runat="server" ControlToValidate="txtContratoHeaderProcesso" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaContrato" />
                <asp:RequiredFieldValidator ID="rfvContratoValidadeExigida" runat="server" ControlToValidate="txtContratoHeaderValidadeExigida" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaContrato" />
                <asp:RequiredFieldValidator ID="rfvContratoPrazoEntrega" runat="server" ControlToValidate="txtContratoHeaderPrazoEntrega" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaContrato" />
                <asp:RequiredFieldValidator ID="rfvContratoBancario" runat="server" ControlToValidate="txtContratoHeaderDadosBancarios" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaContrato" />
                <asp:RequiredFieldValidator ID="rfvContratoDoctoEfetivo" runat="server" ControlToValidate="txtContratoHeaderDoctoEfetivoEntrega" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidaContrato" />
                <asp:ValidationSummary ID="vsmContrato" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaContrato" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
