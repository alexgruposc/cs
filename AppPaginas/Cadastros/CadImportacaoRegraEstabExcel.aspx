<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadImportacaoRegraEstabExcel.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadImportacaoRegraEstabExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvRegraEstab" runat="server"
                SkinID="gvExport"
                OnRowDataBound="gvRegraEstab_RowDataBound">
                <Columns>
                    <%--<asp:BoundField DataField="estabDesc" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />--%>
                    <asp:BoundField DataField="ufDestino" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="produtoImportado" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="clienteContribuinte" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="convenio118" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="isento" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" />
                </Columns>
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
