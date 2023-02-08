<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"
    CodeBehind="CadEmpenho.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEmpenho" %>

<%-- CONTOLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>

<%-- NAMESPACE --%>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Utility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlEmpenho" runat="server">
        <asp:UpdatePanel ID="uppEmpenho" runat="server" UpdateMode="Conditional">
            <Triggers>
                <%-- ANEXOS EMPENHO --%>
                <asp:PostBackTrigger ControlID="btnAnexoEmpenhoAnexar" />
                <asp:AsyncPostBackTrigger ControlID="imbAnexosEmpenhoClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbEmpenhoAnexos" EventName="Click" />
                <%-- ANEXOS CONTRATO --%>
                <asp:AsyncPostBackTrigger ControlID="imbContratoCondicoes" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbAnexosContratoClose" EventName="Click" />
                <%-- FILTROS --%>
                <asp:AsyncPostBackTrigger ControlID="gvEmpenhoPesquisa" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosNovo" EventName="Click" />
                <%-- BODY --%>
                <asp:AsyncPostBackTrigger ControlID="btnVoltar" EventName="Click" />
                <%-- CONTRATO/CLIENTE --%>
                <asp:AsyncPostBackTrigger ControlID="btnContratoClientePesquisa" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnContratoClienteLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbContratoClienteClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvContratoCliente" EventName="RowCommand" />
                <%-- ITEM --%>
                <asp:AsyncPostBackTrigger ControlID="imbItemPanelClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvItensPesquisa" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="btnItemAdicionar" EventName="Click" />
                <%-- DESCRIÇÕES --%>
                <asp:AsyncPostBackTrigger ControlID="imbContratoBancarios" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbDoctoEfetivoEntrega" EventName="Click" />
                <%-- ORDEM COMPRA --%>
                <asp:AsyncPostBackTrigger ControlID="imbItensOrdemCompra" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnOrdemCompraNaoOk" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnOrdemCompraConfirmarOk" EventName="Click" />
                <%--CANCELAMENTO--%>
                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnConfirmarCancelamentoEmpenhoSim" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnConfirmarCancelamentoEmpenhoNao" EventName="Click" />
                <%-- APROVAÇÃO --%>
                <asp:AsyncPostBackTrigger ControlID="btnConfirmarAprovacaoNok" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnConfirmarAprovacaoOk" EventName="Click" />
                <%-- OC's Geradas --%>
                <asp:AsyncPostBackTrigger ControlID="gvOrdensCompraGeradas" EventName="RowCommand" />
                <%-- OC's APROVAÇÃO DE REENVIO --%>
                <asp:AsyncPostBackTrigger ControlID="btnOrdemReenvioOk" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnOrdemReenvioNaoOk" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppEmpenho">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlEmpenhoPesquisa" runat="server" DefaultButton="btnFiltrosEmpenhoPesquisa" Visible="true">
                    <div style="left: 0.5%; width: 99%; height: 100%; position: fixed; overflow-x: none;">
                        <fieldset style="left: 0.5%; width: 99%;">
                            <legend>
                                <asp:Literal ID="ltrEmpenhoFiltrosHeader" runat="server" />
                            </legend>
                            <div class="navegacao">
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosContratoId" runat="server" />
                                    <asp:TextBox ID="txtFiltrosContratoId" runat="server" SkinID="SmallFilter" MaxLength="50" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosEmpenhoId" runat="server" />
                                    <asp:TextBox ID="txtFiltrosEmpenhoId" runat="server" SkinID="SmallFilter" MaxLength="50" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosEmpenhoClienteCnpj" runat="server" />
                                    <asp:TextBox ID="txtFiltrosEmpenhoClienteCnpj" runat="server" SkinID="SmallFilter" MaxLength="20" />
                                </div>
                                <div class="boxPesquisa" style="display: none;">
                                    <asp:Label ID="lblFiltrosEmpenhoClienteRazaoSocial" runat="server" />
                                    <asp:TextBox ID="txtFiltrosEmpenhoClienteRazaoSocial" runat="server" SkinID="SmallFilter" MaxLength="100" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosOC" runat="server" />
                                    <asp:TextBox ID="txtFiltrosOC" runat="server" SkinID="SmallFilter" MaxLength="50" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosEmpenhoStatus" runat="server" />
                                    <asp:DropDownList ID="ddlFiltrosEmpenhoStatus" runat="server" SkinID="DropSmallFilter" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosEmpenhoEstabelecimento" runat="server" />
                                    <asp:DropDownList ID="ddlFiltrosEmpenhoEstabelecimento" runat="server" SkinID="DropSmallFilter" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Button ID="btnFiltrosEmpenhoPesquisa" runat="server" SkinID="ButtonLeftFind" OnClick="btnFiltrosEmpenhoPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosEmpenhoLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosEmpenhoLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovo" runat="server" SkinID="ButtonRightNew" OnClick="btnFiltrosNovo_Click" />
                                </div>
                            </div>

                            <%-- GRID REGISTROS --%>
                            <div class="gridRegistros">
                                <asp:GridView ID="gvEmpenhoPesquisa" runat="server"
                                    DataKeyNames="empenhoCodigoId,contratoLicitacaoId,clienteId,estabelecimentoId,tipoPedidoId,clienteIdFaturamento,empenhoStatusId,clienteCNPJ,
                                                  empenhoData,empenhoObservacao,empenhoDataLimiteEntrega,usuarioId,empenhoDataEmissao,usuarioIdAlteracao,empenhoDataAlteracao,
                                                  usuarioIdCancelamento,empenhoMotivoCancelamento,empenhoDataCancelamento,clienteIdERP,modalidadeLicitacaoDescricao,contratoLicitacaoData,
                                                  contratoLicitacaoProcesso,contratoLicitacaoValidade,contratoLicitacaoVigencia,contratoLicitacaoPrazo,contratoLicitacaoObservacoes,
                                                  contratoLicitacaoBancario,contratoLicitacaoDoctEfetivo,representanteNome,clienteRazaoSocial,lojaFormatada,contratoLicitacaoSeq,empenhoOCNumero,
                                                  clienteCNPJFaturamento,clienteRazaoSocialFaturamento,empenhoDataEncerramento,empenhoOCGerada,empenhoOCusuarioId,empenhoOCDataEmissao"
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
                                                <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Utility.FormataDocumentos(Eval("clienteCNPJFaturamento").ToString(), Utility.FormatOption.ApplyMask), txtFiltrosEmpenhoClienteCnpj.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocialFaturamento"), txtFiltrosEmpenhoClienteRazaoSocial.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="lojaFormatada" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="250px" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrStatus" runat="server" Text='<%# FormataStringSaida(GetResourceValue(Eval("empenhoStatusId").ToString()), ddlFiltrosEmpenhoStatus.SelectedItem.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="empenhoDataEmissao" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrUsuario" runat="server" Text='<%# Eval("usuarioId") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbViewOrdens" runat="server"
                                                    CommandName="ViewOrdens"
                                                    SkinID="ImgGrid"
                                                    ImageUrl="~/Imagens/find.png"
                                                    ToolTip="<%$ Resources:Resource, lblVisualizarOCUsuarios %>"
                                                    CommandArgument='<%#  Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" + 
                                                                                       Eval("estabelecimentoId") + "|" + Eval("contratoLicitacaoSeq") + "|" + 
                                                                                       Eval("empenhoCodigoId") + "|" + Eval("tipoPedidoId") + "|" + Eval("clienteIdFaturamento")  %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbSelect" runat="server"
                                                    CommandName="View"
                                                    SkinID="ImgGrid"
                                                    ImageUrl="~/Imagens/find.png"
                                                    ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                    CommandArgument='<%#  ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                       Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + Eval("empenhoCodigoId") + "|" + 
                                                                                       Eval("contratoLicitacaoSeq") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>

                <%-- PAINEL EMPENHO BODY --%>
                <asp:Panel ID="pnlEmpenhoDados" runat="server" Visible="false">
                    <div style="left: 0.4%; display: table; width: 99%; height: 100%; position: fixed;">
                        <fieldset style="left: 0.4%; width: 98%; height: 100%; position: fixed;">
                            <legend>
                                <asp:Literal ID="ltrEmpenhoBodyHeader" runat="server" />
                            </legend>
                            <%-- BACKGROUND - BODY --%>
                            <div style="left: 0.5%; width: 99%; height: 100%; position: fixed; overflow-x: none;">
                                <%-- BUTTONS --%>
                                <div style="left: 0.5%; width: 99%; padding-bottom: 10px; position: relative; overflow-x: none;">
                                    <%-- HEADER BUTTONS --%>
                                    <div style="width: 100%; display: table; margin-top: 2px;">
                                        <asp:Panel ID="pnlInformacoesGerais" runat="server" Visible="true">
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
                                        <div class="boxPesquisa">
                                            <asp:Label ID="lblStatusEncerramentoEmpenho" runat="server" />
                                            <asp:DropDownList ID="dplStatusEncerramentoEmpenho" runat="server" Width="98%" />

                                        </div>
                                        <div style="display: table-cell; width: 40%; text-align: right; vertical-align: middle;">

                                            <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeftSave" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                            <asp:Button ID="btnCancelar" runat="server" SkinID="ButtonCenterCancel" OnClick="btnCancelar_Click" />
                                            <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnLimpar_Click" />
                                            <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonRightVoltar" OnClick="btnVoltar_Click" />

                                        </div>

                                    </div>
                                </div>

                                <%-- EMPENHO BODY --%>
                                <div style="left: 0.5%; width: 99%; height: 100%; position: relative; overflow-x: none; overflow-y: scroll;">
                                    <%-- HEADER --%>
                                    <fieldset style="height: 30%;">
                                        <legend class="legend_normal">
                                            <asp:Literal ID="ltrBody" runat="server" />
                                        </legend>

                                        <%-- BODY HEADER --%>
                                        <div style="left: 0.5%; width: 99%; height: 90%; position: relative; padding: 1px 1px 1px 1px;">
                                            <%-- PRIMEIRA LINHA --%>
                                            <div style="display: table; width: 100%; height: 25px; position: relative; padding: 1px 1px 1px 1px;">
                                                <div style="display: table-cell; vertical-align: middle; width: 10%; height: 100%; text-align: right;">
                                                    <asp:Label ID="lblContratoClienteCnpj" runat="server" />
                                                </div>
                                                <div style="display: table-cell; vertical-align: middle; width: 10%; height: 100%; padding-left: 10px;">
                                                    <asp:Label ID="lblContratoClienteCnpjDescricao" runat="server" SkinID="LabelResposta" />
                                                </div>
                                                <div style="display: table-cell; vertical-align: middle; width: 3%; height: 100%; text-align: center;">
                                                    <asp:ImageButton ID="imbContratoHeaderCnpjFind" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                        ToolTip="<%$ Resources:Resource, lblLicitacao %>"
                                                        ImageUrl="~/Imagens/find.png"
                                                        OnClick="imbContratoHeaderCnpjFind_Click" />
                                                </div>
                                                <div style="display: table-cell; vertical-align: middle; width: 47%; height: 100%;">
                                                    <asp:Label ID="lblContratoClienteNome" runat="server" SkinID="LabelResposta" />
                                                </div>
                                                <div style="display: table-cell; vertical-align: middle; width: 10%; height: 100%; text-align: right;">
                                                    <asp:Label ID="lblEmpenhoStatus" runat="server" />
                                                </div>
                                                <div style="display: table-cell; vertical-align: middle; width: 20%; height: 100%; text-align: center;">
                                                    <asp:Label ID="lblEmpenhoStatusDescricao" runat="server" SkinID="LabelResposta" />
                                                </div>
                                            </div>

                                            <%-- DIV BODY PRINCIPAL --%>
                                            <div style="display: table; width: 100%; height: auto; position: relative; padding: 1px 1px 1px 1px;">

                                                <%-- LEFT --%>
                                                <div style="display: table-cell; vertical-align: middle; width: 33%; height: auto;">
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoLicitacaoId" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 70%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">
                                                            <asp:Label ID="lblContratoLicitacaoIdDescricao" runat="server" SkinID="LabelResposta" />
                                                            <asp:TextBox ID="txtContratoLicitacaoIdDescricao" runat="server" SkinID="SmallFilter" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoModalidade" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 70%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">
                                                            <asp:Label ID="lblContratoModalidadeDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoProcesso" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">
                                                            <asp:Label ID="lblContratoProcessoDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                        <div style="display: table-cell; width: 20%; height: 100%; vertical-align: middle; text-align: left;">
                                                            <asp:ImageButton ID="imbContratoCondicoes" runat="server" Width="20px" Height="20px" ImageAlign="AbsMiddle"
                                                                ToolTip="<%$ Resources:Resource, lblContratoCondicoesComerciais %>"
                                                                ImageUrl="~/Imagens/anexo.png"
                                                                OnClick="imbContratoCondicoes_Click" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoRepresentante" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 70%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">
                                                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 280px;">
                                                                <asp:Label ID="lblContratoRepresentanteDescricao" runat="server" SkinID="LabelResposta" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoBancarios" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">
                                                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 200px;">
                                                                <asp:Label ID="lblContratoBancariosDescricao" runat="server" SkinID="LabelResposta" />
                                                            </div>
                                                        </div>
                                                        <div style="display: table-cell; width: 20%; height: 100%; vertical-align: middle; text-align: left;">
                                                            <asp:ImageButton ID="imbContratoBancarios" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                ToolTip="<%$ Resources:Resource, lblDadosBancarios %>"
                                                                ImageUrl="~/Imagens/find.png"
                                                                OnClick="imbContratoBancarios_Click" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoDocumentos" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 50%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">
                                                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 200px;">
                                                                <asp:Label ID="lblContratoDocumentosDescricao" runat="server" SkinID="LabelResposta" />
                                                            </div>
                                                        </div>
                                                        <div style="display: table-cell; width: 20%; height: 100%; vertical-align: middle; text-align: left;">
                                                            <asp:ImageButton ID="imbDoctoEfetivoEntrega" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                ToolTip="<%$ Resources:Resource, lblDocumentos %>"
                                                                ImageUrl="~/Imagens/find.png"
                                                                OnClick="imbDoctoEfetivoEntrega_Click" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <%-- CENTER --%>
                                                <div style="display: table-cell; vertical-align: middle; width: 34%; height: auto;">
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoEstabelecimento" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 70%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">
                                                            <asp:Label ID="lblContratoEstabelecimentoDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoData" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 70%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">
                                                            <asp:Label ID="lblContratoDataDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoValidade" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 70%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">

                                                            <asp:TextBox ID="lblContratoValidadeDescricao" runat="server" Style="resize: none" TextMode="MultiLine" Width="251px" Height="30px" />
                                                            <%--<asp:Label ID="lblContratoValidadeDescricao" runat="server" SkinID="LabelResposta" />--%>
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 30%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblVigencia" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 70%; height: 100%; vertical-align: middle; text-align: left; padding-left: 10px;">
                                                            <asp:Label ID="lblVigenciaDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle; text-align: left; padding-left: 5px;">
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle; text-align: left; padding-left: 5px;">
                                                        </div>
                                                    </div>
                                                </div>

                                                <%-- RIGHT --%>
                                                <div style="display: table-cell; vertical-align: middle; width: 33%; height: auto;">
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 40%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblEmpenhoId" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 58%; height: 100%; vertical-align: middle; text-align: center;">
                                                            <asp:TextBox ID="txtEmpenhoId" runat="server" Width="96%" MaxLength="30" />
                                                        </div>
                                                        <div style="display: table-cell; width: 3%; height: 100%; vertical-align: middle; text-align: center;">
                                                            <asp:ImageButton ID="imbEmpenhoAnexos" runat="server" Width="20px" Height="20px" ImageAlign="AbsMiddle"
                                                                ToolTip="<%$ Resources:Resource, lblAnexar %>"
                                                                ImageUrl="~/Imagens/anexo.png"
                                                                ValidationGroup="ValidacaoAnexo"
                                                                OnClick="imbEmpenhoAnexos_Click" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 39%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoClienteFaturamento" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 61%; height: 100%; vertical-align: middle; text-align: center;">
                                                            <asp:DropDownList ID="ddlContratoClienteFaturamento" runat="server" Width="98%" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 39%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblNaturezaId" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 61%; height: 100%; vertical-align: middle; text-align: center;">
                                                            <asp:DropDownList ID="ddlNaturezaId" runat="server" Width="98%" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 39%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblEmpenhoData" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 61%; height: 100%; vertical-align: middle; text-align: left; padding-left: 4px;">
                                                            <CtlData:ControlData ID="CtlDataEmpenho" runat="server" ValidationGroup="Validacao" IsAutoPostBack="true" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 39%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoPrazo" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 61%; height: 100%; vertical-align: middle; text-align: left; padding-left: 4px;">
                                                            <asp:Label ID="lblContratoPrazoDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                    </div>
                                                    <div style="display: table; width: 100%; height: 25px;">
                                                        <div style="display: table-cell; width: 39%; height: 100%; vertical-align: middle; text-align: right;">
                                                            <asp:Label ID="lblContratoDataLimiteEntrega" runat="server" />
                                                        </div>
                                                        <div style="display: table-cell; width: 61%; height: 100%; vertical-align: middle; text-align: left; padding-left: 4px;">
                                                            <asp:Label ID="lblContratoDataLimiteEntregaDescricao" runat="server" SkinID="LabelResposta" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </fieldset>

                                    <%-- BODY --%>
                                    <div style="left: 0.5; display: table; height: 15%; width: 100%; margin-top: 2px;">

                                        <%-- OBSERVAÇÕES CONTRATO --%>
                                        <div style="width: 50%; height: 100%; display: table-cell;">
                                            <fieldset style="height: 100%; width: auto;">
                                                <legend class="legend_normal">
                                                    <asp:Literal ID="ltrObservacoesContrato" runat="server" />
                                                </legend>
                                                <asp:TextBox ID="txtObservacoesContrato" runat="server" TextMode="MultiLine" Width="98%" Height="80%" Font-Bold="true" ForeColor="Blue" ReadOnly="true" />
                                            </fieldset>
                                        </div>

                                        <%-- OBSERVAÇÕES EMPENHO --%>
                                        <div style="width: 50%; height: 100%; display: table-cell;">
                                            <fieldset style="height: 100%; width: auto;">
                                                <legend class="legend_normal">
                                                    <asp:Literal ID="ltrObservacoesEmpenho" runat="server" />
                                                </legend>
                                                <asp:TextBox ID="txtObservacoesEmpenho" runat="server" TextMode="MultiLine" Width="98%" Height="80%" MaxLength="255" />
                                            </fieldset>
                                        </div>

                                    </div>

                                    <%-- ITENS --%>
                                    <div style="left: 0.5; display: table; height: 15%; width: 100%; margin-top: 5px; margin-bottom: 230px;">
                                        <fieldset>
                                            <legend class="legend_normal">
                                                <asp:Literal ID="ltrItens" runat="server" />
                                            </legend>

                                            <div style="left: 0.5; width: 100%; height: auto; margin-top: 5px;">
                                                <div style="left: 0.5; display: table; width: 100%; height: 25px;">
                                                    <div style="display: table-cell; width: 15%; height: 100%; text-align: right; vertical-align: middle;">
                                                        <asp:Label ID="lblEmpenhoItemBusca" runat="server" />
                                                    </div>
                                                    <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                                                        <asp:ImageButton ID="imbItensPesquisar" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                            ValidationGroup="ValidacaoItem"
                                                            ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                            ImageUrl="~/Imagens/find.png"
                                                            OnClick="imbItensPesquisar_Click" />
                                                    </div>
                                                    <div style="display: table-cell; width: 70%; height: 100%;">
                                                        <div style="width: 100%; height: 100%;">
                                                            <div style="display: table; width: 100%; height: 100%; text-align: right;">
                                                                <div style="display: table-cell; vertical-align: middle; width: 43%; height: 100%;">
                                                                    <asp:Label ID="lblEmpenhoOcGerada" runat="server" ForeColor="Green" Visible="false" />
                                                                </div>
                                                                <div style="display: table-cell; width: 12%; height: 100%; vertical-align: middle; padding-right: 5px;">
                                                                    <asp:Label ID="lblEmpenhoItensTotal" runat="server" />
                                                                </div>
                                                                <div style="display: table-cell; width: 15%; height: 100%; vertical-align: middle;">
                                                                    <asp:TextBox ID="txtEmpenhoItensTotal" runat="server" SkinID="Currency150" Enabled="false" Font-Bold="true" />
                                                                </div>
                                                                <div style="display: table-cell; width: 15%; height: 100%; vertical-align: middle; padding-right: 5px;">
                                                                    <asp:Label ID="lblEmpenhoValorTotal" runat="server" />
                                                                </div>
                                                                <div style="display: table-cell; width: 15%; height: 100%; vertical-align: middle;">
                                                                    <asp:TextBox ID="txtEmpenhoValoTotal" runat="server" SkinID="Currency150" Enabled="false" Font-Bold="true" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                                                        <asp:ImageButton ID="imbItensOrdemCompra" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                                            ToolTip="<%$ Resources:Resource, lblGerarOC %>"
                                                            ImageUrl="~/Imagens/tipoPedido.png"
                                                            OnClick="imbItensOrdemCompra_Click" />
                                                    </div>
                                                    <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                                                        <asp:ImageButton ID="imbItensExportar" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                                            ImageUrl="~/Imagens/xlsx.png" />
                                                    </div>
                                                </div>
                                                <div style="left: 0.5; width: 100%; margin-top: 5px; padding: 0 0 50px 0; overflow-x: none; overflow-y: scroll;">
                                                    <asp:Panel ID="pnlItens" runat="server">
                                                        <center />

                                                        <asp:GridView ID="gvEmpenhoItens" runat="server"
                                                            DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,empenhoCodigoId,itemId,Vinculado,clienteIdFaturamento,empenhoItemQtdeValor,
                                                                      tipoEnderecoId,clienteEnderecoSeq,empenhoGradeSeq,itemSaldoContrato,contratoLicitacaoSeq,tipoPedidoId,itemValorNegociado,empenhoItemValidado,
                                                                      usuarioIdAprovacao,empenhoMotivoAprovacao,empenhoDataAprovacao,ordemCompraNumero,ordemCompraData,ordemCompraUsuarioId,ordemCompraGerada,empenhoSituacao,aproFinUsuarioIdAprovacao,
	                                                                  aproFinMotivoAprovacao,aproFinDataAprovacao,nfDevolucao"
                                                            OnPageIndexChanging="gvEmpenhoItens_PageIndexChanging"
                                                            OnRowCommand="gvEmpenhoItens_RowCommand"
                                                            OnRowDataBound="gvEmpenhoItens_RowDataBound"
                                                            OnRowDeleting="gvEmpenhoItens_RowDeleting">
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" Visible="true">
                                                                    <HeaderTemplate>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" Visible="true">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelectTravaItem" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectTravaItem_CheckedChanged" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                                <asp:BoundField DataField="itemDescricao" ItemStyle-Width="210px" />
                                                                <asp:BoundField DataField="empenhoItemQtd" DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" />
                                                                <asp:BoundField DataField="quantidadeLiberada" DataFormatString="{0:f0}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrEmpenhoItemSaldo" runat="server" Text='<%# Eval("empenhoItemSaldo", "{0:f0}") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="empenhoItemQtdeValor" DataFormatString="{0:###,###,#00.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrEmpenhoItemValorTotal" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrSaldoContrato" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="200px" HeaderText="NF Devolução" ItemStyle-HorizontalAlign="Center" >
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrNfDevolucao"   runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="320px">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrEnderecoEntrega" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrEmpenhoSituacao" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                
                                                                <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                                                    <HeaderTemplate>
                                                                        <asp:LinkButton ID="ldOrdemCompraHeader" runat="server"
                                                                            CommandName="ViewRecords"
                                                                            Text="<%$ Resources:Resource, lblOC %>"
                                                                            ToolTip="<%$ Resources:Resource, lblVisualizarOCUsuarios %>" />
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbOrdemCompra" runat="server"
                                                                            CommandName="Details"
                                                                            ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                                            Text='<%# Eval("ordemCompraNumeroDescricao") %>'
                                                                            CommandArgument='<%# Eval("ordemCompraData") + "|" +
                                                                                                         Eval("ordemCompraUsuarioId") + "|" +
                                                                                                         Eval("ordemCompraNumeroDescricao") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                    <HeaderTemplate>
                                                                        <asp:ImageButton ID="imbAprovarTudo" runat="server" CommandName="AproveAll"
                                                                            ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                                            ImageUrl="~/Imagens/agree.png"
                                                                            ToolTip="<%$ Resources:Resource, lblAprovarTudo %>" />
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbViewAprovation" runat="server" CommandName="ViewAprovation"
                                                                            SkinID="ImgGrid"
                                                                            ImageUrl="~/Imagens/find.png"
                                                                            Visible="false"
                                                                            ToolTip="<%$ Resources:Resource, lblViewAprovacao %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                          Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                          Eval("estabelecimentoId") + "|" + Eval("empenhoCodigoId") + "|" + 
                                                                                                          Eval("itemId") + "|" + Eval("tipoEnderecoId") + "|" + Eval("clienteEnderecoSeq") + "|" +
                                                                                                          Eval("empenhoGradeSeq") + "|" + Eval("contratoLicitacaoSeq") + "|" + 
                                                                                                          Eval("tipoPedidoId") + "|" + Eval("clienteIdFaturamento") %>' />
                                                                        <asp:ImageButton ID="imbAprovar" runat="server" CommandName="Aprove" SkinID="ImgGrid"
                                                                            ImageUrl="~/Imagens/agree.png"
                                                                            Visible="false"
                                                                            ToolTip="<%$ Resources:Resource, lblSetAprovacao %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                          Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                          Eval("estabelecimentoId") + "|" + Eval("empenhoCodigoId") + "|" + 
                                                                                                          Eval("itemId") + "|" + Eval("tipoEnderecoId") + "|" + Eval("clienteEnderecoSeq") + "|" +
                                                                                                          Eval("empenhoGradeSeq") + "|" + Eval("contratoLicitacaoSeq") + "|" + 
                                                                                                          Eval("tipoPedidoId") + "|" + Eval("clienteIdFaturamento") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbView" runat="server" CommandName="View" SkinID="ImgGrid"
                                                                            ImageUrl="~/Imagens/find.png"
                                                                            ToolTip="<%$ Resources:Resource, lblVisualizarPedidos %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                          Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                          Eval("estabelecimentoId") + "|" + Eval("empenhoCodigoId") + "|" + 
                                                                                                          Eval("itemId") + "|" + Eval("tipoEnderecoId") + "|" + Eval("clienteEnderecoSeq") + "|" +
                                                                                                          Eval("empenhoGradeSeq") + "|" + Eval("contratoLicitacaoSeq") + "|" + 
                                                                                                          Eval("tipoPedidoId") + "|" + Eval("clienteIdFaturamento") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbDelete" runat="server" CommandName="Delete" SkinID="ImgGrid"
                                                                            ImageUrl="~/Imagens/_trash.png"
                                                                            ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                          Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                          Eval("estabelecimentoId") + "|" + Eval("empenhoCodigoId") + "|" + 
                                                                                                          Eval("itemId") + "|" + Eval("tipoEnderecoId") + "|" + Eval("clienteEnderecoSeq") + "|" +
                                                                                                          Eval("empenhoGradeSeq") + "|" + Eval("contratoLicitacaoSeq") + "|" + 
                                                                                                          Eval("clienteIdFaturamento") + "|" + Eval("tipoPedidoId")  %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                        </asp:GridView>

                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>

                <%-- ITEM PESQUISA --%>
                <asp:UpdatePanel ID="uppItem" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbItensPesquisar" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlItemBusca" runat="server" DefaultButton="btnItemFiltrosPesquisar" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblItemHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbItemPanelClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbItemPanelClose_Click" />
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
                                            <asp:GridView ID="gvItensPesquisa" runat="server"
                                                DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,itemId,itemQuantidade,
                                                                        itemValorNegociado,itemDescricao,fabricanteNome,itemSaldoContrato,contratoLicitacaoSeq"
                                                OnPageIndexChanging="gvItensPesquisa_PageIndexChanging"
                                                OnRowCommand="gvItensPesquisa_RowCommand"
                                                OnRowDataBound="gvItensPesquisa_RowDataBound">
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
                                                            <asp:TextBox ID="txtQtdEmpenho" runat="server" SkinID="Currency70" />
                                                            <asp:HiddenField ID="hdfQtdContrato" runat="server" Value="" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="itemQuantidade" DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemSaldo" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtValorEmpenho" runat="server" SkinID="Currency70" />
                                                            <asp:HiddenField ID="hdfValorContrato" runat="server" Value="" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="itemValorNegociado" DataFormatString="{0:#,###,#00.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrValorTotalItemContrato" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="NF Devolução" ItemStyle-Width="80px"  >
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtNFDevolucao" runat="server" SkinID="Currency70" />
                                                            <asp:HiddenField ID="hidenNFDevolucao" runat="server" Value="" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddlEnderecoEntrega" runat="server" SkinID="DropSmallFilter" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid"
                                                                ImageUrl="~/Imagens/check.png"
                                                                ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                     Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                     Eval("estabelecimentoId") + "|" + Eval("itemId") + "|" + Eval("contratoLicitacaoSeq") %>' />
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

                <%-- CONTRATOS/CLIENTES --%>
                <asp:UpdatePanel ID="uppContratoCliente" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbContratoHeaderCnpjFind" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlContratoCliente" runat="server" DefaultButton="btnContratoClientePesquisa" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblContratoClienteHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbContratoClienteClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbContratoClienteClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <%-- FILTROS --%>
                                        <div class="navegacao">
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltroContratoClienteId" runat="server" />
                                                <asp:TextBox ID="txtFiltroContratoClienteId" runat="server" SkinID="Filtro" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltroContratoClienteCnpj" runat="server" />
                                                <asp:TextBox ID="txtFiltroContratoClienteCnpj" runat="server" SkinID="Filtro" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltroContratoClienteRazao" runat="server" />
                                                <asp:TextBox ID="txtFiltroContratoClienteRazao" runat="server" SkinID="Filtro" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <asp:Label ID="lblFiltroContratoClienteEstabelecimentoId" runat="server" />
                                                <asp:DropDownList ID="ddlFiltroContratoClienteEstabelecimentoId" runat="server" SkinID="DropFiltro" />
                                            </div>
                                            <div class="boxPesquisa">
                                                <div class="line">
                                                    <asp:Button ID="btnContratoClientePesquisa" runat="server" SkinID="ButtonLeft" OnClick="btnContratoClientePesquisa_Click" />
                                                    <asp:Button ID="btnContratoClienteLimpar" runat="server" SkinID="ButtonRight" OnClick="btnContratoClienteLimpar_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <%-- GRID REGISTROS --%>
                                        <div class="gridRegistros">
                                            <asp:GridView ID="gvContratoCliente" runat="server"
                                                DataKeyNames="clienteId,clienteCNPJ,clienteIdERP,clienteRazaoSocial,contratoLicitacaoId,estabelecimentoId,
                                                          ufId,modalidadeLicitacaoDescricao,contratoLicitacaoData,contratoLicitacaoProcesso,contratoLicitacaoValidade,
                                                          representanteId,representanteNome,contratoLicitacaoVigencia,contratoLicitacaoPrazo,contratoLicitacaoBancario,
                                                          contratoLicitacaoDoctEfetivo,contratoLicitacaoObservacoes,estabelecimentoRazaoSocial,lojaFormatada,contratoLicitacaoSeq"
                                                OnPageIndexChanging="gvContratoCliente_PageIndexChanging"
                                                OnRowCommand="gvContratoCliente_RowCommand"
                                                OnRowDataBound="gvContratoCliente_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrContratoId" runat="server" Text='<%# FormataStringSaida(Eval("contratoLicitacaoId"), txtFiltroContratoClienteId.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Utility.FormataDocumentos(Eval("clienteCNPJ").ToString(), Utility.FormatOption.ApplyMask), txtFiltroContratoClienteCnpj.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltroContratoClienteRazao.Text) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Literal ID="ltrContratoStatusId" runat="server" Text='<%# Eval("contratoStatusId") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>



                                                    <asp:BoundField DataField="lojaFormatada" ItemStyle-Width="300px" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid"
                                                                ImageUrl="~/Imagens/check.png"
                                                                ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                                  Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + Eval("contratoLicitacaoSeq") %>' />
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

                <%-- ANEXOS EMPENHO --%>
                <asp:UpdatePanel ID="uppAnexosEmpenho" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbEmpenhoAnexos" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlAnexosEmpenho" runat="server" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblAnexosEmpenhoHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbAnexosEmpenhoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbAnexosEmpenhoClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div style="left: 0%; display: table; width: 100%; height: 100%; position: relative; text-align: left;">
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                                    <asp:Label ID="lblAnexoEmpenhoNome" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                                    <asp:TextBox ID="txtAnexoEmpenhoNome" runat="server" MaxLength="100" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                                    <asp:Label ID="lblAnexoEmpenhoArquivo" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                                    <asp:FileUpload ID="fulAnexoEmpenho" runat="server" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                    <asp:Label ID="lblAnexoEmpenhoObservacoes" runat="server" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 20%;">
                                                <asp:TextBox ID="txtAnexoEmpenhoObservacoes" runat="server" TextMode="MultiLine" Width="98.5%" Height="100%" MaxLength="255" />
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%; text-align: center;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                    <asp:Button ID="btnAnexoEmpenhoAnexar" runat="server" SkinID="ButtonLeft" OnClick="btnAnexoEmpenhoAnexar_Click" />
                                                    <asp:Button ID="btnAnexoEmpenhoLimpar" runat="server" SkinID="ButtonRight" OnClick="btnAnexoEmpenhoLimpar_Click" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 120px; text-align: center;">
                                                <fieldset>
                                                    <div style="width: 100%; height: 100px; overflow-x: none; overflow-y: scroll;">
                                                        <%-- GRID REGISTROS --%>
                                                        <asp:GridView ID="gvAnexoEmpenho" runat="server"
                                                            DataKeyNames="contratoLicitacaoId,empenhoCodigoId,clienteId,estabelecimentoId,tipoPedidoId,clienteIdFaturamento,empenhoDoctoSeq,
                                                                          empenhoDoctoNomeArquivo,empenhoDoctoExtensao,empenhoDoctoDataInclusao,usuarioId,empenhoDoctObservacoes,contratoLicitacaoSeq"
                                                            OnRowDataBound="gvAnexoEmpenho_RowDataBound"
                                                            OnRowCommand="gvAnexoEmpenho_RowCommand"
                                                            OnPageIndexChanging="gvAnexoEmpenho_PageIndexChanging"
                                                            OnRowDeleting="gvAnexoEmpenho_RowDeleting"
                                                            OnRowUpdating="gvAnexoEmpenho_RowUpdating">
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrDataCadastro" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="empenhoDoctoNomeArquivo" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                                                <asp:BoundField DataField="empenhoDoctObservacoes" ItemStyle-HorizontalAlign="Left" />
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbDownload" runat="server" SkinID="ImgGrid" CommandName="Download"
                                                                            ToolTip="<%$ Resources:Resource, lblDownload %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                                              Eval("empenhoCodigoId") + "|" + Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + 
                                                                                                              Eval("tipoPedidoId") + "|" + Eval("clienteIdFaturamento") + "|" + Eval("empenhoDoctoSeq") + "|" + Eval("contratoLicitacaoSeq")  %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid"
                                                                            ImageUrl="~/Imagens/_trash.png"
                                                                            CommandName="Delete"
                                                                            ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                                              Eval("empenhoCodigoId") + "|" + Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + 
                                                                                                              Eval("tipoPedidoId") + "|" + Eval("clienteIdFaturamento") + "|" + Eval("empenhoDoctoSeq") + "|" + Eval("contratoLicitacaoSeq") %>' />
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

                <%-- ANEXOS CONTRATO - CONDIÇÕES COMERCIAIS --%>
                <asp:UpdatePanel ID="uppAnexosContrato" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbContratoCondicoes" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlAnexosContrato" runat="server" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblAnexosContratoHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbAnexosContratoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbAnexosContratoClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div style="left: 0%; display: table; width: 100%; height: 100%; position: relative; text-align: left;">
                                            <div style="display: table; width: 100%; height: 100%; text-align: center;">
                                                <fieldset>
                                                    <div style="width: 100%; height: 100%; overflow-x: none; overflow-y: scroll;">
                                                        <%-- GRID REGISTROS --%>
                                                        <asp:GridView ID="gvAnexosContrato" runat="server"
                                                            DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,contratoDoctoSeq,contratoDoctoNomeArquivo,contratoDoctoExtensao,
                                                                          contratoDoctoDataEmissao,usuarioId,contratoDoctoObservacoes,contratoLicitacaoSeq"
                                                            OnRowDataBound="gvContratoDocumentos_RowDataBound"
                                                            OnRowCommand="gvContratoDocumentos_RowCommand"
                                                            OnPageIndexChanging="gvContratoDocumentos_PageIndexChanging"
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

                <%-- PAINEL QUE APRESENTA DESCRIÇÕES DO LABEL --%>
                <asp:UpdatePanel ID="uppDescricao" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="imbContratoBancarios" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="imbDoctoEfetivoEntrega" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlDescricao" runat="server" Visible="false" SkinID="PnlPopUpNv1">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" id="dvMsg" runat="server" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblDescricoesHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbDescricao" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbDescricao_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <asp:TextBox ID="txtDescricoesBody" runat="server" TextMode="MultiLine" Width="98%" Height="90%" Font-Bold="true" ForeColor="Blue" Enabled="false" />
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- POP UP PEDIDOS VINCULADOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upPedido" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlPedido" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblPedido" runat="server" ForeColor="White" />
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
                                                <asp:BoundField DataField="transportadoraNome" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                                <asp:BoundField DataField="pedidoDataEntregaPrevista" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                <asp:BoundField DataField="pedidoSituacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                                <asp:TemplateField ItemStyle-Width="320px" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Literal ID="ltrEnderecoEntregaPopVinculados" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                </div>

                <%-- CONFIRMAR GERAÇÃO DE ORDEM DE COMPRAS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upOrdemCompraConfirmar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbItensOrdemCompra" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnOrdemCompraNaoOk" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlOrdemCompraConfirmar" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblOrdemCompraHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                                            <div style="width: 80%; height: 100%; display: table-cell; vertical-align: middle;">
                                                <asp:Label ID="lblOrdemCompraConfirmarBody" runat="server" />
                                            </div>
                                            <div style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgAlert" runat="server" Height="50%" Width="60%" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/question.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnOrdemCompraConfirmarOk" runat="server" SkinID="ButtonLeft" OnClick="btnOrdemCompraConfirmarOk_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnOrdemCompraNaoOk" runat="server" SkinID="ButtonRight" OnClick="btnOrdemCompraNaoOk_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- MOTIVO CANCELAMENTO --%>
                <asp:UpdatePanel ID="uppMotivos" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlConfirmarCancelamentoEmpenho" runat="server" Visible="false" SkinID="PnlPopUp">
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
                                                    <asp:Label ID="lblMotivosDescricaoCancelamento" runat="server" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 60%;">
                                                <asp:TextBox ID="txtMotivosDescricaoCancelamento" runat="server" Columns="100" Rows="5" TextMode="MultiLine" MaxLength="250" Height="100%" Width="98%" />
                                            </div>
                                            <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                    <asp:Button ID="btnConfirmarCancelamentoEmpenhoSim" runat="server" SkinID="ButtonLeft" OnClick="btnConfirmarCancelamentoEmpenhoSim_Click" ValidationGroup="ValidacaoCancelamento" />
                                                    <asp:Button ID="btnConfirmarCancelamentoEmpenhoNao" runat="server" SkinID="ButtonRight" OnClick="btnConfirmarCancelamentoEmpenhoNao_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:RequiredFieldValidator ID="rfvDescricaoMotivoCancelamento" runat="server" ControlToValidate="txtMotivosDescricaoCancelamento" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoCancelamento" />
                        <asp:ValidationSummary ID="vsmMotivo" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidacaoCancelamento" />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- CONFIRMAR APROVAÇÃO --%>
                <asp:UpdatePanel ID="uppConfirmarAprovacao" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnConfirmarAprovacaoNok" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlConfirmarAprovacao" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround">
                            </div>
                            <div class="painel" style="width: 40%; height: 50%; left: 30%; top: 25%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblConfirmarAprovacaoHeader" runat="server" ForeColor="White" />
                                    </div>
                                </div>
                                <div class="painel_body" style="height: 75%;">
                                    <fieldset>
                                        <div style="left: 0%; position: relative; width: 99.5%; height: 100%;">
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle; text-align: left;">
                                                    <asp:Label ID="lblConfirmarAprovacaoChave" runat="server" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle; text-align: left;">
                                                    <asp:Label ID="lblConfirmarAprovacao" runat="server" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 60%;">
                                                <asp:TextBox ID="txtConfirmarAprovacao" runat="server" Columns="100" Rows="5" TextMode="MultiLine" MaxLength="250" Height="100%" Width="98%" />
                                            </div>
                                            <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                    <asp:Button ID="btnConfirmarAprovacaoOk" runat="server" SkinID="ButtonLeft" OnClick="btnConfirmarAprovacaoOk_Click" ValidationGroup="ValidacaoAprovacao" />
                                                    <asp:Button ID="btnConfirmarAprovacaoNok" runat="server" SkinID="ButtonRight" OnClick="btnConfirmarAprovacaoNok_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:HiddenField ID="hdfEmpenhoGradeSeq" runat="server" Value="" />
                        <asp:HiddenField ID="hdfItemId" runat="server" Value="" />
                        <asp:HiddenField ID="hdfTipoEnderecoId" runat="server" Value="" />
                        <asp:RequiredFieldValidator ID="rfvConfirmarAprovacao" runat="server" ControlToValidate="txtConfirmarAprovacao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoAprovacao" />
                        <asp:ValidationSummary ID="vsmConfirmarAprovacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidacaoAprovacao" />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- PAINEL ORDENS DE COMPRA GERADAS --%>
                <asp:UpdatePanel ID="uppOrdensCompraGeradas" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlOrdensCompraGeradas" runat="server" Visible="false" SkinID="PnlPopUp">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblOrdensCompraGeradasHeader" runat="server" ForeColor="White" />
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbOrdensGeradasClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbOrdensGeradasClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div style="width: 100%; overflow-x: none; overflow-y: scroll; height: 320px;">
                                            <center />

                                            <asp:GridView ID="gvOrdensCompraGeradas" runat="server"
                                                DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,contratoLicitacaoSeq,empenhoCodigoId,
                                                                        tipoPedidoId,clienteIdFaturamento,ordemCompraData,ordemCompraUsuarioId,ordemCompraNumeroDescricao"
                                                OnRowDataBound="gvOrdensCompraGeradas_RowDataBound"
                                                OnRowCommand="gvOrdensCompraGeradas_RowCommand"
                                                OnPageIndexChanging="gvOrdensCompraGeradas_PageIndexChanging" AllowPaging="false" >
                                                <Columns>
                                                     <asp:BoundField DataField="empenhoGradeSeq" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                                  
                                                    <%--<asp:BoundField DataField="ordemCompraNumeroDescricao" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center" />--%>
                                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="imbViewDetails" runat="server"
                                                                CommandName="ViewDetails"
                                                                Text='<%# Eval("ordemCompraNumeroDescricao") %>'
                                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                                CommandArgument='<%# Eval("ordemCompraData") + "|" +
                                                                                                  Eval("ordemCompraUsuarioId") + "|" +
                                                                                                  Eval("ordemCompraNumeroDescricao") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="contratoLicitacaoSeq" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                                    
                                                    <asp:BoundField DataField="ordemCompraUsuarioId" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="ordemCompraData" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbDownload" runat="server"
                                                                SkinID="ImgGrid"
                                                                CommandName="Download"
                                                                ImageUrl="~/Imagens/download.png"
                                                                ToolTip="<%$ Resources:Resource, lblDownload %>"
                                                                CommandArgument='<%# Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                  Eval("estabelecimentoId") + "|" + Eval("contratoLicitacaoSeq") + "|" + 
                                                                                                  Eval("empenhoCodigoId") + "|" + Eval("tipoPedidoId") + "|" + 
                                                                                                  Eval("clienteIdFaturamento") + "|" + Eval("ordemCompraData") + "|" +
                                                                                                  Eval("ordemCompraUsuarioId") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbReenviar" runat="server"
                                                                SkinID="ImgGrid"
                                                                CommandName="Reenviar"
                                                                ImageUrl="~/Imagens/update.png"
                                                                ToolTip="<%$ Resources:Resource, lblOCReenvio %>"
                                                                CommandArgument='<%# Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                  Eval("estabelecimentoId") + "|" + Eval("contratoLicitacaoSeq") + "|" + 
                                                                                                  Eval("empenhoCodigoId") + "|" + Eval("tipoPedidoId") + "|" + 
                                                                                                  Eval("clienteIdFaturamento") + "|" + Eval("ordemCompraData") + "|" +
                                                                                                  Eval("ordemCompraUsuarioId") %>' />
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

                <%-- CONFIRMAR REENVIO DA OC --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppOrdemReenvio" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlOrdemReenvio" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblOrdemReenvioHeader" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblOrdemCompraConfirmarReenvio %>" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                                            <div style="width: 80%; height: 100%; display: table-cell; vertical-align: middle;">
                                                <asp:Label ID="lblOrdemReenvioBody" runat="server" />
                                            </div>
                                            <div style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="lblOrdemReenvioIcon" runat="server" Height="50%" Width="60%" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/question.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnOrdemReenvioOk" runat="server" SkinID="ButtonLeft" OnClick="btnOrdemReenvioOk_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnOrdemReenvioNaoOK" runat="server" SkinID="ButtonRight" OnClick="btnOrdemReenvioNaoOK_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>


                <%--ALERTA SOBRE CONTRATO ESTAR SUJEITO A APROVAÇÃO--%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upAlertaSobreAprovacao" runat="server" UpdateMode="Conditional">
                        <Triggers>
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlAlertaStatusId" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblContratoAguardandoAprovacao" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                                            <div style="width: 80%; height: 100%; display: table-cell; vertical-align: middle;">
                                                <asp:Label ID="lblAlertStatusContratoMessage" runat="server" ForeColor="Black" />
                                            </div>
                                            <div style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgAlertIntegracao" runat="server" Height="50%" Width="60%" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/_error.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom">
                                                <asp:Button ID="btnClosePopUp" runat="server" SkinID="ButtonOk" OnClick="btnClosePopUp_Click" />
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>



                <%-- VALIDADORES --%>
                <asp:RequiredFieldValidator ID="rfvEmpenhoNumero" runat="server" ControlToValidate="txtEmpenhoId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvContratoId" runat="server" ControlToValidate="txtContratoLicitacaoIdDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoItem" />
                <asp:RequiredFieldValidator ID="rfvContratoIdAnexo" runat="server" ControlToValidate="txtContratoLicitacaoIdDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoAnexo" />
                <asp:RequiredFieldValidator ID="rfvEmpenhoNumeroAnexo" runat="server" ControlToValidate="txtEmpenhoId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="ValidacaoAnexo" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacaoItem" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidacaoItem" />
                <asp:ValidationSummary ID="vsValidacaoAnexo" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidacaoAnexo" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
