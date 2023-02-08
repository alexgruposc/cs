<%@ Page Title="Estabelecimentos Galderma" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadEstabelecimentosGalderma.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEstabelecimentosGalderma" %>

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
            <asp:Literal ID="Literal1" runat="server" Text="Estabelecimentos Galderma" />
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
                                <asp:Literal ID="Literal2" runat="server" Text="Selecione os Estabelecimentos para incluir no grupo Galderma" />
                            </legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    Estabelecimento:<br />
                                    <asp:TextBox ID="txt_SelEstabelec" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do estabelecimento" />
                                    <ucc:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                                        CompletionListCssClass="autocomplete_list1"
                                        CompletionListItemCssClass="autocomplete_listitem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                        CompletionInterval="100"
                                        EnableCaching="false"
                                        MinimumPrefixLength="3"
                                        UseContextKey="true"
                                        TargetControlID="txt_SelEstabelec"
                                        ServiceMethod="GetEstabelecimentoElegivelGalderma"
                                        ServicePath="~/AppWs/WsGetEstabelecimento.asmx" />
                                </div>
                                <div class="col-md-4">
                                    <asp:LinkButton ID="btn_SelEstabelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelEstabelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btn_LimpaSelEstabelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelEstabelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                </div>
                            </div>
                            <div class="pad-10 mt-2">

                                <asp:GridView DataKeyNames="estabelecimentoId, estabelecimentoRazaoSocial"
                                    runat="server"
                                    ID="gvSelEstabelec"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelEstabelec_PageIndexChanging"
                                    OnRowDataBound="gvSelEstabelec_RowDataBound"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkTodosSelEstabelec" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelEstabelec_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelEstabelec" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" />
                                        <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />
                                        <asp:BoundField DataField="ufId" HeaderText="UF" />
                                        <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvSelEstabelecPageInfo" runat="server"></asp:Localize>
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
                                <asp:Literal ID="Literal3" runat="server" Text="Selecione os Estabelecimentos do grupo Galderma" />
                            </legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    Estabelecimento:<br />
                                    <asp:TextBox ID="txt_SelEstabelecGalderma" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do estabelecimento" />
                                    <ucc:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                                        CompletionListCssClass="autocomplete_list1"
                                        CompletionListItemCssClass="autocomplete_listitem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                        CompletionInterval="100"
                                        EnableCaching="false"
                                        MinimumPrefixLength="3"
                                        UseContextKey="true"
                                        TargetControlID="txt_SelEstabelecGalderma"
                                        ServiceMethod="GetEstabelecimentoGalderma"
                                        ServicePath="~/AppWs/WsGetEstabelecimento.asmx" />
                                </div>
                                <div class="col-md-4">
                                    <asp:LinkButton ID="btn_SelEstabelecGalderma" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelEstabelecGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btn_LimpaSelEstabelecGalderma" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelEstabelecGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                </div>
                            </div>
                            <div class="pad-10 mt-2">

                                <asp:GridView DataKeyNames="estabelecimentoId, estabelecimentoRazaoSocial, CNPJ"
                                    runat="server"
                                    ID="gvSelEstabelecGalderma"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelEstabelecGalderma_PageIndexChanging"
                                    OnRowDataBound="gvSelEstabelecGalderma_RowDataBound"
                                    OnRowCommand="gvSelEstabelecGalderma_RowCommand"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkTodosSelEstabelecGalderma" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelEstabelecGalderma_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelEstabelecGalderma" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" />
                                        <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />
                                        <asp:BoundField DataField="ufId" HeaderText="UF" />
                                        <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btnEditCliGalderma" runat="server" Text="Médicos" SkinID="BtnDefault-xs" CommandName="EditMedicos"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvSelEstabelecGaldermaPageInfo" runat="server"></asp:Localize>
                                </div>

                            </div>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

    </fieldset>

    <!--  *******************************  PESQUISA E SELEÇÃO DE MEDICOS  *******************************  -->

    <asp:UpdatePanel ID="updMedicos" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hid_estabelecimentoId" runat="server" />
            <asp:Panel ID="pnlMedicos" runat="server" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel">

                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Label ID="lblHeader1" Text="Médicos do Estabelecimento" runat="server" ForeColor="White" />
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imgMedicosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" OnClick="imgMedicosClose_Click"
                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                ImageUrl="~/Imagens/Fechar.png" />
                        </div>
                    </div>

                    <div class="painel_body">

                            <div class="mt-3" style="width: 96%; margin:auto;">

                                <h3>
                                    <asp:Localize ID="lblTituloMedicos" runat="server"></asp:Localize></h3>

                                <div>
                                    <fieldset class="center pad-5">
                                        <asp:Button ID="btnAdicMedicos" runat="server" SkinID="BtnPrimary" Text="Adicionar" OnClick="btnAdicMedicos_Click" />
                                        <asp:Button ID="btnRemoveMedicos" runat="server" SkinID="BtnWarning" Text="Remover" OnClick="btnRemoveMedicos_Click" />
                                    </fieldset>
                                </div>

                                <div class="row mt-2">

                                    <!-- ====================================================================================== -->
                                    <!-- COLUNA ESQUERDA -->
                                    <div class="col-md-6">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                            <ContentTemplate>
                                                <fieldset>
                                                    <legend>
                                                        <asp:Literal ID="Literal4" runat="server" Text="Selecione os Médicos para associar ao estabelecimento" />
                                                    </legend>
                                                    <div class="row pad-5">
                                                        <div class="col-md-8">
                                                            Cliente:<br />
                                                            <asp:TextBox ID="txt_SelCliente" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do cliente" />
                                                            <ucc:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server"
                                                                CompletionListCssClass="autocomplete_list1"
                                                                CompletionListItemCssClass="autocomplete_listitem"
                                                                CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                                CompletionInterval="100"
                                                                EnableCaching="false"
                                                                MinimumPrefixLength="3"
                                                                UseContextKey="true"
                                                                TargetControlID="txt_SelCliente"
                                                                ServiceMethod="GetClienteElegivelEstabGalderma"
                                                                ServicePath="~/AppWs/WsGetEstabelecimento.asmx" />
                                                        </div>
                                                        <div class="col-md-4">
                                                            <asp:LinkButton ID="btn_SelCliente" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelCliente_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                            <asp:LinkButton ID="btn_LimpaSelCliente" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelCliente_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="pad-10 mt-2">

                                                        <asp:GridView DataKeyNames="clienteId"
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
                                                                <asp:BoundField DataField="medicoCRM" HeaderText="CRM" />
                                                                <asp:BoundField DataField="medicoUFidCRM" HeaderText="Estado" />
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
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                                            <ContentTemplate>
                                                <fieldset>
                                                    <legend>
                                                        <asp:Literal ID="Literal5" runat="server" Text="Selecione os Clientes já relacionados ao estabelecimento" />
                                                    </legend>
                                                    <div class="row pad-5">
                                                        <div class="col-md-8">
                                                            Cliente:<br />
                                                            <asp:TextBox ID="txt_SelClienteEstabGalderma" runat="server" MaxLength="50" placeholder="Código ou nome do cliente" />
                                                            
                                                        </div>
                                                        <div class="col-md-4">
                                                            <asp:LinkButton ID="btn_SelClienteEstabGalderma" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelClienteEstabGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                            <asp:LinkButton ID="btn_LimpaSelClienteEstabGalderma" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelClienteEstabGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="pad-10 mt-2">

                                                        <asp:GridView DataKeyNames="clienteId"
                                                            runat="server"
                                                            ID="gvSelClienteEstabGalderma"
                                                            AllowPaging="True"
                                                            SkinID="GridViewTable"
                                                            OnPageIndexChanging="gvSelClienteEstabGalderma_PageIndexChanging"
                                                            OnRowDataBound="gvSelClienteEstabGalderma_RowDataBound" 
                                                            EmptyDataText="Não foi encontrado nenhum resultado!">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:CheckBox ID="chkTodosSelClienteEstabGalderma" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelClienteEstabGalderma_CheckedChanged" />
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelClienteEstabGalderma" runat="server" CssClass="flat" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" />
                                                                <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Nome" />
                                                                <asp:BoundField DataField="medicoCRM" HeaderText="CRM" />
                                                                <asp:BoundField DataField="medicoUFidCRM" HeaderText="Estado" />
                                                            </Columns>
                                                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                        </asp:GridView>
                                                        <div class="center">
                                                            <asp:Localize ID="lblgvSelClienteEstabGaldermaPageInfo" runat="server"></asp:Localize>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                </div>

                            </div>

                    </div>
                    
                    <div class="painel_bottom">
                        <div class="center mt-1">
                            <asp:Button ID="btnFecharMedicos" runat="server" Text="Fechar" OnClick="btnFecharMedicos_Click" />
                        </div>
                    </div>

                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  ***********************************************************************************************  -->

    <asp:UpdateProgress ID="upLoading" runat="server">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
