<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadGrupoClienteTabelaImportacao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadGrupoClienteTabelaImportacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- CONTROLES --%>
    <%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>
    <%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
    <%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
    <%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        .bordaParaEsquerda {
            padding: 0 0 0 16px;
            border-left-style: solid;
            border-left-color: #B3B3B3;
            border-bottom-width: 0,1px;
        }
        /* AutoComplete */

        /* AutoComplete flyout*/
        .autocomplete_list2, .autocomplete_list2 {
            margin: 0px!important;
            padding: 0px;
            color: #000000;
            border-width: 1px;
            border-style: solid;
            text-align: left;
            line-height: 30px;
            overflow: auto;
            font-family: Tahoma;
            font-size: 12px;
        }

        .autocomplete_list2 {
            width: 500px !important;
        }

        /* AutoComplete highlighted item */
        .autocomplete_highlighted_listitem2 {
            background-color: #14293E;
            font-weight: bold;
            color: #FFFFFF;
        }

        /* AutoComplete item */
        .autocomplete_listitem2 {
            background-color: #DADAD9;
            position: fixed;
            grid-template: initial;
            width: 40%;
        }

        .alterarStatusAtivo {
            display: inline;
        }

        .alterarStatusInativo {
            display: inline;
        }
    </style>
    <script type="text/javascript">

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_initializeRequest(InitializeRequest);
        prm.add_endRequest(EndRequest);
        var postBackElement;


        var updateProgress = null;

        function postbackButtonClick() {
            updateProgress = $find("<%= btnUpload.ClientID %>");
            document.getElementById('<%= uppSimuladorImportacao.ClientID %>').style.display = 'block';
            return true;
        }

        function InitializeRequest(sender, args) {
            if (prm.get_isInAsyncPostBack()) {
                args.set_cancel(true);
            }

            postBackElement = args.get_postBackElement();

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnUpload.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';
            }

        }

        function EndRequest(sender, args) {

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnUpload.ClientID %>') {
                    document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';
                }
            }
            function openLoad() {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';
            document.getElementById('<%= btnUpload.ClientID %>').click();
        }


        function LimparSelecaoDDLs() {
            var select = document.querySelector('<%# ddlOrigem.ClientID %>');
            options = select.querySelectorAll('option');
            options[select.selectedIndex].removeAttribute("selected");

            var select = document.querySelector('<%# ddlDestino.ClientID %>');
            options = select.querySelectorAll('option');
            options[select.selectedIndex].removeAttribute("selected");

            var select = document.querySelector('<%# ddlGrupo.ClientID %>');
            options = select.querySelectorAll('option');
            options[select.selectedIndex].removeAttribute("selected");

        }
    </script>
    <asp:UpdatePanel ID="uppSimuladorImportacao" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvTabela" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvTabela" EventName="PageIndexChanging" />

            <asp:PostBackTrigger ControlID="btnGerarExcel" />
            <asp:PostBackTrigger ControlID="btnUpload" />

        </Triggers>
        <ContentTemplate>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppSimuladorImportacao">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <fieldset style="margin: 0 0 0 0 !important; padding: 0 0 0 0 !important">
                <legend>
                    <asp:Literal runat="server" Text="Grupo Cliente Tabela" />
                </legend>
                <asp:Panel ID="pnlFiltro" runat="server">

                    <table style="margin: 20px 0 0 0">
                        <tr>

                            <td>
                                <div class="boxPesquisaCurta">
                                    <asp:Label ID="Label2"  Text="Grupo: " runat="server" />
                                 
                                        <asp:DropDownList ID="ddlGrupo" AppendDataBoundItems="true" Style="width: 455px !important; margin: 0 50px 0 0" AutoPostBack="true" runat="server" TabIndex="12" SkinID="DropSmallFilter">
                                            <Items>
                                                <asp:ListItem Text="SELECIONAR..." Value="" />
                                            </Items>
                                        </asp:DropDownList>
                     

                                </div>
                            </td>
                            <td>
                                <div class="boxPesquisa" style="width: 100px;">
                                    <asp:Label ID="Label1" runat="server" Style="margin: 0 0 0 220px;" Text="Item:" />
                                    <asp:TextBox ID="txtCodigoPedido" runat="server" Width="250px" TabIndex="3" />
                                </div>
                            </td>
                            <td>
                                <div class="boxPesquisa" style="width: 122px !Important;">
                                    <asp:Label ID="Label7" Text="Origem: " runat="server" />
                            
                                        <asp:DropDownList ID="ddlOrigem" Style="width: 120px !important" AutoPostBack="true" runat="server" TabIndex="12" SkinID="DropSmallFilter">
                                            <asp:ListItem Selected="True" Text="SELECIONAR" Value="" />
                                            <asp:ListItem Text="AC" Value="AC"></asp:ListItem>
                                            <asp:ListItem Text="AL" Value="AL"></asp:ListItem>
                                            <asp:ListItem Text="AP" Value="AP"></asp:ListItem>
                                            <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                            <asp:ListItem Text="BA" Value="BA"></asp:ListItem>
                                            <asp:ListItem Text="CE" Value="CE"></asp:ListItem>
                                            <asp:ListItem Text="DF" Value="DF"></asp:ListItem>
                                            <asp:ListItem Text="ES" Value="ES"></asp:ListItem>
                                            <asp:ListItem Text="GO" Value="GO"></asp:ListItem>
                                            <asp:ListItem Text="MA" Value="MA"></asp:ListItem>
                                            <asp:ListItem Text="MT" Value="MT"></asp:ListItem>
                                            <asp:ListItem Text="MS" Value="MS"></asp:ListItem>
                                            <asp:ListItem Text="MG" Value="MG"></asp:ListItem>
                                            <asp:ListItem Text="PA" Value="PA"></asp:ListItem>
                                            <asp:ListItem Text="PB" Value="PB"></asp:ListItem>
                                            <asp:ListItem Text="PR" Value="PR"></asp:ListItem>
                                            <asp:ListItem Text="PE" Value="PE"></asp:ListItem>
                                            <asp:ListItem Text="PI" Value="PI"></asp:ListItem>
                                            <asp:ListItem Text="RJ" Value="RJ"></asp:ListItem>
                                            <asp:ListItem Text="RN" Value="RN"></asp:ListItem>
                                            <asp:ListItem Text="RS" Value="RS"></asp:ListItem>
                                            <asp:ListItem Text="RO" Value="RO"></asp:ListItem>
                                            <asp:ListItem Text="RR" Value="RR"></asp:ListItem>
                                            <asp:ListItem Text="SC" Value="SC"></asp:ListItem>
                                            <asp:ListItem Text="SP" Value="SP"></asp:ListItem>
                                            <asp:ListItem Text="SE" Value="SE"></asp:ListItem>
                                            <asp:ListItem Text="TO" Value="TO"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                           
                            </td>
                            <td>
                                <div class="boxPesquisa" style="width: 0 !Important;">
                                    <asp:Label ID="Label3" Text="Destino: " runat="server" />
                                  
                                        <asp:DropDownList ID="ddlDestino" Style="width: 120px !important; " AutoPostBack="true" runat="server" TabIndex="12" SkinID="DropSmallFilter">
                                            <asp:ListItem Selected="True" Text="SELECIONAR" Value="" />
                                            <asp:ListItem Text="AC" Value="AC"></asp:ListItem>
                                            <asp:ListItem Text="AL" Value="AL"></asp:ListItem>
                                            <asp:ListItem Text="AP" Value="AP"></asp:ListItem>
                                            <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                            <asp:ListItem Text="BA" Value="BA"></asp:ListItem>
                                            <asp:ListItem Text="CE" Value="CE"></asp:ListItem>
                                            <asp:ListItem Text="DF" Value="DF"></asp:ListItem>
                                            <asp:ListItem Text="ES" Value="ES"></asp:ListItem>
                                            <asp:ListItem Text="GO" Value="GO"></asp:ListItem>
                                            <asp:ListItem Text="MA" Value="MA"></asp:ListItem>
                                            <asp:ListItem Text="MT" Value="MT"></asp:ListItem>
                                            <asp:ListItem Text="MS" Value="MS"></asp:ListItem>
                                            <asp:ListItem Text="MG" Value="MG"></asp:ListItem>
                                            <asp:ListItem Text="PA" Value="PA"></asp:ListItem>
                                            <asp:ListItem Text="PB" Value="PB"></asp:ListItem>
                                            <asp:ListItem Text="PR" Value="PR"></asp:ListItem>
                                            <asp:ListItem Text="PE" Value="PE"></asp:ListItem>
                                            <asp:ListItem Text="PI" Value="PI"></asp:ListItem>
                                            <asp:ListItem Text="RJ" Value="RJ"></asp:ListItem>
                                            <asp:ListItem Text="RN" Value="RN"></asp:ListItem>
                                            <asp:ListItem Text="RS" Value="RS"></asp:ListItem>
                                            <asp:ListItem Text="RO" Value="RO"></asp:ListItem>
                                            <asp:ListItem Text="RR" Value="RR"></asp:ListItem>
                                            <asp:ListItem Text="SC" Value="SC"></asp:ListItem>
                                            <asp:ListItem Text="SP" Value="SP"></asp:ListItem>
                                            <asp:ListItem Text="SE" Value="SE"></asp:ListItem>
                                            <asp:ListItem Text="TO" Value="TO"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                       
                            </td>
                            <td></td>
                            <td>
                                <div class="boxPesquisaCurta" style="width: 30px !Important;">
                                    <asp:Label ID="Label9" Text="Data Importação: " runat="server" />
                                    <div style="display: table-cell; vertical-align: middle; width: 25%;">
                                        <CtlData:ControlData ID="dtCadastro" runat="server" />
                                    </div>
                                </div>
                            </td>
                            <div class="boxPesquisa" style="float: right">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" Text="Pesquisar" runat="server" SkinID="ButtonLeftFind"
                                        TabIndex="13" OnClick="btnFiltrosPesquisa_Click" />

                                    <asp:Button ID="btnFiltrosLimpar" Text="Limpar" runat="server" SkinID="ButtonCenterClean"
                                        TabIndex="15" OnClick="btnFiltrosLimpar_Click" />

                                    <asp:Button ID="btnPnlDeleteGrupo" Text="Deletar Tabela" runat="server" SkinID="ButtonCenterClean"
                                        TabIndex="15" OnClick="btnPnlDeleteGrupo_Click" />

                                    <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                        ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                        ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />

                                </div>
                        </tr>
                    </table>
                </asp:Panel>
            </fieldset>

            <fieldset>
                <asp:Panel ID="pnlCarregarAquivo" runat="server">
                    <div style="border: solid 0px; margin-top: 21px;">
                        <div class="boxPesquisa">
                            <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                <asp:FileUpload ID="fulArquivo" runat="server" />
                            </div>
                        </div>
                        <div class="boxPesquisa">
                            <asp:Button ID="btnUpload" runat="server" Width="160px" Text="<%$ Resources:Resource, lblCarregar %>" OnClick="btnUpload_Click" OnClientClick="openLoad();" />
                        </div>
                    </div>
                    <div  style="float:right">
                        <asp:Button ID="btnExcluirSelecionados" Text="Excluir Selecionados" runat="server" SkinID="ButtonLeftFind"
                                        TabIndex="13" OnClick="btnExcluirSelecionados_Click" />

                    </div>
                </asp:Panel>
            </fieldset>

            <fieldset style="left: 0.5%; width: 99%; height: 50%;">
                <asp:Panel ID="pnlGvTabelaCusto" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">

                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">

                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                <center />

                                <asp:GridView ID="gvTabela" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="itemId,itemDescricao,grupoId,ufOrigem,ufDestino,precoFabrica,descontoPadrao,usuarioId,DataImportacao,itemInserido,itemAtualizado,itemExcluido"
                                    OnRowDataBound="gvTabela_RowDataBound"
                                  
                                    OnRowCommand="gvTabela_RowCommand"
                                    OnPageIndexChanging="gvTabela_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="checkAll"  runat="server"  OnCheckedChanged="checkAll_CheckedChanged" AutoPostBack="true" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="checkAnItem"  runat="server"   AutoPostBack="true"  OnCheckedChanged="checkAnItem_CheckedChanged"  />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Descricão" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="grupoId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="ufOrigem" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="ufDestino" ItemStyle-HorizontalAlign="Center" />
                                        <%--   <asp:BoundField DataField="precoFabrica" ItemStyle-HorizontalAlign="Center" />--%>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Preço Padrão" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtPrecoFabrica" runat="server" EnablePageMethods="true"
                                                    SkinID="Currency50" AutoPostBack="false" Font-Bold="true" MaxLength="10"
                                                    Style="width: 90px !important;" Enabled="false" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Desconto Padrão" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDescontoPadrao" runat="server" EnablePageMethods="true"
                                                    SkinID="Currency50" AutoPostBack="false" Font-Bold="true" MaxLength="10"
                                                    Style="width: 90px !important;" Enabled="false" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                        </asp:TemplateField>


                                        <%--<asp:BoundField DataField="descontoPadrao" ItemStyle-HorizontalAlign="Center" />--%>
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrDataCadastro" runat="server" />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltritemInserido" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltritemAtualizado" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltritemExcluido" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrItemSemAtualizacao" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Atualizar" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnAlterar" CommandName="Visualizar"
                                                    ToolTip="Atualizar"
                                                    Style="z-index: 1000" runat="server" SkinID="ImgGrid" ImageUrl="~/Imagens/update.png"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex  + "|" + Eval("itemId") 
                                                                                                            + "|" + Eval("ufOrigem") 
                                                                                                            + "|" + Eval("ufDestino")  
                                                                                                            + "|" + Eval("grupoId") %>' />

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Excluir" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="Deletar" runat="server" CommandName="Excluir" SkinID="ImgGrid" Style="z-index: 1000"
                                                    ToolTip="Deletar" CommandArgument='<%# ((GridViewRow)Container).RowIndex  
                                                                                                            + "|" +  Eval("itemId") 
                                                                                                            + "|" + Eval("ufOrigem") 
                                                                                                            + "|" + Eval("ufDestino")  
                                                                                                            + "|" + Eval("grupoId") %>'
                                                    ImageUrl="~/Imagens/_trash.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Voltar" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnVoltar" CommandName="voltar"
                                                    ToolTip="Voltar"
                                                    Style="z-index: 1000" runat="server" SkinID="ImgGrid"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex  + "|" + Eval("itemId") 
                                                                                                            + "|" + Eval("ufOrigem") 
                                                                                                            + "|" + Eval("ufDestino")  
                                                                                                            + "|" + Eval("grupoId") %>'
                                                    ImageUrl="~/Imagens/btnVoltar.png" />

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Salvar" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnSalvarGrid" CommandName="salvar"
                                                    ToolTip="Sarvar"
                                                    Style="z-index: 1000" runat="server" SkinID="ImgGrid"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex  + "|" + Eval("itemId") 
                                                                                                            + "|" + Eval("ufOrigem") 
                                                                                                            + "|" + Eval("ufDestino")  
                                                                                                            + "|" + Eval("grupoId")  %>'
                                                    ImageUrl="~/Imagens/btnSave.png" />

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="gridGrupo" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>

                        </fieldset>
                    </div>
                </asp:Panel>
            </fieldset>


        </ContentTemplate>
    </asp:UpdatePanel>





    <asp:UpdatePanel ID="upDeletarGrupo" runat="server" UpdateMode="Conditional">
        <Triggers>
        </Triggers>

        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="upDeletarGrupo">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:Panel ID="pnlDeleteItemGrupo" runat="server" DefaultButton="btnPnlDeleteGrupo" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel">
                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Label ID="Label4" Text="Deletar Tabela" runat="server" ForeColor="White" />
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="btnFecharPainelGrupo" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                ImageUrl="~/Imagens/Fechar.png"
                                OnClick="btnFecharPainelGrupo_Click" />
                        </div>
                    </div>
                    <div class="painel_body">
                        <fieldset style="height: 10% !Important;">
                            <%-- FILTROS CLIENTES --%>
                            <div class="navegacao">
                                <div class="boxPesquisa">
                                    <asp:Label ID="Label5" Text="Grupo: " runat="server" />
                                    <asp:DropDownList ID="ddlGrupoDelete" AppendDataBoundItems="true" OnTextChanged="ddlGrupoDelete_TextChanged" Style="width: 455px !important; margin: 0 50px 0 0" AutoPostBack="true" runat="server" TabIndex="12" SkinID="DropSmallFilter">
                                        <Items>
                                            <asp:ListItem Text="SELECIONAR.." Value="" />
                                        </Items>
                                    </asp:DropDownList>
                                </div>

                                <div class="boxPesquisa">
                                    <asp:Button ID="btnBuscarGrupo" Text="BUSCAR" runat="server" SkinID="ButtonLeft" OnClick="btnBuscarGrupo_Click" />
                                    <asp:Button ID="btnLimparGrupo" Text="LIMPAR" runat="server" SkinID="ButtonRight" OnClick="btnLimparGrupo_Click" />
                                </div>
                            </div>

                        </fieldset>
                        <fieldset style="height: 85% !Important;">
                            <asp:GridView ID="gvGrupo" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                DataKeyNames="grupoId,grupoDescricao,dataCadastro,usuarioId,grupoAtivo"
                                OnRowDataBound="gbGrupo_RowDataBound"
                                OnRowCommand="gbGrupo_RowCommand"
                                OnPageIndexChanging="gvTabela_PageIndexChanging"
                                AutoGenerateColumns="False"
                                AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="grupoId" HeaderText="GrupoId" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="grupoDescricao" HeaderText="Descricao" ItemStyle-HorizontalAlign="Center" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbExcluir" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblNaoOk %>" CommandArgument='<%#   Eval("grupoId") + "|" + Eval("grupoDescricao")  %>'
                                                ImageUrl="~/Imagens/Fechar.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </fieldset>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>


    <script type="text/javascript">

        $(document).ready(function () {
            PagingCommon("#gvTabela");
        });

        var updateProgress = null;

        function postbackButtonClick() {
            updateProgress = $find("<%= btnUpload.ClientID %>");
            document.getElementById('<%= uppSimuladorImportacao.ClientID %>').style.display = 'block';
            return true;
        }

        function checkAll(objRef) {
            var GridView = objRef.parentNode.parentNode.parentNode;
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //Get the Cell To find out ColumnIndex
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        //If the header checkbox is checked
                        //check all checkboxes
                        //and highlight all rows
                        row.style.backgroundColor = "#C2D69B";
                        inputList[i].checked = true;
                    }
                    else {
                        //If the header checkbox is checked
                        //uncheck all checkboxes
                        //and change rowcolor back to original 

                        row.style.backgroundColor = "white";
                        inputList[i].checked = false;
                    }
                }
            }
        }


        function Check_Click(objRef) {
            //Get the Row based on checkbox
            var row = objRef.parentNode.parentNode;
            if (objRef.checked) {
                //If checked change color to Aqua
                row.style.backgroundColor = "#C2D69B";
            }
            else {
                //If not checked change back to original color

                row.style.backgroundColor = "white";
            }
            //Get the reference of GridView
            var GridView = row.parentNode;
            //Get all input elements in Gridview
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];
                //Based on all or none checkboxes
                //are checked check/uncheck Header Checkbox
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;
        }


        function SelecionaTodosChecks(spanChk, nameChk) {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];

            xState = theBox.checked;
            elm = theBox.form.elements;

            for (i = 0; i < elm.length; i++) {
                if ((elmIdea.type == "checkbox" && elmIdea.id != theBox.id)
                        && (elmIdea.checked != xState) && (elmIdea.name == nameChk)) {
                    elmIdea.click();
                }
            }
        }
    </script>

</asp:Content>

