<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConItemValorAcimaTabela.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConItemValorAcimaTabela" %>

<%-- CONTROLES --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>

<%-- NAMESPACES --%>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlItemAcimaTabela" runat="server">
        <asp:UpdatePanel ID="uppItemAcimaTabela" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppItemAcimaTabela">
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
                                <asp:Literal ID="ltrItemAcimaTabelaHeader" runat="server" />
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisa">
                                        <CtlPeriodo:ControlPeriodo ID="CtlFiltrosPeriodo" runat="server" 
                                                                   TabIndexDataInicio="1" 
                                                                   TabIndexDataTermino="2" 
                                                                   ShowHeaderLine="false" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosItem" runat="server" />
                                        <asp:TextBox ID="txtFiltrosItem" runat="server" MaxLength="30" TabIndex="3" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosTipoBusca" runat="server" />
                                        <asp:DropDownList ID="ddlFiltrosTipoBusca" runat="server" TabIndex="4" Height="20px" Width="50px">
                                            <asp:ListItem Value="MR" Text="Maior" Selected="True" />
                                            <asp:ListItem Value="MN" Text="Menor" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltorsPesquisar" runat="server" SkinID="ButtonLeft" Onclick="btnFiltorsPesquisar_Click" TabIndex="5" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" OnClick="btnFiltrosLimpar_Click" TabIndex="6" />
                                        <asp:Button ID="btnGerarExcel" runat="server" SkinID="ButtonRight" OnClick="btnGerarExcel_Click" TabIndex="7" />
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
                                        <asp:DropDownList ID="ddlRegistrosPagina" runat="server" TabIndex="8" Height="20px" Width="50px">
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
                            <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;" >
                                <center />
                                <asp:GridView ID="gvItensAcimaTabela" runat="server" TabIndex="9"
                                    onpageindexchanging="gvItensAcimaTabela_PageIndexChanging" 
                                    onrowcommand="gvItensAcimaTabela_RowCommand" 
                                    onrowdatabound="gvItensAcimaTabela_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="pedidoId" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="pedidoData" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100px" />
                                        <asp:BoundField DataField="itemId" ItemStyle-Width="50px"  />
                                        <asp:BoundField DataField="itemDescricao" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="tabelaPrecoVlrMinimo" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="pedidoItemPrecoTabela" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="tabelaPrecoVlrMaximo" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="80px" />                                        
                                        <asp:BoundField DataField="usuarioId" ItemStyle-Width="50px"  />
                                        <asp:BoundField DataField="usuarioIdMotivo" ItemStyle-Width="50px"  />                                        
                                        <asp:TemplateField ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100px;">
                                                    <asp:Label ID="lblMotivoDescricao" runat="server" 
                                                               Text='<%# Eval("pedidoMotivoDescricao") %>' 
                                                               ToolTip='<%# Eval("pedidoMotivoDescricao") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
