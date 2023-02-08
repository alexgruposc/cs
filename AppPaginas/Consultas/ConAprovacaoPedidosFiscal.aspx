<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConAprovacaoPedidosFiscal.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConAprovacaoPedidosFiscal" %>


<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updAprovacaoPedidos" runat="server">
         <Triggers>
                <asp:PostBackTrigger ControlID="btnExport" />
            </Triggers>
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updAprovacaoPedidos">
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <fieldset style="left: 0.5%; width: 99%; height: 50%;">
                <legend>
                    <asp:Literal ID="ltrTitulo" runat="server" Text="<%$ Resources:Resource, lblConsultaPedidosFiscal %>" />
                </legend>
                <asp:Panel ID="pnlFiltros" runat="server" SkinID="PnlMenu">
                    <div class="boxPesquisa">
                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                            ShowHeaderLine="false" />
                    </div>
               
                    <div class="boxPesquisaCurta">
                        <asp:Label ID="lblFiltroPedidoId" runat="server" />
                        <asp:TextBox ID="txtFiltroPedidoId" runat="server" TabIndex="3" SkinID="Size70" />
                    </div>
                    <div class="boxPesquisaCurta">
                        <asp:Label ID="lblFiltroSituacao" runat="server" />
                        <asp:DropDownList ID="ddFiltroSituacao" runat="server" SkinID="DropSmallFilter" TabIndex="14" />
                    </div>
                    <div id="dvEmissor" runat="server" visible="true" class="boxPesquisa">
                        <asp:Label ID="lblFiltrosPedidoEmissor" runat="server" />
                        <asp:DropDownList ID="ddlFiltrosPedidoAprovador" runat="server" SkinID="DropSmallFilter" TabIndex="15" />
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
                <asp:Panel ID="pnlGvTabelaPedidos" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">
                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">
                                <center />
                                <asp:GridView ID="gvPedidoAprovados" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="logId, pedidoId, usuarioId, Data, StatusPedidoAnterior, StatusPedidoAtual"
                                    OnRowDataBound="gvPedidoAprovados_RowDataBound"
                                    OnPageIndexChanging="gvPedidoAprovados_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="Data" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="StatusPedidoAnterior" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="StatusPedidoAtual" ItemStyle-HorizontalAlign="Left" />                                         
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
