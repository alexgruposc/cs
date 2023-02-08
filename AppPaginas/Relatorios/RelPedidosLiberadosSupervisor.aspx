<%@ Page Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelPedidosLiberadosSupervisor.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelPedidosLiberadosSupervisor" %>

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

    <asp:Panel ID="pnlRelPedidosLiberadosSupervisor" runat="server">
        <asp:UpdatePanel ID="uppRelPedidosLiberadosSupervisor" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelPedidosLiberadosSupervisor">
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
                                Relatório Pedidos Liberados Supervisor
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisaMaisCurta">
                                        <asp:Label ID="lblFiltroClienteIdERP" runat="server" Text="Cliente ID ERP"></asp:Label>
                                        <asp:TextBox ID="txtFiltroClienteIdERP" runat="server" SkinID="SmallFilter" MaxLength="30"></asp:TextBox>
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroRazaoSocial" runat="server" Text="Razão Social"></asp:Label><br />
                                        <asp:TextBox ID="txtFiltroRazaoSocial" runat="server" SkinID="SmallFilter" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="boxPesquisaMaisCurta">
                                        <asp:Label ID="lblFiltroItemId" runat="server" Text="Item ID"></asp:Label><br />
                                        <asp:TextBox ID="txtFiltroItemId" runat="server" SkinID="SmallFilter" MaxLength="30"></asp:TextBox>
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroViolacao" runat="server" Text="Possui Violação"></asp:Label>
                                        <asp:DropDownList ID="ddlFiltroViolacao" runat="server" SkinID="DropSmallFilter">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblPeriodo" runat="server" Text="Período"></asp:Label>
                                        <CtlPeriodo:ControlPeriodo ID="ctpPedido" runat="server" ShowHeaderLine="false" />
                                    </div>

                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltrosPesquisar" runat="server" Text="Pesquisar" SkinID="ButtonLeftFind" OnClick="btnFiltrosPesquisar_Click" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" Text="Limpar" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" />
                                        <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                            ImageUrl="~/Imagens/xlsx.png" />
                                    </div>
                                </div>
                        </fieldset>
                    </div>

                     <%-- GRID REGISTROS --%>
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                            <%--<center />--%>
                            <asp:GridView ID="grdPedidosLiberdadosSupervisor" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                OnPageIndexChanging="grdPedidosLiberdadosSupervisor_PageIndexChanging"
                                AutoGenerateColumns="False"
                                AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="pedidoId" HeaderText="Pedido ID" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="Cliente Id ERP" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Razão Social" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="pedidoData" HeaderText="Data Pedido" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="usuarioIdMotivo" HeaderText="Usuário" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="Supervisor" HeaderText="Supervisor" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="MotivoLiberacao" HeaderText="Motivo Liberação" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="itemId" HeaderText="Item Id" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="itemDescricao" HeaderText="Descrição Item" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="PrecoPraticado" HeaderText="Preço Praticado" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="PrecoMinimo" HeaderText="Preço Mínimo" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="PrecoMaximo" HeaderText="Preço Máximo" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="ViolouPrecoMinimo" HeaderText="Violou Preço Mínimo" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ViolouPrecoMaximo" HeaderText="Violou Preço Máximo" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="FretefoiAlterado" HeaderText="Frete Alterado" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ExcecaoEstab" HeaderText="Exceção Estab" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="freteValorPadrao" HeaderText="Frete Padrão" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="freteValorInformado" HeaderText="Frete Informado" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="pedidoSituacao" HeaderText="Situação Pedido" />
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
