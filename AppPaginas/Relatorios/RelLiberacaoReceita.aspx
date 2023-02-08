<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelLiberacaoReceita.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelLiberacaoReceita" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- CONTROLE --%>
    <%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
    <%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
    <%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
    <%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <%-- NAMESPACES --%>
    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="uppRelatorioLiberacaoReceita" runat="server" UpdateMode="Conditional">
        <Triggers>
                 <asp:PostBackTrigger ControlID="btnGerarExcel" />
        </Triggers>
        <ContentTemplate>

            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelatorioLiberacaoReceita">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <%-- PAINEL FILTROS --%>
            <asp:Panel ID="pnlFiltros" runat="server" Height="100%" DefaultButton="btnFiltorsPesquisar">
                <%-- BACKGROUND - BODY --%>
                <div style="left: 0.5%; width: 99%; height: 20%;">
                    <fieldset style="left: 0.5%; width: 99%;">

                        <legend>Consulta PEdidos Liberação Receita</legend>

                        <div style="display: table; width: 100%;">
                            <div class="navegacao">

                                <div class="boxPesquisa">
                                    <asp:Label ID="Label7" runat="server" Text="Exportar para Excel:" />
                                    <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                        ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                        ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />
                                </div>

                                <div class="boxPesquisa">
                                    <asp:Label ID="Label6" runat="server" Text="Aprovação Data:" />
                                    <CtlPeriodo:ControlPeriodo ID="ControlperiodoReceitaAprovacaoData" runat="server"
                                        TabIndexDataInicio="1" TabIndexDataTermino="2"
                                        ShowHeaderLine="false" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="Label5" runat="server" Text="Pedido Periodo Data:" />
                                    <CtlPeriodo:ControlPeriodo ID="ControlperiodoPedidoData" runat="server"
                                        TabIndexDataInicio="1" TabIndexDataTermino="2"
                                        ShowHeaderLine="false" />
                                </div>
                                <div class="boxPesquisaCurta" style="width: 100px;">
                                    <asp:Label ID="Label1" runat="server" Text="Pedido Id" />
                                    <asp:TextBox ID="txtFiltroPedidoId" onkeypress="return isNumberKey(event)" runat="server" Width="100px" TabIndex="3" />
                                </div>
                                <div class="boxPesquisaCurta" style="width: 100px;">
                                    <asp:Label ID="Label2" runat="server" Text="Cliente Id" />
                                    <asp:TextBox ID="txtClienteId" onkeypress="return isNumberKey(event)" runat="server" Width="100px" TabIndex="3" />
                                </div>
                                <div class="boxPesquisaCurta" style="width: 100px;">
                                    <asp:Label ID="Label3" runat="server" Text="Cliente Razão"></asp:Label>
                                    <asp:TextBox ID="txtClienteRazao" runat="server" Width="100px" TabIndex="3" />
                                </div>
                                <div class="boxPesquisaCurta" style="width: 100px;">
                                    <asp:Label ID="Label4" runat="server" Text="Receita Aprovar"></asp:Label>
                                    <%--<asp:TextBox ID="txtxReceitaApro" runat="server" Width="100px" TabIndex="3" />--%>
                                    <asp:DropDownList runat="server" ID="dropReceitaApro" CssClass="AjusteDrop ">

                                        <asp:ListItem Text="SIM" Value="1" Selected="True" />
                                        <asp:ListItem Text="NAO" Value="0" />
                                    </asp:DropDownList>
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Button ID="btnFiltorsPesquisar" Text="Pesquisar" runat="server" SkinID="BtnDefault" OnClick="btnFiltorsPesquisar_Click" TabIndex="4" />
                                    <asp:Button ID="btnFiltrosLimpar" Text="Limpar" runat="server" SkinID="BtnDefault" OnClick="btnFiltrosLimpar_Click" TabIndex="5" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>

                <%-- GRID REGISTROS --%>
                <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                    <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                        <%--<center />--%>
                        <asp:GridView ID="gvLiberacaoReceita" runat="server"
                            OnPageIndexChanging="gvLiberacaoReceita_PageIndexChanging"
                            AutoGenerateColumns="False"
                            AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="pedidoId" HeaderText="Pedido Id" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="estabelecimentoId" HeaderText="Estabelecimento Id" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="clienteId" HeaderText="Cliente Id" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="pedidoData" HeaderText="Pedido Data" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="backOfficeReceita" HeaderText="BackOffice Receita" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente Razão" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="boReceitaAprovacaoData" HeaderText="Aprovação Data" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="boReceitaAprovador" HeaderText="Aprovador" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />

                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle toUpper" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlGridRelatorio" Visible="false" runat="server" Height="100%" DefaultButton="btnFiltorsPesquisar">
                <fieldset>
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                            <%--<center />--%>
                        </div>
                    </div>
                </fieldset>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <style>
        .DropDownList {
            height: 110px;
            width: 120px;
        }
    </style>
</asp:Content>
