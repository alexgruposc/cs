<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadGrupoUsuario.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadGrupoUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroGrupoUsuario" runat="server">
        <asp:UpdatePanel ID="uppCadastroGrupoUsuario" runat="server">
            <ContentTemplate>

                <%-- PROGRESS BACKGROUND --%>
                <%--  <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroPerfilAcesso">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>--%>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        <div class="navegacao">
                            <%--  <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosGrupoUsuarioId" runat="server" />
                                <asp:TextBox ID="txtFiltrosGrupoUsuarioId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="12" />
                            </div>--%>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosGrupoUsuarioDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltrosGrupoUsuarioDescricao" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="13" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="14" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" TabIndex="15" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonRight" TabIndex="16" OnClick="btnFiltrosNovoCadastro_Click" />
                                    <%--<asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="17" OnClick="btnFiltrosExcluir_Click" />--%>
                                </div>
                            </div>
                        </div>

                        <%--DataKeyNames="perId,perDescricao"--%>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="20"
                                DataKeyNames="perfilAcessoId,perfilAcessoDescricao"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="perfilAcessoId" HeaderText="Código" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <HeaderTemplate>
                                            PERFIL DE ACESSO
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="perfilAcessoDescricao" runat="server" Text='<%# FormataStringSaida(Eval("perfilAcessoDescricao"), txtFiltrosGrupoUsuarioDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnOpen" runat="server" CommandName="Editar" Width="25px" Height="25px"
                                                CommandArgument='<%# Eval("perfilAcessoId")+","+Eval("perfilAcessoDescricao") %>'
                                                ToolTip="<%$ Resources:Resource, lblMenu%>"
                                                ImageUrl="~/Imagens/Menus.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnShowUsers" runat="server" CommandName="Visualizar" Width="25px" Height="25px"
                                                CommandArgument='<%# Eval("perfilAcessoId") %>'
                                                ToolTip="<%$ Resources:Resource, lblUsuarios%>"
                                                ImageUrl="~/Imagens/Users.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </asp:Panel>

                <br />
                <br />
                <br />


                <%--PANEL QUE LISTA MÓDULOS--%>
                <asp:Panel ID="pnlModulos" runat="server" Visible="false" SkinID="PnlPopUp">
                    <div class="OpacityBackGround">
                    </div>
                    <div class="painel">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblModulosHeader" runat="server" ForeColor="White" /><asp:HiddenField ID="hidPerfielId" runat="server" />
                                <asp:TextBox ID="txtPerfilId" Visible="false" runat="server"></asp:TextBox>
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="imbFiltrosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" TabIndex="28" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosClose_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <asp:GridView ID="gvModulos" runat="server"
                                DataKeyNames="menuId,menuDescricao,menuIdpai,checkPerfil"
                                AutoGenerateColumns="false"
                                AllowPaging="false"
                                OnRowDataBound="gvModulos_RowDataBound"
                                OnRowCommand="gvModulos_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="menuId" HeaderText="Código" Visible="true" />
                                    <asp:BoundField DataField="menuIdPai" HeaderText="Menu Pai" Visible="true" />
                                    <asp:BoundField DataField="menuDescricao" HeaderText="Descrição" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAllModulos" runat="server" OnCheckedChanged="chkAllModulos_CheckedChanged" AutoPostBack="true" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkFlagModulos" runat="server" OnCheckedChanged="chkFlagModulos_CheckedChanged" AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>

                <%-- INFORME DADOS DOS USUÁRIOD DO GRUPO --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <div style="width: 100%; display: table;">
                        <fieldset style="margin-bottom: 100px;">
                            <legend>
                                <asp:Literal ID="ltrDadosHeader" runat="server" />
                            </legend>

                            <%-- BOTOES --%>
                            <div class="navegacao">
                                <div class="boxPesquisa">
                                    <asp:Button ID="btnVoltar" runat="server" TabIndex="32" SkinID="ButtonCenter" OnClick="btnVoltar_Click" />
                                </div>
                            </div>
                            <div style="width: 100%;">
                                <%--GRID USUARIOS --%>
                                <asp:Panel ID="pnlGvItens" runat="server">
                                    <div style="display: table; width: 99.6%; height: 40%;">
                                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                                            <asp:GridView ID="gvUsuarios" runat="server" TabIndex="51"
                                                DataKeyNames="usuarioId, usuarionome"
                                                OnPageIndexChanging="gvUsuarios_PageIndexChanging"
                                                OnRowCommand="gvUsuarios_RowCommand"
                                                OnRowDataBound="gvUsuarios_RowDataBound"
                                                OnRowUpdating="gvUsuarios_RowUpdating">
                                                <Columns>
                                                    <asp:BoundField DataField="usuarioId" ItemStyle-Width="90px" />
                                                    <asp:BoundField DataField="usuarioNome" />
                                                </Columns>
                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </fieldset>
                                    </div>
                                </asp:Panel>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>
