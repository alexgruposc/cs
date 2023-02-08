<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelPedidosPorSistemaEntrada.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelPedidosPorSistemaEntrada" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- CONTROLE --%>
    <%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
    <%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
    <%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
    <%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

    <%-- NAMESPACES --%>
    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Panel ID="pnlRelatorioDescontoBoleto" runat="server">
        <asp:UpdatePanel ID="uppRelatorioDescontoBoleto" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
            </Triggers>
            <ContentTemplate>

                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelatorioDescontoBoleto">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlFiltros" runat="server">
                    <%-- BACKGROUND - BODY --%>
                    <div class="pad-5 mt-2">
                        <fieldset>

                            <legend>
                                <asp:Literal Text="Relatório Sistema Entrada" runat="server" />
                            </legend>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="col-md-6" style="padding: 2% 0 0 4%">

                                            <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                                ShowHeaderLine="false" />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblFiltroPedidoId" runat="server" />
                                    <asp:TextBox ID="txtFiltroPedidoId" runat="server" Width="200px"  />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label ID="Label3" Text="CPF/CNPJ" runat="server" />
                                    <asp:TextBox ID="txtFiltroCliente" runat="server" MaxLength="30" Width="200px" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="Label4" Text="Razão Social" runat="server" />
                                    <asp:TextBox ID="txtFiltroRazaoSocial" runat="server" MaxLength="30" Width="200px" />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label ID="Label6" runat="server" Width="200px"   />
                                </div>
                                
                                <div class="col-md-2">
                                    <asp:Label ID="Label7" runat="server" Width="200px"   />
                                </div>
                                
                                <div class="col-md-2">
                                    <asp:Label ID="Label5" Text="Cliente ERP" runat="server" />
                                    <asp:TextBox ID="txtFiltroClienteIdErp" runat="server" MaxLength="30" Width="190px" />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label ID="Label1" runat="server" Text="Sistema Entrada" />
                                    <asp:DropDownList runat="server" ID="ddlsistemaEntrada" Width="200px">
                                        <asp:ListItem Text="Selecione..." Selected="True" />
                                        <asp:ListItem Text="TEVA" />
                                        <asp:ListItem Text="Vortice" />
                                        <asp:ListItem Text="VIDALINK" />
                                        <asp:ListItem Text="AMGEN" />
                                        <asp:ListItem Text="EPHARMA" />
                                        <asp:ListItem Text="FIDELIZE" />
                                        <asp:ListItem Text="GALDERMA" />
                                        <asp:ListItem Text="JANSSEN" />
                                        <asp:ListItem Text="PHARMANEXO" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="Label2" Text="Pedido Situacão" runat="server" />

                                    <asp:DropDownList runat="server" ID="ddFiltroSituacao" Width="200px">
                                        <asp:ListItem Text="Selecione..." />
                                        <asp:ListItem Text="Agendado" />
                                        <asp:ListItem Text="AguardandoComercial" />
                                        <asp:ListItem Text="AguardandoFideliza" />
                                        <asp:ListItem Text="aguardandoFiscal" />
                                        <asp:ListItem Text="AguardandoLGPD" />
                                        <asp:ListItem Text="AguardandoMerck" />
                                        <asp:ListItem Text="AguardandoPagamentoCartao" />
                                        <asp:ListItem Text="AnaliseCredito" />
                                        <asp:ListItem Text="BackOffice" />
                                        <asp:ListItem Text="Cancelado" />
                                        <asp:ListItem Text="Faturado" />
                                        <asp:ListItem Text="Financeiro" />
                                        <asp:ListItem Text="Implantacao" />
                                        <asp:ListItem Text="Integrado" />
                                        <asp:ListItem Text="NaoIntegrado" />
                                        <asp:ListItem Text="Orcamento" />
                                        <asp:ListItem Text="Reprovado" />
                                        <asp:ListItem Text="Reserva" />
                                        <asp:ListItem Text="Supervisor" />
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:Button ID="btnFiltorsPesquisar" runat="server" SkinID="BtnInfo-sm" OnClick="btnFiltorsPesquisar_Click" TabIndex="4" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault-sm" OnClick="btnFiltrosLimpar_Click" TabIndex="4" />
                                    <asp:Button ID="btnGerarExcel" Text="Exportar Excel" runat="server" SkinID="BtnWarning" OnClick="btnGerarExcel_Click1" TabIndex="4" />


                                    <%--                                    <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" SkinID="BtnWarning-sm"  ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                        ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                        ImageUrl="~/Imagens/xlsx.png" />--%>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="pad-5 mt-2">
                        <fieldset>
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


                            <asp:GridView
                                ID="grdReservas"
                                runat="server"
                                AllowPaging="true"
                                AutoGenerateColumns="true"
                                DataKeyNames="pedidoId,	sistemaEntrada,nr_nota_fis,serie,cod_estabel,pedidoSituacao,clienteIdERP,clienteCPF,ClienteCNPJ,
                                                        clienteRazaoSocial,clienteIdERPTri,clienteCPFTri, 
                                               ClienteCNPJTri,clienteRazaoSocialTri"
                                OnPageIndexChanging="grdReservas_PageIndexChanging"
                                OnRowCommand="grdReservas_RowCommand"
                                OnRowDataBound="grdReservas_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="sistemaEntrada" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />                                    
                                    <asp:BoundField DataField="pedidoSituacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="clienteCPF" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="ClienteCNPJ" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="clienteIdERPTri" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="clienteCPFTri" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="ClienteCNPJTri" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                 
                                       <asp:BoundField DataField="clienteRazaoSocialTri" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="pedidoData" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="nr_nota_fis" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="serie" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />
                                    <asp:BoundField DataField="cod_estabel" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="true" />

                                </Columns>

                            </asp:GridView>

                        </fieldset>
                    </div>





                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>


</asp:Content>
