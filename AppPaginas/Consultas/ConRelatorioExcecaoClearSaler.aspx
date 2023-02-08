<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConRelatorioExcecaoClearSaler.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConRelatorioExcecaoClearSaler" %>

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

    <asp:Panel ID="pnlRelatorioExcecaoClearSales" runat="server">
        <asp:UpdatePanel ID="uppRelatorioExcecaoClearSales" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelatorioExcecaoClearSales">
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
                                <asp:Literal ID="ltrExcecaoClearSales" runat="server" />
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">

                                    <div class="boxPesquisa">
                                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoInclusao" runat="server"
                                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                                            ShowHeaderLine="false" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroClienteId" runat="server" />
                                        <asp:TextBox ID="txtFiltroClienteId" runat="server" TabIndex="3" SkinID="Size70" />
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

                            <asp:GridView ID="gvExcecaoClearSales" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                OnPageIndexChanging="gvExcecaoClearSales_PageIndexChanging"
                                OnRowDataBound="gvExcecaoClearSales_RowDataBound"
                                AutoGenerateColumns="False"
                                AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Código" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="clienteId" HeaderText="Código Cliente" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" HeaderText="Razão Social" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="acao" ItemStyle-HorizontalAlign="Center" HeaderText="Ação" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" HeaderText="Usuário" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="dataHora" ItemStyle-HorizontalAlign="Center" HeaderText="Data" ItemStyle-Width="100px"  DataFormatString="{0:dd/MM/yyyy}"/>


                                    <%--<asp:BoundField DataField="AguardandoClearSales" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />--%>
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
