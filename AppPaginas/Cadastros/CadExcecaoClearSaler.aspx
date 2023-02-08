<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadExcecaoClearSaler.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadExcecaoClearSaler" %>



<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link href="../../Styles/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <asp:UpdatePanel ID="updCadBloqueioLaboratorio" runat="server">

        <ContentTemplate>
            <%-- PROGRESS --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updCadBloqueioLaboratorio">
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <fieldset>
                <legend>
                    <asp:Literal ID="Literal3" runat="server" Text="Exceção ClearSale" />
                </legend>



                <asp:UpdatePanel ID="updPnls" runat="server" UpdateMode="Conditional">
                    <Triggers></Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="dvInclusao" runat="server">

                            <fieldset>
                                <div style="margin: 0 0 0 44.2%">
                                    <asp:Button ID="btnAdcionar" runat="server" SkinID="BtnPrimary" Text="Adicionar" OnClick="btnAdcionar_Click" />
                                    <asp:Button ID="btnRemover" runat="server" SkinID="BtnWarning" Text="Remover" OnClick="btnRemover_Click" />
                                </div>
                            </fieldset>
                            <fieldset>
                                <div style="width: 100%; display: table; height: 30px; padding: 14px 0 0 0">
                                    <div style="width: 30%; display: table-cell; vertical-align: top;">
                                        <div style="left: 0.5px; display: table; width: 100%; margin-top: 2px;">
                                            <div style="width: 45%; height: 100%; display: table-cell;">
                                                <fieldset style="height: 100%; width: auto;">
                                                    <legend>
                                                        <asp:Literal ID="Literal1" runat="server" Text="Selecione Cliente Exceção" />
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label1" runat="server" Text="Cliente:" />
                                                            <asp:TextBox ID="txtClienteNaoSelecionado" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código Cliente ou nome" />
                                                            <ucc:AutoCompleteExtender ID="aceItem" runat="server"
                                                                CompletionListCssClass="autocomplete_list1"
                                                                CompletionListItemCssClass="autocomplete_listitem"
                                                                CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                                CompletionInterval="100"
                                                                EnableCaching="false"
                                                                MinimumPrefixLength="3"
                                                                UseContextKey="true"
                                                                TargetControlID="txtClienteNaoSelecionado"
                                                                ServiceMethod="GetCliente"
                                                                ServicePath="~/AppWs/WsGetCliente.asmx" />

                                                            <%--<asp:Button ID="btnPesquisaClienteNaoSelecionado" runat="server" Text="Pesquisar" SkinID="BtnSuccess" TabIndex="8" OnClick="btnPesquisaClienteNaoSelecionado_Click" />--%>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:LinkButton ID="btnPesquisaClienteNaoSelecionado" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btnPesquisaClienteNaoSelecionado_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                            <asp:LinkButton ID="btnLimparClienteNaoSelecionado" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btnLimparClienteNaoSelecionado_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                        </div>

                                                        <asp:GridView DataKeyNames="clienteId,clienteRazaoSocial"
                                                            runat="server"
                                                            Width="100%"
                                                            HorizontalAlign="Center"
                                                            ID="gvClientesNaoSelecionado"
                                                            AutoGenerateColumns="False"
                                                            AllowPaging="True"
                                                            SkinID="GridViewTable"
                                                            OnPageIndexChanging="gvClientesNaoSelecionado_PageIndexChanging"
                                                            OnRowDataBound="gvClientesNaoSelecionado_RowDataBound"
                                                            EmptyDataText="Não foi encontrado nenhum resultado!">
                                                            <Columns>
                                                                <asp:TemplateField >
                                                                    <HeaderTemplate>
                                                                        <asp:CheckBox ID="chkClienteNaoSelecionado" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkClienteNaoSelecionado_CheckedChanged" />
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelect" runat="server" CssClass="flat"  />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="clienteId" HeaderText="Código do Cliente" ItemStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Razão Social" ItemStyle-HorizontalAlign="Center" />
                                                            </Columns>
                                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div style="width: 45%; height: 100%; display: table-cell;">
                                                <fieldset style="height: 100%; width: auto;">
                                                    <legend>
                                                        <asp:Literal ID="Literal2" runat="server" Text="Remover Cliente Exceção" />
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label2" runat="server" Text="Cliente:" />

                                                            <asp:TextBox ID="txtCliente" runat="server" MaxLength="50" AutoPostBack="false" placeholder="Código Cliente ou Nome" />
                                                            <ucc:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                                                                CompletionListCssClass="autocomplete_list1"
                                                                CompletionListItemCssClass="autocomplete_listitem"
                                                                CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                                CompletionInterval="100"
                                                                EnableCaching="false"
                                                                MinimumPrefixLength="3"
                                                                UseContextKey="true"
                                                                TargetControlID="txtCliente"
                                                                ServiceMethod="GetClienteSelecionado"
                                                                ServicePath="~/AppWs/WsGetCliente.asmx" />


                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:LinkButton ID="btnPesquisarClienteSelecionados" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btnPesquisarClienteSelecionados_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                            <asp:LinkButton ID="btnLimparClienteSelecionados" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btnLimparClienteSelecionados_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                        </div>
                                                    </div>





                                                    <asp:GridView DataKeyNames="clienteId,clienteRazaoSocial"
                                                        runat="server"
                                                        CssClass="table table-bordered table-striped table-hover"
                                                        Width="100%"
                                                        HorizontalAlign="Center"
                                                        ID="gvClientesSelecionados"
                                                        SkinID="GridViewTable"
                                                        AutoGenerateColumns="False"
                                                        AllowPaging="True"
                                                        OnPageIndexChanging="gvClientesSelecionados_PageIndexChanging"
                                                        OnRowDataBound="gvClientesSelecionados_RowDataBound"
                                                        EmptyDataText="Não foi encontrado nenhum resultado!">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkClienteSelecionado" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkClienteSelecionado_CheckedChanged" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" runat="server" CssClass="flat" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="clienteId" HeaderText="Código do Cliente" ItemStyle-HorizontalAlign="Center" />
                                                            <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Razão Social" ItemStyle-HorizontalAlign="Center" />
                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
