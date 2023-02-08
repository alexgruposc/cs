<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConRelatorioConfigDistribuicao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConRelatorioConfigDistribuicao" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="uppRelConfig" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvRegistroConfig" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvRegistroConfig" EventName="PageIndexChanging" />


            <asp:PostBackTrigger ControlID="btnExport" />

        </Triggers>
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelConfig">
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
                    <div style="display: table; width: 100%;">
                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                    TabIndexDataInicio="1" TabIndexDataTermino="2"
                                    ShowHeaderLine="false" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblProduto" runat="server" />
                                <asp:TextBox ID="txtProduto" runat="server" TabIndex="3" SkinID="Size70" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteCodigoErp" runat="server" />
                                <asp:TextBox ID="txtClienteERP" runat="server" MaxLength="30" TabIndex="4" SkinID="SmallFilter" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteCnpj" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteCnpj" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                <asp:DropDownList ID="ddFiltroEstabelecimento" SkinID="DropFiltro" runat="server" TabIndex="11" />
                            </div>


                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroStatus" runat="server" Text="Usuário Cadastro" />
                                <asp:DropDownList ID="dplFiltroUsuario" SkinID="DropFiltro" runat="server" TabIndex="11" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="Label1" runat="server" Text="Motivo Exceção" />
                                <asp:DropDownList ID="dplfiltroMotivoExcecao" SkinID="DropFiltro" runat="server" TabIndex="11" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroTipoRegra" runat="server" Text="Tipo Regra" />
                                <asp:DropDownList ID="dplFiltroTipoRegra" SkinID="DropFiltro" runat="server" TabIndex="11" />
                            </div>
                        </div>
                    </div>
                    <div style="display: table; width: 100%;">
                        <div class="navegacao">



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

                        </div>
                    </div>

                </asp:Panel>
                <asp:Panel ID="pnlgvRegistroConfig" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">
                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">
                                <center />
                                <asp:GridView ID="gvRegistroConfig" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    OnRowDataBound="gvRegistroConfig_RowDataBound"
                                    OnPageIndexChanging="gvRegistroConfig_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="UfId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="TipoDescricao" ItemStyle-HorizontalAlign="Center" HeaderText="Tipo Regra" />
                                        <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="estabelecimentoRazaoSocial" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="DataCadastro" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="UsuarioId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="MotivoDescricao" ItemStyle-HorizontalAlign="Left" />
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
