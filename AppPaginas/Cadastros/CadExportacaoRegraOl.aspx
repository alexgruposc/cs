<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadExportacaoRegraOl.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadExportacaoRegraOl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divGrid" visible="false" runat="server">
            <asp:GridView ID="gvExport" runat="server"
                SkinID="gvExport"
                OnRowDataBound="gvExport_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="medicoCli" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="ValorVendaLiq" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="UFdestino" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="PercDescontoIndustria" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="PercDescontoFinanceiroInd" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="InicioValidade" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="FimValidade" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="mercadoId" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="itemInserido" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="itemAtualizado" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="itemExcluido" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="DataImportacao" ItemStyle-HorizontalAlign="Left" />
                </Columns>
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
        <div id="divAviso" visible="false" runat="server">
            <h3>Nenhum registro encontrado!</h3>
        </div>
    </form>
</body>
</html>
