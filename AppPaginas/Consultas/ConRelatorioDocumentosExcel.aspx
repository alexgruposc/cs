<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConRelatorioDocumentosExcel.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConRelatorioDocumentosExcel" %>

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
        <asp:GridView ID="gvDocumentosCliente" runat="server"
            SkinID="gvExport"
             OnRowDataBound="gvDocumentosCliente_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="clienteId" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <div style="text-overflow: ellipsis; white-space: nowrap; width: 120px;">
                                                <asp:Label ID="lblClienteNome" runat="server"
                                                    Text='<%# Eval("clienteRazaoSocial") %>'
                                                    ToolTip='<%# Eval("clienteRazaoSocial") %>' />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="tipoDocumentoId" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Dias_Vencimento" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Status" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Data_Vencimento" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                </Columns>
            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
