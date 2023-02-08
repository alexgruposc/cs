﻿<%@ Page Title="Relatório de Pedidos Fidelize - Wholesaler" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelPedidosFidelizeWS.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelPedidosFidelizeWS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>

    <script type="text/javascript" src="../../Scripts/jquery-3.1.0.js"></script>

    <script type="text/javascript">

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 13 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

    </script>

    <style type="text/css">
        div.colForm {
            display: inline-table;
            padding: 4px;
            text-align: left;
            vertical-align: top;
        }

            div.colForm.center {
                text-align: center;
            }

        .bordaLeft {
            border-left: solid 1px #aaaaaa;
        }

        .GridView td {
            text-align: center;
        }

        .GridPager a {
            margin: 3px;
            color: #ffffff;
        }

            .GridPager a:hover, .GridPager a:active {
                color: #00ffff;
            }

            .GridPager a:visited {
                color: #e4e4e4;
            }

        .GridPager td, .GridPager span {
            margin: 3px;
            color: #00ffff;
        }

        table.table-condensed td {
            vertical-align: top;
            border-bottom: solid 1px #d0d0d0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanelGeral" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="imbExportarExcel" />
        </Triggers>
    </asp:UpdatePanel>

    <!--  *******************************  RELATÓRIO  *******************************  -->
    <asp:UpdatePanel ID="updRelatorio" runat="server">
        <ContentTemplate>

            <asp:Panel ID="pnlRelatorio" runat="server" Width="100%" Height="97%">

                <fieldset class="mt-2 pad-5">

                    <legend>Relatório de Pedidos Fidelize - Canal Wholesaler</legend>

                    <div class="mt-2" style="padding-left: 5px">

                        <div class="colForm" style="width: 13%">
                            Nº Order Fidelize:<br />
                            <asp:TextBox ID="txtSelOrderCode" runat="server" Width="90px" onkeypress="return isNumberKey(event)"></asp:TextBox>

                            <div style="clear: both; padding-top: 6px">
                                <hr />
                            </div>

                            Nº Pedido Oncoprod:<br />
                            <asp:TextBox ID="txtSelPedidoId" runat="server" Width="90px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                        </div>

                        <div class="colForm bordaLeft" style="width: 24%">
                            <div>
                                <div style="float: left; margin: 0">
                                    Data Importação de:<br />
                                    <CtlData:ControlData ID="dtSelDataImpDe" runat="server" />
                                </div>
                                <div style="float: left; margin: 0">
                                    até:<br />
                                    <CtlData:ControlData ID="dtSelDataImpAte" runat="server" />
                                </div>

                            </div>

                            <div style="clear: both; padding-top: 6px">
                                <hr />
                            </div>

                            <div style="clear: both">
                                <div style="float: left; margin: 0">
                                    Data Pedido de:<br />
                                    <CtlData:ControlData ID="dtSelDataPedDe" runat="server" />
                                </div>
                                <div style="float: left; margin: 0">
                                    até:<br />
                                    <CtlData:ControlData ID="dtSelDataPedAte" runat="server" />
                                </div>
                            </div>

                        </div>

                        <div class="colForm bordaLeft" style="width: 16%">
                            Status Fidelize:<br />
                            <asp:DropDownList ID="ddlSelStatusFidelize" runat="server" Style="width: 98%; max-width: 180px" />

                            <div style="clear: both; padding-top: 6px">
                                <hr />
                            </div>

                            Status Oncoprod:<br />
                            <asp:DropDownList ID="ddlSelPedidoSituacao" runat="server" Style="width: 98%; max-width: 180px" />
                        </div>

                        <div class="colForm bordaLeft" style="width: 13%">
                            CNPJ do Cliente<br />
                            <asp:TextBox ID="txtSelClienteCnpj" runat="server" Style="width: 96%; max-width: 180px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                        </div>

                        <div class="colForm bordaLeft" style="width: 16%">
                            Aprovação:<br />
                            <asp:DropDownList ID="ddlSelAprovacao" runat="server" Style="width: 98%; max-width: 180px" />
                        </div>

                        <div class="colForm bordaLeft" style="width: 16%">
                            Laboratório:<br />
                            <asp:DropDownList ID="ddlSelFabricante" runat="server" Style="width: 98%; max-width: 220px" />
                        </div>

                    </div>

                    <div class="mt-2 pad-5 text-right">
                        <div class="colForm center bordaLeft" style="width: 16%">
                            <asp:Button ID="btnSelecionar" runat="server" Text="Pesquisar" SkinID="BtnDefault-sm" OnClick="btnSelecionar_Click" />&nbsp;
                                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="BtnDefault-sm" OnClick="btnLimpar_Click" />
                        </div>
                        <div class="colForm center bordaLeft" style="width: 8%">
                            <asp:ImageButton ID="imbExportarExcel" ImageUrl="../../Imagens/xlsx.png" runat="server" OnClick="imbExportarExcel_Click" ToolTip="Exportar para Excel" Style="width: auto; height: 38px" />
                        </div>
                    </div>

                </fieldset>

                <fieldset class="mt-2 pad-5">

                    <asp:Localize ID="lblMensagemAviso" runat="server"></asp:Localize>
                    <h3>
                        <asp:Localize ID="lblTituloRelatorio" runat="server"></asp:Localize></h3>

                    <asp:GridView DataKeyNames="pedidoIdGerado, order_code"
                        runat="server"
                        ID="gvSelPedidos"
                        AutoGenerateColumns="False"
                        AllowPaging="True"
                        OnRowDataBound="gvSelPedidos_RowDataBound"
                        OnPageIndexChanging="gvSelPedidos_PageIndexChanging"
                        OnRowCommand="gvSelPedidos_RowCommand"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="order_code" HeaderText="ID Fidelize" />
                            <asp:BoundField DataField="imported_at" HeaderText="Importado em" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="industry_code" HeaderText="Sigla" />
                            <asp:BoundField DataField="customer_code" HeaderText="CNPJ Cliente" />
                            <asp:BoundField DataField="order_status" HeaderText="Aprovação" />
                            <asp:BoundField DataField="consideration_code" HeaderText="Avaliação Oncoprod" />
                            <asp:BoundField DataField="pedidoIdGerado" HeaderText="Pedido Oncoprod" />
                            <asp:BoundField DataField="pedidoData" HeaderText="Data Pedido" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="pedidoSituacao" HeaderText="Status Oncoprod" />
                            <asp:BoundField DataField="statusFidelize" HeaderText="Status Fidelize" />
                            <asp:BoundField DataField="fabricanteNome" HeaderText="Fabricante" />
                            <asp:BoundField DataField="notaFiscalNumero" HeaderText="Num. NF" />
                            <asp:BoundField DataField="notaFiscalSerie" HeaderText="Série NF" />
                            <asp:BoundField DataField="estabelec" HeaderText="Estabelec." />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbVerDetalhes" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle"
                                        ImageUrl="~/Imagens/find.png"
                                        CommandName="Selecionar"
                                        ToolTip="Selecionar"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                    </asp:GridView>
                    <div class="center">
                        <asp:Localize ID="lblgvSelPedidosPageInfo" runat="server"></asp:Localize>
                    </div>
                </fieldset>

            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  *******************************  DETALHES DO PEDIDO  *******************************  -->
    <asp:UpdatePanel ID="updDetalhePedido" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlDetalhePedido" runat="server" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel">
                    <div class="painel_header">
                        <div class="painel_header_message">
                            <h3 style="color: #ffffff">Detalhes do Pedido #
                                <asp:Localize ID="lblPedidoId" runat="server"></asp:Localize></h3>
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imbFecharDetalhePedido" runat="server" ImageAlign="AbsMiddle" Width="32px" Height="32px" OnClick="btnFecharDetalhePedido_Click"
                                ToolTip="Fechar"
                                ImageUrl="~/Imagens/Fechar.png" />
                        </div>
                    </div>
                    <div class="painel_body">
                        <div class="row pad-5">
                            <div class="col-lg-3">
                                <!-- informação do Pedido -->
                                <table class="table-condensed">
                                    <tr>
                                        <td>Num. Pedido Fidelize:</td>
                                        <td>
                                            <asp:Localize ID="lbl_idFidelize" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Status Fidelize:</td>
                                        <td>
                                            <asp:Localize ID="lbl_statusFidelize" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Status Oncoprod:</td>
                                        <td>
                                            <asp:Localize ID="lbl_pedidoSituacao" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Aprovação Oncoprod:</td>
                                        <td>
                                            <asp:Localize ID="lbl_order_status" runat="server" /></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-lg-3" style="border-left: solid 1px #aaaaaa;">
                                <!-- outras informações -->
                                <table class="table-condensed">
                                    <tr>
                                        <td>Importado em:</td>
                                        <td>
                                            <asp:Localize ID="lbl_imported_at" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Data do Pedido:</td>
                                        <td>
                                            <asp:Localize ID="lbl_pedidoData" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Unid. Negócio:</td>
                                        <td>
                                            <asp:Localize ID="lbl_unidadeNegocioId" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Cliente Triangular:</td>
                                        <td>
                                            <asp:Localize ID="lbl_pedidoTriangular" runat="server" /></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-lg-4" style="border-left: solid 1px #aaaaaa;">
                                <!-- informação do Cliente -->
                                <table class="table-condensed">
                                    <tr>
                                        <td>Cod Cliente ERP:</td>
                                        <td>
                                            <asp:Localize ID="lbl_clienteIdERP" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Razão Social:</td>
                                        <td>
                                            <asp:Localize ID="lbl_clienteRazaoSocial" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>CNPJ/CPF:</td>
                                        <td>
                                            <asp:Localize ID="lbl_CnpjCpf" runat="server" /></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-lg-2" style="border-left: solid 1px #aaaaaa;">
                                <!-- informação da Fatura -->
                                <table class="table-condensed">
                                    <tr>
                                        <td>Estabelecimento:</td>
                                        <td>
                                            <asp:Localize ID="lbl_estabelec" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>N.F. Numero:</td>
                                        <td>
                                            <asp:Localize ID="lbl_notaFiscalNumero" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>N.F. Série:</td>
                                        <td>
                                            <asp:Localize ID="lbl_notaFiscalSerie" runat="server" /></td>
                                    </tr>
                                </table>
                            </div>

                        </div>

                        <div style="clear: both"></div>

                        <div class="mt-2 pad-5">
                            <asp:GridView DataKeyNames="itemId"
                                runat="server"
                                ID="gvItens"
                                AutoGenerateColumns="false"
                                AllowPaging="false" AllowCustomPaging="false"
                                OnRowDataBound="gvItens_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="itemId" HeaderText="Item ID" />
                                    <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />
                                    <asp:BoundField DataField="fabricanteNome" HeaderText="Fabricante" />
                                    <asp:BoundField DataField="itemInfComplementar" HeaderText="EAN" />
                                    <asp:BoundField DataField="pedidoItemQuantidade" HeaderText="Qtde" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemPrecoTabela" HeaderText="Preço Unit." DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="TipoPedido" HeaderText="Tipo" />
                                    <asp:BoundField DataField="industry_consideration" HeaderText="Avaliação Oncoprod" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="painel_bottom">
                        <div class="center mt-1">
                            <asp:Button ID="btnFecharDetalhePedido" runat="server" Text="Fechar" OnClick="btnFecharDetalhePedido_Click" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  ********************************************************************************************************  -->

    <asp:UpdateProgress ID="upLoading" runat="server">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>

