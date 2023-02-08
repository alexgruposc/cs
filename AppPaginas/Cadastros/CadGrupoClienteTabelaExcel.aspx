<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadGrupoClienteTabelaExcel.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadGrupoClienteTabelaExcel" %>

<<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"
                                DataKeyNames="grupoId,grupoDescricao,dataCadastro,usuarioId"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                <Columns>
                                    <asp:BoundField DataField="grupoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="grupoDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="dataCadastro" ItemStyle-HorizontalAlign="Center"  DataFormatString="{0:dd/MM/yyyy}"  ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
    </div>
    </form>
</body>
</html>
