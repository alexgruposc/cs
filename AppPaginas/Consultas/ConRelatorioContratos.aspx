<%@ Page Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConRelatorioContratos.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConRelatorioContratos" %>

<%-- CONTROLES --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>

<%-- NAMESPACES --%>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlLicitacaoRelatorio" runat="server">
        <asp:UpdatePanel ID="uppLicitacaoRelatorio" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
            </Triggers>
            
            <ContentTemplate>
                
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppLicitacaoRelatorio">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlFiltros" runat="server" Height="100%" DefaultButton="btnFiltorsPesquisar">
                    <%-- BACKGROUND - BODY --%>
                    <div style="left: 0.5%; width: 99%; height: 20%;">
                        <fieldset style="left: 0.5%; width: 99%;">
                            <legend>
                                <asp:Literal ID="ltrLicitacaoRelatorio" runat="server" />
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosCliente" runat="server" />
                                        <asp:TextBox ID="txtFiltrosClienteIdDe" runat="server" SkinID="Size70" MaxLength="9" TabIndex="1" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:TextBox ID="txtFiltrosClienteIdAte" runat="server" SkinID="Size70" MaxLength="9" TabIndex="2" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosItem" runat="server" />
                                        <asp:TextBox ID="txtFiltrosItemDe" runat="server" SkinID="Size70" MaxLength="5" TabIndex="3" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:TextBox ID="txtFiltrosItemAte" runat="server" SkinID="Size70" MaxLength="5" TabIndex="4" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosEstabelecimentoId" runat="server" />
                                        <asp:DropDownList ID="ddlFiltrosEstabelecimentoIdDe" runat="server" SkinID="DropSmallFilter" TabIndex="5" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:DropDownList ID="ddlFiltrosEstabelecimentoIdAte" runat="server" SkinID="DropSmallFilter" TabIndex="6" Visible="false" />
                                        <asp:Label ID="lblFiltrosFabricante" runat="server" />
                                        <asp:DropDownList ID="ddlFiltrosFabricante" runat="server" SkinID="DropSmallFilter" TabIndex="7" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosModalidade" runat="server" />
                                        <asp:DropDownList ID="ddlFiltrosModalidade" runat="server" SkinID="DropSmallFilter" TabIndex="8" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosRepresentante" runat="server" />
                                        <asp:TextBox ID="txtFiltrosRepresentante" runat="server" SkinID="Size70" MaxLength="50" TabIndex="9" />
                                    </div>                                
                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltorsPesquisar" runat="server" SkinID="ButtonLeftFind" Onclick="btnFiltrosPesquisar_Click" TabIndex="10" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" TabIndex="11" />
                                        <asp:ImageButton ID="btnGerarExcel" runat="server" OnClick="btnGerarExcel_Click" TabIndex="12"
                                            Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                            ImageUrl="~/Imagens/xlsx.png"/>
                                    </div>
                                </div>
                            </div>
                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisa">
                                        <CtlPeriodo:ControlPeriodo ID="CtlFiltrosVigencia" runat="server" 
                                                                   TabIndexDataInicio="13" 
                                                                   TabIndexDataTermino="14" 
                                                                   ShowHeaderLine="false" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblQtdRegistros" runat="server" />
                                        <asp:Label ID="lblQtdRegistrosGridDesc" runat="server" SkinID="LabelResposta" />
                                    </div>
                                    <div class="boxPesquisa" style="width: 180px;">
                                        <asp:Label ID="lblRegistrosPagina" runat="server" Text="<%$ Resources:Resource, lblRegistrosPagina %>" />
                                        <asp:DropDownList ID="ddlRegistrosPagina" runat="server" TabIndex="15" Height="20px" Width="50px">
                                            <asp:ListItem Value="10" Text="10" />
                                            <asp:ListItem Value="20" Text="20" />
                                            <asp:ListItem Value="30" Text="30" />
                                            <asp:ListItem Value="40" Text="40" />
                                            <asp:ListItem Selected="True" Value="50" Text="50" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            
                        </fieldset>
                    </div>
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <%-- GRID REGISTROS --%>
                            <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;" >
                                <center />
                                <asp:GridView ID="gvLicitacaoRelatorio" runat="server" TabIndex="16"
                                    onpageindexchanging="gvLicitacaoRelatorio_PageIndexChanging" 
                                    onrowcommand="gvLicitacaoRelatorio_RowCommand" 
                                    onrowdatabound="gvLicitacaoRelatorio_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="contratoLicitacaoId" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrCnpj" runat="server" 
                                                             Text='<%# Comom.Utility.FormataDocumentos(Eval("clienteCNPJ").ToString(), Comom.Utility.FormatOption.ApplyMask) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                    <asp:Label ID="lblClienteNome" runat="server" 
                                                               Text='<%# Eval("clienteRazaoSocial") %>' 
                                                               ToolTip='<%# Eval("clienteRazaoSocial") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="estabelecimentoId" DataFormatString="{0:d2}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                        <%--<asp:TemplateField ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                    <asp:Label ID="lblLoja" runat="server" 
                                                               Text='<%# Eval("estabelecimentoRazaoSocial") %>' 
                                                               ToolTip='<%# Eval("estabelecimentoRazaoSocial") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="ufId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                        <asp:BoundField DataField="contratoLicitacaoProcesso" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="modalidadeLicitacaoDescricao" ItemStyle-Width="70px" />                                        
                                        <asp:BoundField DataField="contratoLicitacaoDataEmissao" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" />                                        
                                        <asp:BoundField DataField="contratoLicitacaoData" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" />
                                        <asp:BoundField DataField="contratoLicitacaoVigencia" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" />
                                        <asp:BoundField DataField="itemId" ItemStyle-Width="50px"  />
                                        <asp:TemplateField ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                    <asp:Label ID="lblItem" runat="server" 
                                                               Text='<%# Eval("itemDescricao") %>' 
                                                               ToolTip='<%# Eval("itemDescricao") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                    <asp:Label ID="lblFabricante" runat="server" 
                                                               Text='<%# Eval("FabricanteDescricao") %>' 
                                                               ToolTip='<%# Eval("FabricanteDescricao") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="itemQuantidade" DataFormatString="{0:#,###,#00.##}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="itemValorNegociado" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="ValorTotal" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="itemPrecoFabrica" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="itemValorDesconto" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="itemValorDescontoCAP" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="precoCompra" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="80px" />
                                        
                                        <asp:BoundField DataField="QtdFaturada" DataFormatString="{0:#,###,#00.##}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="Saldo" DataFormatString="{0:#,###,#00.##}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="contratoLicitacaoPrazo" DataFormatString="{0:#,###,#00.##}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" />
                                        <asp:TemplateField ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 50px;">
                                                    <asp:Label ID="lblValidade" runat="server" 
                                                               Text='<%# Eval("contratoLicitacaoValidade") %>' 
                                                               ToolTip='<%# Eval("contratoLicitacaoValidade") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblControlado" runat="server"
                                                           Text='<%# bool.Parse(Eval("itemControlado").ToString()) 
                                                                        ? 
                                                                     GetResourceValue("lblSim") 
                                                                        : 
                                                                     GetResourceValue("lblNao") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                    <asp:Label ID="lblTipoProduto" runat="server" 
                                                               Text='<%# Eval("tipoProdutoDescricao") %>' 
                                                               ToolTip='<%# Eval("tipoProdutoDescricao") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                    <asp:Label ID="lblRepresentante" runat="server" 
                                                               Text='<%# Eval("representanteNome") %>' 
                                                               ToolTip='<%# Eval("representanteNome") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                    <asp:Label ID="lblObservacoes" runat="server" 
                                                               Text='<%# Eval("contratoLicitacaoObservacoes") %>' 
                                                               ToolTip='<%# Eval("contratoLicitacaoObservacoes") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>    
                                             <asp:TemplateField ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAcaoJudicial" runat="server"
                                                           Text='<%# bool.Parse(Eval("AcaoJudicial").ToString()) 
                                                                        ? 
                                                                     GetResourceValue("lblSim") 
                                                                        : 
                                                                     GetResourceValue("lblNao") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>   
                                            <asp:BoundField DataField="contratoStatusId" ItemStyle-Width="70px" />                                                                 
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>
