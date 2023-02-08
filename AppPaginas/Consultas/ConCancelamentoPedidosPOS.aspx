<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConCancelamentoPedidosPOS.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConCancelamentoPedidosPOS" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .Grid td {
            background-color: #A1DCF2;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .Grid th {
            background-color: #3AC0F2;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid td {
            background-color: #eee !important;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid th {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "../../Imagens/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "../../Imagens/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
    <asp:UpdatePanel ID="uppPedidoPOS" runat="server" UpdateMode="Conditional">
        <Triggers>
                <asp:PostBackTrigger ControlID="btnExport" />
            </Triggers>
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppPedidoPOS">
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <fieldset style="left: 0.5%; width: 99%; height: 50%;">
                <legend>
                    <asp:Literal ID="ltrTitulo" runat="server" Text="Lista de pedidos" />
                </legend>
                <asp:Panel ID="pnlFiltros" runat="server" SkinID="PnlMenu">
                    <div class="boxPesquisa">
                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                            ShowHeaderLine="false" />
                    </div>
                    <div class="boxPesquisaCurta">
                        <asp:Label ID="lblPedidoId" runat="server" />
                        <asp:TextBox ID="txtPedidoId" runat="server" TabIndex="3" SkinID="Size70" />
                    </div>
                    <div class="boxPesquisaCurta">
                        <asp:Label ID="lblpedidoPos" runat="server" />
                        <asp:TextBox ID="txtPedidoPos" runat="server" MaxLength="30" TabIndex="4" SkinID="SmallFilter" />
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
                <asp:Panel ID="pnlGvTabelaPedidoPOS" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">


                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">
                                <center />
                                <asp:GridView ID="gvPedidoPOS" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="pedidoId,id"
                                    OnRowDataBound="gvPedidoPOS_RowDataBound"
                                    OnPageIndexChanging="gvPedidoPOS_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <img alt="" style="cursor: pointer" src="../../Imagens/plus.png" />
                                                <asp:Panel ID="pnlIntencoes" runat="server" Style="display: none">
                                                    <asp:GridView ID="gvIntencoes"
                                                        DataKeyNames="intencaoVendaStatusId"
                                                        OnRowDataBound="gvIntencoes_RowDataBound"
                                                        OnRowCommand="gvIntencoes_RowCommand"
                                                        runat="server"
                                                        AutoGenerateColumns="false"
                                                        CssClass="ChildGrid">
                                                        <Columns>
                                                            <asp:BoundField DataField="id" HeaderText="intenção Id" />
                                                            <asp:BoundField DataField="token" HeaderText="Token" />
                                                            <asp:BoundField DataField="valorFinal" HeaderText="Total" />
                                                            <asp:BoundField DataField="quantidadeParcelas" HeaderText="QTD Parcelas" />
                                                            <asp:BoundField DataField="intencaoVendaStatusnome" HeaderText="Status" />
                                                            <asp:BoundField DataField="nsuTid" HeaderText="NSU TID" />
                                                            <asp:BoundField DataField="trnNsu" HeaderText="TRN NSU" />
                                                            <asp:BoundField DataField="autorizacao" HeaderText="Autorização" />
                                                            <asp:BoundField DataField="adquirente" HeaderText="Adquirente" />
                                                            <asp:BoundField DataField="bandeira" HeaderText="Bandeira" />
                                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imbDelete" runat="server" SkinID="ImgGrid" CommandName="CancelarIntencao"
                                                                        ImageUrl="~/Imagens/Fechar.png"
                                                                        ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                        CommandArgument='<%# Eval("pedidoId") + "|" + Eval("id") + "|" + Eval("pedido") + "|" +  ((GridViewRow)Container).RowIndex %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                            </asp:TemplateField>

                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" HeaderText="Nº PEDIDO" />
                                        <asp:BoundField DataField="pedidoData" ItemStyle-HorizontalAlign="Center" HeaderText="DATA PEDIDO" />
                                        <asp:BoundField DataField="id" ItemStyle-HorizontalAlign="Center" HeaderText="Nº PEDIDO POS" />
                                        <asp:BoundField DataField="referencia" ItemStyle-HorizontalAlign="Center" HeaderText="referência" />
                                        <asp:BoundField DataField="pedidoStatus" ItemStyle-HorizontalAlign="Center" HeaderText="STATUS" />
                                        <asp:BoundField DataField="valorFormat" ItemStyle-HorizontalAlign="Center" HeaderText="VALOR" />
                                        <asp:BoundField DataField="valorAbertoFormat" ItemStyle-HorizontalAlign="Center" HeaderText="VALOR ABERTO" />
                                        <asp:BoundField DataField="valorOriginalPagoFormat" ItemStyle-HorizontalAlign="Center" HeaderText="VALOR ORIGINAL PAGO" />
                                        <asp:BoundField DataField="valorOriginalEmPagamentoFormat" ItemStyle-HorizontalAlign="Center" HeaderText="VALOR ORIGINAL EM PAGAMENTO" />
                                        <asp:BoundField DataField="quantidade" ItemStyle-HorizontalAlign="Center" HeaderText="QTD" />
                                        <asp:BoundField DataField="obs" ItemStyle-HorizontalAlign="Center" HeaderText="OBS" />

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
