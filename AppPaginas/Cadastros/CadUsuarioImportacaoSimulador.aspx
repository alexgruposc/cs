<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadUsuarioImportacaoSimulador.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadUsuarioImportacaoSimulador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroAprovContrato" runat="server">
        <asp:UpdatePanel ID="uppCadastroAprovContrato" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroAprovContrato">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <%--BEGIN BLOCK--%>
                <div style="width: 100%; display: table;">
                    <fieldset style="margin-bottom: 100px;">
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosUsuarioId" runat="server" />
                                <asp:TextBox ID="txtFiltrosUsuarioId" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="24" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosUsuarioNome" runat="server" />
                                <asp:TextBox ID="txtFiltrosUsuarioNome" runat="server" SkinID="Filtro" MaxLength="100" TabIndex="25" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosUsuarioTipo" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosUsuarioTipo" runat="server" SkinID="DropFiltro" TabIndex="27" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="30" OnClick="btnFiltrosPesquisa_Click1" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" TabIndex="31" OnClick="btnFiltrosLimpar_Click1" />
                                </div>
                            </div>
                        </div>

                        <%--BEGIN GRIDVIEW--%>
                        <div class="gridRegistros" style="margin-top: 10px;">
                            <asp:GridView ID="gvRegistrosPesquisa" runat="server" TabIndex="36"
                                DataKeyNames="usuarioId,usuarioNome,usuarioEmail,usuarioTipoDescricao,
                                              unidadeNegocioCompras"
                                OnPageIndexChanging="gvRegistrosPesquisa_PageIndexChanging"
                                OnRowDataBound="gvRegistrosPesquisa_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="130px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioId" runat="server" Visible="true" Text='<%# FormataStringSaida(Eval("usuarioId"), txtFiltrosUsuarioId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioNome" runat="server" Text='<%# FormataStringSaida(Eval("usuarioNome"), txtFiltrosUsuarioNome.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="usuarioTipoDescricao" ItemStyle-Width="150px" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelectFlagCompras" runat="server" Checked='<%# Bind("unidadeNegocioCompras") %>' OnCheckedChanged="chkSelectFlagCompras_CheckedChanged" AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                        <%--END GRIDVIEW--%>
                </div>

                </fieldset>
                <%--END BLOCK--%>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
