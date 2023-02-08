<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConRelatorioPedidoOL.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConRelatorioPedidoOL" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="uppSimuladorImportacao" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvPedidoOL" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvPedidoOL" EventName="PageIndexChanging" />
        </Triggers>
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppSimuladorImportacao">
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <fieldset style="left: 0.5%; width: 99%; height: 50%;">
                <legend>
                    <asp:Literal ID="ltrTitulo" runat="server" Text="<%$ Resources:Resource, lblCarregarTabela %>" />
                </legend>
                <asp:Panel ID="pnlFiltros" runat="server" SkinID="PnlMenu">
                    <div class="boxPesquisa">
                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                            ShowHeaderLine="false" />
                    </div>
                    <div class="boxPesquisaCurta">
                        <asp:Label ID="lblProduto" runat="server" />
                        <asp:TextBox ID="txtProduto" runat="server" TabIndex="3" SkinID="Size70" />
                    </div>
                    <div class="boxPesquisaCurta">
                        <asp:Label ID="lblCliente" runat="server" />
                        <asp:TextBox ID="txtCliente" runat="server" MaxLength="30" TabIndex="4" SkinID="SmallFilter" />
                    </div>
                    <div class="boxPesquisaCurta">
                        <asp:Label ID="lblFabricante" runat="server" />
                        <asp:TextBox ID="txtFabricante" runat="server" MaxLength="30" TabIndex="4" SkinID="SmallFilter" />
                    </div>
                    <div class="boxPesquisa">
                        <asp:Button ID="btnPesquisar" runat="server" SkinID="ButtonLeftFind" TabIndex="20"
                            OnClick="btnPesquisar_Click" />
                        <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonCenterClean" TabIndex="21"
                            OnClick="btnLimpar_Click" />
                    </div>
                    <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                        <asp:ImageButton ID="btnExport" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                            ImageUrl="~/Imagens/xlsx.png" OnClick="btnExport_Click" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlGvTabelaPedidoOL" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">
                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">
                                <center />
                                <asp:GridView ID="gvPedidoOL" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="pedidoId, pedidoData, clienteCNPJ, clienteRazaoSocial, itemId, itemDescricao,itemInfComplementar
                                    ,itemPrecoFabrica,itemDescontoComercial,itemDescontoIndustria,itemDescontoFinIndustria,itemDescontoFinanceiro"
                                    OnRowDataBound="gvPedidoOL_RowDataBound"
                                    OnPageIndexChanging="gvPedidoOL_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="pedidoData" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="clienteCNPJ" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemInfComplementar" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemPrecoFabrica" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemDescontoComercial" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemDescontoIndustria" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemDescontoFinIndustria" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemDescontoFinanceiro" ItemStyle-HorizontalAlign="Left" />
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


