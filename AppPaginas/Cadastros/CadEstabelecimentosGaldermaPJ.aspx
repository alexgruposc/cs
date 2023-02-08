<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadEstabelecimentosGaldermaPJ.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEstabelecimentosGaldermaPJ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script src="../../Scripts/jquery-1.10.2.min.js"></script>--%>
    <script src="../../Scripts/jquery-3.1.0.js"></script>
    <%--   <script src="../../Scripts/bootstrap.js"></script>--%>
    <link href="../../Styles/custom.css" rel="stylesheet" />

    <link href="../../Styles/font-awesome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updCadastro" runat="server">
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updCadastro">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <asp:Panel ID="pnlDados" runat="server">


                <div class="x_panel">
                    <div class="x_title">
                        <h2>Configuração Estabelecimentos Galderma PJ
                        </h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="container body">
                            <br />

                            <div class="form-row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>Estabelecimento não selecionados </h2>
                                                    <div class="nav navbar-right panel_toolbox">

                                                        <asp:LinkButton ID="btnAdcionarEstabelecimentos" data-toggle="tooltip" data-placement="top" OnClick="btnAdcionarEstabelecimentos_Click" title="Adicionar Estabelecimentos" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>

                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlEstabelecimentosNaoSelecionado" runat="server" DefaultButton="btnPesquisarNaoSelEstabele">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                                                    <ContentTemplate>
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
                                                                            <asp:GridView DataKeyNames="estabelecimentoId, estabelecimentoRazaoSocial,ufId, CNPJ"
                                                                                runat="server"
                                                                                SkinID="GridViewTable"
                                                                                ID="gvNaoSelEstabelec"
                                                                                AutoGenerateColumns="False"
                                                                                AllowPaging="false"
                                                                                OnPageIndexChanging="gvNaoSelEstabelec_PageIndexChanging"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!"
                                                                                OnRowDataBound="gvNaoSelEstabelec_RowDataBound">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosNaoSelEstabelec" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosNaoSelEstabelec_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkNaoSelEstabelec" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelEstabelec_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" />
                                                                                    <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />
                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                    <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                                                                </Columns>
                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                            </asp:GridView>
                                                                            <%--<div class="center">
                                                                                                    <asp:Localize ID="lblgvSelEstabelecPageInfo" runat="server"></asp:Localize>
                                                                                                </div>--%>
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
                                                    <h2>Estabelecimento selecionados</h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnRemoverEstabelecimentos" runat="server" data-toggle="tooltip" OnClick="btnRemoverEstabelecimentos_Click" data-placement="top" title="Remover Estabelecimentos" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlEstabelecimentosSelecionado" runat="server" DefaultButton="btn_SelEstabelec">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                                                    <ContentTemplate>
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
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosSelEstabele" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelEstabele_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkSelEstabelec" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelEstabelec_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" />
                                                                                    <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />
                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                                                                    <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />

                                                                                </Columns>
                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                            </asp:GridView>
                                                                            <div class="center">
                                                                                <asp:Localize ID="lblgvSelEstabelePageInfo" runat="server"></asp:Localize>
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



                        </div>
                    </div>
                </div>

            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
