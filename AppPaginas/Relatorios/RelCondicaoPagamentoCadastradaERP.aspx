<%@ Page Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelCondicaoPagamentoCadastradaERP.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelCondicaoPagamentoCadastradaERP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- CONTROLE --%>
    <%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
    <%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

    <%-- NAMESPACES --%>
    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlRelatorioCondicaoPagamentoCadastradaERP" runat="server">
        <asp:UpdatePanel ID="uppRelatorioCondicaoPagamentoCadastradaERP" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
            </Triggers>

            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelatorioCondicaoPagamentoCadastradaERP">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlFiltros" runat="server" Height="100%" DefaultButton="btnFiltorsPesquisar">
                    <div style="height:10px"></div>
                    <%-- BACKGROUND - BODY --%>
                    <div style="left: 0.5%; width: 99%; height: 20%;">
                        <fieldset style="left: 0.5%; width: 99%;">

                            <legend>
                                Relatório Condições de Pagamento Cadastradas no ERP
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroCliente" runat="server" />
                                        <asp:TextBox ID="txtFiltroCliente" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>

                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroClienteIdErp" runat="server" />
                                        <asp:TextBox ID="txtFiltroClienteIdErp" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>

                                    <div class="boxPesquisaCurta">
                                        <asp:Label runat="server" ID="lblCondicaoPagamento" Text="Condição Pagamento" />
                                        <asp:TextBox runat="server" ID="txtFiltroCondicaoPagamento" MaxLength="50" SkinID="SmallFilter" />
                                    </div>

                                    <div class="boxPesquisaCurta" >
                                        <asp:Label ID="lblOrdem" runat="server" Text="Ordenação" />
                                        <asp:DropDownList runat="server" ID="ddlOrdem" Width="200px">
                                            <asp:ListItem Text="Cliente Id" Selected="True" Value="clienteId"/>
                                            <asp:ListItem Text="Cliente Id ERP" Value="clienteIdERP" />
                                            <asp:ListItem Text="Razão Social" Value="clienteRazaoSocial" />
                                        </asp:DropDownList>
                                    </div>

                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltorsPesquisar" runat="server" SkinID="ButtonLeftFind" OnClick="btnFiltorsPesquisar_Click" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" />
                                        <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                            ImageUrl="~/Imagens/xlsx.png" />
                                    </div>

                                </div>
                            </div>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">

                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblQtdRegistros" runat="server" />
                                        <asp:Label ID="lblQtdRegistrosGridDesc" runat="server" SkinID="LabelResposta" />
                                    </div>
                                    <div class="boxPesquisa" style="width: 180px;">
                                        <asp:Label ID="lblRegistrosPagina" runat="server" Text="<%$ Resources:Resource, lblRegistrosPagina %>" />
                                        <asp:DropDownList ID="ddlRegistrosPagina" runat="server" TabIndex="7" Height="20px" Width="50px">
                                            <asp:ListItem Value="10" Text="10" />
                                            <asp:ListItem Value="20" Text="20" />
                                            <asp:ListItem Value="30" Text="30" />
                                            <asp:ListItem Value="40" Text="40" />
                                            <asp:ListItem Selected="True" Value="50" Text="50" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                     <%-- GRID REGISTROS --%>
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                            <%--<center />--%>
                            <asp:GridView ID="grdClienteCondicaoPagamento" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                OnPageIndexChanging="grdClienteCondicaoPagamento_PageIndexChanging"
                                AutoGenerateColumns="False"
                                AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="clienteId" HeaderText="Cliente Id" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="Cliente Id ERP" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Razão Social" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="condicaoPagamentoid" HeaderText="Cód Condição Pagamento" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="condicaoPagamentoDescricao" HeaderText="Descrição da Condição de Pagamento" />
                                    <asp:BoundField DataField="representanteId" HeaderText="Representante Id" />
                                    <asp:BoundField DataField="representanteNome" HeaderText="Nome do Representante" />
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


