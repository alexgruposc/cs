<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadParametroCMed.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadParametroCMed" %>


<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroParametroCMed" runat="server">
        <asp:UpdatePanel ID="uppCadastroParametroCMed" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroParametroCMed">
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
                                <asp:Literal ID="ltrDadosParametroHeader" runat="server" />
                            </legend>
                            <fieldset>
                                <div style="display: table; text-align: center; width: 99%;">
                                    <div style="display: table; width: 100%;">
                                        <div class="boxPesquisa">
                                            <div class="line">
                                                <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeftSave" OnClick="btnSalvar_Click" TabIndex="1" ValidationGroup="Validacao" />
                                                <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnVoltar_Click" />
                                                <asp:Button ID="btnExcluir" runat="server" SkinID="ButtonLeftSave" OnClick="btnExcluir_Click" TabIndex="1" ValidationGroup="Validacao" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <%-- FORMULÁRIO --%>
                            <div style="width: 100%; display: table;">
                                <div style="width: 30%; display: table-cell; vertical-align: top;">
                                    <fieldset>
                                        <div style="width: 100%; display: table;">
                                            <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderParametroId" runat="server" />
                                                <asp:Label ID="lblHeaderParametroIdDescricao" runat="server" ForeColor="Blue" />
                                            </div>
                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <div style="width: 100%; display: table;">
                                            <asp:Panel ID="pnlLinha1" runat="server">
                                                <asp:Panel ID="pnlHeaderCliente" runat="server">
                                                    <fieldset>
                                                        <legend>
                                                            <asp:Literal ID="ltrHeaderParametro" runat="server" />
                                                        </legend>
                                                        <div style="width: 100%; height: 100%; display: table;">
                                                            <div style="display: table-cell; width: 30%;">
                                                                <asp:Label ID="lblDescricao" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtDescricao" runat="server" MaxLength="50" TabIndex="7" />
                                                                <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator5" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="txtDescricao" ErrorMessage="<%$ Resources:Resource, msgDescricao %>" />
                                                            </div>
                                                        </div>
                                                        <div style="width: 100%; height: 100%; display: table;">
                                                            <div style="display: table-cell; width: 30%;">
                                                                <asp:Label ID="lblColuna" runat="server" SkinID="LabelForm" />
                                                                <asp:DropDownList ID="ddlColuna" runat="server" SkinID="DropFiltro">
                                                                    <asp:ListItem Value="A0" Text="<%$ Resources:Resource, lblA0 %>" Selected="True" />
                                                                    <asp:ListItem Value="A12" Text="<%$ Resources:Resource, lblA12 %>" />
                                                                    <asp:ListItem Value="A17" Text="<%$ Resources:Resource, lblA17 %>" />
                                                                    <asp:ListItem Value="A17_5" Text="<%$ Resources:Resource, lblA17_5 %>" />
                                                                    <asp:ListItem Value="A18" Text="<%$ Resources:Resource, lblA18 %>" />
                                                                    <asp:ListItem Value="A20" Text="<%$ Resources:Resource, lblA20 %>" />
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlColuna" ErrorMessage="<%$ Resources:Resource, msgColuna %>" />
                                                            </div>
                                                        </div>
                                                        <div style="width: 100%; height: 100%; display: table;">
                                                            <div style="display: table-cell; width: 30%;">
                                                                <asp:Label ID="lblPrioridade" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtPrioridade" runat="server" MaxLength="2" TabIndex="10" /><asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="ddlColuna" ErrorMessage="<%$ Resources:Resource, msgColuna %>" />
                                                                <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="txtPrioridade" ErrorMessage="<%$ Resources:Resource, msgPrioridade %>" />
                                                            </div>
                                                        </div>
                                                        <div style="width: 100%; height: 100%; display: table;">
                                                            <div style="display: table-cell; width: 30%;">
                                                                <asp:Label ID="lblReferencia" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtReferencia" runat="server" MaxLength="50" TabIndex="11" />
                                                                <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="txtReferencia" ErrorMessage="<%$ Resources:Resource, msgReferencia %>" />
                                                            </div>
                                                        </div>
                                                        <div style="width: 100%; height: 100%; display: table;">
                                                            <div style="display: table-cell; width: 50%;">
                                                                <asp:Label ID="lblFormula" runat="server" SkinID="LabelForm" />
                                                                <asp:TextBox ID="txtFormula" runat="server" MaxLength="350" TextMode="MultiLine" Columns="50" Rows="6" Width="50%" TabIndex="8" />
                                                                <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="txtFormula" ErrorMessage="<%$ Resources:Resource, msgFormula %>" />
                                                            </div>
                                                        </div>
                                                        <div style="width: 100%; height: 100%; display: table; text-align=center">
                                                            <div style="display: table-cell; width: 30%;">
                                                                <asp:Button ID="btnValidaFormula" runat="server" SkinID="ButtonLeftSave" OnClick="btnValidaFormula_Click" TabIndex="1" ValidationGroup="Validacao" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </asp:Panel>
                                            </asp:Panel>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>

                <%-- FILTROS PESQUISA--%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnNovoParametroCMed">
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
                                                        <div class="line">
                                                            <div class="line">
                                                                <asp:Button ID="btnNovoParametroCMed" runat="server" SkinID="ButtonLeftFind" TabIndex="13" OnClick="btnNovoParametroCMed_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="navegacao">
                                                        <div class="boxPesquisa">
                                                            <div class="line">
                                                                <asp:Button ID="btnSalvarPrecoFabrMod" runat="server" SkinID="ButtonLeftFind" TabIndex="13" OnClick="btnSalvarPrecoFabrMod_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                        <div class="navegacao">
                                                        <div class="line">
                                                            <div style="text-align: left; width: 250px;">
                                                                <asp:RadioButtonList ID="rblTipoPreco" runat="server" RepeatDirection="Horizontal" TabIndex="26">
                                                                    <asp:ListItem Selected="True" Value="1"
                                                                        Text="<%$ Resources:Resource, lblPrecoCMed %>" />
                                                                    <asp:ListItem Value="2"
                                                                        Text="<%$ Resources:Resource, lblPFabrica %>" />
                                                                    <asp:ListItem Value="3"
                                                                        Text="<%$ Resources:Resource, lblMisto %>" />
                                                                </asp:RadioButtonList>
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
                                DataKeyNames="Id, Descricao, Formula, Coluna, Prioridade, Referencia, usuarioId, Excluido,
                                              DataCadastro, DataAlteracao, DataExclusao"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                OnRowUpdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:BoundField DataField="Id" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="Descricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="Formula" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="Coluna" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="Prioridade" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="Referencia" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Update" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/find.png" />

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

