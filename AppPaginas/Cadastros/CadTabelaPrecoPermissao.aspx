<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadTabelaPrecoPermissao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadTabelaPrecoPermissao" %>

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
                                <asp:Label ID="lblFiltrosUsuarioId" runat="server" />
                                <asp:TextBox ID="txtFiltrosUsuarioId" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="24" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosUsuarioNome" runat="server" />
                                <asp:TextBox ID="txtFiltrosUsuarioNome" runat="server" SkinID="Filtro" MaxLength="100" TabIndex="25" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosUsuarioTipo" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosUsuarioTipo" runat="server" SkinID="DropFiltro" TabIndex="26" />
                            </div>

                            <%--<div class="boxPesquisa" style="text-align: center;">
                                <asp:CheckBox ID="chkFiltrosPrecoVlrMinimo" runat="server" Font-Bold="true" TabIndex="26" Text="<%$ Resources:Resource, lblValorMinimo%>" />
                            </div>
                            <div class="boxPesquisa" style="text-align: center;">
                                <asp:CheckBox ID="chkFiltrosPrecoVlrTabela" runat="server" Font-Bold="true" TabIndex="27" Text="<%$ Resources:Resource, lblValorTabela %>" />
                            </div>
                            <div class="boxPesquisa" style="text-align: center;">
                                <asp:CheckBox ID="chkFiltrosPrecoVlrMaximo" runat="server" Font-Bold="true" TabIndex="28" Text="<%$ Resources:Resource, lblValorMaximo %>" />
                            </div>
                            --%>

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
                                DataKeyNames="usuarioId,usuarioNome,usuarioAutenticaAD,usuarioEmail,usuarioTipoDescricao,
                                              unidadeNegocioCompras,unidadeNegocioPJP,unidadeNegocioPJD,unidadeNegocioPF"
                                OnPageIndexChanging="gvRegistrosPesquisa_PageIndexChanging"
                                OnRowDataBound="gvRegistrosPesquisa_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="130px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioId" runat="server" Text='<%# FormataStringSaida(Eval("usuarioId"), txtFiltrosUsuarioId.Text) %>' />
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

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelectFlagPJP" runat="server" Checked='<%# Bind("unidadeNegocioPJP") %>' OnCheckedChanged="chkSelectFlagPJP_CheckedChanged" AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelectFlagPJD" runat="server" Checked='<%# Bind("unidadeNegocioPJD") %>' OnCheckedChanged="chkSelectFlagPJD_CheckedChanged" AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelectFlagPF" runat="server" Checked='<%# Bind("unidadeNegocioPF") %>' OnCheckedChanged="chkSelectFlagPF_CheckedChanged" AutoPostBack="true"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
