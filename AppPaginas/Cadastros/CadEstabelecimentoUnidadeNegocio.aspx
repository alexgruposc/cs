<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"
    CodeBehind="CadEstabelecimentoUnidadeNegocio.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEstabelecimentoUnidadeNegocio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlEstabelecimentoUnidadeNegocio" runat="server">
        <asp:UpdatePanel ID="uppEstabelecimentoUnidadeNegocio" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppEstabelecimentoUnidadeNegocio">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                    <div style="left: 0.5%; width: 99%; height: 100%; position: fixed; ">        
                        <fieldset style="left: 0.5%; height: 70%; width: 97.8%;  position: relative;">
                            <legend>
                                <asp:Literal ID="ltrEstabelecimentoUnidade" runat="server" />
                            </legend>

                            <div style="left: 0.5%; top: 0%; width: 99%; height: 85%; display: table; position: relative;">
                                <div style="width: 50%; height: 100%; display: table-cell; text-align: left; vertical-align: middle; ">
                                    <fieldset>
                                        <legend>
                                            <asp:Literal ID="ltrEstabelecimentos" runat="server" />
                                        </legend>

                                        <div style="display: table; width: 100%; height: 95%; ">
                                            <div style="display: table-cell; width: 60%; height: 100%; ">
                                                <asp:ListBox ID="lbxEstabelecimentos" runat="server" SelectionMode="Multiple" />
                                            </div>
                                            <div style="display: table-cell; vertical-align: middle; text-align: left; width: 40%; height: 100%;">
                                                <asp:ImageButton ID="imbSelect" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px" 
                                                                 ToolTip="<%$ Resources:Resource, lblAdicionar %>"
                                                                 ImageUrl="~/Imagens/addSelected.png" 
                                                                 onclick="imbSelect_Click" />
                                                <br />
                                                <asp:ImageButton ID="imbSelectAll" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px" 
                                                                 ToolTip="<%$ Resources:Resource, lblAdicionarTodos %>"
                                                                 ImageUrl="~/Imagens/addAll.png" 
                                                                 onclick="imbSelectAll_Click" />
                                            </div>
                                        </div>

                                    </fieldset>
                                </div>
                                <div style="width: 50%; height: 100%; display: table-cell; ">
                                    <fieldset>

                                        <legend>
                                            <asp:Literal ID="ltrUnidadeEstabelecimentos" runat="server" />
                                        </legend>

                                        <div style="display: table; width: 100%; height: 95%; ">
                                            <div style="display: table; width: 100%; height: 100%; ">
                                                <div style="display: table; width: 100%; height: 10%; ">
                                                    <div style="display: table-cell; vertical-align: middle;">
                                                        <ol>
                                                            <li style="text-align: right;">
                                                                <asp:Label ID="lblUnidadeNegocio" runat="server" />
                                                                <asp:DropDownList ID="ddlUnidadeNegocio" runat="server" AutoPostBack="true" onselectedindexchanged="ddlUnidadeNegocio_SelectedIndexChanged" />
                                                            </li>
                                                        </ol>
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; height: 90%; ">
                                                    <div style="display: table-cell; vertical-align: middle; text-align: right; width: 40%; height: 100%;">
                                                        <asp:ImageButton ID="imbRemove" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px" 
                                                                         ToolTip="<%$ Resources:Resource, lblRemover %>"
                                                                         ImageUrl="~/Imagens/removeSelected.png" 
                                                                         onclick="imbRemove_Click" />
                                                        <br />
                                                        <asp:ImageButton ID="imbRemoveAll" runat="server" ImageAlign="AbsMiddle" Height="50px" Width="50px" 
                                                                         ToolTip="<%$ Resources:Resource, lblRemoverTodos %>"
                                                                         ImageUrl="~/Imagens/remove.png" 
                                                                         onclick="imbRemoveAll_Click" />
                                                    </div>
                                                    <div style="display: table-cell; width: 60%; height: 100%; ">
                                                        <asp:ListBox ID="lbxEstabelecimentosVinculados" runat="server" SelectionMode="Multiple" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </fieldset>
                                </div>
                            </div>
                            
                            <div style="left: 0.5%; top: 0%; width: 99%; height: 10%; display: table; position: relative;">
                                <div style="display: table-cell; vertical-align: middle; text-align: center;">
                                    <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeft" onclick="btnSalvar_Click" />
                                    <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonRight" onclick="btnLimpar_Click" />
                                </div>
                            </div>

                        </fieldset>
                    </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>
