<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelClientes.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelClientes" %>

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
        <asp:UpdatePanel ID="uppRelatorioClientes" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelatorioClientes">
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
                                <asp:Literal ID="ltrClientes" runat="server" />
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">

                                    <div class="boxPesquisa">
                                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoInclusao" runat="server"
                                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                                            ShowHeaderLine="false" />
                                    </div>
                                    <div class="boxPesquisa" style="width: 70px;">
                                        <asp:Label ID="lblDadosClienteCNPJ" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosClienteCNPJ" runat="server" MaxLength="20" />
                                        </div>
                                        <div class="boxPesquisa" style="width: 70px;">
                                            <asp:Label ID="lblFiltrosClienteCodigoErp" runat="server" Text="aa" />
                                            <asp:TextBox ID="txtFiltrosClienteCodigoErp" SkinID="SmallFilter" runat="server" TabIndex="4" />
                                        </div>
                                         
                                        <div class="boxPesquisa" style="width: 70px;">
                                            <asp:Label ID="lblFiltrosClienteCodigoSAP" runat="server" Text="aa" />
                                            <asp:TextBox ID="txtFiltrosClienteCodigoSAP" SkinID="SmallFilter" runat="server" TabIndex="5" />
                                        </div>
                                        <div class="boxPesquisa" style="width: 70px;">
                                            <asp:Label ID="lblDadosClienteGrupoComercial" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddlDadosClienteGrupoComercial" runat="server" SkinID="DropSmallFilter"  TabIndex="6" />
                                        </div>
                                        <div class="boxPesquisa" style="width: 70px;">
                                            <asp:Label ID="lblDadosClienteRepresentante" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddDadosClienteRepresentante" runat="server" SkinID="DropSmallFilter" TabIndex="7" />
                                        </div>
                                        <div class="boxPesquisa">
                                            <asp:Button ID="btnFiltorsPesquisar" runat="server" SkinID="ButtonLeftFind" OnClick="btnFiltorsPesquisar_Click" TabIndex="8" />
                                            <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" TabIndex="9" />
                                            <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                                ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                                ImageUrl="~/Imagens/xlsx.png" TabIndex="10" />
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
                                            <asp:ListItem Selected="True" Value="10" Text="10" />
                                            <asp:ListItem Value="20" Text="20" />
                                            <asp:ListItem Value="30" Text="30" />
                                            <asp:ListItem Value="40" Text="40" />
                                            <asp:ListItem Value="50" Text="50" />
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

                            <asp:GridView ID="gvClientes" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                OnPageIndexChanging="gvClientes_PageIndexChanging"
                                OnRowDataBound="gvClientes_RowDataBound"
                                AutoGenerateColumns="False"
                                AllowPaging="True">
                                <Columns>

                                    <asp:BoundField DataField="clienteIdERP" HeaderText="Código ERP" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" HeaderText="Razão Social" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="clienteGrupoComercialNome" ItemStyle-HorizontalAlign="Center" HeaderText="Grupo comercial" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="clienteIdSap" ItemStyle-HorizontalAlign="Center" HeaderText="Código SAP" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="clienteCNPJ" ItemStyle-HorizontalAlign="Center" HeaderText="CNPJ" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="tipoEnderecoId" ItemStyle-HorizontalAlign="Center" HeaderText="Tipo Endereço" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="clienteContatoNome" ItemStyle-HorizontalAlign="Center" HeaderText="Nome Contato" ItemStyle-Width="100px" />
                                     <asp:BoundField DataField="representanteNome" ItemStyle-HorizontalAlign="Center" HeaderText="Representante" ItemStyle-Width="100px" />
                                    <%--<asp:BoundField DataField="AguardandoClearSales" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />--%>
                                </Columns>
                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
