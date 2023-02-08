<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConRelatorioReservas.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConRelatorioReservas" %>

<%-- CONTROLES --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>

<%-- NAMESPACES --%>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="pnlDocumentosRelatorio" runat="server">
        <asp:UpdatePanel ID="uppDocumentosRelatorio" runat="server" UpdateMode="Conditional">
            <Triggers>
                  <asp:PostBackTrigger ControlID="btnGerarExcel" />
            </Triggers>
            <ContentTemplate>

                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppDocumentosRelatorio">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlFiltros" runat="server" Height="100%" DefaultButton="btnFiltorsPesquisar">
                    <%-- BACKGROUND - BODY --%>
                    <div style="left: 0.5%; width: 99%; height: 20%;">
                        <fieldset style="left: 0.5%; width: 99%;">

                            <legend>
                                <asp:Literal ID="ltrLicitacaoRelatorio" runat="server" />
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisa">
                                          <asp:Label ID="lbldias" Text="Dias em reserva :" runat="server" />                                       
                                     
                                        <asp:DropDownList ID="drpPeriodo" runat="server" AutoPostBack="True" Width="120px">
                                            <asp:ListItem Selected="True" Text="SELECIONE.." Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Superior a  90 dias" Value="9999" />
                                            <asp:ListItem Text="90 dias" Value="90" />
                                            <asp:ListItem Text="60 dias" Value="60" />
                                            <asp:ListItem Text="30 dias" Value="30" />
                                            <asp:ListItem Text="20 dias" Value="30" />
                                            </asp:DropDownList>
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                        <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" TabIndex="12" SkinID="DropSmallFilter" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosPedidoEmissor" runat="server" />
                                        <asp:DropDownList ID="ddlFiltrosPedidoEmissor" runat="server" SkinID="DropSmallFilter" TabIndex="15" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltroPedidoItem" runat="server" />
                                        <asp:DropDownList ID="ddFiltroPedidoItem" runat="server" SkinID="DropSmallFilter" TabIndex="16" />
                                    </div>
                                      <div class="boxPesquisa">
                                        <asp:Label ID="lblUnidadeNegocio" runat="server" />
                                        <asp:DropDownList ID="ddlHeaderUnidadeNegocio" runat="server" SkinID="DropSmallFilter" TabIndex="16" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltorsPesquisar" runat="server" SkinID="ButtonLeftFind" OnClick="btnFiltorsPesquisar_Click" TabIndex="4" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" TabIndex="5" />
                                        <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                            ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />
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
                            
                            <asp:GridView ID="grdReservas" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                     OnPageIndexChanging="grdReservas_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                         <asp:BoundField DataField="pedidoId" HeaderText="Pedido" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="estabelecimentoId" HeaderText="Loja" ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="unidadeNegocioDescricao" HeaderText="Unidade" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="pedidoData" HeaderText="Dt. Pedido" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="DiasReserva" HeaderText="Dias.Reserva" ItemStyle-Width="15px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="itemId" HeaderText="item" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="usuarioNome" HeaderText="Operador" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="pedidoItemDataReserva" HeaderText="Dt. Reserva" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="empenhoCodigoId" HeaderText="Empenho" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="ordemCompraNumero" HeaderText="N° OC" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="empenhoGradeSeq" HeaderText="Empenho Grade" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="empenhoDataLimiteEntrega" HeaderText="Data Limite Entrega" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="representanteId" HeaderText="Representante" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="representanteNome" HeaderText="Representante Nome" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Left" />
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
