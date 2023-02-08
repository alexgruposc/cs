<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadEstabelecimentoReposicao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEstabelecimentoReposicao" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroEstabelecimento" runat="server">
        <asp:UpdatePanel ID="uppCadastroEstabelecimento" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroEstabelecimento">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <div style="width: 100%; display: table;">
                        <fieldset style="margin-bottom: 100px;">
                            <legend>
                                <asp:Literal ID="ltrDadosHeader" runat="server" />
                            </legend>
                            <%-- FORMULÁRIO --%>
                            <div style="width: 100%; display: table;">
                                <div style="width: 30%; display: table-cell; vertical-align: top;">
                                    <asp:Panel ID="pnlDadosEsquerda" runat="server">
                                        <ol>

                                            <li>

                                                <%--<div class="line">--%>
                                                <asp:Label Text="Solicitante" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddEstabelecimentoIdSolicitante" runat="server" TabIndex="10"
                                                    AutoPostBack="true"
                                                    SkinID="DropFiltro"
                                                   />
                                                <%--</div>
                                                
                                                    <div class="line">--%>
                                                <asp:Label Text="Repositor" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddlEstabelecimentoIdRepositor" runat="server" TabIndex="11"
                                                    AutoPostBack="true"
                                                    SkinID="DropFiltro" />

                                                <%-- </div>--%>
                                            </li>
                                        </ol>
                                    </asp:Panel>
                                </div>

                            </div>
                            <div style="width: 100%; display: table; text-align: center;">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="29" SkinID="ButtonLeftSave" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="30" SkinID="ButtonCenterVoltar" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="31" SkinID="ButtonRightClean" OnClick="btnLimpar_Click" />
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>

                        <fieldset>
                            <div class="navegacao">
                                <div class="boxPesquisa">
                                    <asp:Label Text="Solicitante:" runat="server" />
                                    <asp:DropDownList ID="ddFiltroEstabelecimentoIdSolicitante" runat="server" TabIndex="10"
                                        AutoPostBack="True" SkinID="DropFiltro" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label Text="Repositor" runat="server" />
                                    <asp:DropDownList ID="ddFiltroEstabelecimentoIdRepositor" SkinID="DropFiltro" runat="server" TabIndex="11" />
                                </div>

                                <div class="boxPesquisa">
                                    <div class="line">
                                        <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind"
                                            TabIndex="13" OnClick="btnFiltrosPesquisa_Click" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean"
                                            TabIndex="14" OnClick="btnFiltrosLimpar_Click" />
                                        <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenterNew"
                                            TabIndex="15" OnClick="btnFiltrosNovoCadastro_Click" />
                                        <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRightCancel"
                                            TabIndex="16" OnClick="btnFiltrosExcluir_Click" />
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <%-- GRID REGISTROS --%>

                        <fieldset>
                            <div class="gridRegistros">
                                <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"
                                    DataKeyNames="ReposicaoId,EstabelecimentoIdSolicitante,estabelecimentoRazaoSocialSolicitante,EstabelecimentoIdRepositor,estabelecimentoRazaoSocialRepositor,usuarioId,DataCadastro"
                                    OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                    OnRowCommand="gvRegistros_RowCommand"
                                    OnRowDataBound="gvRegistros_RowDataBound"
                                    OnRowDeleting="gvRegistros_RowDeleting"
                                    OnRowUpdating="gvRegistros_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chlAll" runat="server" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ReposicaoId" HeaderText="ReposicaoId" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                        <asp:BoundField DataField="EstabelecimentoIdSolicitante" HeaderText="Solicitante ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="estabelecimentoRazaoSocialSolicitante" HeaderText="Solicitante" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="EstabelecimentoIdRepositor" HeaderText="Repositor ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="estabelecimentoRazaoSocialRepositor" HeaderText="Repositor" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="usuarioId" HeaderText="UsuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="DataCadastro" HeaderText="Data Cadastro" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Excluir" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbDelete" runat="server"
                                                    SkinID="ImgGrid"
                                                    CommandName="Delete"
                                                    ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                    ImageUrl="~/Imagens/_trash.png"
                                                    CommandArgument='<%# Eval("ReposicaoId") %>' />

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Alterar" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnAlterar" runat="server"
                                                    SkinID="ImgGrid"
                                                    CommandName="Update"
                                                    ToolTip="<%$ Resources:Resource, lblEditar %>"
                                                    ImageUrl="~/Imagens/find.png"
                                                    CommandArgument='<%# Eval("ReposicaoId") +"|"+  Eval("estabelecimentoRazaoSocialSolicitante") +"|"+ Eval("estabelecimentoRazaoSocialRepositor")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </fieldset>
                    </fieldset>
                </asp:Panel>

                <%-- CONFIRMAR EXCLUSÃO --%>
                <div style="position: absolute;">
                    <asp:Panel ID="pnlConfirmarExclusao" runat="server" Visible="false">
                        <div class="OpacityBackGround">
                        </div>
                        <div class="alert">
                            <div class="alert_header">
                                <div class="alert_header_message">
                                    <asp:Label ID="lblConfirmarExclusaoHeader" runat="server" ForeColor="White" />
                                </div>
                            </div>
                            <div class="alert_body">
                                <asp:Label ID="lblConfirmarExclusaoBody" runat="server" ForeColor="Black" />
                            </div>
                            <div class="alert_bottom">
                                <div class="alert_bottom_button">
                                    <div class="alert_bottom_button_left">
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft"
                                            TabIndex="14" OnClick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight"
                                            TabIndex="15" OnClick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
