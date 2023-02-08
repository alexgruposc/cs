<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadUsuarioGrupo.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadUsuarioGrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- CONTROLES --%>
    <%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>
    <%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
    <%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
    <%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../Styles/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <script language="Javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
    <asp:Panel ID="pnlCadastroGrupos" runat="server">
        <asp:UpdatePanel ID="updCadastroGrupos" runat="server">

            <ContentTemplate>
                <%-- PROGRESS --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updCadastroGrupos">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <div style="width: 100%; display: block;">

                        <fieldset>
                            <div style="display: table; width: 100%; height: 43px">
                                <div style="text-align: right; display: table-cell; width: 100%; vertical-align: middle;">
                                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" SkinID="ButtonLeftSave" TabIndex="1" ValidationGroup="Validacao" OnClick="btnSalvar_Click" UseSubmitBehavior="false" />
                                    <%-- <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="ButtonCenterClean" TabIndex="6" OnClick="btnLimpar_Click" />--%>
                                    <asp:Button ID="btnVoltar" runat="server" Text="Voltar" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnVoltar_Click" UseSubmitBehavior="false" />

                                </div>
                            </div>
                        </fieldset>
                        <%-- FORMULÁRIO --%>
                        <fieldset style="float: left; width: 99.4%; padding: 25px 0 0 0; height: 50px">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblNomeGrupo" Text="Nome: " runat="server" />
                            </div>
                            <div class="boxPesquisa" style="margin: 0 0 0 0">
                                <asp:TextBox ID="txtNomeGrupo" runat="server" Width="300px" MaxLength="250" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblDescricao" Text="Descrição: " runat="server" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:TextBox ID="txtDescricao" runat="server" Width="600%" MaxLength="500" />
                            </div>
                        </fieldset>
                        <br />
                        <br />

                        <asp:UpdatePanel ID="updUsuarios" runat="server" >
                            <ContentTemplate>

                                <asp:Panel ID="pnlUsuarios" runat="server" Visible="true">

                                    <div style="width: 100%; display: table; height: 30px; padding: 14px 0 0 0">
                                        <div style="width: 30%; display: table-cell; vertical-align: top;">
                                            <div style="left: 0.5; display: table; width: 100%; margin-top: 2px;">

                                                <%-- Grupo Não Selecionados --%>
                                                <div style="width: 45%; height: 100%; display: table-cell;">
                                                    <fieldset style="height: 100%; width: auto;">
                                                        <legend>
                                                            <asp:Literal ID="Literal1" runat="server" Text="Usuários não selecionados" />
                                                        </legend>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtUsuarioIdNaoSelecionado" runat="server" MaxLength="50" SkinID="txtBootstrap2" placeholder="Usuário Id" />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:TextBox ID="txtUsuarioNaoSelecionado" runat="server" SkinID="txtBootstrap2" placeholder="Nome Usuário" />
                                                        </div>


                                                        <div class="col-md-3">
                                                            <asp:LinkButton ID="btnPesquisaUsuarioNaoSelecionado" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btnPesquisaUsuarioNaoSelecionado_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                            <asp:LinkButton ID="btnLimparUsuarioNaoSelecionado" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btnLimparUsuarioNaoSelecionado_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                        </div>
                                                        <asp:GridView DataKeyNames="usuarioId,nomeUsuario"
                                                            runat="server"
                                                            Width="100%"
                                                            HorizontalAlign="Center"
                                                            ID="gdvGrupoNaoSelecionado"
                                                            AutoGenerateColumns="False"
                                                            AllowPaging="True"
                                                            OnPageIndexChanging="gdvGrupoNaoSelecionado_PageIndexChanging"
                                                            OnRowDataBound="gdvGrupoNaoSelecionado_RowDataBound"
                                                            SkinID="GridViewTable"
                                                            EmptyDataText="Não foi encontrado nenhum resultado!">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:CheckBox ID="chkAllGrupoNaoSel" AutoPostBack="true" OnCheckedChanged="chkAllGrupoNaoSel_CheckedChanged" runat="server" />
                                                                    </HeaderTemplate>
                                                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblusuarioId" runat="server" Text='<%# Eval("usuarioId") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblusuarioNome" runat="server" Text='<%# Eval("nomeUsuario") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </fieldset>
                                                </div>

                                                <div style="width: 4%; display: table-cell;">
                                                    <asp:Button ID="btnAdicionar" runat="server" SkinID="BtnSuccess" Text=">" OnClick="btnAdcionarGrupo_Click" />
                                                    <asp:Button ID="btnRemover" runat="server" SkinID="BtnDanger" Text="<" OnClick="btnRemoverGrupo_Click" />
                                                </div>

                                                <%--Grupos Selecionados --%>
                                                <div style="width: 45%; height: 100%; display: table-cell;">

                                                    <fieldset style="height: 100%; width: auto;">
                                                        <legend>
                                                            <asp:Literal ID="Literal2" runat="server" Text="Usuários selecionados" />
                                                        </legend>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtUsuarioIdSelecionado" runat="server" MaxLength="50" SkinID="txtBootstrap2" placeholder="Usuário Id" />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:TextBox ID="txtUsuarioNome" runat="server" MaxLength="50" SkinID="txtBootstrap2" placeholder="Nome Usuário" />
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:LinkButton ID="btnPesquisaUsuarioSelecionado" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btnPesquisaUsuarioSelecionado_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                            <asp:LinkButton ID="btnLimparUsuarioSelecionado" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btnLimparUsuarioSelecionado_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                        </div>
                                                        <asp:GridView DataKeyNames="usuarioId,nomeUsuario"
                                                            runat="server"
                                                            CssClass="table table-bordered table-striped table-hover"
                                                            Width="100%"
                                                            HorizontalAlign="Center"
                                                            ID="gdvGruposSelecionados"
                                                            AutoGenerateColumns="False"
                                                            AllowPaging="True"
                                                            OnPageIndexChanging="gdvGruposSelecionados_PageIndexChanging"
                                                            OnRowDataBound="gdvGruposSelecionados_RowDataBound"
                                                            SkinID="GridViewTable"
                                                            EmptyDataText="Não foi encontrado nenhum resultado!">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:CheckBox ID="chkAllGrupoSel" AutoPostBack="true" OnCheckedChanged="chkAllGrupoSel_CheckedChanged" runat="server" />
                                                                    </HeaderTemplate>
                                                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblusuarioId" runat="server" Text='<%# Eval("usuarioId") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblusuarioNome" runat="server" Text='<%# Eval("nomeUsuario") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </fieldset>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                    </div>
                </asp:Panel>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        <asp:UpdatePanel ID="uppFiltros" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="imbFiltros" EventName="Click" />
                            </Triggers>
                            <ContentTemplate>
                                <div style="display: table; text-align: center; width: 99%;">
                                    <div style="width: 100%; margin-top: 10px;">
                                        <div style="width: 100%; background-color: #13213C; text-align: left;">
                                            <table style="width: auto;">
                                                <tr>
                                                    <td valign="middle">
                                                        <asp:ImageButton ID="imbFiltros" runat="server" Height="15px" Width="15px" ImageAlign="AbsMiddle"
                                                            ImageUrl="~/Imagens/Colapse.png"
                                                            ToolTip="<%$ Resources:Resource, lblContrair %>"
                                                            OnClick="imbFiltros_Click" />
                                                    </td>
                                                    <td valign="middle">
                                                        <asp:Label ID="lblFiltrosHeader" runat="server" SkinID="lblLastShowHide" Text="<%$ Resources:Resource, lblFiltros %>" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <asp:Panel ID="pnlFiltros" runat="server" SkinID="PnlMenu">
                                            <div style="display: table; text-align: center; width: 99%;">
                                                <div style="display: table; width: 100%;">

                                                    <div class="navegacao">
                                                        <div class="boxPesquisa">
                                                            <asp:Label ID="lblFiltroGrupoId" Text="Código Grupo" runat="server" />
                                                            <asp:TextBox ID="txtFiltroGrupoId" onkeypress="return isNumberKey(event)" runat="server" SkinID="SmallFilter" TabIndex="3" />
                                                        </div>
                                                        <div class="boxPesquisa">
                                                            <asp:Label ID="lblFiltroGrupoDesc" Text="Descrição" runat="server" />
                                                            <asp:TextBox ID="txtFiltroGrupoDesc" runat="server" TabIndex="4" />
                                                        </div>
                                                        <div class="boxPesquisa">
                                                            <asp:Label ID="lblFiltroGrupoNome" Text="Nome" runat="server" />
                                                            <asp:TextBox ID="txtFiltroGrupoNome" runat="server" TabIndex="4" />
                                                        </div>
                                                        <div class="boxPesquisa">
                                                            <div class="line">
                                                                <asp:Button ID="btnFiltrosPesquisa" Text="Pesquisar" runat="server" SkinID="ButtonLeftFind"
                                                                    TabIndex="13" OnClick="btnFiltrosPesquisa_Click" />
                                                                <asp:Button ID="btnFiltrosLimpar" Text="Limpar" runat="server" SkinID="ButtonCenterClean"
                                                                    TabIndex="14" OnClick="btnFiltrosLimpar_Click" />
                                                                <asp:Button ID="btnFiltrosNovoCadastro" Text="Novo" runat="server" SkinID="ButtonRightCancel"
                                                                    TabIndex="15" OnClick="btnFiltrosNovoCadastro_Click" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"
                                DataKeyNames="usuarioGrupoId,nome,descricao"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                SkinID="GridViewTable"
                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                <Columns>
                                    <asp:BoundField DataField="usuarioGrupoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="nome" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="descricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Visualizar" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/find.png" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbExcluir" runat="server" CommandName="Excluir" SkinID="usuarioGrupoId"
                                                ToolTip="<%$ Resources:Resource, lblNaoOk %>" CommandArgument='<%# Eval("usuarioGrupoId") + "|" + Eval("descricao") %>'
                                                ImageUrl="~/Imagens/Fechar.png" />
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
