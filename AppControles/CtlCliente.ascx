<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlCliente.ascx.cs" Inherits="KRAFTSALES.AppControles.CtlCliente" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:UpdatePanel ID="uppCliente" runat="server">
    <Triggers>
        <asp:PostBackTrigger ControlID="imbClienteFind" />
        <asp:PostBackTrigger ControlID="imbClienteCheck" />
    </Triggers>

    <ContentTemplate>
        <asp:Panel ID="pnlCliente" runat="server" DefaultButton="imbClienteCheck" >
            <div style="width: 100%; display: table;">
                <div style="width: 500px; display: table-cell;">
                    <div style="width: 500px; display: table;">
                        <div style="width: 260px; display: table-cell;">
                            <asp:Label ID="lblClienteId" runat="server" Text="Cliente" Width="100px"/>
                            <asp:TextBox ID="txtClienteId" runat="server" SkinID="Pedido" MaxLength="10" />
                            <asp:ImageButton ID="imbClienteCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/check.png" OnClick="imbClienteCheck_Click" />
                            <asp:ImageButton ID="imbClienteFind" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/find.png" OnClick="imbClienteFind_Click" data-bs-toggle="modal" data-bs-target="#ModalSelecionarCliente" />
                        </div>
                        <div style="width: 240px; display: table-cell;">
                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 240px;">
                                <asp:Label ID="lblClienteDescricao" runat="server" SkinID="LabelResposta"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: auto; display: table-cell; display: block;">
                    <asp:Panel ID="pnlEndereco" runat="server">
                        <asp:Label ID="lblTipoEndereco" runat="server" Text="Tipo de Endereço"></asp:Label>
                        <asp:DropDownList ID="dplTipoEndereco" runat="server" SkinID="DropFiltro" AutoPostBack="true" Enabled="false" OnSelectedIndexChanged="dplTipoEndereco_SelectedIndexChanged"></asp:DropDownList>
                        <asp:Label ID="lblCidadeSelecionada" runat="server"></asp:Label>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlSelecionar" runat="server" Visible="false" DefaultButton="btnFiltroPesquisa">
            <div class="OpacityBackGround" style="z-index: 0;"></div>
            <div class="painel">
                <div class="painel_header">
                    <div class="painel_header_message">
                        <asp:Label ID="lblClienteHeader" runat="server" ForeColor="White" />
                    </div>
                    <div class="alert_header_icon">
                        <asp:ImageButton ID="imbClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                            Height="25px" ImageUrl="~/Imagens/Fechar.png" OnClick="imbClose_Click" />
                    </div>
                </div>
                <div class="painel_body">
                    <fieldset>
                        <legend>Selecionar Cliente</legend>
                        <div class="navegacao">
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroClienteId" runat="server" Text="Código"></asp:Label>
                                <asp:TextBox ID="txtFiltroClienteId" runat="server" SkinID="Filtro" MaxLength="30"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroClienteIdERP" runat="server" Text="Código ERP"></asp:Label>
                                <asp:TextBox ID="txtFiltroClienteIdERP" runat="server" SkinID="Filtro" MaxLength="30"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroClienteCPF" runat="server" Text="CPF"></asp:Label>
                                <asp:TextBox ID="txtFiltroCPF" runat="server" SkinID="Filtro" MaxLength="11"></asp:TextBox>
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroNome" runat="server" Text="Nome"></asp:Label><br />
                                <asp:TextBox ID="txtFiltroNome" runat="server" SkinID="Filtro" MaxLength="50"></asp:TextBox>
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
                            <asp:GridView ID="grdCliente" runat="server" 
                                DataKeyNames="clienteId" 
                                OnPageIndexChanging="grdCliente_PageIndexChanging" 
                                OnRowCommand="grdCliente_RowCommand"
                                EmptyDataText="Nenhum cliente encontrado" 
                                EnableTheming="false" CssClass="GridView"
                                PageSize="8" AllowPaging="true" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="clienteId" HeaderText="Código" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" />
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Razão Social" />
                                    <asp:BoundField DataField="clienteCPF" HeaderText="CPF" />
                                    <asp:BoundField DataField="representanteNome" HeaderText="Representante" />
                                    <asp:BoundField DataField="clienteGrupoComercialNome" HeaderText="Grupo" />
                                    <asp:BoundField DataField="canalVendaDescricao" HeaderText="Canal de Vendas"/>
                                    <asp:BoundField DataField="clienteTipoCredito" HeaderText="Tipo de Crédito" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid" Height="25px" Width="25px"
                                                ImageUrl="~/Imagens/check.png" CommandArgument='<%# Eval("clienteId") %>' />
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

