<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelPreco.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelPreco" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroTabelaPrecoPermissao" runat="server">
        <asp:UpdatePanel ID="uppTabelaPrecoPermissao" runat="server" UpdateMode="Always">
            <ContentTemplate>

                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppTabelaPrecoPermissao">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosPedidoId" runat="server" />
                                <asp:TextBox ID="txtFiltrosPedidoId" runat="server" SkinID="Filtro" MaxLength="100" TabIndex="27" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosItemId" runat="server" />
                                <asp:TextBox ID="txtFiltrositemId" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="24" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosItemDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltrosItemDescricao" runat="server" SkinID="Filtro" MaxLength="100" TabIndex="25" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="29" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" TabIndex="30" OnClick="btnFiltrosLimpar_Click" />
                                </div>
                            </div>

                        </div>

                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros" style="margin-bottom: 100px;">
                            <asp:GridView ID="gvRegistrosPesquisa" runat="server" TabIndex="36"
                                DataKeyNames="pedidoId, itemId, itemDescricao, tabelaPrecoVlrTabela, pedidoItemPrecoTabela, usuarioId,usuarioIdMotivo,PrecoFaturado"
                                OnPageIndexChanging="gvRegistrosPesquisa_PageIndexChanging"
                                OnRowDataBound="gvRegistrosPesquisa_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="pedidoId" ItemStyle-Width="150px" />
                                    <asp:BoundField DataField="itemId" ItemStyle-Width="150px" />
                                    <asp:BoundField DataField="itemDescricao" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Label ID="tabelaPrecoVlrTabela" runat="server"
                                                Text='<%# Eval("tabelaPrecoVlrTabela", "{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Label ID="pedidoItemPrecoTabela" runat="server"
                                                Text='<%# Eval("pedidoItemPrecoTabela", "{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Label ID="PrecoFaturado" runat="server"
                                                Text='<%# Eval("PrecoFaturado", "{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--<asp:BoundField DataField="tabelaPrecoVlrTabela" ItemStyle-Width="150px" />
                                    <asp:BoundField DataField="pedidoItemPrecoTabela" ItemStyle-Width="150px" />--%>
                                    <asp:BoundField DataField="usuarioId" ItemStyle-Width="150px" />
                                    <asp:BoundField DataField="usuarioIdMotivo" ItemStyle-Width="150px" />
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
