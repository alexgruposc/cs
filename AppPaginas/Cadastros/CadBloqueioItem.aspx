<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadBloqueioItem.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadBloqueioItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="updGridsDados" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlDados" runat="server">
                <asp:UpdatePanel ID="uppDados" runat="server">
                    <ContentTemplate>
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Configuração Bloqueio Itens
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
                                                            <h2>Itens não selecionados  </h2>
                                                            <div class="nav navbar-right panel_toolbox">
                                                                <asp:LinkButton ID="btnAdicionarItens" data-toggle="tooltip" data-placement="top" OnClick="btnAdicionarItens_Click" title="Adicionar Itens" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="x_content">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="demo-container">
                                                                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnPesqItemNaoSelec">
                                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                                                            <ContentTemplate>
                                                                                <div class="row">
                                                                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                        <asp:Label ID="lblCodigoItemNaoSelec" runat="server" Text="Código Item" />
                                                                                        <asp:TextBox ID="txtCodigoItemNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                                    </div>

                                                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                        <asp:Label ID="lblDescItemNaoSelec" runat="server" Text="Descrição" />
                                                                                        <asp:TextBox ID="txtDescItemNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                    </div>

                                                                                    <div class="col-md-4" style="margin-top: 10px;">
                                                                                        <asp:LinkButton ID="btnPesqItemNaoSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqItemNaoSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                        <asp:LinkButton ID="btnLimparItemNaoSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparItemNaoSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                    </div>

                                                                                </div>
                                                                                <br />
                                                                                <div class="pad-10 mt-2">
                                                                                    <br />
                                                                                    <asp:GridView DataKeyNames="itemId, itemDescricao, itemInfComplementar"
                                                                                        runat="server"
                                                                                        ID="gvItensNaoSelecionados"
                                                                                        AutoGenerateColumns="False"
                                                                                        AllowPaging="True"
                                                                                        SkinID="GridViewTable"
                                                                                        OnPageIndexChanging="gvItensNaoSelecionados_PageIndexChanging"
                                                                                        OnRowDataBound="gvItensNaoSelecionados_RowDataBound"
                                                                                        EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                        <Columns>
                                                                                            <asp:TemplateField>
                                                                                                <HeaderTemplate>
                                                                                                    <asp:CheckBox ID="chkTodosItensNaoSel" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosItensNaoSel_CheckedChanged" />
                                                                                                </HeaderTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:CheckBox ID="chkNaoSelItens" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelItens_CheckedChanged" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField DataField="itemId" HeaderText="Código" />
                                                                                            <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />
                                                                                            <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />
                                                                                        </Columns>
                                                                                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                    </asp:GridView>
                                                                                    <div class="center">
                                                                                        <asp:Localize ID="Localize1" runat="server"></asp:Localize>
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
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="x_panel">
                                                        <div class="x_title">
                                                            <h2>Itens selecionados</h2>
                                                            <div class="nav navbar-right panel_toolbox">
                                                                <asp:LinkButton ID="btnRemoverItens" runat="server" data-toggle="tooltip" OnClick="btnRemoverItens_Click" data-placement="top" title="Remover Itens" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="x_content">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="demo-container">
                                                                    <asp:Panel ID="pnlItensSelecionados" runat="server" DefaultButton="btnPesqItemSelec">
                                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                                                                            <ContentTemplate>
                                                                                <div class="row">
                                                                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                        <asp:Label ID="lblCodigoItemSelec" runat="server" Text="Código Item" />
                                                                                        <asp:TextBox ID="txtCodigoItemSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                                    </div>

                                                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                        <asp:Label ID="lblDescItemSelec" runat="server" Text="Descrição" />
                                                                                        <asp:TextBox ID="txtDescItemSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                    </div>

                                                                                    <div class="col-md-4" style="margin-top: 10px;">
                                                                                        <asp:LinkButton ID="btnPesqItemSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesqItemSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                        <asp:LinkButton ID="btnLimparItemSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparItemSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                    </div>

                                                                                </div>
                                                                                <br />
                                                                                <div class="pad-10 mt-2">
                                                                                    <br />
                                                                                    <asp:GridView DataKeyNames="itemId,itemDescricao,itemInfComplementar"
                                                                                        runat="server"
                                                                                        ID="gvItensSelecionados"
                                                                                        AutoGenerateColumns="False"
                                                                                        AllowPaging="True"
                                                                                        SkinID="GridViewTable"
                                                                                        OnPageIndexChanging="gvItensSelecionados_PageIndexChanging"
                                                                                        OnRowDataBound="gvItensSelecionados_RowDataBound"
                                                                                        EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                        <Columns>
                                                                                            <asp:TemplateField>
                                                                                                <HeaderTemplate>
                                                                                                    <asp:CheckBox ID="chkTodosItensSel" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosItensSel_CheckedChanged" />
                                                                                                </HeaderTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:CheckBox ID="chkSelItens" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelItens_CheckedChanged" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField DataField="itemId" HeaderText="Código" />
                                                                                            <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />
                                                                                            <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />

                                                                                        </Columns>
                                                                                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                    </asp:GridView>
                                                                                    <div class="center">
                                                                                        <asp:Localize ID="Localize2" runat="server"></asp:Localize>
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
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
