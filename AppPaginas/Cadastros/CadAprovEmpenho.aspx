<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadAprovEmpenho.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadAprovEmpenho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroAprovEmpenho" runat="server">
        <asp:UpdatePanel ID="uppCadastroAprovEmpenho" runat="server">
            <Triggers>
                  <asp:PostBackTrigger ControlID="btnAnexoAprovEmpenhoAnexar"  />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroAprovEmpenho">
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
                               <div id="dvHistorico" runat="server" class="boxPesquisa">
                        <asp:CheckBox ID="chkHistorico" runat="server"
                            TabIndex="24"
                            AutoPostBack="true"
                            Font-Bold="true"
                            TextAlign="Left"
                            Text="<%$ Resources:Resource, lblHistoricoAprovacao %> "
                            OnCheckedChanged="chkHistorico_CheckedChanged" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroSituacao" runat="server" />
                                <asp:DropDownList ID="ddFiltroSituacao" runat="server" SkinID="DropSmallFilter" TabIndex="14" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosContratoId" runat="server" />
                                <asp:TextBox ID="txtFiltrosContratoId" runat="server" SkinID="SmallFilter" MaxLength="50" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosEmpenhoId" runat="server" />
                                <asp:TextBox ID="txtFiltrosEmpenhoId" runat="server" SkinID="SmallFilter" MaxLength="50" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosEmpenhoClienteRazaoSocial" runat="server" />
                                <asp:TextBox ID="txtFiltrosEmpenhoClienteRazaoSocial" runat="server" SkinID="SmallFilter" MaxLength="100" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosEmpenhoClienteIdErp" runat="server" />
                                <asp:TextBox ID="txtFiltrosEmpenhoClienteIdErp" runat="server" SkinID="SmallFilter" MaxLength="100" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosEmpenhoEstabelecimento" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosEmpenhoEstabelecimento" runat="server" SkinID="DropSmallFilter" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Button ID="btnFiltrosEmpenhoPesquisa" runat="server" SkinID="ButtonLeftFind" OnClick="btnFiltrosEmpenhoPesquisa_Click" />
                                <asp:Button ID="btnFiltrosEmpenhoLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosEmpenhoLimpar_Click" />

                            </div>
                                 <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                                <asp:ImageButton ID="imbItensExportar" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                    ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                    ImageUrl="~/Imagens/xlsx.png" OnClick="imbItensExportar_Click" />
                                <asp:ImageButton ID="imbItensExportarHist" runat="server" Width="30px" Height="30px" Visible="false" ImageAlign="AbsMiddle"
                                    ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                    ImageUrl="~/Imagens/xlsx.png" />
                            </div>
                        </div
                        
                        <%--BEGIN GRIDVIEW--%>
                        <div style="left: 0.5; width: 100%; margin-top: 5px; padding: 0 0 50px 0; overflow-x: none; overflow-y: scroll;">
                           
                            <asp:Panel ID="pnlItens" runat="server">
                                <center />

                                <asp:GridView ID="gvEmpenhoItens" runat="server"
                                    DataKeyNames="clienteRazaoSocial,clienteEndereco,contratoLicitacaoId,clienteId,clienteIdERP,estabelecimentoId,empenhoCodigoId,itemId,Vinculado,clienteIdFaturamento,empenhoItemQtdeValor,
                                                                      tipoEnderecoId,clienteEnderecoSeq,empenhoGradeSeq,itemSaldoContrato,contratoLicitacaoSeq,tipoPedidoId,itemValorNegociado,empenhoItemValidado,
                                                                      usuarioIdAprovacao,empenhoMotivoAprovacao,empenhoDataAprovacao,ordemCompraNumero,ordemCompraData,ordemCompraUsuarioId,ordemCompraGerada,empenhoSituacao,aproFinUsuarioIdAprovacao,
	                                                                  aproFinMotivoAprovacao,aproFinDataAprovacao"
                                    OnPageIndexChanging="gvEmpenhoItens_PageIndexChanging"
                                    OnRowCommand="gvEmpenhoItens_RowCommand"
                                    OnRowDataBound="gvEmpenhoItens_RowDataBound"
                                    OnRowDeleting="gvEmpenhoItens_RowDeleting">
                                    <Columns>
                                        <%--<asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" Visible="true">--%>
                                        <%--   <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" />
                                        </HeaderTemplate>--%>
                                        <%--   <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>--%>
                                        <%--</asp:TemplateField>--%>
                                         <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="empenhoData"  DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                        <asp:BoundField DataField="empenhoCodigoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="clienteEndereco" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />

                                        <asp:BoundField DataField="empenhoItemQtd" DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="contratoLicitacaoId"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                <%--        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrEmpenhoItemSaldo" runat="server" Text='<%# Eval("empenhoItemSaldo", "{0:f0}") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="empenhoItemQtdeValor" DataFormatString="{0:###,###,#00.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrEmpenhoItemValorTotal" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                         <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                         <asp:TemplateField ItemStyle-Width="320px" ItemStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrEmpenhoSituacao" runat="server"  />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="aproFinUsuarioIdAprovacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="aproFinMotivoAprovacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="aproFinDataAprovacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                       <asp:BoundField DataField="clienteTipoCredito" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                          <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbAprovar" runat="server" CommandName="Aprovar" SkinID="ImgGrid"
                                                    ImageUrl="~/Imagens/aprovar.png"
                                                    ToolTip="<%$ Resources:Resource, lblAprovarItem %>"
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
                                                <asp:ImageButton ID="imbReprovar" runat="server" CommandName="Reprovar" SkinID="ImgGrid"
                                                    ImageUrl="~/Imagens/Reprovar.jpg"
                                                    ToolTip="<%$ Resources:Resource, lblReprovarItem %>"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                          Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                          Eval("estabelecimentoId") + "|" + Eval("empenhoCodigoId") + "|" + 
                                                                                                          Eval("itemId") + "|" + Eval("tipoEnderecoId") + "|" + Eval("clienteEnderecoSeq") + "|" +
                                                                                                          Eval("empenhoGradeSeq") + "|" + Eval("contratoLicitacaoSeq") + "|" + 
                                                                                                          Eval("clienteIdFaturamento") + "|" + Eval("tipoPedidoId")  %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imbView" Visible="false" runat="server" CommandName="View"
                                                            SkinID="ImgGrid"
                                                            ImageUrl="~/Imagens/find.png"
                                                            ToolTip="<%$ Resources:Resource, ToolTipVisualizarLog %>" 
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

                                <asp:GridView ID="gvHistoricosAprovacao" Visible="false" runat="server"
                                    DataKeyNames="clienteRazaoSocial,clienteEndereco,contratoLicitacaoId,clienteId,clienteIdERP,estabelecimentoId,empenhoCodigoId,itemId,Vinculado,clienteIdFaturamento,empenhoItemQtdeValor,
                                                                      tipoEnderecoId,clienteEnderecoSeq,empenhoGradeSeq,itemSaldoContrato,contratoLicitacaoSeq,tipoPedidoId,itemValorNegociado,empenhoItemValidado,
                                                                      usuarioIdAprovacao,empenhoMotivoAprovacao,empenhoDataAprovacao,ordemCompraNumero,ordemCompraData,ordemCompraUsuarioId,ordemCompraGerada,empenhoSituacao,aproFinUsuarioIdAprovacao,
	                                                                  aproFinMotivoAprovacao,aproFinDataAprovacao"
                                    OnPageIndexChanging="gvHistoricosAprovacao_PageIndexChanging"
                                    OnRowCommand="gvHistoricosAprovacao_RowCommand"
                                    OnRowDataBound="gvHistoricosAprovacao_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />                                       
                                        <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="empenhoData"  DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                        <asp:BoundField DataField="empenhoCodigoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="clienteEndereco" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                         <asp:BoundField DataField="empenhoItemQtd" DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="contratoLicitacaoId"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                              
                                        <asp:BoundField DataField="empenhoItemQtdeValor" DataFormatString="{0:###,###,#00.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrEmpenhoItemValorTotal" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField ItemStyle-Width="320px" ItemStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrEmpenhoSituacao" runat="server"  />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="aproFinUsuarioIdAprovacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="aproFinMotivoAprovacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="aproFinDataAprovacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                      
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                        <%--END GRIDVIEW--%>

                    
                    </fieldset>
                    <%--END BLOCK--%>
            </ContentTemplate>
        </asp:UpdatePanel>

    </asp:Panel>

    <%-- PAINEL QUE APRESENTA DESCRIÇÕES DO LABEL --%>
    <asp:UpdatePanel ID="uppDescricao" runat="server" UpdateMode="Conditional">
        <%-- <Triggers>--%>
        <%-- <asp:AsyncPostBackTrigger ControlID="imbContratoBancarios" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="imbDoctoEfetivoEntrega" EventName="Click" />
                    </Triggers>--%>
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

    <%--LOG APROVAÇÃO --%>
   <asp:UpdatePanel ID="uppVisualizarLogAprovacao" runat="server" UpdateMode="Conditional">
           <ContentTemplate>
            <asp:Panel ID="pnlVisualizarLogAprovacao" runat="server" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround">
                </div>
                <div class="painel" style="width: 70%; height: 60%; left: 10%; top: 25%;">
                <div class="painel_header">
                <div class="painel_header_message">
                        <asp:Label ID="lblVisualizarLogAprovacaoHeader" runat="server" ForeColor="White" />
                    <%--<asp:Label ID="lblAnexosAprovEmpenhoHeader" runat="server" ForeColor="White" />--%>
                </div>
                <div class="alert_header_icon">
                    <asp:ImageButton ID="imgVisualizarLogAlteracaoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                        ToolTip="<%$ Resources:Resource, lblFechar %>"
                        ImageUrl="~/Imagens/Fechar.png"
                        OnClick="imgVisualizarLogAlteracaoClose_Click" />
                </div>
            </div>
                    <div class="painel_body" style="height: 80%;">
                        <fieldset>
           



                            <div style="left: 0%; position: relative; width: 99.5%; height: 100%;">
                               <%-- <div style="display: table; width: 100%; height: 10%;">
                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                        <asp:Label ID="lblaproFinUsuarioIdAprovacao" runat="server" />
                                    </div>
                                    <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                        <asp:TextBox ID="txtaproFinUsuarioIdAprovacao" runat="server" Enabled="false" MaxLength="100" />
                                    </div>
                                </div>
                                <div style="display: table; width: 100%; height: 10%;">
                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                        <asp:Label ID="lblaproFinDataAprovacao" runat="server" />
                                    </div>
                                    <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                        <asp:TextBox ID="txtaproFinDataAprovacao" runat="server" Enabled="false" MaxLength="100" />
                                    </div>
                                </div>
                                <div style="display: table; width: 100%; height: 10%;">
                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                        <asp:Label ID="lblaproFinMotivoAprovacao" runat="server" />
                                    </div>
                                    <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                        <asp:TextBox ID="txtaproFinMotivoAprovacao"  TextMode="MultiLine"  Width="98%"  Columns="50" Rows="6" Enabled="false" runat="server" MaxLength="100" />
                                    </div>
                                </div>--%>
                                       <%--BEGIN GRIDVIEW--%>
                        <div style="left: 0.5; width: 100%; margin-top: 5px; padding: 0 0 50px 0; overflow-x: none; overflow-y: scroll;">
                           
                            <asp:Panel ID="Panel1" runat="server">
                                <center />

                                <asp:GridView ID="gvEmpenhoHistoricoAprovacao" runat="server"
                                    DataKeyNames="contratoLicitacaoSeq, clienteId
	                              ,estabelecimentoId
                                   ,EmpenhoHistoricoId
	                               ,empenhoCodigoId
                                  ,tipoPedidoId
                                  ,clienteIdFaturamento
                                  ,itemId
                                  ,tipoEnderecoId
                                  ,empenhoGradeSeq
                                  ,aproFinUsuarioIdAprovacao
                                  ,aproFinMotivoAprovacao
                                  ,aproFinDataAprovacao,empenhoSituacao"
                                    OnPageIndexChanging="gvEmpenhoHistoricoAprovacao_PageIndexChanging"
                                    OnRowCommand="gvEmpenhoHistoricoAprovacao_RowCommand"
                                    OnRowDataBound="gvEmpenhoHistoricoAprovacao_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="empenhoSituacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="aproFinDataAprovacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="aproFinUsuarioIdAprovacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="aproFinMotivoAprovacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                      
                                        
                                          <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imbView" runat="server" CommandName="View"
                                                            SkinID="ImgGrid"
                                                            ImageUrl="~/Imagens/find.png"
                                                            ToolTip="<%$ Resources:Resource, ToolTipVisualizarLog %>" 
                                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + 
                                                                                                          Eval("contratoLicitacaoId") + "|" + Eval("clienteId") + "|" +
                                                                                                          Eval("estabelecimentoId") + "|" + Eval("EmpenhoHistoricoId") + "|"  + "|" + Eval("empenhoCodigoId") + "|" + 
                                                                                                          Eval("tipoPedidoId") + "|" + Eval("clienteIdFaturamento") + "|" + Eval("itemId") + "|" +
                                                                                                          Eval("tipoEnderecoId") + "|" + Eval("empenhoGradeSeq")   %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>

                            </asp:Panel>
                        </div>
                        <%--END GRIDVIEW--%>
                                <div style="display: table; width: 100%; height: 120px; text-align: center;">
                                                        <fieldset>
                                                            <div style="width: 100%; height: 100px; overflow-x: none; overflow-y: scroll;">
                                                                <%-- GRID REGISTROS --%>
                                                                <asp:GridView ID="gvViewLogAprovacao" runat="server"
                                                                    DataKeyNames="contratoLicitacaoId,empenhoCodigoId,clienteId,estabelecimentoId,tipoPedidoId,clienteIdFaturamento,empenhoDoctoSeq,
                                                                                                    empenhoDoctoNomeArquivo,empenhoDoctoExtensao,empenhoDoctoDataInclusao,usuarioId,contratoLicitacaoSeq"
                                                                    OnRowDataBound="gvViewLog_RowDataBound"
                                                                    OnRowCommand="gvViewLog_RowCommand"
                                                                    OnPageIndexChanging="gvViewLog_PageIndexChanging"
                                                                    OnRowDeleting="gvViewLog_RowDeleting"
                                                                    OnRowUpdating="gvViewLog_RowUpdating">
                                                                    <Columns>
                                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Literal ID="ltrDataCadastro" runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="empenhoDoctoNomeArquivo" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imbDownload" runat="server" SkinID="ImgGrid" CommandName="Download"
                                                                                    ToolTip="<%$ Resources:Resource, lblDownload %>"
                                                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                                                                        Eval("empenhoCodigoId") + "|" + Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + 
                                                                                                                                        Eval("tipoPedidoId") + "|" + Eval("clienteIdFaturamento") + "|" + Eval("empenhoDoctoSeq") + "|" + Eval("contratoLicitacaoSeq")  %>' />
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

    <asp:UpdatePanel ID="uppAnexosAprovEmpenho" runat="server" UpdateMode="Conditional">
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnConfirmarAprovacaoNok" EventName="Click" />
            <asp:PostBackTrigger ControlID="btnAnexoAprovEmpenhoAnexar"  />
        </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="pnlAnexosAprovEmpenho" runat="server" SkinID="PnlPopUp" Visible="false">
                            <div class="OpacityBackGround"></div>
                            <div class="painel" style="width: 70%; height: 80%; left: 20%; top: 15%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                         <asp:Label ID="lblConfirmarAprovacaoHeader" runat="server" ForeColor="White" />
                                        <%--<asp:Label ID="lblAnexosAprovEmpenhoHeader" runat="server" ForeColor="White" />--%>
                                    </div>
                                    <div class="alert_header_icon">
                                        <asp:ImageButton ID="imbAnexosAprovEmpenhoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                                            ImageUrl="~/Imagens/Fechar.png"
                                            OnClick="imbAnexosAprovEmpenhoClose_Click" />
                                    </div>
                                </div>
                                <div class="painel_body">
                                    <fieldset>
                                        <div style="left: 0%; display: table; width: 100%; height: 100%; position: relative; text-align: left;">
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                                    <asp:Label ID="lblAnexoAprovEmpenhoNome" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                                    <asp:TextBox ID="txtAnexoAprovEmpenhoNome" runat="server" MaxLength="100" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 10%;">
                                                <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                                    <asp:Label ID="lblAnexoAprovEmpenhoArquivo" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                                    <asp:FileUpload ID="fulAnexoAprovEmpenho" runat="server" />
                                                </div>
                                            </div>
                                           
                                            <div style="display: table; width: 100%; height: 10%; text-align: center;">
                                                <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                    <asp:Button ID="btnAnexoAprovEmpenhoAnexar" runat="server" SkinID="ButtonLeft" OnClick="btnAnexoAprovEmpenhoAnexar_Click" />
                                                    <asp:Button ID="btnAnexoAprovEmpenhoLimpar" runat="server" SkinID="ButtonRight" OnClick="btnAnexoAprovEmpenhoLimpar_Click" />
                                                </div>
                                            </div>
                                            <div style="display: table; width: 100%; height: 120px; text-align: center;">
                                                <fieldset>
                                                    <div style="width: 100%; height: 95px; overflow-x: none; overflow-y: scroll;">
                                                        <%-- GRID REGISTROS --%>
                                                        <asp:GridView ID="gvAnexoAprovEmpenho" runat="server"
                                                            DataKeyNames="contratoLicitacaoId,empenhoCodigoId,clienteId,estabelecimentoId,tipoPedidoId,clienteIdFaturamento,empenhoDoctoSeq,
                                                                          empenhoDoctoNomeArquivo,empenhoDoctoExtensao,empenhoDoctoDataInclusao,usuarioId,contratoLicitacaoSeq"
                                                            OnRowDataBound="gvAnexoAprovEmpenho_RowDataBound"
                                                            OnRowCommand="gvAnexoAprovEmpenho_RowCommand"
                                                            OnPageIndexChanging="gvAnexoAprovEmpenho_PageIndexChanging"
                                                            OnRowDeleting="gvAnexoAprovEmpenho_RowDeleting"
                                                            OnRowUpdating="gvAnexoAprovEmpenho_RowUpdating">
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="ltrDataCadastro" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="empenhoDoctoNomeArquivo" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
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

                                                <div style="left: 0%; position: relative; width: 98.5%; height: 50%;">
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
                                                        <div style="display: table; width: 100%; height: 30%;">
                                                            <asp:TextBox ID="txtConfirmarAprovacao" runat="server" Columns="90" Rows="5" TextMode="MultiLine" Width="100%" />
                                                        </div>
                                                        <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                                            <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                                <asp:Button ID="btnConfirmarAprovacaoOk" runat="server" SkinID="ButtonLeft" OnClick="btnConfirmarAprovacaoOk_Click" ValidationGroup="ValidacaoAprovacao" />
                                                                <asp:Button ID="btnConfirmarAprovacaoNok" runat="server" SkinID="ButtonRight" OnClick="btnConfirmarAprovacaoNok_Click" />
                                                            </div>
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


    <asp:UpdatePanel ID="uppDetalheLogAprovacao" runat="server" UpdateMode="Conditional">
           <ContentTemplate>
            <asp:Panel ID="pnlDetalheLogAprovacao" runat="server" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround">
                </div>
                <div class="painel" style="width: 70%; height: 60%; left: 10%; top: 25%;">
                <div class="painel_header">
                <div class="painel_header_message">
                        <asp:Label ID="lblDetalheLogAprovacaoHeader" runat="server" Text="Detalhe" ForeColor="White" />
                  
                </div>
                <div class="alert_header_icon">
                    <asp:ImageButton ID="imgDetalheLogAlteracaoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                        ToolTip="<%$ Resources:Resource, lblFechar %>"
                        ImageUrl="~/Imagens/Fechar.png"
                        OnClick="imgDetalheLogAlteracaoClose_Click" />
                </div>
            </div>
                    <div class="painel_body" style="height: 80%;">
                        <fieldset>
                            <div style="left: 0%; position: relative; width: 99.5%; height: 100%;">
                               <div style="display: table; width: 100%; height: 10%;">
                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                        <asp:Label ID="lblaproFinUsuarioIdAprovacao" runat="server" />
                                    </div>
                                    <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                        <asp:TextBox ID="txtaproFinUsuarioIdAprovacao" runat="server" Enabled="false" MaxLength="100" />
                                    </div>
                                </div>
                                <div style="display: table; width: 100%; height: 10%;">
                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                        <asp:Label ID="lblaproFinDataAprovacao" runat="server" />
                                    </div>
                                    <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                        <asp:TextBox ID="txtaproFinDataAprovacao" runat="server" Enabled="false" MaxLength="100" />
                                    </div>
                                </div>
                                <div style="display: table; width: 100%; height: 10%;">
                                    <div style="display: table-cell; width: 10%; height: 100%; vertical-align: middle;">
                                        <asp:Label ID="lblaproFinMotivoAprovacao" runat="server" />
                                    </div>
                                    <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                        <asp:TextBox ID="txtaproFinMotivoAprovacao"  TextMode="MultiLine"  Width="98%"  Columns="50" Rows="6" Enabled="false" runat="server" MaxLength="100" />
                                    </div>
                                </div>
                        </fieldset>
                    </div>
                </div>
            </asp:Panel>
         
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
