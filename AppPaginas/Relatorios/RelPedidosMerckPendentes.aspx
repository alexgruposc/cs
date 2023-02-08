<%@ Page Title="Relatório de Pedidos Merck Pendentes" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelPedidosMerckPendentes.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelPedidosMerck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>

    <script type="text/javascript">

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 13 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        function checkTamTexto(controlNome, controlTitulo, controlInfo, tamanhoMax) {
            texto = document.getElementById("ContentPlaceHolder1_" + controlNome).value;
            tamAtual = texto.length;
            msgAlert = (tamanhoMax - tamAtual) + " caracteres restantes.";
            document.getElementById(controlInfo).value = msgAlert;
            if (tamAtual >= tamanhoMax) {
                msgAlert = "O campo " + controlTitulo + " suporta no máximo " + tamanhoMax + " caracteres.";
                alert(msgAlert);
                document.getElementById("ContentPlaceHolder1_" + controlNome).value = texto.substring(0, tamanhoMax);
                return false;
            }
            else {
                return true;
            }
        }

    </script>

    <style type="text/css">
        .LabelInfo
        {
            border-style: none;
            background-color: transparent;
            width: 100%;
            text-align: center;
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--  ***********************************  RELATÓRIO  ***********************************  -->

    <asp:UpdatePanel ID="updRelatorio" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlRelatorio" runat="server" Width="100%">

                <!-- filtros por data, número do pedido e cliente -->

                <fieldset class="mt-2 pad-5">
                    <legend>Relatório de Pedidos Merck Pendentes</legend>

                    <div class="col-lg-9">
                        <div class="row">

                            <div class="col-md-2">
                                Pedido:<br />
                                <asp:TextBox ID="txtSelpedidoId" runat="server" Width="90px" onkeypress="return isNumberKey(event)" MaxLength="10"></asp:TextBox>
                            </div>

                            <div class="col-md-2 boxPesquisa">
                                ID Cliente ERP:<br />
                                <asp:TextBox ID="txtSelclienteIdERP" runat="server" Width="90px" onkeypress="return isNumberKey(event)" MaxLength="9"></asp:TextBox>
                            </div>

                            <div class="col-md-3 boxPesquisa">
                                Razão Social ou CNPJ:<br />
                                <asp:TextBox ID="txtSelclienteRazaoSocial" runat="server" Width="150px" MaxLength="30"></asp:TextBox>
                            </div>

                            <div class="col-md-5 boxPesquisa">
                                <div style="float: left; margin: 0">Data Criação de&nbsp;<CtlData:ControlData ID="dtSelDataCriacaoDe" runat="server" />
                                </div>
                                <div style="float: left; margin: 0">&nbsp;até:&nbsp;<CtlData:ControlData ID="dtSelDataCriacaoAte" runat="server" />
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="row boxPesquisa text-right">
                            <asp:Button ID="btnSelecionar" runat="server" Text="Selecionar" SkinID="BtnDefault-xs" OnClick="btnSelecionar_Click" />&nbsp;
                            <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="BtnDefault-xs" OnClick="btnLimpar_Click" />
                        </div>
                    </div>

                </fieldset>

                <fieldset class="mt-2 pad-5">
                    <asp:Localize ID="lblMensagemAviso" runat="server"></asp:Localize>
                    <h3>
                        <asp:Localize ID="lblTituloRelatorio" runat="server"></asp:Localize></h3>
                    <asp:GridView DataKeyNames="pedidoId, retorno, DataCriacao, clienteRazaoSocial"
                        runat="server"
                        ID="gvSelRegistros"
                        AutoGenerateColumns="False"
                        AllowPaging="True"
                        OnRowDataBound="gvSelRegistros_RowDataBound"
                        OnRowCommand="gvSelRegistros_RowCommand"
                        OnPageIndexChanging="gvSelRegistros_PageIndexChanging"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="pedidoId" HeaderText="Cod. Pedido" />
                            <asp:BoundField DataField="retorno" HeaderText="Retorno" />
                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" />
                            <asp:BoundField DataField="DataCriacao" HeaderText="Data Criação" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="DataAutorizacao" HeaderText="Data Autoriz" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="clienteIdERP" HeaderText="ID Cliente ERP" />
                            <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" />
                            <asp:BoundField DataField="clienteCNPJ" HeaderText="CNPJ" />
                            <asp:TemplateField HeaderText="Ação">
                                <ItemTemplate>
                                    <asp:Button ID="btngvSelRegPross" runat="server" Text="Prosseguir" CommandName="Prosseguir" SkinID="BtnSuccess-xs"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                    &nbsp;
                                    <asp:Button ID="btngvSelRegReenv" runat="server" Text="Reenviar" CommandName="Reenviar" SkinID="BtnWarning-xs"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                    </asp:GridView>
                    <div class="center">
                        <asp:Localize ID="lblgvSelRegistrosPageInfo" runat="server"></asp:Localize>
                    </div>
                </fieldset>


            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  *********************************  POPUP COMANDOS  *********************************  -->

    <asp:UpdatePanel ID="updComando" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlComando" runat="server" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>


                <div class="painel">

                    <div class="painel_header">
                        <div class="painel_header_message">
                            <h4 style="color: #ffffff"><asp:Localize ID="lblComandoTitulo" runat="server" /></h4>
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imbComandoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" OnClick="btnComandoClose_Click"
                                ToolTip="Fechar"
                                ImageUrl="~/Imagens/Fechar.png" />
                        </div>
                    </div>

                    <div class="painel_body">
                        <div class="mt-3" style="width: 96%; margin: auto;">
                            <h3>Pedido: <b>
                                <asp:Localize ID="lblPedidoId" runat="server"></asp:Localize></b>
                            </h3>
                            <div class="mt-2 pad-5">
                                <p>
                                    <asp:Localize ID="lblInfoPedido" runat="server"></asp:Localize></p>
                                <!-- ============================= ITENS DO PEDIDO ============================= -->
                                <asp:GridView runat="server" ID="gvItens"
                                AutoGenerateColumns="False"
                                AllowPaging="false">
                                <Columns>
                                    <asp:BoundField DataField="itemId" HeaderText="Item ID" />
                                    <asp:BoundField DataField="unidadeMedidaId" HeaderText="Unid. Medida" />
                                    <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" />
                                    <asp:BoundField DataField="itemInfComplementar" HeaderText="Info Complem." />
                                    <asp:BoundField DataField="fabricanteNome" HeaderText="Fabricante" />
                                    <asp:BoundField DataField="pedidoItemQuantidade" HeaderText="Qtde" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemPrecoTabela" HeaderText="Preço Unit." DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemAliquotaICMS" HeaderText="% ICMS" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemValorICMS" HeaderText="Val. ICMS" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemAliquotaIPI" HeaderText="% IPI" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemValorIPI" HeaderText="Val. IPI" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemValorFrete" HeaderText="Val. Frete" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemPesoBruto" HeaderText="Peso Bruto" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemPesoLiquido" HeaderText="Peso Liq." DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="pedidoItemSituacao" HeaderText="Situação" />
                                </Columns>
                            </asp:GridView>
                                <!-- =========================================================================== -->
                                <fieldset class="mt-2 pad-5 center">

                                    <p>
                                        <b>Observações:</b>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="txtNotas" TextMode="MultiLine" Style="width: 50%; height: 90px; resize: none;" runat="server"
                                                onkeyup="return checkTamTexto('txtNotas', 'Observações', 'lblInfoTamNotas', 255)" /><br />
                                            <input type="text" class="LabelInfo" id="lblInfoTamNotas" />

                                    </p>

                                    <p>Clique abaixo para confirmar a operação</p>
                                    <p>
                                        <asp:Button ID="btnComandoProsseguir" runat="server" SkinID="BtnSuccess" Text="Prosseguir com Pedido" OnClick="btnComandoProsseguir_Click" />
                                        <asp:Button ID="btnComandoReenviar" runat="server" SkinID="BtnWarning" Text="Reenviar Pedido" OnClick="btnComandoReenviar_Click" />
                                    </p>
                                </fieldset>
                            </div>

                        </div>
                    </div>

                    <div class="painel_bottom">
                        <div class="center mt-1">
                            <asp:Button ID="btnComandoClose" runat="server" Text="Fechar" OnClick="btnComandoClose_Click" />
                        </div>
                    </div>

                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  ***********************************************************************************  -->

    <asp:UpdateProgress ID="upLoading" runat="server">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
