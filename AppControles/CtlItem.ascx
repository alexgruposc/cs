<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlItem.ascx.cs" Inherits="KRAFTSALES.AppControles.CtlItem" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:UpdatePanel ID="uppItem" runat="server">
    <Triggers>
        <asp:PostBackTrigger ControlID="imbItemFind" />
        <asp:PostBackTrigger ControlID="imbItemCheck" />
    </Triggers>

    <ContentTemplate>
        <asp:Panel ID="pnlItem" runat="server" DefaultButton="imbItemCheck">
            <asp:Label ID="lblItemId" runat="server" Width="100px" Text="Item" />
            <asp:TextBox ID="txtItemId" runat="server" SkinID="Pedido" MaxLength="50" />
            <asp:ImageButton ID="imbItemCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/check.png" OnClick="imbItemCheck_Click" />
            <asp:ImageButton ID="imbItemFind" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/find.png" OnClick="imbItemFind_Click" data-bs-toggle="modal" data-bs-target="#ModalSelecionarItem" />
            <asp:TextBox ID="txtItemDescricao" runat="server" SkinID="Filtro" ReadOnly="true"></asp:TextBox>
        </asp:Panel>

        <asp:Panel ID="pnlSelecionar" runat="server" Visible="false" DefaultButton="btnFiltroPesquisa">
            <div class="OpacityBackGround" style="z-index: 0;"></div>
            <div class="painel">
                <div class="painel_header">
                    <div class="painel_header_message">
                        <asp:Label ID="lblItemHeader" runat="server" ForeColor="White" />
                    </div>
                    <div class="alert_header_icon">
                        <asp:ImageButton ID="imbClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                            Height="25px" ImageUrl="~/Imagens/Fechar.png" OnClick="imbClose_Click" />
                    </div>
                </div>
                <div class="painel_body">
                    <fieldset>
                        <legend>
                            Selecionar Item
                        </legend>
                        <div class="navegacao">
                            <div class="boxPesquisaCurta">
                                <label class="label">Código</label><br />
                                <asp:TextBox ID="txtFiltroCodigo" runat="server" SkinID="Filtro" MaxLength="30"></asp:TextBox>
                            </div>
                            <div class="boxPesquisa">
                                <label class="label">Descrição</label><br />
                                <asp:TextBox ID="txtFiltroDescricao" runat="server" SkinID="Filtro"></asp:TextBox>
                            </div>
                            <div class="boxPesquisa">
                                <label class="label">Família Material</label><br />
                                <asp:DropDownList ID="ddlFiltroFamiliaMaterial" runat="server" SkinID="DropFiltro"
                                    OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" AutoPostBack="true" />
                            </div>
                            <div class="boxPesquisa">
                                <label class="label">Família Comercial</label><br />
                                <asp:DropDownList ID="ddlFiltroFamiliaComercial" runat="server" SkinID="DropFiltro" 
                                    OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" AutoPostBack="true" />
                            </div>
                            <div class="boxPesquisa">
                                <label class="label">Grupo Estoque</label><br />
                                <asp:DropDownList ID="ddlFiltroGrupoEstoque" runat="server" SkinID="DropFiltro" 
                                    OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>
                            <div class="boxPesquisa">
                                <label class="label">Fabricante</label><br />
                                <asp:DropDownList ID="ddlFiltroFabricante" runat="server" SkinID="DropFiltro"
                                    OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" AutoPostBack="true" />
                            </div>

                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltroPesquisa" runat="server" Text="Pesquisar" SkinID="ButtonLeft"
                                        OnClick="btnFiltroPesquisa_Click" />
                                    <asp:Button ID="btnFiltroLimpar" runat="server" Text="Limpar" SkinID="ButtonRight"
                                        OnClick="btnFiltroLimpar_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="gridRegistros">
                            <asp:GridView ID="grdItem" runat="server"
                                DataKeyNames="itemId"
                                OnPageIndexChanging="grdItem_PageIndexChanging"
                                OnRowCommand="grdItem_RowCommand" 
                                EmptyDataText="Nenhum item encontrado" 
                                EnableTheming="false" CssClass="GridView"
                                PageSize="8" AllowPaging="true" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="itemId" HeaderText="Item" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                                    <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                    <asp:BoundField DataField="unidadeMedidaSigla" HeaderText="Unidade Medida" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                                    <asp:BoundField DataField="familiaComercialDescricao" HeaderText="Família Comercial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                    <asp:BoundField DataField="familiaMaterialDescricao" HeaderText="Família Material" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                    <asp:BoundField DataField="grupoEstoqueDescricao" HeaderText="Grupo Estoque" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                    <asp:BoundField DataField="fabricanteNome" HeaderText="Fabricante" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                    <asp:BoundField DataField="classificacaoFiscalDescricao" HeaderText="Classificaão Fiscal" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid" Height="25px" Width="25px"
                                                ImageUrl="~/Imagens/check.png" CommandArgument='<%# Eval("itemId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </div>
            </div>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
