<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadBloqueioEstabelecimentoEstado.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadBloqueioEstabelecimentoEstado" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/Mensagem.ascx" TagPrefix="MsgBox" TagName="Mensagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
        <script src="../../Scripts/jQuery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.js"></script>
    <%--<script src="../../Scripts/jquery-1.10.2.min.js"></script>--%>
    <%--<script src="../../Scripts/jquery-3.1.0.js"></script>--%>
    <%--   <script src="../../Scripts/bootstrap.js"></script>--%>
    <%--<link href="../../Styles/custom.css" rel="stylesheet" />--%>

    <%--<link href="../../Styles/font-awesome.css" rel="stylesheet" />--%>
    <script language="javascript">
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


    <br />
    <br />


    <asp:UpdatePanel ID="updCadastro" runat="server">
        <%--      <Triggers>
           <asp:AsyncPostBackTrigger   ControlID="gvSelEstabelec" EventName="RowCommand" />
        </Triggers>--%>
        <ContentTemplate>


            <asp:Panel ID="pnlDados" runat="server">
                <%--   <asp:UpdatePanel ID="uppDados" runat="server">
                    <ContentTemplate>--%>

                <div class="x_panel">
                    <div class="x_title">
                        <h2>Configuração de Bloqueio estabelecimento por UF 
                        </h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <div class="container body">
                            <br />


                            <div class="form-row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                                            <ContentTemplate>
                                                <MsgBox:Mensagem runat="server" ID="MensagemBox" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>Estabelecimento não selecionados </h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnAdcionarEstabelecimentos" Visible="false" data-toggle="tooltip" data-placement="top" OnClick="btnAdcionarEstabelecimentos_Click" title="Adicionar Estabelecimentos" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlEstabelecimentosNaoSelecionado" runat="server" DefaultButton="btnPesquisarNaoSelEstabele">
                                                                <%--  <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                                                            <ContentTemplate>--%>
                                                                <div class="row">

                                                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                                                        <asp:Label ID="lblCodigoEstabNaoSelec" runat="server" Text="Código" />
                                                                        <asp:TextBox ID="txtCodigoEstabNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                    </div>
                                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                                        <asp:Label ID="lblNomeSelecionado" runat="server" Text="Razão Social" />
                                                                        <asp:TextBox ID="txtRazaoEstabNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                    </div>
                                                                    <div class="col-md-4" style="margin-top: 10px;">
                                                                        <asp:LinkButton ID="btnPesquisarNaoSelEstabele" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesquisarNaoSelEstabele_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                        <asp:LinkButton ID="btnLimparNaoSelEstabele" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparNaoSelEstabele_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>

                                                                    </div>

                                                                </div>
                                                                <br />
                                                                <div class="pad-10 mt-2">
                                                                    <br />
                                                                    <asp:HiddenField ID="hdestabelecimentoId" runat="server" />
                                                                    <asp:GridView DataKeyNames="estabelecimentoId, estabelecimentoRazaoSocial,ufId, CNPJ"
                                                                        runat="server"
                                                                        SkinID="GridViewTable"
                                                                        ID="gvNaoSelEstabelec"
                                                                        AutoGenerateColumns="False"
                                                                        AllowPaging="false"
                                                                        OnPageIndexChanging="gvNaoSelEstabelec_PageIndexChanging"
                                                                        EmptyDataText="Não foi encontrado nenhum resultado!"
                                                                        OnRowCommand="gvNaoSelEstabelec_RowCommand"
                                                                        OnRowDataBound="gvNaoSelEstabelec_RowDataBound">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" />
                                                                            <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />
                                                                            <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                            <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" HeaderText="">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="btnADD" runat="server" CommandName="AddEstabelecimento" Width="21px" Height="21px"
                                                                                        ToolTip="Cadastrar Estabelecimento" CommandArgument='<%# Eval("estabelecimentoId") +"|" + Eval("estabelecimentoRazaoSocial")  %>'
                                                                                        ImageUrl="~/Imagens/adicionar.png" />

                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                    </asp:GridView>
                                                                </div>

                                                                <%--                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>--%>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>Estabelecimento selecionados</h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnRemoverEstabelecimentos" Visible="false" runat="server" data-toggle="tooltip" OnClick="btnRemoverEstabelecimentos_Click" data-placement="top" title="Remover Estabelecimentos" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlEstabelecimentosSelecionado" runat="server" DefaultButton="btn_SelEstabelec">
                                                                <%--   <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                                                                            <ContentTemplate>--%>

                                                                <div class="row">

                                                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                                                        <asp:Label ID="lblCodigoEstabSelecionado" runat="server" Text="Código" />
                                                                        <asp:TextBox ID="txtCodigoEstabSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                    </div>

                                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                                        <asp:Label ID="lblEstabRazaoSelecionado" runat="server" Text="Razão Social" />
                                                                        <asp:TextBox ID="txtEstabRazaoSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                    </div>

                                                                    <div class="col-md-4" style="margin-top: 10px;">
                                                                        <asp:LinkButton ID="btn_SelEstabelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btn_SelEstabelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                        <asp:LinkButton ID="btn_LimpaSelEstabelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btn_LimpaSelEstabelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                                <br />
                                                                <div class="pad-10 mt-2">
                                                                    <br />
                                                                    <asp:GridView DataKeyNames="estabelecimentoId,estabelecimentoRazaoSocial,ufId,CNPJ"
                                                                        runat="server"
                                                                        ID="gvSelEstabelec"
                                                                        AutoGenerateColumns="False"
                                                                        AllowPaging="True"
                                                                        SkinID="GridViewTable"
                                                                        OnPageIndexChanging="gvSelEstabelec_PageIndexChanging"
                                                                        OnRowDataBound="gvSelEstabelec_RowDataBound"
                                                                        OnRowCommand="gvSelEstabelec_RowCommand"
                                                                        EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <a href="JavaScript:shrinkandgrow('div<%# Eval("estabelecimentoId")   %>');">
                                                                                        <img alt="Itens" id='imgdiv<%# Eval("estabelecimentoId")  %>' src="../../Imagens/plus.png" />
                                                                                    </a>
                                                                                    <div id='div<%# Eval("estabelecimentoId")  %>' style="display: none;">
                                                                                        <div style="display: table; width: 100%;">
                                                                                            <asp:GridView DataKeyNames="estabelecimentoId"
                                                                                                runat="server"
                                                                                                ID="gvSelUF"
                                                                                                AutoGenerateColumns="False"
                                                                                                PageSize="30"
                                                                                                AllowPaging="False"
                                                                                                SkinID="GridViewTable"
                                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                                    <asp:BoundField DataField="estadoNome" HeaderText="Estado" />
                                                                                                </Columns>
                                                                                                <%--   <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />--%>
                                                                                            </asp:GridView>
                                                                                            <%--     <div class="center">
                                                                                                                <asp:Localize ID="lblgvSelEstabelePageInfo" runat="server"></asp:Localize>
                                                                                                            </div>--%>
                                                                                        </div>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>


                                                                            <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" />
                                                                            <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />
                                                                           <%-- <asp:BoundField DataField="ufId" HeaderText="UF" />--%>
                                                                            <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" HeaderText="">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="btnCadastrarUF" runat="server" CommandName="CadastrarUF" Width="21px" Height="21px"
                                                                                        ToolTip="Cadastrar UF" CommandArgument='<%# Eval("estabelecimentoId") +"|" + Eval("estabelecimentoRazaoSocial")  %>'
                                                                                        ImageUrl="~/Imagens/Map.png" />

                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" HeaderText="">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="Excluir" runat="server" CommandName="ExcluirEstabelecimento" Width="21px" Height="21px"
                                                                                        ToolTip="Excluir Estabelecimento" CommandArgument='<%# Eval("estabelecimentoId") +"|" + Eval("estabelecimentoRazaoSocial")  %>'
                                                                                        ImageUrl="~/Imagens/recycle.png" />

                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                    </asp:GridView>
                                                                    <div class="center">
                                                                        <asp:Localize ID="lblgvSelEstabelePageInfo" runat="server"></asp:Localize>
                                                                    </div>
                                                                </div>
                                                                <%-- </ContentTemplate>
                                                                        </asp:UpdatePanel>--%>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>


    <br />
    <br />



    <div style="position: absolute;">
        <asp:UpdatePanel ID="updModalItemUF" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlModalItemUF" runat="server" CssClass="Modal" Visible="false">
                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 80%; left: 5%; height: 80%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Cadastro de UF por estabelecimento" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFechaItemUF" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png" OnClick="btnFechaItemUF_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <div class="col-md-12 col-sm-12 col-xs-12">

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblDescricaoItemUF" runat="server" Text="Item" />
                                        <asp:TextBox ID="txtDescricaoItemUFModal" runat="server" Enabled="false" SkinID="txtBootstrap3"></asp:TextBox>
                                    </div>
                                </div>
                                </br>
                                 </br>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">

                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>UF não selecionados  </h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnAddUFItens" data-toggle="tooltip" data-placement="top" OnClick="btnAddUFItens_Click" title="Adicionar UF" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlUF" runat="server" DefaultButton="btnPesqUFItensNaoSelec">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                                                    <ContentTemplate>
                                                                        <div class="row">
                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblCodigUFItensNaoSelec" runat="server" Text="Código UF" />
                                                                                <asp:TextBox ID="txtCodigoUFItensNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblDescUFItensNaoSelec" runat="server" Text="Descrição UF" />
                                                                                <asp:TextBox ID="txtDescUFItensNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>
                                                                            <div class="col-md-4" style="margin-top: 10px;">
                                                                                <asp:LinkButton ID="btnPesqUFItensNaoSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqUFItensNaoSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                <asp:LinkButton ID="btnLimparUFItensNaoSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparUFItensNaoSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                        <br />
                                                                        <div class="pad-10 mt-2">
                                                                            <br />
                                                                            <asp:GridView DataKeyNames="ufId,estadoNome"
                                                                                runat="server"
                                                                                ID="gvUFItensNaoSelec"
                                                                                AutoGenerateColumns="False"
                                                                                AllowPaging="True"
                                                                                SkinID="GridViewTable"
                                                                                OnPageIndexChanging="gvUFItensNaoSelec_PageIndexChanging"
                                                                                OnRowDataBound="gvUFItensNaoSelec_RowDataBound"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosNaoSelUFelec" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosNaoSelUFelec_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkNaoSelUFSelec" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelUFSelec_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                    <asp:BoundField DataField="estadoNome" HeaderText="Descrição" />
                                                                                </Columns>
                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>UF selecionados</h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnRemoverUFItens" runat="server" data-toggle="tooltip" OnClick="btnRemoverUFItens_Click" data-placement="top" title="Remover UF" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlUFSelc" runat="server" DefaultButton="btnPesqUFItensSelec">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                                                    <ContentTemplate>
                                                                        <div class="row">
                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblCodigoUFItensSelec" runat="server" Text="Código UF" />
                                                                                <asp:TextBox ID="txtCodigoUFItensSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblDescUFItensSelec" runat="server" Text="Descrição UF" />
                                                                                <asp:TextBox ID="txtDescUFItensSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>
                                                                            <div class="col-md-4" style="margin-top: 10px;">
                                                                                <asp:LinkButton ID="btnPesqUFItensSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqUFItensSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                <asp:LinkButton ID="btnLimparUFItensSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparUFItensSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                        <br />
                                                                        <div class="pad-10 mt-2">
                                                                            <br />
                                                                            <asp:GridView DataKeyNames="ufId,estadoNome"
                                                                                runat="server"
                                                                                ID="gvUFItensSelec"
                                                                                AutoGenerateColumns="False"
                                                                                AllowPaging="True"
                                                                                SkinID="GridViewTable"
                                                                                OnPageIndexChanging="gvUFItensSelec_PageIndexChanging"
                                                                                OnRowDataBound="gvUFItensSelec_RowDataBound"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosSelUF" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelUF_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkSelUF" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelUF_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                    <asp:BoundField DataField="estadoNome" HeaderText="Descrição" />
                                                                                </Columns>
                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                            </asp:GridView>
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
                        </fieldset>
                    </div>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
