<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadModalidadeLicitacao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadModalidadeLicitacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- CONTROLES --%>
    <%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>
    <%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
    <%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
    <%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <asp:Panel ID="pnlDados" runat="server" Width="100%" Height="100%" Visible="false">
                    <div style="width: 100%; height: 53px; display: table;">

                        <fieldset>
                            <legend>Nova Modalidade</legend>
                            <div style="display: table; width: 100%; height: 43px">

                                <div class="boxPesquisa" style="margin: 0 0 0 0">
                                    <asp:Label ID="lblCadmodalidadeLicitacaoDescricao" Text="Descricão: " runat="server" />
                                    <asp:TextBox ID="txtCadmodalidadeLicitacaoDescricao" runat="server" Width="500px" MaxLength="50" />
                                </div>
                                <div style="text-align: right; display: table-cell; width: 100%; vertical-align: middle;">
                                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" SkinID="ButtonLeftSave" TabIndex="1" ValidationGroup="Validacao" OnClick="btnSalvar_Click" OnClientClick="this.disabled=true; __doPostBack(this.name, '');" />
                                    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="ButtonCenterClean" TabIndex="6" OnClick="btnLimpar_Click" />
                                    <asp:Button ID="btnVoltar" runat="server" Text="Voltar" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnVoltar_Click" />

                                </div>
                            </div>
                        </fieldset>
                        <%-- FORMULÁRIO --%>
                </asp:Panel>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa" Width="100%" Height="100%">
                    <fieldset>
                        <legend>Cadastro de Modalidade
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
                                                            <asp:Label ID="lblmodalidadeLicitacaoId" Text="Codigo Modalidade" runat="server" />
                                                            <asp:TextBox ID="txtmodalidadeLicitacaoId" onkeypress="return isNumberKey(event)" runat="server" SkinID="SmallFilter" TabIndex="3" />
                                                        </div>
                                                        <div class="boxPesquisa">
                                                            <asp:Label ID="lblmodalidadeLicitacaoDescricao" Text="Descricao" runat="server" />
                                                            <asp:TextBox ID="txtmodalidadeLicitacaoDescricao" runat="server" TabIndex="4" />
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
                                DataKeyNames="modalidadeLicitacaoId, modalidadeLicitacaoDescricao"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                <Columns>
                                    <asp:BoundField DataField="modalidadeLicitacaoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="modalidadeLicitacaoDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Visualizar" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/find.png" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbExcluir" runat="server" CommandName="Excluir" SkinID="modalidadeLicitacaoId"
                                                ToolTip="<%$ Resources:Resource, lblNaoOk %>" CommandArgument='<%#   Eval("modalidadeLicitacaoId") + "|" + Eval("modalidadeLicitacaoDescricao") %>'
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
