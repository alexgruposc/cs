<%@ Page Title="Médicos Galderma" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadMedicosGalderma.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadMedicosGalderma" %>

<%-- NAMESPACES --%>
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

        .TextBoxEdit {
            background-color: #ddffdd;
            border: solid 1px #00ee00;
        }

        .TextBoxLabel {
            background-color: transparent;
            border-style: none;
        }

        .TextBoxAlert {
            background-color: #ffdddd;
            border: solid 1px #ee0000;
        }

        input.BotaoGravar {
            /* Não funcionou no button */
            color: #ffffff;
            background-color: #5cb85c;
            border-color: #4cae4c;
        }

        .bgSubGrid {
            background-color: #ffffdd;
            padding: 3px;
            min-height: 30px;
        }

        .bg-VermelhoClaro {
            background-color: #eec0c0;
        }

        .bg-AzulClaro {
            background-color: #c0c0ee;
        }

        /* CLASSES DO PROGRESS BAR */

        .areaTelaTransp {
            /* class = Quadro que cobre área total para boxes sobrepostos */
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            text-align: center;
            z-index: 2020;
            background-repeat: repeat;
            background-image: url('../../imagens/layout/bkb50.png');
        }

            .areaTelaTransp .b30 {
                background-image: url('../../imagens/layout/bkb30.png');
            }

        div.modal-dialogPostBack {
            width: 90%;
            max-width: 920px;
            margin: 50px auto;
            height: auto;
            max-height: 92%;
            overflow-y: auto;
        }

        /* outros */

        input.UploadDoc {
            margin: auto;
            background-color: #ffddaa;
            padding: 10px;
            width: 100%;
            min-height: 70px;
            text-align: center;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: 60px;
            background-image: url('imagens/layout/bgUploadDoc.png');
        }
    </style>

    <script type="text/javascript">

        function panel_StatusImport(pDisplay) {
            if (pDisplay == "") {
                document.getElementById("ContentPlaceHolder1_hid_modalVisible").value = "panel_StatusImport";
            }
            document.getElementById("panel_StatusImport").style.display = pDisplay;
        }

    </script>

    <link href="../../Styles/font-awesome/css/font-awesome.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="colorAzulKs">Médicos Galderma</h3>

    <asp:UpdatePanel ID="UpdatePanelGeral" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_panelUploadArq" />
            <asp:PostBackTrigger ControlID="btn_panelEditor" />
            <asp:PostBackTrigger ControlID="btn_enviarArquivo" />
            <asp:PostBackTrigger ControlID="btn_ConfirmImport" />
            <asp:PostBackTrigger ControlID="imbExportarExcel" />
            <asp:PostBackTrigger ControlID="btn_ExportErros" />
        </Triggers>
        <ContentTemplate>
            <asp:HiddenField ID="hid_modalVisible" runat="server" />
            <fieldset class="pad-10 text-right">
                <asp:Button ID="btn_panelUploadArq" runat="server" SkinID="BtnInfo" Text="Envio de Arquivo" OnClick="btn_panelUploadArq_Click" />
                &nbsp;
                <asp:Button ID="btn_panelEditor" runat="server" SkinID="BtnInfo" Text="Editar Dados" OnClick="btn_panelEditor_Click" />
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  *******************************  PESQUISA E SELEÇÃO DE CLIENTES  *******************************  -->

    <asp:UpdatePanel ID="updCliente" runat="server">
        <ContentTemplate>

            <asp:Panel ID="panel_Editor" runat="server" CssClass="pad-5 mt-2">

                <div>
                    <fieldset class="center pad-5">
                        <asp:Button ID="btnAdicionar" runat="server" SkinID="BtnPrimary" Text="Adicionar" OnClick="btnAdicionar_Click" />
                        <asp:Button ID="btnRemover" runat="server" SkinID="BtnWarning" Text="Remover" OnClick="btnRemover_Click" />
                    </fieldset>
                </div>

                <div class="row mt-2">

                    <!-- ====================================================================================== -->
                    <!-- COLUNA ESQUERDA -->
                    <div class="col-md-5">
                        <fieldset>
                            <legend>
                                <asp:Literal ID="Literal2" runat="server" Text="Selecione os Clientes para incluir no grupo Galderma" />
                            </legend>
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
                                        ServiceMethod="GetClienteElegivelGalderma"
                                        ServicePath="~/AppWs/WsGetCliente.asmx" />
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
                    </div>

                    <!-- ====================================================================================== -->
                    <!-- COLUNA DIREITA -->
                    <div class="col-md-7">
                        <asp:HiddenField ID="hid_rowIndexEditCliente" runat="server" />
                        <fieldset>
                            <legend>
                                <asp:Literal ID="Literal3" runat="server" Text="Selecione os Clientes do grupo Galderma" />
                            </legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    Cliente:<br />
                                    <asp:TextBox ID="txt_SelClienteGalderma" runat="server" MaxLength="50" AutoPostBack="true" placeholder="Código ou nome do cliente" />
                                    <ucc:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                                        CompletionListCssClass="autocomplete_list1"
                                        CompletionListItemCssClass="autocomplete_listitem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                        CompletionInterval="100"
                                        EnableCaching="false"
                                        MinimumPrefixLength="3"
                                        UseContextKey="true"
                                        TargetControlID="txt_SelClienteGalderma"
                                        ServiceMethod="GetClienteGalderma"
                                        ServicePath="~/AppWs/WsGetCliente.asmx" />
                                </div>
                                <div class="col-md-2 text-right">
                                    <asp:LinkButton ID="btn_SelClienteGalderma" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelClienteGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btn_LimpaSelClienteGalderma" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelClienteGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                </div>
                                <div class="col-md-2 text-right">
                                    <asp:ImageButton ID="imbExportarExcel" ImageUrl="../../Imagens/xlsx.png" runat="server" OnClick="imbExportarExcel_Click" ToolTip="Exportar para Excel" Style="width: auto; height: 38px" />
                                </div>
                            </div>
                            <div class="pad-10 mt-2">
                                <asp:GridView DataKeyNames="clienteId, dataValidade, clienteRazaoSocial, medicoCRM"
                                    runat="server"
                                    ID="gvSelClienteGalderma"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelClienteGalderma_PageIndexChanging"
                                    OnRowDataBound="gvSelClienteGalderma_RowDataBound"
                                    OnRowCommand="gvSelClienteGalderma_RowCommand"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbRelacEstabelec" runat="server" ImageUrl="../../Imagens/plus.png" CommandName="MostrarRelacEstabelec"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkTodosSelClienteGalderma" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelClienteGalderma_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelClienteGalderma" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%-- <asp:BoundField DataField="clienteId" HeaderText="Código" />--%>
                                        <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" />
                                        <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Nome" />
                                        <asp:BoundField DataField="medicoCRM" HeaderText="CRM" />
                                        <asp:BoundField DataField="medicoUFidCRM" HeaderText="Estado" />

                                        <asp:TemplateField HeaderText="Data Validade">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtdataValidade" runat="server" Width="75px" CssClass="TextBoxLabel"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btnEditCliGalderma" runat="server" Text="Editar" CommandName="Editar" SkinID="BtnDefault-xs"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                                <asp:Button ID="btnGravaDataValidade" runat="server" Text="Gravar" CommandName="Gravar" SkinID="BtnSuccess-xs"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />

                                                <asp:Localize ID="lbl_childTr" runat="server" />
                                                <asp:Panel ID="Panel_child" runat="server" Visible="false" CssClass="bgSubGrid">
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <b>
                                                                <asp:Localize ID="lbl_childTitulo" runat="server" /></b>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <asp:Button ID="btnEditarRelacEstabelec" runat="server" Text="Editar" SkinID="BtnDefault-xs" Style="text-align: right"
                                                                CommandName="EditarEstabelec" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                                        </div>
                                                        <div class="col-md-2">
                                                            <asp:ImageButton ID="imbFecharRelacEstabelec" runat="server" ImageUrl="../../Imagens/fechar.png" Style="text-align: right; width: 24px; height: 24px;"
                                                                CommandName="FecharRelacEstabelec" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                                        </div>
                                                    </div>

                                                    <asp:GridView ID="gvRelacEstabelec"
                                                        DataKeyNames="estabelecimentoId"
                                                        OnRowDataBound="gvRelacEstabelec_RowDataBound"
                                                        OnRowCommand="gvRelacEstabelec_RowCommand"
                                                        runat="server"
                                                        AutoGenerateColumns="false"
                                                        AllowPaging="false"
                                                        CssClass="ChildGrid">
                                                        <Columns>
                                                            <asp:BoundField DataField="estabelecimentoId" HeaderText="Codigo" />
                                                            <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />
                                                            <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                                            <asp:BoundField DataField="ufId" HeaderText="Estado" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvSelClienteGaldermaPageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                </div>

            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  *******************************  PESQUISA E SELEÇÃO DE ESTABELECIMENTOS  *******************************  -->

    <asp:UpdatePanel ID="updEstabelec" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hid_clienteId" runat="server" />

            <asp:Panel ID="pnlEstabelec" runat="server" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel">

                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Label ID="lblHeadEstabelec" Text="Estabelecimentos Relacionados ao Médico" runat="server" ForeColor="White" />
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imgEstabelecClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" OnClick="imgEstabelecClose_Click"
                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                ImageUrl="~/Imagens/Fechar.png" />
                        </div>
                    </div>

                    <div class="painel_body">

                        <div class="mt-3" style="width: 96%; margin: auto;">

                            <h3>
                                <asp:Localize ID="lblTituloEstabelec" runat="server"></asp:Localize></h3>

                            <div>
                                <fieldset class="center pad-5">
                                    <asp:Button ID="btnAdicEstabelec" runat="server" SkinID="BtnPrimary" Text="Adicionar" OnClick="btnAdicEstabelec_Click" />
                                    <asp:Button ID="btnRemoveEstabelec" runat="server" SkinID="BtnWarning" Text="Remover" OnClick="btnRemoveEstabelec_Click" />
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
                                                    <asp:Literal ID="Literal4" runat="server" Text="Selecione os Estabelecimentos para associar ao Médico" />
                                                </legend>
                                                <div class="row pad-5">
                                                    <div class="col-md-8">
                                                        Estabelecimento:<br />
                                                        <asp:TextBox ID="txt_SelEstabelec" runat="server" MaxLength="50" placeholder="Código ou nome do estabelecimento" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:LinkButton ID="btn_SelEstabelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelEstabelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                        <asp:LinkButton ID="btn_LimpaSelEstabelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelEstabelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <div class="pad-10 mt-2">

                                                    <asp:GridView DataKeyNames="estabelecimentoId"
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
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                                        <ContentTemplate>
                                            <fieldset>
                                                <legend>
                                                    <asp:Literal ID="Literal5" runat="server" Text="Selecione os Estabelecimentos já relacionados ao Médico" />
                                                </legend>
                                                <div class="row pad-5">
                                                    <div class="col-md-8">
                                                        Estabelecimentos:<br />
                                                        <asp:TextBox ID="txt_SelEstabClienteGalderma" runat="server" MaxLength="50" placeholder="Código ou nome do estabelecimento" />

                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:LinkButton ID="btn_SelEstabClienteGalderma" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btn_SelEstabClienteGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                        <asp:LinkButton ID="btn_LimpaSelEstabClienteGalderma" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btn_LimpaSelEstabClienteGalderma_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <div class="pad-10 mt-2">

                                                    <asp:GridView DataKeyNames="estabelecimentoId"
                                                        runat="server"
                                                        ID="gvSelEstabClienteGalderma"
                                                        AllowPaging="True"
                                                        SkinID="GridViewTable"
                                                        OnPageIndexChanging="gvSelEstabClienteGalderma_PageIndexChanging"
                                                        OnRowDataBound="gvSelEstabClienteGalderma_RowDataBound"
                                                        EmptyDataText="Não foi encontrado nenhum resultado!">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkTodosSelEstabClienteGalderma" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelEstabClienteGalderma_CheckedChanged" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelEstabClienteGalderma" runat="server" CssClass="flat" />
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
                                                        <asp:Localize ID="lblgvSelEstabClienteGaldermaPageInfo" runat="server"></asp:Localize>
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
                            <asp:Button ID="btnFecharEstabelec" runat="server" Text="Fechar" OnClick="btnFecharEstabelec_Click" />
                        </div>
                    </div>

                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  *******************************  UPLOAD DE CARGA DE DADOS  *******************************  -->

    <asp:UpdatePanel ID="updUploadArq" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel_UploadArq" runat="server">
                <fieldset class="pad-10">
                    <h4 class="colorAzulKs">Envio de Arquivo</h4>
                    <div class="row">
                        <div class="col-md-6 warning">
                            <asp:FileUpload ID="upl_UploadArq" runat="server" CssClass="UploadDoc" Style="margin: auto" EnableViewState="true" />
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btn_enviarArquivo" runat="server" Text="Enviar Arquivo" SkinID="BtnSuccess" OnClick="btn_enviarArquivo_Click" />
                        </div>

                    </div>

                </fieldset>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updPanelValidaTabela" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel_ValidaTabela" runat="server">
                <fieldset class="pad-10">
                    <h4 class="colorAzulKs">Validação dos Dados Enviados</h4>

                    <div class="row">
                        <div class="col-md-8">
                            <asp:Localize ID="lbl_ValidaTabela" runat="server"></asp:Localize>
                        </div>
                        <div class="col-md-4 text-center">
                            <asp:Button ID="btn_ConfirmImport" runat="server" Text="Confirmar Importação" SkinID="BtnSuccess"
                                OnClick="btn_ConfirmImport_Click" UseSubmitBehavior="false" OnClientClick="panel_StatusImport('')" />
                        &nbsp;
                            <asp:Button ID="btn_ExportErros" runat="server" Text="Exportar Erros" SkinID="BtnWarning"
                                OnClick="btn_ExportErros_Click" UseSubmitBehavior="false" />
                        </div>
                    </div>

                    <div class="mt-2">
                        <asp:GridView ID="grv_ValidaTabela" runat="server" DataKeyNames="linhaOk,ClienteGalderma"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="50"
                            OnPageIndexChanging="grv_ValidaTabela_PageIndexChanging" OnRowDataBound="grv_ValidaTabela_RowDataBound"
                            EmptyDataText="Não foi encontrado nenhum resultado!">
                            <Columns>
                                <asp:BoundField DataField="Linha" HeaderText="Linha" ItemStyle-Width="5%" />
                                <asp:BoundField DataField="estabelecimentoId" HeaderText="Loja" ItemStyle-Width="5%" />
                                <asp:BoundField DataField="clienteIdERP" HeaderText="ID ERP" ItemStyle-Width="7%" />
                                <asp:BoundField DataField="clienteId" HeaderText="ID Kraft" ItemStyle-Width="7%" />
                                <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" ItemStyle-Width="19%" />
                                <asp:BoundField DataField="medicoCRM" HeaderText="CRM" ItemStyle-Width="7%" />
                                <asp:BoundField DataField="ClienteGalderma" HeaderText="Cliente Galderma" ItemStyle-Width="5%" />
                                <asp:BoundField DataField="Excluir" HeaderText="Excluir" ItemStyle-Width="5%" />
                                <asp:BoundField DataField="infoValidacao" HeaderText="Validação" ItemStyle-Width="20%" />
                                <asp:BoundField DataField="result" HeaderText="Resultado" ItemStyle-Width="20%" />
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                        </asp:GridView>
                        <div class="text-center">
                            <asp:Localize ID="lbl_grv_ValidaTabela_PageInfo" runat="server" />
                        </div>
                    </div>

                </fieldset>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div style="min-height: 70px;">
        &nbsp;
    </div>

    <!--  ********************************************************************************************************  -->

    <asp:UpdateProgress ID="upLoading" runat="server">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="updStatusImport" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" />
            <asp:PostBackTrigger ControlID="btn_CancelarTarefa" />
        </Triggers>
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Enabled="false" />
            <div id="panel_StatusImport" class="areaTelaTransp" style="display: <%= StatusImportDisplay %>">
                <!-- MODAL - Aguardando... -->
                <div class="modal-dialogPostBack" style="margin-top: 150px">
                    <div class="modal-content">
                        <h3>IMPORTANDO DADOS. AGUARDE...</h3>
                        <div class="m-2 pad-10">
                            <p>
                                <asp:Localize ID="lbl_InfoStatusImport" runat="server"></asp:Localize>
                            </p>
                            <div class="progress" style="height: 40px">
                                <asp:Localize ID="lbl_BarraStatusImport" runat="server"></asp:Localize>
                            </div>

                            <div class="m-3 pad12">
                                <asp:Button ID="btn_CancelarTarefa" runat="server" Text="Cancelar" SkinID="BtnDefault" OnClick="btn_CancelarTarefa_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
