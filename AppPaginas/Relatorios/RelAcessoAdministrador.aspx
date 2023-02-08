<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelAcessoAdministrador.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelAcessoAdministrador" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnluppRelAcessoAdministrador" runat="server">
        <asp:UpdatePanel ID="uppRelAcessoAdministrador" runat="server" UpdateMode="Always">
            <Triggers>
                <asp:PostBackTrigger ControlID="ddlExportacao" />
                <asp:PostBackTrigger ControlID="imgExporCSV" />
                <asp:PostBackTrigger ControlID="imgExporXLS" />
            </Triggers>

            <ContentTemplate>

                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelAcessoAdministrador">
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
                                <asp:Label ID="lblFiltroDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltroDescricao" runat="server" SkinID="Filtro" MaxLength="100" TabIndex="25" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosPerfilAcesso" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosPerfilAcesso" runat="server" SkinID="DropFiltro" TabIndex="27" />
                            </div>


                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="29" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" TabIndex="30" OnClick="btnFiltrosLimpar_Click" />
                                </div>
                            </div>
                        </div>

                        <div style="width: 95%; float: right; text-align: right; margin-right: 15px; margin-top: 20px;">
                            <asp:ImageButton ID="imgExporCSV" runat="server" OnClick="imgExporCSV_Click" alt="Exportar CSV" title="Exportar CSV" ImageUrl="~/Imagens/down-csv.png" />
                            <asp:ImageButton ID="imgExporXLS" runat="server" OnClick="imgExporXLS_Click" alt="Exportar XLS" title="Exportar XLS" ImageUrl="~/Imagens/down-xls.png" />
                            <asp:DropDownList ID="ddlExportacao" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddlExportacao_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros" style="margin-bottom: 100px; margin-top: 3px;">
                            <asp:GridView ID="gvRegistrosPesquisa" runat="server" TabIndex="36"
                                DataKeyNames="usuarioId,usuarioNome,logAcessoAdmData,logAcessoAdmDescricao,perfilAcessoDescricao"
                                OnPageIndexChanging="gvRegistrosPesquisa_PageIndexChanging"
                                OnRowDataBound="gvRegistrosPesquisa_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="usuarioId" ItemStyle-Width="150px" />
                                    <asp:BoundField DataField="usuarioNome" ItemStyle-Width="150px" />
                                    <asp:BoundField DataField="logAcessoAdmDescricao" />
                                    <asp:BoundField DataField="logAcessoAdmData" ItemStyle-Width="150px" />
                                    <asp:BoundField DataField="perfilAcessoDescricao" ItemStyle-Width="150px" />
                                    <%--<asp:BoundField DataField="usuarioAcessoData" ItemStyle-Width="150px" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkAtivo" Enabled="false" runat="server" Checked='<%# Bind("usuarioAtivo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
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

