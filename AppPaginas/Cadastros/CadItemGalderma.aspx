<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadItemGalderma.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadItemGalderma" %>

<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .GridPager a
        {
            margin: 3px;
            color: #ffffff;
        }

            .GridPager a:hover, .GridPager a:active
            {
                color: #00ffff;
            }

            .GridPager a:visited
            {
                color: #e4e4e4;
            }

        .GridPager td, .GridPager span
        {
            margin: 3px;
            color: #00ffff;
        }
    </style>

    <link href="../../Styles/font-awesome/css/font-awesome.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

    <fieldset class="pad-5 mt-2">
        <legend>
            <asp:Literal ID="Literal1" runat="server" Text="Itens Galderma" />
        </legend>

        <div>
            <fieldset class="center pad-5">
                <asp:Button ID="btnAdicionar" runat="server" SkinID="BtnPrimary" Text="Adicionar" OnClick="btnAdicionar_Click" />
                <asp:Button ID="btnRemover" runat="server" SkinID="BtnWarning" Text="Remover" OnClick="btnRemover_Click" />
            </fieldset>
        </div>

        <div class="row mt-2">
            <!-- COLUNA ESQUERDA -->
            <div class="col-md-6">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <fieldset>
                            <legend>
                                <asp:Literal ID="Literal2" runat="server" Text="Selecione os Itens para incluir no grupo Galderma" />
                            </legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    Item:<br />
                                    <asp:TextBox ID="txt_SelItem" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do Item" />
                                    <ucc:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                                        CompletionListCssClass="autocomplete_list1"
                                        CompletionListItemCssClass="autocomplete_listitem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                        CompletionInterval="100"
                                        EnableCaching="false"
                                        MinimumPrefixLength="3"
                                        UseContextKey="true"
                                        TargetControlID="txt_SelItem"
                                        ServiceMethod="GetItens"
                                        ServicePath="~/AppWs/WsGetItens.asmx" />
                                </div>
                                <div class="col-md-4">
                                    <asp:LinkButton ID="btn_SelItem" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelItem_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btn_LimpaSelItem" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelItem_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                </div>
                            </div>
                            <div class="pad-10 mt-2">

                                <asp:GridView DataKeyNames="itemId"
                                    runat="server"
                                    ID="gvSelItem"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelItem_PageIndexChanging"
                                    OnRowDataBound="gvSelItem_RowDataBound"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkTodosSelItem" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelItem_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelItem" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="itemId" HeaderText="Código" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Produto" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvSelItemPageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <!-- ====================================================================================== -->
            <!-- COLUNA DIREITA -->
            <div class="col-md-6">
                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                    <ContentTemplate>
                        <fieldset>
                            <legend>
                                <asp:Literal ID="Literal3" runat="server" Text="Selecione os Itens do grupo Galderma" />
                            </legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    Item:<br />
                                    <asp:TextBox ID="txt_SelItemGalderma" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do Item" />
                                    <ucc:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                                        CompletionListCssClass="autocomplete_list1"
                                        CompletionListItemCssClass="autocomplete_listitem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                        CompletionInterval="100"
                                        EnableCaching="false"
                                        MinimumPrefixLength="3"
                                        UseContextKey="true"
                                        TargetControlID="txt_SelItemGalderma"
                                        ServiceMethod="GetItensGalderma"
                                        ServicePath="~/AppWs/WsGetItens.asmx" />
                                </div>
                                <div class="col-md-4">
                                    <asp:LinkButton ID="btn_SelItemGalderma" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelItemGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btn_LimpaSelItemGalderma" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelItemGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                </div>
                            </div>
                            <div class="pad-10 mt-2">

                                <asp:GridView DataKeyNames="itemId"
                                    runat="server"
                                    ID="gvSelItemGalderma"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelItemGalderma_PageIndexChanging"
                                    OnRowDataBound="gvSelItemGalderma_RowDataBound"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkTodosSelItemGalderma" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelItemGalderma_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelItemGalderma" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="itemId" HeaderText="Código" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Produto" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvSelItemGaldermaPageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

    </fieldset>

</asp:Content>
