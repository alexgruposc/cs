<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConExportacaoXMLNotas.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConExportacaoXMLNotas" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .GridPager a {
            margin: 3px;
            color: #ffffff;
        }

            .GridPager a:hover, .GridPager a:active {
                color: #00ffff;
            }

            .GridPager a:visited {
                color: #e4e4e4;
            }

        .GridPager td, .GridPager span {
            margin: 3px;
            color: #00ffff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="uppExportacao" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvNota" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvNota" EventName="PageIndexChanging" />
        </Triggers>
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppExportacao">
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
                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoNota" runat="server"
                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                            ShowHeaderLine="false" />
                    </div>
                    <div class="boxPesquisaCurta">
                        <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                        <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" TabIndex="12" SkinID="DropSmallFilter" />
                    </div>
                    <div class="boxPesquisa">
                        <asp:Label ID="lblFiltroFabricante" runat="server" />
                        <asp:DropDownList ID="ddFabricante" runat="server" SkinID="DropFiltro" TabIndex="3" />
                    </div>
                    <div class="boxPesquisa">
                        <asp:Button ID="btnPesquisar" runat="server" SkinID="ButtonLeftFind" TabIndex="20"
                            OnClick="btnPesquisar_Click" />
                        <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonCenterClean" TabIndex="21"
                            OnClick="btnLimpar_Click" />
                    </div>
                    <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                        <asp:ImageButton ID="btnExport" runat="server" Width="40px" Height="40px" ImageAlign="AbsMiddle"
                            ToolTip="Exportar itens selecionados para XML!"
                            ImageUrl="~/Imagens/xmlex.png" OnClick="btnExport_Click" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlGvTabelaPedidoOL" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">
                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">
                                <center />
                                <asp:GridView ID="gvNota" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="nr_nota_fis,serie,cod_estabel"
                                    OnRowDataBound="gvNota_RowDataBound"
                                    OnPageIndexChanging="gvNota_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkAll"
                                                    AllowPaging="true"
                                                    AllowSorting="true"
                                                    CssClass="flat"
                                                    runat="server"
                                                    OnCheckedChanged="chkAll_CheckedChanged" AutoPostBack="true" />
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" CssClass="flat" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="nr_nota_fis" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="serie" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="cod_estabel" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="dt_emis_nota" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>

                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvNotaPageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

