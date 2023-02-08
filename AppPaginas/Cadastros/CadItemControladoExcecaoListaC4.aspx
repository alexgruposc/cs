<%@ Page Title="Itens Controlados Exceção lista C4" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadItemControladoExcecaoListaC4.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadItemControladoExcecaoListaC4" %>

<%@ Register Src="~/AppControles/CtlItem.ascx" TagPrefix="CtlItem" TagName="ControlItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updPrincipal" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnFiltrosIncluir" />
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="pnlGrid" runat="server">
                <div style="height:10px"></div>

                <div id="filters" style="left: 0.5%; width: 99%; height: 20%;">
                    <fieldset>
                        <legend>
                            Itens Controlados Exceção Lista C4
                        </legend>
                        <div id="filtersFields" class="row">
                            <div class="boxPesquisaMaisCurta">
                                <span class="Label">Código</span>
                                <asp:TextBox ID="txtFiltroCodigoProduto" runat="server" MaxLength="30" Style="width: 95%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaCurta">
                                <span class="Label">Nome Produto</span>
                                <asp:TextBox ID="txtFiltroNomeProduto" runat="server" MaxLength="100" Style="width: 95%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaCurta">
                                <span class="Label">Família Comercial</span>
                                <asp:DropDownList ID="ddlFiltroFamiliaComercial" runat="server" SkinID="DropFiltro"></asp:DropDownList>
                            </div>
                            <div class="boxPesquisaCurta">
                                <span class="Label">Família Material</span>
                                <asp:DropDownList ID="ddlFiltroFamiliaMaterial" runat="server" SkinID="DropFiltro"></asp:DropDownList>
                            </div>
                            <div class="boxPesquisaCurta">
                                <span class="Label">Grupo Estoque</span>
                                <asp:DropDownList ID="ddlFiltroGrupoEstoque" runat="server" SkinID="DropFiltro"></asp:DropDownList>
                            </div>
                            <div class="boxPesquisaCurta">
                                <span class="Label">Fabricante</span>
                                <asp:DropDownList ID="ddlFiltroFabricante" runat="server" SkinID="DropFiltro"></asp:DropDownList>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <span class="Label">Classificação Fiscal</span>
                                <asp:DropDownList ID="ddlFiltroClassificacaoFiscal" runat="server" SkinID="DropFiltro"></asp:DropDownList>
                            </div>
                        </div>
                        <div id="filtersButtons" class="row">
                            <div class="col-md-12 text-right">
                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnInfo" Text="Pesquisar" OnClick="btnFiltrosPesquisa_Click" />&nbsp;
                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault" Text="Limpar" OnClick="btnFiltrosLimpar_Click" />&nbsp;
                                <asp:Button ID="btnFiltrosIncluir" runat="server" SkinID="BtnPrimary" Text="Incluir" OnClick="btnFiltrosIncluir_Click" />
                            </div>
                        </div>
                    </fieldset>
                </div>

                <fieldset class="pad-10">
                    <div id="grid" class="gridRegistros">
                        <asp:GridView ID="grdRegistros" runat="server"
                            DataKeyNames="itemId"
                            OnPageIndexChanging="grdRegistros_PageIndexChanging"
                            OnRowCommand="grdRegistros_RowCommand"
                            EmptyDataText="Não foi encontrado nenhum resultado!">
                            <Columns>
                                <asp:BoundField DataField="itemId" HeaderText="Código" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="itemDescricao" HeaderText="Item" />
                                <asp:BoundField DataField="familiaComercialDescricao" HeaderText="Família Comercial" />
                                <asp:BoundField DataField="familiaMaterialDescricao" HeaderText="Família Material" />
                                <asp:BoundField DataField="grupoEstoqueDescricao" HeaderText="Grupo Estoque" />
                                <asp:BoundField DataField="fabricanteNomeAbreviado" HeaderText="Fabricante" />
                                <asp:BoundField DataField="classificacaoFiscalDescricao" HeaderText="Classificação Fiscal" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbCancelar" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblExcluir %>" CommandArgument='<%# Eval("itemId") %>'
                                            ImageUrl="~/Imagens/Fechar.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </fieldset>
            </asp:Panel>

            <asp:Panel ID="pnlDados" runat="server" Visible="false">
                <ContentTemplate>
                    <div id="editButtons" class="form-row">
                        <div class="col-lg-10"></div>
                        <div class="col-lg-2">
                            <asp:Button ID="btnSalvar" runat="server" SkinID="BtnPrimary" Text="Salvar" OnClick="btnSalvar_Click" />
                            <asp:Button ID="btnVoltar" runat="server" SkinID="BtnDefault" Text="Voltar" OnClick="btnVoltar_Click" />
                        </div>
                    </div>

                    <div id="dataForm" class="form-row">
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Incluir Item Controlado Exceção Lista C4</legend>
                                <div class="form-group">
                                    <br />
                                    <CtlItem:ControlItem ID="CtlItem" runat="server"></CtlItem:ControlItem>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
