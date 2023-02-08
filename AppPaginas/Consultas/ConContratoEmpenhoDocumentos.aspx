<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConContratoEmpenhoDocumentos.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConContratoEmpenhoDocumentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="left: 0.5%; width: 99%; height: 80%; position: fixed;">
        <fieldset style="left: 0.5%; width: 99%; ">
            <div style="display: table; width: 100%; height: 90%; ">
                <div style="width: 100%; height: 50%;">
                    <fieldset style="left: 0%; width: 99%;">
                        <legend>
                            <asp:Literal ID="ltrContratoHeader" runat="server" Text="<%$ Resources:Resource, lblContratoDocumentoHeader %>" />
                        </legend>

                        <div style="width: 100%; height: 200px; overflow-x: none; overflow-y: scroll;">
                            <center />
                            <asp:GridView ID="gvContratoDocumentos" runat="server" 
                                            DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,contratoDoctoSeq,contratoDoctoNomeArquivo,contratoDoctoExtensao,
                                                        contratoDoctoDataEmissao,usuarioId,contratoDoctoObservacoes,contratoLicitacaoSeq"
                                            OnRowDataBound="gvContratoDocumentos_RowDataBound" 
                                            OnRowCommand="gvContratoDocumentos_RowCommand"
                                            OnPageIndexChanging="gvContratoDocumentos_PageIndexChanging" 
                                            OnRowUpdating="gvContratoDocumentos_RowUpdating">
                                <Columns>                                        
                                    <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="contratoLicitacaoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />                                    
                                    <asp:BoundField DataField="contratoDoctoDataEmissao" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="contratoDoctoNomeArquivo" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="contratoDoctoObservacoes" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbDownload" runat="server" SkinID="ImgGrid" 
                                                                CommandName="Download"
                                                                ToolTip="<%$ Resources:Resource, lblDownload %>" 
                                                                CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                    Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + Eval("contratoDoctoSeq") + "|" + 
                                                                                    Eval("contratoLicitacaoSeq") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>                        
                </div>
                <div style="width: 100%; height: 50%;">
                    <fieldset style="left: 0%; width: 99%;">
                        <legend>
                            <asp:Literal ID="ltrEmpenhoHeader" runat="server" Text="<%$ Resources:Resource, lblEmpenhoAnexos %>" />
                        </legend>

                        <div style="width: 100%; height: 200px; overflow-x: none; overflow-y: scroll;">
                            <center />
                                <asp:GridView ID="gvEmpenhoAnexos" runat="server" 
                                              DataKeyNames="contratoLicitacaoId,clienteId,estabelecimentoId,contratoLicitacaoSeq,
                                                            empenhoCodigoId,tipoPedidoId,clienteIdFaturamento,empenhoDoctoSeq"
                                              OnRowDataBound="gvEmpenhoAnexos_RowDataBound" 
                                              OnRowCommand="gvEmpenhoAnexos_RowCommand"
                                              OnPageIndexChanging="gvEmpenhoAnexos_PageIndexChanging" 
                                              OnRowUpdating="gvEmpenhoAnexos_RowUpdating">
                                    <Columns>
                                        <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="contratoLicitacaoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="empenhoCodigoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="empenhoDoctoDataInclusao" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="empenhoDoctoNomeArquivo" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="empenhoDoctObservacoes" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbDownload" runat="server" SkinID="ImgGrid" 
                                                                 CommandName="Download"
                                                                 ToolTip="<%$ Resources:Resource, lblDownload %>" 
                                                                 CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("contratoLicitacaoId") + "|" + 
                                                                                      Eval("clienteId") + "|" + Eval("estabelecimentoId") + "|" + 
                                                                                      Eval("contratoLicitacaoSeq") + "|" + Eval("empenhoCodigoId") + "|" + Eval("tipoPedidoId") + "|" + 
                                                                                      Eval("clienteIdFaturamento") + "|" + Eval("empenhoDoctoSeq") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                        </div>
                    </fieldset>                        
                </div>
            </div>
        </fieldset>
    </div>

</asp:Content>
