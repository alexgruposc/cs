<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConRelatorioContratosExcel.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConRelatorioContratosExcel" %>

<%-- NAMESPACES --%>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvLicitacaoRelatorio" runat="server"
                SkinID="gvExport"
                OnRowDataBound="gvLicitacaoRelatorio_RowDataBound">
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
                    <asp:TemplateField ItemStyle-Width="100px">
                        <ItemTemplate>
                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                <asp:Label ID="lblLoja" runat="server"
                                    Text='<%# string.Format("{0:d2} - {1} | {2}", Eval("estabelecimentoId"), Eval("estabelecimentoRazaoSocial"), Eval("ufId")) %>'
                                    ToolTip='<%# string.Format("{0:d2} - {1} | {2}", Eval("estabelecimentoId"), Eval("estabelecimentoRazaoSocial"), Eval("ufId")) %>' />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ufId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                    <asp:BoundField DataField="contratoLicitacaoProcesso" ItemStyle-Width="70px" />
                    <asp:BoundField DataField="modalidadeLicitacaoDescricao" ItemStyle-Width="70px" />
                    <asp:BoundField DataField="contratoLicitacaoData" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" />
                    <asp:BoundField DataField="contratoLicitacaoDataEmissao" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" />
                    <asp:BoundField DataField="contratoLicitacaoVigencia" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" />
                    <asp:BoundField DataField="itemId" ItemStyle-Width="50px" />
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
                                              "Sim"
                                                : 
                                              "Não" %>' />
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
                </Columns>
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
