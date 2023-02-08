<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadBloqueioItemVendasInterCompany.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadBloqueioItemVendasInterCompany" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="../../Scripts/jquery-1.10.2.min.js"></script>--%>
    <script src="../../Scripts/jquery-3.1.0.js"></script>
    <%--   <script src="../../Scripts/bootstrap.js"></script>--%>
    <link href="../../Styles/custom.css" rel="stylesheet" />

    <link href="../../Styles/font-awesome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">

        //$("[src*=plus]").live("click", function () {
        //    $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
        //    $(this).attr("src", "../../Imagens/minus.png");
        //});


        //$("[src*=minus]").live("click", function () {
        //    $(this).attr("src", "../../Imagens/plus.png");
        //    $(this).closest("tr").next().remove();
        //});

    
     
        //function scrolled(o) {
        //    //visible height + pixel scrolled = total height
        //    if (o.offsetHeight + o.scrollTop == o.scrollHeight) {
        //        GetRecords(o.id);
        //    }
        //}


      

        function shrinkandgrow(input) {
            var displayIcon = "img" + input;
            if ($("#" + displayIcon).attr("src") == "../../Imagens/plus.png") {
                $("#" + displayIcon).closest("tr")
                    .after("<tr><td></td><td colspan = '100%'>" + $("#" + input)
                        .html() + "</td></tr>");
                $("#" + displayIcon).attr("src", "../../Imagens/minus.png");
            } else {
                $("#" + displayIcon).closest("tr").next().remove();
                $("#" + displayIcon).attr("src", "../../Imagens/plus.png");
            }
        }
    </script>

    <asp:HiddenField ID="hdfEsta" runat="server" />

    <br />
    <asp:UpdatePanel ID="updCadastro" runat="server">
 
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="updCadastro">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:Panel ID="pnlGrid" runat="server" Width="100%" Height="100%">
                <asp:UpdatePanel ID="uppFiltros" runat="server">
                    <ContentTemplate>
                        <div style="display: table; text-align: center; width: 99%;">
                            <div style="width: 100%; margin-top: 10px;">

                                <asp:Panel ID="pnlFiltros" runat="server">


                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>
                                                <asp:Label ID="lblFiltrosHeader" runat="server" SkinID="lblLastShowHide" Text="<%$ Resources:Resource, lblFiltros %>" /></h2>

                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <div style="display: table; width: 100%;">

                                                <div class="navegacao">
                                                    <div class="boxPesquisa" style="text-align: left">
                                                        <asp:Label ID="lblDe" runat="server" Text="De:" />
                                                        <asp:DropDownList ID="ddlFiltroDe" SkinID="ddlBootstrap" runat="server"></asp:DropDownList>
                                                    </div>


                                                    <div class="boxPesquisa" style="text-align: left">
                                                        <asp:Label ID="lblFiltroPara" runat="server" Text="Para:" />
                                                        <asp:DropDownList ID="ddlFiltroPara" SkinID="ddlBootstrap" runat="server"></asp:DropDownList>
                                                    </div>

                                                    <div class="boxPesquisa" style="text-align: left">
                                                        <asp:Label ID="lblFiltroItem" runat="server" Text="Item:" />
                                                        <asp:Panel ID="Panel1" runat="server">

                                                            <asp:TextBox ID="txtIFiltroItem" CssClass="ajustarCamposPadrao" Height="26px" runat="server" SkinID="txtBootstrap3" placeholder="Item ID" />

                                                            <ucc:AutoCompleteExtender ID="ddlaceFiltroItens" runat="server"
                                                                CompletionListCssClass="autocomplete_list1"
                                                                CompletionListItemCssClass="autocomplete_listitem"
                                                                CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                                CompletionInterval="100"
                                                                EnableCaching="false"
                                                                MinimumPrefixLength="3"
                                                                TargetControlID="txtIFiltroItem"
                                                                ServiceMethod="GetItens"
                                                                UseContextKey="true"
                                                                ServicePath="~/AppWs/WsGetItens.asmx" />
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <div class="line" style="margin-top: 15px">


                                                            <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnDefault"
                                                                TabIndex="13" OnClick="btnFiltrosPesquisa_Click" Text="Pesquisar" />
                                                            <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault"
                                                                TabIndex="14" OnClick="btnFiltrosLimpar_Click" Text="Limpar" />
                                                            <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnDefault" TabIndex="22" Text="Novo"
                                                                OnClick="btnFiltrosNovoCadastro_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </asp:Panel>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <fieldset>
                    <div class="gridRegistros">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2><asp:Literal ID="Literal2" runat="server" Text="ITENS BLOQUEADOS PARA VENDA INTERCOMPANY" /></h2>
                                 
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                 
                                <asp:GridView ID="gvBloqueioItemVendaIntercompany" runat="server" AllowPaging="false" SkinID="GridViewTable"
                                    DataKeyNames="estabelecimentoIdDe, estabelecimentoIdPara"
                                    OnPageIndexChanging="gvBloqueioItemVendaIntercompany_PageIndexChanging"
                                    OnRowCommand="gvBloqueioItemVendaIntercompany_RowCommand"
                                    OnRowDataBound="gvBloqueioItemVendaIntercompany_RowDataBound"
                                    OnRowDeleting="gvBloqueioItemVendaIntercompany_RowDeleting">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="10px">
                                            <ItemTemplate>

                                                <a  href="JavaScript:shrinkandgrow('div<%#  Eval("estabelecimentoIdDe").ToString().Split('-')[0].Trim() + "_" + Eval("estabelecimentoIdPara").ToString().Split('-')[0].Trim() + "_" + ((GridViewRow)Container).RowIndex %>');">
                                                    <img alt="Itens" id='imgdiv<%#  Eval("estabelecimentoIdDe").ToString().Split('-')[0].Trim() + "_" + Eval("estabelecimentoIdPara").ToString().Split('-')[0].Trim() + "_" + ((GridViewRow)Container).RowIndex %>' src="../../Imagens/plus.png" />
                                                </a>
                                                <div id='div<%#  Eval("estabelecimentoIdDe").ToString().Split('-')[0].Trim() + "_" + Eval("estabelecimentoIdPara").ToString().Split('-')[0].Trim() + "_" + ((GridViewRow)Container).RowIndex %>' style="display: none;">

                                                    <%-- <asp:Image alt="" ID="imgColapso" runat="server" Style="cursor: pointer" src="../../Imagens/plus.png" />
                                                <asp:Panel ID="pnlIntencoes" runat="server" Style="display: none">--%>


                                                    <%--  <div style="width: 100%; height: 200px; overflow: scroll">--%>
                                                    <div id='<%#  Eval("estabelecimentoIdDe").ToString().Split('-')[0].Trim() + "_" + Eval("estabelecimentoIdPara").ToString().Split('-')[0].Trim() + "_" + ((GridViewRow)Container).RowIndex %>' onscroll="scrolled(this)" style="height: 200px; overflow: auto; width: 100%;">
                                                        <asp:UpdatePanel ID="updSubGRID" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>


                                                                <asp:GridView ID="gvSubGridItem" runat="server"
                                                                    DataKeyNames="estabelecimentoIdDe, estabelecimentoIdPara,itemId"
                                                                    OnRowCommand="gvSubGridItem_RowCommand"
                                                                    OnRowDataBound="gvSubGridItem_RowDataBound"
                                                                    OnRowDeleting="gvSubGridItem_RowDeleting" 
                                                                    OnPageIndexChanging="gvSubGridItem_PageIndexChanging">
                                                                    <Columns>
                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                            <HeaderTemplate>
                                                                                Item  
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate><%# Eval("ItemId") %></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="estabelecimentoIdDe" Visible="false" />
                                                                        <asp:BoundField DataField="estabelecimentoIdPara" Visible="false" />

                                                                        <asp:TemplateField ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imbDelete" runat="server" SkinID="ImgGrid" CommandName="DeleteItem"
                                                                                    ImageUrl="~/Imagens/_trash.png"
                                                                                    ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                                    CommandArgument='<%# Eval("itemId") + "|" + Eval("estabelecimentoIdDe") + "|" + Eval("estabelecimentoIdPara") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <%--</asp:Panel>--%>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="estabelecimentoIdDe" HeaderText="Estabelecimento De" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                        <asp:BoundField DataField="estabelecimentoIdPara" HeaderText="Estabelecimento Para" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />

                                        <asp:TemplateField ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center" HeaderText="Deletar Configuração">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbDelete" runat="server"  style="height:30px;width:30px"  CommandName="Deletar"
                                                    ImageUrl="~/Imagens/_trash.png"
                                                    ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                    CommandArgument='<%# Eval("estabelecimentoIdDe") + "|" + Eval("estabelecimentoIdPara") +   ((GridViewRow)Container).RowIndex %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center" HeaderText="Visualizar Itens">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbAlterar" runat="server" style="height:30px;width:30px"  CommandName="Atualizar"
                                                    ImageUrl="~/Imagens/find.png"
                                                    ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                    CommandArgument='<%# Eval("estabelecimentoIdDe") + "|" + Eval("estabelecimentoIdPara") +   ((GridViewRow)Container).RowIndex %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                                <p style="color:red;"> *Visualizando os 100 primeiros itens no sub grid, para visualizar todos os itens utilize a lupa!</p>
                            </div>
                        </div>


                    </div>
                </fieldset>
            </asp:Panel>
            <asp:Panel ID="pnlDados" runat="server">
                <asp:UpdatePanel ID="uppDados" runat="server">
                    <ContentTemplate>
                        <div class="form-row">
                            <div class="col-lg-10"></div>
                            <div class="col-lg-2">
                                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" SkinID="BtnDefault" TabIndex="3" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="BtnDefault" TabIndex="6" OnClick="btnLimpar_Click" />
                                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" SkinID="BtnDefault" TabIndex="1" OnClick="btnVoltar_Click" />
                            </div>
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>
                                        <asp:Literal ID="Literal3" runat="server" Text="Bloquear Itens Vendas Intercompany" /></h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="container body">

                                        <div style="display: table; text-align: center; width: 99%;">
                                            <div style="display: table; width: 100%;">
                                                <div class="navegacao">
                                                    <div class="col-lg-3">
                                                        <div class="boxPesquisa" style="text-align: left">
                                                            <asp:Label ID="Label1" runat="server" Text="De:" />
                                                            <asp:DropDownList ID="ddlDe" runat="server" SkinID="ddlBootstrap"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="boxPesquisa" style="text-align: left">
                                                            <asp:Label ID="Label2" runat="server" Text="Para:" />
                                                            <asp:DropDownList ID="ddlPara" runat="server" SkinID="ddlBootstrap"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4" style="margin-top: 11px;">
                                                        <div class="boxPesquisa">
                                                            <div class="line">
                                                                <asp:Panel ID="pnlItem" runat="server">
                                                                    <asp:HiddenField ID="hdPerfilUsuario" runat="server" />
                                                                    <div class="col-lg-5">
                                                                        <asp:TextBox ID="txtItem" CssClass="ajustarCamposPadrao" Height="26px" runat="server" SkinID="txtBootstrap3" placeholder="Item ID" />

                                                                    </div>
                                                                    <div class="col-lg-7">
                                                                        <asp:Button ID="btnPesquisaItem" runat="server" Text="Pesquisar" SkinID="BtnDefault" TabIndex="1" OnClick="btnPesquisaItem_Click" />
                                                                        <asp:Button ID="btnLimpaPesquisaItem" runat="server" Text="Limpar Pesquisa" SkinID="BtnDefault" TabIndex="1" OnClick="btnLimpaPesquisaItem_Click" />
                                                                    </div>
                                                                    <ucc:AutoCompleteExtender ID="ddlaceItem" runat="server"
                                                                        CompletionListCssClass="autocomplete_list1"
                                                                        CompletionListItemCssClass="autocomplete_listitem"
                                                                        CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                                        CompletionInterval="100"
                                                                        EnableCaching="false"
                                                                        MinimumPrefixLength="3"
                                                                        UseContextKey="true"
                                                                        TargetControlID="txtItem"
                                                                        ServiceMethod="GetItens"
                                                                        ServicePath="~/AppWs/WsGetItens.asmx" />
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <br />
                                        <div class="col-md-12">
                                            <fieldset>


                                                <asp:GridView ID="gvItens" runat="server" TabIndex="51" SkinID="GridViewTable"
                                                    DataKeyNames="itemId,itemDescricao"
                                                    OnPageIndexChanging="gvItens_PageIndexChanging"
                                                    OnRowCommand="gvItens_RowCommand"
                                                    OnRowDataBound="gvItens_RowDataBound"
                                                    OnRowDeleting="gvItens_RowDeleting">

                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Check" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25px">
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="chkAll" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" runat="server" />
                                                            </HeaderTemplate>
                                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelectItem" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectItem_CheckedChanged"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="itemId" HeaderText="ItemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                                        <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" ItemStyle-Width="150px">
                                                            <ItemStyle Width="150px" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="10pt" CssClass="GridPager" />
                                                </asp:GridView>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>

    <div style="position: absolute;">
        <asp:UpdatePanel ID="updModalItem" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlModalItem" runat="server" CssClass="Modal" Visible="false">

                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 80%; left: 5%; height: 80%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label11" runat="server" ForeColor="White" Text="Lista de Itens" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFechaItem" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFechaItem_Click"   />
                            </div>
                        </div>
                        <div class="painel_body">
                            
                                <div class="col-md-12 col-sm-12 col-xs-12">             

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>Itens selecionados</h2>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <div class="demo-container">
                                                        <asp:Panel ID="Panel3" runat="server" DefaultButton="btnPesqItensSelec">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel7">
                                                                <ContentTemplate>
                                                                    <div class="row">
                                                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                                                            <asp:Label ID="lblCodigoItensSelec" runat="server" Text="Código Item" />
                                                                            <asp:TextBox ID="txtCodigoItensSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                        </div>

                                                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                                                            <asp:Label ID="lblDescItensSelec" runat="server" Text="Descrição" />
                                                                            <asp:TextBox ID="txtDescItensSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                        </div>

                                                                        <div class="col-md-3" style="margin-top: 10px;">
                                                                            <asp:LinkButton ID="btnPesqItensSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqItensSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span> </asp:LinkButton>
                                                                            <asp:LinkButton ID="btnLimparItensSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparItensSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-erase"></asp:LinkButton>
                                                                        </div>

                                                                    </div>
                                                                    <br />
                                                                    <div class="pad-10 mt-2">
                                                                        <br />
                                                                        <asp:GridView ID="gvGridItem" runat="server"
                                                                            DataKeyNames="estabelecimentoIdDe, estabelecimentoIdPara,itemId"
                                                                            OnRowCommand="gvGridItem_RowCommand"
                                                                            OnRowDataBound="gvGridItem_RowDataBound"
                                                                            OnRowDeleting="gvGridItem_RowDeleting"
                                                                            OnPageIndexChanging="gvGridItem_PageIndexChanging">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                                    <HeaderTemplate>
                                                                                        Item
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate><%# Eval("ItemId") %></ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="estabelecimentoIdDe" Visible="false" />
                                                                                <asp:BoundField DataField="estabelecimentoIdPara" Visible="false" />

                                                                                <asp:TemplateField ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center">
                                                                                    <ItemTemplate>
                                                                                        <asp:ImageButton ID="imbDelete" runat="server"  style="height:30px;width:30px"  CommandName="Deletar"
                                                                                            ImageUrl="~/Imagens/_trash.png"
                                                                                            ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                                            CommandArgument='<%# Eval("itemId") + "|" + Eval("estabelecimentoIdDe") + "|" + Eval("estabelecimentoIdPara") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                        <div class="center">
                                                                            <asp:Localize ID="Localize6" runat="server"></asp:Localize>
                                                                        </div>

                                                                    </div>

                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                  
                  
                    

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

        </ContentTemplate>
    </asp:UpdatePanel>


    <script type="text/javascript">
        //window.onload = function () {
        //    LoadPage();
        //};
        //function voltar() {
        //    document.getElementById('divNovo').style.display = 'none';
        //    document.getElementById('divfiltro').style.display = '';
        //}
        //function Novo() {
        //    document.getElementById('divNovo').style.display = '';
        //    document.getElementById('divfiltro').style.display = 'none';
        //}
        //function LoadPage() {
        //    document.getElementById('divfiltro').style.display = '';
        //    document.getElementById('divNovo').style.display = 'none';
        //}
    </script>
</asp:Content>
