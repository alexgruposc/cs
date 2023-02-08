<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" ClientIDMode="AutoID"
    MaintainScrollPositionOnPostback="true" CodeBehind="CadConvenio.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadConvenio" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlDados" runat="server" Visible="true">
        <fieldset>
            <legend>
                <asp:Literal ID="ltrDadosHeader" runat="server" />
            </legend>
            <%-- FORMULÁRIO --%>
            <br />
            <br />
            <div class="alert_bottom_button">
                <ol>
                    <li>
                        <asp:Label ID="lblCodigo" Text="Código Convênio" Enabled="false" Visible="False" runat="server" SkinID="LabelForm" />
                        <asp:TextBox ID="txtCodigo" Enabled="false"  runat="server" Visible="False" MaxLength="30" TabIndex="5" ReadOnly="True" />
                    </li>
                    <li>
                        <asp:Label ID="lblDescricaoConvenio" runat="server" SkinID="LabelForm" />
                        <asp:TextBox ID="txtNomeConvenio" Enabled="true" runat="server" MaxLength="30" TabIndex="5" />
                    </li>
                </ol>
                <br />
                <div class="line">
                    <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeft" ValidationGroup="Validacao" TabIndex="10" OnClick="btnSalvar_Click" />
                    <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonRight" OnClick="btnVoltar_Click" TabIndex="15" Visible="True" />
                    <asp:Button ID="btnAlterar" runat="server" SkinID="ButtonRight" OnClick="btnAlterar_Click" TabIndex="16" Visible="false" />
                </div>
            </div>
        </fieldset>
        <br />
        <br />
        <fieldset>
            <legend>
                <asp:Literal ID="ltrGrid" Text="Convênios" runat="server" />
            </legend>
            <div class="gridRegistros">
                <asp:GridView ID="gvRegistros" runat="server" TabIndex="20"
                              DataKeyNames="codigoConvenio,nomeConvenio"
                              OnPageIndexChanging="gvRegistros_PageIndexChanging"
                              OnRowCommand="gvRegistros_RowCommand"
                              OnRowDataBound="gvRegistros_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="codigoConvenio" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                        <asp:BoundField DataField="nomeConvenio" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Alterar" SkinID="ImgGrid"
                                                 ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                 ImageUrl="~/Imagens/find.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                            <ItemTemplate>
                                <asp:ImageButton ID="imbCancelar" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                                 ToolTip="<%$ Resources:Resource, lblExcluir %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                 ImageUrl="~/Imagens/Fechar.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>         
                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </fieldset>
    </asp:Panel>
    
</asp:Content>
