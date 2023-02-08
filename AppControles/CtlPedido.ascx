<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlPedido.ascx.cs" Inherits="KRAFTSALES.AppControles.CtlPedido" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>

<asp:UpdatePanel ID="uppPedido" runat="server">
    <Triggers>
        <asp:PostBackTrigger ControlID="imbPedidoFind" />
        <asp:PostBackTrigger ControlID="imbPedidoCheck" />
    </Triggers>
    <ContentTemplate>
        <asp:Panel ID="pnlPedido" runat="server" DefaultButton="imbPedidoCheck" CssClass="row">
            <div class="col-sm-4">
                <asp:Label ID="lblPedidoId" runat="server" Text="Pedido" />
                <asp:TextBox ID="txtPedidoId" runat="server" SkinID="Pedido" MaxLength="9" ></asp:TextBox>
                <asp:ImageButton ID="imbPedidoCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/check.png" OnClick="imbPedidoCheck_Click" />
                <asp:ImageButton ID="imbPedidoFind" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/find.png" OnClick="imbPedidoFind_Click" data-bs-toggle="modal" data-bs-target="#ModalSelecionarPedido" />
            </div>
            <div id="divDetalhe" runat="server" class="col-sm-7" >
                <asp:Label ID="lblPedidoDescricao" runat="server" ></asp:Label><br />
                <asp:Label ID="lblPedidoTriangular" runat="server"></asp:Label>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlSelecionar" runat="server" Visible="false" DefaultButton="btnFiltroPesquisa">
            <div class="OpacityBackGround" style="z-index: 0;"></div>
            <div class="painel">
                <div class="painel_header">
                    <div class="painel_header_message">
                        <asp:Label ID="lblPedidoHeader" runat="server" ForeColor="White" Text="Seleção de Pedido" />
                    </div>
                    <div class="alert_header_icon">
                        <asp:ImageButton ID="imbClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                            Height="25px" ImageUrl="~/Imagens/Fechar.png" OnClick="imbClose_Click" />
                    </div>
                </div>
                <div class="painel_body">
                    <fieldset>
                        <legend>Selecionar Pedido</legend>
                        <div class="navegacao">
                            <div class="boxPesquisaMaisCurta">
                                <CtlPeriodo:ControlPeriodo ID="CtlFiltroPeriodo" runat="server" MostraLinha="false"/>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroPedidoId" runat="server" Text="Nº Pedido"></asp:Label>
                                <asp:TextBox ID="txtFiltroPedidoId" runat="server" SkinID="Pedido" MaxLength="9"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroCliente" runat="server" Text="Cliente"></asp:Label>
                                <asp:TextBox ID="txtFiltroCliente" runat="server" SkinID="Filtro" MaxLength="50"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroClienteIdERP" runat="server" Text="ERP"></asp:Label>
                                <asp:TextBox ID="txtFiltroClienteIdERP" runat="server" SkinId="Pedido" MaxLength="10"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroCPF" runat="server" Text="CPF"></asp:Label>
                                <asp:TextBox ID="txtFiltroCPF" runat="server" SkinID="Pedido" MaxLength="11"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroCNPJ" runat="server" Text="CNPJ"></asp:Label>
                                <asp:TextBox ID="txtFiltroCNPJ" runat="server" SkinID="Pedido" MaxLength="14"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                <asp:Label ID="lblFiltroNF" runat="server" Text="NF"></asp:Label>
                                <asp:TextBox ID="txtFiltroNF" runat="server" SkinID="Pedido" MaxLength="12"></asp:TextBox>
                            </div>
                            <div class="boxPesquisa" style="width:600px">
         
                                    <asp:Button ID="btnFiltroPesquisa" runat="server" Text="Pesquisar" SkinID="ButtonLeft"
                                        OnClick="btnFiltroPesquisa_Click" />
                                    <asp:Button ID="btnFiltroLimpar" runat="server" Text="Limpar" SkinID="ButtonRight"
                                        OnClick="btnFiltroLimpar_Click" />
                            </div>
                        </div>
                        <div class="gridRegistros">
                            <asp:GridView ID="grdPedido" runat="server" 
                                 DataKeyNames="pedidoId"
                                 OnPageIndexChanging="grdPedido_PageIndexChanging"
                                 OnRowCommand="grdPedido_RowCommand"
                                 EmptyDataText="Nenhum pedido encontrado" 
                                 EnableTheming="false" CssClass="GridView"
                                 PageSize="8" AllowPaging="true" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="pedidoId" HeaderText="Pedido" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="pedidoData" HeaderText="Data Pedido" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" />
                                    <asp:BoundField DataField="pedidoItemDataReserva" HeaderText="Data da Reserva" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="numeroEmbarque" HeaderText="Embarque" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ItmNumeroNotaFiscal" HeaderText="NF" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ItmNumeroNotaFiscalTriangular" HeaderText="NF Triangular" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="condicaoPagamentoDescricao" HeaderText="Condição de Pagamento" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="pedidoSituacao" HeaderText="Status" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="usuarioNome" HeaderText="Atendente" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="pedidoValorTotal" HeaderText="Valor" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid" Height="25px" Width="25px"
                                                ImageUrl="~/Imagens/check.png" CommandArgument='<%# Eval("pedidoId") %>' />
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
