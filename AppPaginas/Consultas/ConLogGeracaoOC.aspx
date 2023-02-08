<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConLogGeracaoOC.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConLogGeracaoOC" %>

<%-- CONTOLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>

<%-- NAMESPACE --%>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Utility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="uppLogOC" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvLogOC" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvLogOC" EventName="PageIndexChanging" />
        </Triggers>
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppLogOC">
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <div style="left: 0.5%; width: 99%; height: 100%; position: fixed; overflow-x: none;">
                <fieldset style="left: 0.5%; width: 99%;">
                    <legend>
                        <asp:Literal ID="ltrEmpenhoFiltrosHeader" runat="server" />
                    </legend>
                    <div class="navegacao">
                        <div class="boxPesquisa">
                            <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                TabIndexDataInicio="1" TabIndexDataTermino="2"
                                ShowHeaderLine="false" />
                        </div>
                        <div class="boxPesquisa">
                            <asp:Label ID="lblFiltrosContratoId" runat="server" />
                            <asp:TextBox ID="txtFiltrosContratoId" runat="server" SkinID="SmallFilter" MaxLength="50" />
                        </div>
                        <div class="boxPesquisa">
                            <asp:Label ID="lblFiltrosEmpenhoId" runat="server" />
                            <asp:TextBox ID="txtFiltrosEmpenhoId" runat="server" SkinID="SmallFilter" MaxLength="50" />
                        </div>
                        <div class="boxPesquisa">
                            <asp:Label ID="lblFiltrosClienteIdERP" runat="server" />
                            <asp:TextBox ID="txtFiltrosClienteIdERP" runat="server" SkinID="SmallFilter" MaxLength="20" />
                        </div>
                        <div class="boxPesquisa">
                            <asp:Label ID="lblFiltrosEmpenhoEstabelecimento" runat="server" />
                            <asp:DropDownList ID="ddlFiltrosEmpenhoEstabelecimento" runat="server" SkinID="DropSmallFilter" />
                        </div>
                        <div class="boxPesquisa">
                            <asp:Button ID="btnFiltrosEmpenhoPesquisa" runat="server" SkinID="ButtonLeftFind" OnClick="btnFiltrosEmpenhoPesquisa_Click" />
                            <asp:Button ID="btnFiltrosEmpenhoLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosEmpenhoLimpar_Click" />

                        </div>
                        <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                        <asp:ImageButton ID="btnExport" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                            ImageUrl="~/Imagens/xlsx.png" OnClick="btnExport_Click" />
                    </div>
                    </div>

                    <%-- GRID REGISTROS --%>
                    <asp:Panel ID="pnlGvTabelaLogOC" runat="server">
                        <div style="display: table; width: 99.6%; height: 40%;">
                            <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                                <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">
                                    <center />
                                    <asp:GridView ID="gvLogOC" runat="server"
                                        CssClass="table table-bordered table-striped table-hover"
                                        DataKeyNames="id,nomeArquivo,EmpenhoId,ContratoId,estabelecimentoId,ClienteId,ContratoLicitacaoSeq,TipoPedido,
                                                 ClienteIdFaturamento,usuarioIdLog,dataLog,tipoTransacao,ItemId"
                                        OnRowDataBound="gvLogOC_RowDataBound"
                                        OnPageIndexChanging="gvLogOC_PageIndexChanging"
                                        AutoGenerateColumns="False"
                                        AllowPaging="True">
                                        <Columns>
                                            <asp:BoundField DataField="ItemId" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="nomeArquivo" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="EmpenhoId" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="ContratoId" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="TipoPedido" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="clienteCNPJ" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="ClienteIdFaturamento" ItemStyle-HorizontalAlign="Left" />
                                             <asp:BoundField DataField="clienteCNPJFAT" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="clienteRazaoSocialFAT" ItemStyle-HorizontalAlign="Left" />                                           
                                            <asp:BoundField DataField="usuarioIdLog" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="tipoTransacao" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="dataLog" ItemStyle-HorizontalAlign="Left" />
                                        </Columns>
                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                            </fieldset>
                        </div>
                    </asp:Panel>
                </fieldset>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
