<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConRelatorioDocumentos.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConRelatorioDocumentos" %>

<%-- CONTROLES --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>

<%-- NAMESPACES --%>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlDocumentosRelatorio" runat="server">
        <asp:UpdatePanel ID="uppDocumentosRelatorio" runat="server" UpdateMode="Conditional">
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
                                        <asp:Label ID="lblFiltrosCliente" runat="server" />
                                        <asp:TextBox ID="txtFiltrosClienteId" runat="server" SkinID="Size70" MaxLength="9" TabIndex="1" />
                                    </div>

                                    <div class="boxPesquisa">
                                        <CtlPeriodo:ControlPeriodo ID="CtlFiltrosVigencia" runat="server"
                                            TabIndexDataInicio="2"
                                            TabIndexDataTermino="3"
                                            ShowHeaderLine="false" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltorsPesquisar" runat="server" SkinID="ButtonLeftFind" OnClick="btnFiltorsPesquisar_Click" TabIndex="4" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" TabIndex="5" />
                                        <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
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
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <%-- GRID REGISTROS --%>
                        <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                            <center />
                            <asp:GridView ID="gvDocumentosCliente" runat="server" TabIndex="16"
                                OnPageIndexChanging="gvDocumentosCliente_PageIndexChanging"
                                OnRowCommand="gvDocumentosCliente_RowCommand"
                                OnRowDataBound="gvDocumentosCliente_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="clienteId" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <div style="text-overflow: ellipsis; white-space: nowrap; width: 120px;">
                                                <asp:Label ID="lblClienteNome" runat="server"
                                                    Text='<%# Eval("clienteRazaoSocial") %>'
                                                    ToolTip='<%# Eval("clienteRazaoSocial") %>' />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="tipoDocumentoId" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Dias_Vencimento" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Status" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Data_Vencimento" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
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
