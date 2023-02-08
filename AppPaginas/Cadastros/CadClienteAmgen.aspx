<%@ Page Title="Clientes Amgen" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadClienteAmgen.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadClienteAmgen" %>

<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table.table-striped td {
            text-align: center;
        }

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

    <asp:UpdatePanel ID="Upp_Geral" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="imbExportarExcel" />
        </Triggers>
    </asp:UpdatePanel>

    <fieldset class="pad-5 mt-2">

        <legend>Clientes Amgen
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
                <asp:UpdatePanel runat="server" ID="Upp_GvEsq">
                    <ContentTemplate>
                        <fieldset>
                            <legend>Selecione os Clientes para incluir no grupo Amgen</legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    Cliente:<br />
                                    <asp:TextBox ID="txt_SelCliente" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do cliente" />
                                    <ucc:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                                        CompletionListCssClass="autocomplete_list1"
                                        CompletionListItemCssClass="autocomplete_listitem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                        CompletionInterval="100"
                                        EnableCaching="false"
                                        MinimumPrefixLength="3"
                                        UseContextKey="true"
                                        TargetControlID="txt_SelCliente"
                                        ServiceMethod="GetClienteElegivelAmgen"
                                        ServicePath="~/AppWs/WsGetCliente.asmx" />
                                </div>
                                <div class="col-md-4">
                                    <asp:LinkButton ID="btn_SelCliente" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelCliente_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btn_LimpaSelCliente" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelCliente_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                </div>
                            </div>
                            <div class="pad-10 mt-2">
                                <asp:GridView DataKeyNames="clienteId, clienteCNPJ"
                                    runat="server"
                                    ID="gvSelCliente"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelCliente_PageIndexChanging"
                                    OnRowDataBound="gvSelCliente_RowDataBound"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkTodosSelCliente" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelCliente_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelCliente" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" />
                                        <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Nome" />
                                        <asp:BoundField DataField="clienteCNPJ" HeaderText="CNPJ" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvSelClientePageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>

                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>

            <!-- ====================================================================================== -->
            <!-- COLUNA DIREITA -->
            <div class="col-md-6">
                <asp:UpdatePanel runat="server" ID="Upp_GvDir">
                    <ContentTemplate>
                        <fieldset>
                            <legend>
                                Selecione os Clientes do grupo Amgen
                            </legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    Cliente:<br />
                                    <asp:TextBox ID="txt_SelClienteAmgen" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do cliente" />
                                    <ucc:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                                        CompletionListCssClass="autocomplete_list1"
                                        CompletionListItemCssClass="autocomplete_listitem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                        CompletionInterval="100"
                                        EnableCaching="false"
                                        MinimumPrefixLength="3"
                                        UseContextKey="true"
                                        TargetControlID="txt_SelClienteAmgen"
                                        ServiceMethod="GetClienteAmgen"
                                        ServicePath="~/AppWs/WsGetCliente.asmx" />
                                </div>
                                <div class="col-md-2 text-right">
                                    <asp:LinkButton ID="btn_SelClienteAmgen" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelClienteAmgen_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btn_LimpaSelClienteAmgen" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelClienteAmgen_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                </div>
                                <div class="col-md-2 text-right">
                                    <asp:ImageButton ID="imbExportarExcel" ImageUrl="../../Imagens/xlsx.png" runat="server" OnClick="imbExportarExcel_Click" ToolTip="Exportar para Excel" Style="width: auto; height: 38px" />
                                </div>
                            </div>
                            <div class="pad-10 mt-2">
                                <asp:GridView DataKeyNames="clienteId"
                                    runat="server"
                                    ID="gvSelClienteAmgen"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelClienteAmgen_PageIndexChanging"
                                    OnRowDataBound="gvSelClienteAmgen_RowDataBound"
                                    OnRowCommand="gvSelClienteAmgen_RowCommand"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkTodosSelClienteAmgen" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelClienteAmgen_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelClienteAmgen" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" />
                                        <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Nome" />
                                        <asp:BoundField DataField="clienteCNPJ" HeaderText="CNPJ" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvSelClienteAmgenPageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>
                        </fieldset>

                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>

        </div>


    </fieldset>

</asp:Content>
