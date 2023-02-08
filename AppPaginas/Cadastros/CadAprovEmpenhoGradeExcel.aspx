<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadAprovEmpenhoGradeExcel.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadAprovEmpenhoGradeExcel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
             <asp:GridView ID="gvEmpenhoItens" runat="server"
                                    SkinID="gvExport"
                                    OnRowDataBound="gvEmpenhoItens_RowDataBound" >
                                    <Columns>
                                       <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="empenhoCodigoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                          <asp:BoundField DataField="contratoLicitacaoId"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                        <asp:BoundField DataField="clienteEndereco" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />

                                        <asp:BoundField DataField="empenhoItemQtd" DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
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
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />

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
    </div>
    </form>
</body>
</html>
