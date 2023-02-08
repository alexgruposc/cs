<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadExportacaoPrecoCMed.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadExportacaoPrecoCMed" %>

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

                    <asp:BoundField DataField="EAN" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="A0" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="A12" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="A17" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="A17_5" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="A18" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="A20" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Left" />
                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Literal ID="ltrDataCadastro" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Literal ID="ltritemInserido" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Literal ID="ltritemAtualizado" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Literal ID="ltritemExcluido" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Literal ID="ltrItemSemAtualizacao" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
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

