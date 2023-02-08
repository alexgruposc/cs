<%@ Page Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelPedidosFidelizePF.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelPedidosFidelizePF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- CONTROLE --%>
    <%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
    <%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
    <%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
    <%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <%-- NAMESPACES --%>
    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlRelPedidosPJPF" runat="server">
        <asp:UpdatePanel ID="uppRelPedidosPJPF" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelPedidosPJPF">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlFiltros" runat="server" Height="100%" DefaultButton="btnFiltrosPesquisar">
                    <div style="height:10px"></div>
                    <%-- BACKGROUND - BODY --%>
                    <div style="left: 0.5%; width: 99%; height: 20%;">
                        <fieldset style="left: 0.5%; width: 99%;">
                            <legend>
                                Relatório Pedidos Fidelize PF
                            </legend>
                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblPeriodo" runat="server" Text="Período"></asp:Label>
                                        <CtlPeriodo:ControlPeriodo ID="ctpPedido" runat="server" ShowHeaderLine="false" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroPedidoId" runat="server" Text='<%$ Resources:Resource, lblNumeroPedido %>' />
                                        <asp:TextBox ID="txtFiltroPedidoId" runat="server" SkinID="Size70" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroCliente" runat="server" Text='<%$ Resources:Resource, lblCliente %>'/>
                                        <asp:TextBox ID="txtFiltroCliente" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroClienteIdErp" runat="server" Text='<%$ Resources:Resource, lblCodigoERP %>' />
                                        <asp:TextBox ID="txtFiltroClienteIdErp" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>
                                    <div id="dvCpfFiltro" runat="server" class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroClienteCpf" runat="server" Text='<%$ Resources:Resource, lblCpf %>' />
                                        <asp:TextBox ID="txtFiltroClienteCpf" runat="server" SkinID="SmallFilter" MaxLength="14" />
                                    </div>
                                    <div id="dvTelefone" runat="server" class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroClienteTelefone" runat="server" Text='<%$ Resources:Resource, lblFone %>'/>
                                        <asp:TextBox ID="txtFiltroClienteTelefone" runat="server" SkinID="SmallFilter" MaxLength="20" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltroEstabelecimento" runat="server" Text='<%$ Resources:Resource, lblClienteEstabelecimento %>' />
                                        <asp:DropDownList ID="ddlFiltroEstabelecimento" runat="server" SkinID="DropSmallFilter" />
                                    </div>
                                    <div id="divFiltroPedidoItem" runat="server" class="boxPesquisa">
                                        <asp:Label ID="lblFiltroPedidoItem" runat="server" Text='<%$ Resources:Resource, lblItem %>' />
                                        <asp:DropDownList ID="ddlFiltroPedidoItem" runat="server" SkinID="DropSmallFilter" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltrosPesquisar" runat="server" Text="Pesquisar" SkinID="ButtonLeftFind" OnClick="btnFiltrosPesquisar_Click" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" Text="Limpar" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" />
                                        <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                            ImageUrl="~/Imagens/xlsx.png" />
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                     <%-- GRID REGISTROS --%>
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                            <center />
                            <asp:GridView ID="grdPedidosFidelizePF" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                AllowPaging="True" 
                                AutoGenerateColumns="true"
                                DataKeyNames="pedidoId"
                                OnPageIndexChanging="grdPedidosFidelizePF_PageIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="pedidoData" HeaderText="Data Pedido" DataFormatString="{0:dd/MM/yyyy hh:mm}" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="pedidoId" HeaderText="Nº Pedido" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="tipoPedidoId" HeaderText="Tipo" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="estabelecimentoId" HeaderText="Estabelecimento Id" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Estabelecimento" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="ERP" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="clienteId" HeaderText="Cliente Id" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" />
                                    <asp:BoundField DataField="OperadoraFidelize" HeaderText="Operadora Fidelize" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="operadoraDescricao" HeaderText="Operadora" />
                                    <asp:BoundField DataField="itemId" HeaderText="Id Produto" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="itemDescricao" HeaderText="Nome Produto"/>
                                    <asp:BoundField DataField="fabricanteNome" HeaderText="Nome Fabricante" />
                                    <asp:BoundField DataField="notaFiscalNumero" HeaderText="N° NF" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="notaFiscalSerie" HeaderText="Série NF" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="OrderIdFidelize" HeaderText="Order Id Fidelize" ItemStyle-HorizontalAlign="Center"/>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>