<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadMenuItem.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadMenuItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlMenuItem" runat="server">
        <asp:UpdatePanel ID="uppMenuItem" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbMenuFileSelected" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbMenuItemSelected" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppMenuItem">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <div style="left: 0.5%; width: 99%; height: 100%; position: relative;">
                    <fieldset style="left: 0.5%; height: 70%; width: 97.8%; position: relative;">
                        <legend>
                            <asp:Literal ID="ltrMenuItemHeader" runat="server" Text="<%$ Resources:Resource, lblMenuAddItem %>" />
                        </legend>

                        <div style="left: 0.5%; top: 0%; width: 99%; height: 85%; display: table; position: relative;">
                            <div style="width: 25%; display: table-cell; text-align: left; vertical-align: top;">
                                <asp:TreeView ID="tvAppPages" runat="server" 
                                                RootNodeStyle-ImageUrl="~/Imagens/folder_open.png"
                                                ShowCheckBoxes="None"
                                                SelectedNodeStyle-BackColor="Blue"
                                                SelectedNodeStyle-ForeColor="White"
                                                SelectedNodeStyle-Width="100%" />
                            </div>
                            <div style="width: 5%; display: table-cell; text-align: left; vertical-align: top;">
                                <div style="width: 100%; height: 100%; display: table-cell; text-align: center; vertical-align: middle;">
                                    <fieldset>
                                        <div style="display: table; width: 100%; height: 100%;">
                                            <asp:ImageButton ID="imbMenuFileSelected" runat="server" 
                                                             Height="50px" 
                                                             Width="50px" 
                                                             ToolTip="<%$ Resources:Resource, lblSelecionadosAdicionaTodos %>"
                                                             ImageUrl="~/Imagens/addAll.png" 
                                                             OnClick="imbMenuFileSelected_Click"  />
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div style="width: 40%; height: 100%; display: table-cell; vertical-align: top;">
                                <fieldset>
                                    <legend>
                                        <asp:Literal ID="ltrMenuNodeHeader" runat="server" Text="<%$ Resources:Resource, lblDadosNo %>" />
                                    </legend>    

                                    <div style="display: table; width: 100%;">
                                        <div style="display: table; width: 100%; height: 10px;"></div>
                                        <div style="display: table; width: 100%;">
                                            <div style="display: table-cell; width: 20%; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblMenuPagesHeader" runat="server" Text="<%$ Resources:Resource, lblURL %>" />
                                            </div>
                                            <div style="display: table-cell; width: 80%; text-align: right; vertical-align: middle;"></div>
                                        </div>
                                        <div style="display: table; width: 100%; height: 10px;"></div>
                                        <div style="display: table; width: 100%; text-align: center; height: 10px;">
                                            <asp:Label ID="lblMenuUrlDsc" runat="server" SkinID="lblResposta" />
                                            <%--<asp:ListBox ID="lbxMenuPages" runat="server" 
                                                         Height="250px" 
                                                         SelectionMode="Multiple"
                                                         Visible="false" />--%>
                                        </div>
                                        <div style="display: table; width: 100%; height: 10px;"></div>
                                        <div style="display: none; width: 100%;">
                                            <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: right;">
                                                <asp:ImageButton ID="imbMenuRemove" runat="server" 
                                                                 ImageAlign="AbsMiddle" 
                                                                 ImageUrl="~/Imagens/removeSelected.png" 
                                                                 Height="35px" 
                                                                 Width="35px" 
                                                                 ToolTip="<%$ Resources:Resource, lblSelecionadosRemoveTodos %>"
                                                                 OnClick="imbMenuRemove_Click" />
                                            </div>
                                            <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: left;">
                                                <asp:ImageButton ID="imbMenuRemoveAll" runat="server" 
                                                                 ImageUrl="~/Imagens/remove.png" 
                                                                 Height="50px" 
                                                                 Width="50px" 
                                                                 ToolTip="<%$ Resources:Resource, lblRemoverTodos %>"
                                                                 OnClick="imbMenuRemoveAll_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display: table; width: 100%; margin-bottom: 3px;">
                                        <div style="display: table-cell; width: 20%; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblMenuId" runat="server" />
                                        </div>
                                        <div style="display: table-cell; width: 80%; text-align: center; vertical-align: middle;">
                                            <asp:DropDownList ID="ddlMenuId" runat="server" Width="91%" />
                                        </div>
                                    </div>
                                    <div style="display: table; width: 100%;">
                                        <div style="display: table-cell; width: 20%; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblMenuNoSuperior" runat="server" />
                                        </div>
                                        <div style="display: table-cell; width: 80%; text-align: center; vertical-align: middle;">
                                            <asp:TextBox ID="txtMenuNoSuperior" runat="server" Width="90%" MaxLength="30" SkinID="txtNormal" />
                                        </div>
                                    </div>
                                    <div style="display: table; width: 100%;">
                                        <div style="display: table-cell; width: 20%; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblMenuCodigo" runat="server" />
                                        </div>
                                        <div style="display: table-cell; width: 80%; text-align: center; vertical-align: middle;">
                                            <asp:TextBox ID="txtMenuCodigo" runat="server" Width="90%" MaxLength="30" />
                                        </div>
                                    </div>
                                    <%--<div style="display: table; width: 100%;">
                                        <div style="display: table-cell; width: 20%; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblMenuUrl" runat="server" Text="Url:" />
                                        </div>
                                        <div style="display: table-cell; width: 80%; text-align: center; vertical-align: middle;">
                                            <asp:Label ID="lblMenuUrlDsc" runat="server" SkinID="LabelResposta" />
                                        </div>
                                    </div>--%>
                                    <div style="display: table; width: 100%;">
                                        <div style="display: table-cell; width: 20%; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblMenuDescricao" runat="server" />
                                        </div>
                                        <div style="display: table-cell; width: 80%; text-align: center; vertical-align: middle;">
                                            <asp:TextBox ID="txtMenuDescricao" runat="server" Width="90%" MaxLength="50" SkinID="txtNormal" />
                                        </div>
                                    </div>
                                    <div style="display: table; width: 100%; height: 15px;">
                                    </div>
                                    <div style="display: table; width: 100%;">
                                        <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: right;">
                                            <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeftSave" OnClick="btnSalvar_Click" />
                                        </div>
                                        <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: left;">
                                            <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonRightClean" OnClick="btnLimpar_Click" />
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div style="width: 5%; display: table-cell; text-align: left; vertical-align: top;">
                                <div style="width: 100%; display: table-cell; text-align: center; vertical-align: middle;">
                                    <fieldset>
                                        <div style="display: table; width: 100%; height: 100%;">
                                            <asp:ImageButton ID="imbMenuItemSelected" runat="server" 
                                                             Height="50px" 
                                                             Width="50px" 
                                                             ImageUrl="~/Imagens/remove.png" 
                                                             ToolTip="<%$ Resources:Resource, lblSelecionadosRemoveTodos %>"
                                                             OnClick="imbMenuItemSelected_Click"  />
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div style="width: 25%; display: table-cell; text-align: left; vertical-align: top;">
                                <asp:TreeView ID="tvMenu" runat="server"
                                              ShowCheckBoxes="Leaf" />
                            </div>
                        </div>                        
                    </fieldset>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>
