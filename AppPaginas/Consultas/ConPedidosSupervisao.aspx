<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="ConPedidosSupervisao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConPedidosSupervisao" %>

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
    <style type="text/css">
        .toUpper {
            text-transform: uppercase;
        }

        .colorItens {
            background-color:#ff6a00;
            color:#ffffff;

        }
    </style>
    <script language="javascript" type="text/javascript">

        $(document).ready(function () {
            $('.colorItens').hover(function () { $(this).toggleClass('td'); });
        });

        function mask(value, mask, fill) {
            var fill = (fill) ? fill : false;
            var vl = value.length * (-1);
            var ml = mask.length * (-1);
            var r = '';

            if (fill) {
                while (vl > ml) {
                    value += '0';
                    var vl = value.length * (-1);
                    var ml = mask.length * (-1);
                }
            }

            while (vl < 0 && r.length < mask.length) {
                var mm = mask.substr(ml, 1);
                var vv = value.substr(vl, 1);

                if (/\W/.test(mm)) {
                    r += mm;
                    ml++;
                } else if (/\d/.test(vv)) {   // [a-zA-Z] = /\w/.test(vv)
                    r += vv;
                    vl++;
                    ml++;
                } else {
                    vl++;
                }
            }
            return r;
        }
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
    <asp:Panel ID="pnlRelatorioDescontoBoleto" runat="server">
        <asp:UpdatePanel ID="uppRelatorioDescontoBoleto" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
                <asp:PostBackTrigger ControlID="btnExportarAgrupado" />
                
            </Triggers>
            <ContentTemplate>

                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelatorioDescontoBoleto">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlFiltros" runat="server" Height="100%" DefaultButton="btnFiltorsPesquisar">
                    <%-- BACKGROUND - BODY --%>
                    <div style="left: 0.5%; width: 99%; height: 20%;">
                        <fieldset style="left: 0.5%; width: 99%;">

                            <legend>Consulta PEdidos Supervisão</legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">

                                    <div class="boxPesquisa">
                                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                                            ShowHeaderLine="false" />
                                    </div>

                                    <div class="boxPesquisa" style="width: 180px;">
                                        <asp:Label ID="Label2" runat="server" Text="Usuário:" />
                                        <asp:DropDownList ID="ddlUsuario" runat="server" AppendDataBoundItems="true" TabIndex="3" Height="90px" Width="200px">
                                            <Items>
                                                <asp:ListItem Text="SELECIONAR..." Value="" />
                                            </Items>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="boxPesquisaCurta" style="width: 100px;">
                                        <asp:Label runat="server" Text="Número Pedido" />
                                        <asp:TextBox ID="txtFiltroPedidoId" onkeypress="return isNumberKey(event)" runat="server" Width="100px" TabIndex="3" />
                                    </div>
                                <%--    <div class="boxPesquisaCurta">
                                        <asp:Label runat="server" Text="Descricao Motivo" />
                                        <asp:TextBox ID="txtFiltroCliente" runat="server" Width="200px" MaxLength="60" TabIndex="3" />
                                    </div>--%>

                                    <div class="boxPesquisa" style="width: 180px;">
                                        <asp:Label runat="server" Text="Tipo Motivo:" />
                                        <asp:DropDownList ID="ddlTipoMotivo" runat="server" AppendDataBoundItems="true" TabIndex="3" Height="90px" Width="200px">
                                            <Items>
                                                <asp:ListItem Text="SELECIONAR..." Value="" />
                                            </Items>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltorsPesquisar" runat="server" SkinID="BtnDefault" OnClick="btnFiltorsPesquisar_Click" TabIndex="4" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault" OnClick="btnFiltrosLimpar_Click" TabIndex="5" />
                                        <asp:Button ID="btnRelatorio" runat="server" Text="Visualizar Agrupado" SkinID="BtnDefault" OnClick="btnRelatorio_Click" TabIndex="5" />
                                        <asp:Button ID="btnVoltar" Visible="false" runat="server" Text="Voltar" SkinID="BtnDefault" OnClick="btnVoltar_Click" TabIndex="5" />
                                        <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                            ToolTip="Exportar Detalhado"
                                            ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />
                                         <asp:ImageButton ID="btnExportarAgrupado" Visible="false" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnExportarAgrupado_Click"
                                            ToolTip="Exportal Agrupado"
                                            ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />
                                    </div>
                                </div>
                            </div>


                        </fieldset>
                    </div>

                    <%-- GRID REGISTROS --%>
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                            <%--<center />--%>

                            <asp:GridView ID="grdPedidosSupervisao"  runat="server"
                               
                                OnPageIndexChanging="grdPedidosSupervisao_PageIndexChanging"
                                AutoGenerateColumns="False"
                                AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="pedidoId" HeaderText="Pedido" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="USUARIONOME" HeaderText="Usuario" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="TIPOMOTIVOID" HeaderText="Status" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                    <%--<asp:BoundField DataField="PEDIDOMOTIVODESCRICAO" HeaderText="Descricao" ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center" />--%>
                                    <asp:BoundField DataField="pedidoData" HeaderText="Data" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
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

                                <asp:GridView ID="gridPedidoSoma" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    OnPageIndexChanging="gridPedidoSoma_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:BoundField DataField="usuarioIdMotivo" HeaderText="Usuario" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="qtdPedido" HeaderText="Quantidade" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                      <%--  <asp:BoundField DataField="SOMA" HeaderText="SOMA" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />--%>
                                        <asp:BoundField DataField="tipoMotivoDescricao" HeaderText="Status" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                   
                                         </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle toUpper" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </fieldset>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>
