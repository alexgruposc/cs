<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConLogGeracaoOCExcel.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConLogGeracaoOCExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:GridView ID="gvLogOC" runat="server"
                                        CssClass="table table-bordered table-striped table-hover"
                                        DataKeyNames="id,nomeArquivo,EmpenhoId,ContratoId,estabelecimentoId,ClienteId,ContratoLicitacaoSeq,TipoPedido,
                                                 ClienteIdFaturamento,usuarioIdLog,dataLog,tipoTransacao,ItemId"
                                        OnRowDataBound="gvLogOC_RowDataBound"
                                        OnPageIndexChanging="gvLogOC_PageIndexChanging"
                                        AutoGenerateColumns="False"
                                        AllowPaging="True">
                                        <Columns>
                                              <asp:BoundField DataField="ItemId" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="nomeArquivo" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="EmpenhoId" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="ContratoId" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="TipoPedido" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="clienteCNPJ" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="ClienteIdFaturamento" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="clienteRazaoSocialFAT" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="clienteCNPJFAT" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="usuarioIdLog" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="tipoTransacao" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="dataLog" ItemStyle-HorizontalAlign="Left" />
                                        </Columns>
                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                    </asp:GridView>
    </div>
    </form>
</body>
</html>
