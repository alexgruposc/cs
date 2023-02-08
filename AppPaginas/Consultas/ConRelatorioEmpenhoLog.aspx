<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConRelatorioEmpenhoLog.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConRelatorioEmpenhoLog" %>

<%-- CONTOLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>

<%-- NAMESPACE --%>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Utility" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlEmpenho" runat="server">
        <asp:UpdatePanel ID="uppEmpenho" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppEmpenho">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:Panel ID="pnlEmpenhoPesquisa" runat="server" DefaultButton="btnFiltrosEmpenhoPesquisa" Visible="true">
                    <div style="left: 0.5%; width: 99%; height: 100%; position: fixed; overflow-x: none;">
                        <fieldset style="left: 0.5%; width: 99%;">
                            <legend>
                                <asp:Literal ID="ltrEmpenhoFiltrosHeader" runat="server" />
                            </legend>
                            <div class="navegacao">
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosContratoId" runat="server" />
                                    <asp:TextBox ID="txtFiltrosContratoId" runat="server" SkinID="SmallFilter" MaxLength="50" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosEmpenhoId" runat="server" />
                                    <asp:TextBox ID="txtFiltrosEmpenhoId" runat="server" SkinID="SmallFilter" MaxLength="50" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosEmpenhoClienteCnpj" runat="server" />
                                    <asp:TextBox ID="txtFiltrosEmpenhoClienteCnpj" runat="server" SkinID="SmallFilter" MaxLength="20" />
                                </div>
                                <div class="boxPesquisa" style="display: none;">
                                    <asp:Label ID="lblFiltrosEmpenhoClienteRazaoSocial" runat="server" />
                                    <asp:TextBox ID="txtFiltrosEmpenhoClienteRazaoSocial" runat="server" SkinID="SmallFilter" MaxLength="100" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosOC" runat="server" />
                                    <asp:TextBox ID="txtFiltrosOC" runat="server" SkinID="SmallFilter" MaxLength="50" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosEmpenhoStatus" runat="server" />
                                    <asp:DropDownList ID="ddlFiltrosEmpenhoStatus" runat="server" SkinID="DropSmallFilter" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="lblFiltrosEmpenhoEstabelecimento" runat="server" />
                                    <asp:DropDownList ID="ddlFiltrosEmpenhoEstabelecimento" runat="server" SkinID="DropSmallFilter" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Button ID="btnFiltrosEmpenhoPesquisa" runat="server" SkinID="ButtonLeftFind" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosEmpenhoLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" />
                                </div>
                                <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                                    <asp:ImageButton ID="btnExportEmpenhoLog" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                        ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                        ImageUrl="~/Imagens/xlsx.png" />
                                </div>
                            </div>

                            <%-- GRID REGISTROS Empenho--%>
                            <div class="gridRegistros">
                                <asp:GridView ID="gvEmpenhoPesquisa" runat="server"
                                    DataKeyNames="contratoLicitacaoId, empenhoCodigoId, clienteCNPJFaturamento, clienteRazaoSocialFaturamento, empenhoStatusId, usuarioIdAlteracao, empenhoDataAlteracao"
                                    OnPageIndexChanging="gvLogEmpenho_PageIndexChanging"
                                    OnRowDataBound="gvLogEmpenho_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrContrato" runat="server" Text='<%# FormataStringSaida(Eval("contratoLicitacaoId"), txtFiltrosContratoId.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrEmpenho" runat="server" Text='<%# FormataStringSaida(Eval("empenhoCodigoId"), txtFiltrosEmpenhoId.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Utility.FormataDocumentos(Eval("clienteCNPJFaturamento").ToString(), Utility.FormatOption.ApplyMask), txtFiltrosEmpenhoClienteCnpj.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocialFaturamento"), txtFiltrosEmpenhoClienteRazaoSocial.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrStatus" runat="server" Text='<%# FormataStringSaida(GetResourceValue(Eval("empenhoStatusId").ToString()), ddlFiltrosEmpenhoStatus.SelectedItem.Text) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="empenhoDataAlteracao" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrUsuario" runat="server" Text='<%# Eval("usuarioIdAlteracao") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>

                            <%-- GRID REGISTROS GradeEmpenho --%>
                            <div class="gridRegistros">
                                <asp:GridView ID="gvEmpenhoGradePesquisa" runat="server"
                                    DataKeyNames="empenhoCodigoId,itemId,itemDescricao,empenhoStatusId,dataAlteracao,empenhoItemQtd,empenhoItemQtdeValor,clienteEndereco,usuarioIdAlteracao"
                                    OnPageIndexChanging="gvLogEmpenhoGrade_PageIndexChanging"
                                    OnRowDataBound="gvLogEmpenhoGrade_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="empenhoCodigoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="empenhoStatusId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="dataAlteracao" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                        <asp:BoundField DataField="empenhoItemQtd" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="empenhoItemQtdeValor" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="clienteEndereco" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                        <asp:BoundField DataField="usuarioIdAlteracao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
