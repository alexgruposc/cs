<%@ Page Title="Produtos Merck" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadProdutoMerck.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadProdutoMerck" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .GridPager a {
            margin: 3px;
            color: #ffffff;
        }

            .GridPager a:hover, .GridPager a:active {
                color: #00ffff;
            }

            .GridPager a:visited {
                color: #e4e4e4;
            }

        .GridPager td, .GridPager span {
            margin: 3px;
            color: #00ffff;
        }
    </style>

    <link href="../../Styles/font-awesome/css/font-awesome.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanelGeral" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="imbExportarExcel" />
        </Triggers>
    </asp:UpdatePanel>
    <fieldset class="pad-5 mt-2">
        <legend>
            <asp:Literal ID="Literal1" runat="server" Text="Produtos Merck" />
        </legend>

        <div>
            <fieldset class="center pad-5">
                <asp:Button ID="btnAdicionar" runat="server" SkinID="BtnPrimary" Text="Adicionar" OnClick="btnAdicionar_Click" />
                <asp:Button ID="btnRemover" runat="server" SkinID="BtnWarning" Text="Remover" OnClick="btnRemover_Click" />
            </fieldset>
        </div>

        <div class="row mt-2">

            <!-- ====================================================================================== -->
            <!-- COLUNA ESQUERDA -->
            <div class="col-md-6">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <fieldset>
                            <legend>
                                <asp:Literal ID="Literal2" runat="server" Text="Selecione os Produtos para incluir no grupo Merck" />
                            </legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    Produto:<br />
                                    <asp:TextBox ID="txt_SelProduto" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do Produto" />
                                    <ucc:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                                        CompletionListCssClass="autocomplete_list1"
                                        CompletionListItemCssClass="autocomplete_listitem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                        CompletionInterval="100"
                                        EnableCaching="false"
                                        MinimumPrefixLength="3"
                                        UseContextKey="true"
                                        TargetControlID="txt_SelProduto"
                                        ServiceMethod="GetItens"
                                        ServicePath="~/AppWs/WsGetItens.asmx" />
                                </div>
                                <div class="col-md-4">
                                    <asp:LinkButton ID="btn_SelProduto" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelProduto_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btn_LimpaSelProduto" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelProduto_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                </div>
                            </div>
                            <div class="pad-10 mt-2">
                                <asp:Localize ID="lblMsgSelProduto" runat="server" />
                                <asp:GridView DataKeyNames="itemId, itemInfComplementar"
                                    runat="server"
                                    ID="gvSelProduto"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelProduto_PageIndexChanging"
                                    OnRowDataBound="gvSelProduto_RowDataBound"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkTodosSelProduto" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelProduto_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelProduto" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="itemId" HeaderText="Código" />
                                        <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Produto" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvSelProdutoPageInfo" runat="server"></asp:Localize>
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
                                <asp:Literal ID="Literal3" runat="server" Text="Selecione os Produtos do grupo Merck" />
                            </legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    Item:<br />
                                    <asp:TextBox ID="txt_SelProdutoMerck" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do Item" />
                                    <ucc:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                                        CompletionListCssClass="autocomplete_list1"
                                        CompletionListItemCssClass="autocomplete_listitem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                        CompletionInterval="100"
                                        EnableCaching="false"
                                        MinimumPrefixLength="3"
                                        UseContextKey="true"
                                        TargetControlID="txt_SelProdutoMerck"
                                        ServiceMethod="GetItensMerck"
                                        ServicePath="~/AppWs/WsGetItens.asmx" />
                                </div>
                                <div class="col-md-2 text-right">
                                    <asp:LinkButton ID="btn_SelProdutoMerck" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelProdutoMerck_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btn_LimpaSelProdutoMerck" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelProdutoMerck_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                </div>
                                <div class="col-md-2 text-right">
                                    <asp:ImageButton ID="imbExportarExcel" ImageUrl="../../Imagens/xlsx.png" runat="server" OnClick="imbExportarExcel_Click" ToolTip="Exportar para Excel" Style="width: auto; height: 38px" />
                                </div>
                            </div>                            
                            <div class="pad-10 mt-2">
                                <asp:Localize ID="lblMsgSelProdutoMerck" runat="server" />
                                <asp:GridView DataKeyNames="itemId"
                                    runat="server"
                                    ID="gvSelProdutoMerck"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelProdutoMerck_PageIndexChanging"
                                    OnRowDataBound="gvSelProdutoMerck_RowDataBound"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkTodosSelProdutoMerck" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelProdutoMerck_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelProdutoMerck" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="itemId" HeaderText="Código" />
                                        <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Produto" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvSelProdutoMerckPageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

    </fieldset>


</asp:Content>

