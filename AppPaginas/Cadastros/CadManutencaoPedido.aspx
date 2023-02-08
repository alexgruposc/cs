<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadManutencaoPedido.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadManutencaoPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .colorAzulKs {
            color: #14293E;
        }

        .GridView td {
            text-align: center;
        }

        .borderLeft {
            border-left: solid 1px #aaaaaa;
        }

        div.blocoFloat {
            float: left;
            margin: 5px;
            padding: 5px;
        }

        div.TabBar {
            margin: 14px auto 0px 20px;
            min-height: 18px;
        }

            div.TabBar a.PropTab {
                padding: 6px 12px 6px 12px;
                text-align: center;
                color: #333333;
                background-color: #ffffff;
                border: solid 1px #777777;
                border-radius: 5px 5px 0px 0px;
                /* border-bottom: none; */
            }

            div.TabBar a.PropTabAt {
                padding: 8px 12px 8px 12px;
                text-align: center;
                color: #333333;
                background-color: #ffffff;
                border: solid 1px #777777;
                border-radius: 5px 5px 0px 0px;
                border-bottom: none;
            }

            div.TabBar a.PropTab:hover {
                background-color: #d0d0d0;
            }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="colorAzulKs">Manutençao e Ajustes em Dados de Pedidos</h2>

    <asp:UpdatePanel ID="updGeral" runat="server">
        <ContentTemplate>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- ==============================   SELEÇÃO DO PEDIDO   ============================== -->

    <asp:UpdatePanel ID="updSelecao" runat="server">
        <ContentTemplate>

            <fieldset class="pad-10">
                <h3 class="colorAzulKs">Selecionar Pedido</h3>

                <div class="row">

                    <div class="col-md-4">
                        Pedido ID: &nbsp;
                         <asp:TextBox ID="txt_SelPedidoId" runat="server" Style="width: 95%; max-width: 120px" MaxLength="20"></asp:TextBox>
                        &nbsp;
                     <asp:Button ID="btn_SelecPedido" runat="server" Text="Selecionar" SkinID="BtnInfo" OnClick="btn_SelecPedido_Click" />

                    </div>

                    <div class="col-md-8 borderLeft">
                        <asp:Localize ID="lbl_PedidoInfo" runat="server"></asp:Localize>
                        <hr />
                        <div class="pad-10">
                            <div class="gridRegistros">
                                <asp:GridView ID="grvItens" runat="server"
                                    AllowPaging="false" AutoGenerateColumns="false"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:BoundField DataField="itemId" HeaderText="Item ID" ItemStyle-Width="5%" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Produto" ItemStyle-Width="25%" />
                                        <asp:BoundField DataField="pedidoItemQuantidade" HeaderText="Qtde" ItemStyle-Width="5%" />
                                        <asp:BoundField DataField="itemValorPadrao" HeaderText="Valor Padrão" ItemStyle-Width="10%" DataFormatString="{0:N2}" />
                                        <asp:BoundField DataField="pedidoItemValorBruto" HeaderText="Valor Bruto" ItemStyle-Width="10%" DataFormatString="{0:N2}" />
                                        <asp:BoundField DataField="pedidoItemPrecoTabela" HeaderText="Preço Tabela" ItemStyle-Width="10%" DataFormatString="{0:N2}" />
                                        <asp:BoundField DataField="itemPrecoFabrica" HeaderText="Preço Fabrica" ItemStyle-Width="10%" DataFormatString="{0:N2}" />
                                        <asp:BoundField DataField="pedidoItemValorFrete" HeaderText="Frete" ItemStyle-Width="10%" DataFormatString="{0:N2}" />
                                        <asp:BoundField DataField="itemTipoPedido" HeaderText="Tipo Pedido" ItemStyle-Width="10%" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                </div>

            </fieldset>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updEdicaoDadosPedido" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnCancelamentoConfirma" />
            <asp:PostBackTrigger ControlID="btnCancelamentoFechar" />
        </Triggers>
        <ContentTemplate>

            <asp:Panel ID="panel_EdicaoDadosPedido" runat="server">

                <fieldset class="pad-10">
                    <h3 class="colorAzulKs">Dados do Pedido</h3>

                    <asp:Panel ID="pnlDadosPedido" runat="server">
                        <div class="blocoFloat">
                            <asp:CheckBox ID="chk_transportadoraEmergencial" runat="server" />&nbsp;Emergencial
                        </div>
                        <div class="blocoFloat borderLeft">
                            <asp:CheckBox ID="chk_transportadoraOrcamento" runat="server" />&nbsp;Cotação Transportadora
                        </div>
                        <div class="blocoFloat borderLeft">
                            <asp:CheckBox ID="chk_vendaDireta" runat="server" />&nbsp;Venda Direta
                        </div>
                        <div class="blocoFloat borderLeft">
                            <asp:CheckBox ID="chk_RetiraBalcao" runat="server" />&nbsp;Retira no Balcão
                        </div>
                        <div class="blocoFloat borderLeft">
                            Loja:<br />
                            <asp:DropDownList ID="ddw_estabelecimentoId" runat="server" Style="width: auto; max-width: 320px"></asp:DropDownList>
                        </div>
                        <div class="blocoFloat borderLeft">
                            CFOP:<br />
                            <asp:DropDownList ID="ddw_tipoPedidoId" runat="server" Style="width: auto; max-width: 240px"></asp:DropDownList>
                        </div>
                    </asp:Panel>

                    <div style="clear: both; height: 4px;"></div>
                    <hr />

                    <div class="pad-10 text-center">
                        <asp:Button ID="btn_GravarDadosPedido" runat="server" Text="Atualizar" SkinID="BtnSuccess" OnClick="btn_GravarDadosPedido_Click" />
                        <asp:Button ID="btnCancelarSevenPDV" runat="server" Text="Cancelar SevenPDV" SkinID="BtnDanger" Visible="false" OnClick="btnCancelarSevenPDV_Click" />
                    </div>

                </fieldset>

            </asp:Panel>

            <!-- Modal Cancelamento -->
            <asp:Panel ID="pnlCancelamento" runat="server" Visible="false" SkinID="PnlPopUp" DefaultButton="btnCancelamentoFechar">
                <div class="OpacityBackGround">
                </div>
                <div class="painel" style="width: 40%; height: 60%; left: 30%; top: 25%;">
                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Label ID="lblHeaderCancelamento" runat="server" ForeColor="White" />
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imbCancelamentoFechar" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                Height="25px" ImageUrl="~/Imagens/Fechar.png" OnClick="imbCancelamentoFechar_Click" />
                        </div>
                    </div>
                    <div class="painel_body">
                        <fieldset>
                            <legend>
                                <asp:Literal ID="ltrCancelamentoHeader" runat="server" Text="<%$ Resources:Resource, lblMotivoOperacao %>" />
                            </legend>
                            <div class="form-group">
                                <asp:Label ID="lblMotivosCategoria" runat="server" class="col-md-2 Label" Text="<%$ Resources:Resource, lblCategoria %>" />
                                <asp:TextBox ID="txtMotivoCategoria" runat="server" SkinID="TextBox1" Text="<%$ Resources:Resource, lblCancelamento %>" Enabled="false"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblMotivosTipo" runat="server" class="col-md-2 Label" Text="<%$ Resources:Resource, lblTipoMotivo %>" />
                                <asp:DropDownList ID="ddlMotivosTipo" runat="server" />
                            </div>
                            <div class="form-group" id="divMotivoReprovaPedido" runat="server">
                                <asp:Label ID="lblMotivoReprovPedido" runat="server" class="col-md-2 Label" Text="Motivo Cancelamento" />
                                <asp:DropDownList ID="ddlMotivoReprovPedido" runat="server" AutoPostBack="true"></asp:DropDownList>
                            </div>
                            <div class="form-group align-top">
                                <asp:Label ID="lblMotivosDescricao" runat="server" class="col-md-2 Label" Text="Descrição" />
                                <textarea id="txaMotivoDescricao" runat="server" rows="3" cols="20" style="width:100%; resize:none"></textarea>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="btnCancelamentoConfirma" runat="server" Text="Salvar" SkinID="ButtonLeft" OnClick="btnCancelamentoConfirma_Click" />
                                <asp:Button ID="btnCancelamentoFechar" runat="server" Text="Fechar" SkinID="ButtonRight" OnClick="btnCancelamentoFechar_Click" />
                            </div>
                        </fieldset>
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
