<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadEmpenhoGradeExcel.aspx.cs"
    Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEmpenhoGradeExcel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvEmpenhoGrade" runat="server" 
                      SkinID="gvExport"
                      OnRowDataBound="gvEmpenhoGrade_RowDataBound">
            <Columns>
                <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                <asp:BoundField DataField="itemDescricao" />
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
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <asp:Literal ID="ltrSaldoContrato" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="320px">
                    <ItemTemplate>
                        <asp:Literal ID="ltrEnderecoEntrega" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
