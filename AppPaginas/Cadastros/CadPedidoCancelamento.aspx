<%@ Page Title="Cancelamento de Pedidos" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadPedidoCancelamento.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadPedidoCancelamento" %>

<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

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

    <!--  *******************************  SELEÇÃO/RELATÓRIO  *******************************  -->

    <asp:UpdatePanel ID="updSelecao" runat="server">
        <ContentTemplate>

            <asp:Panel ID="pnlRelatorio" runat="server">

                <fieldset class="mt-2 pad-5">
                    <legend>Cancelamento de Pedidos</legend>

                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-md-4">
                                Data Pedido:&nbsp;<CtlData:ControlData ID="dtSelDataDe" runat="server" />
                                Até:&nbsp;<CtlData:ControlData ID="dtSelDataAte" runat="server" />
                            </div>
                            <div class="col-md-4 boxPesquisa">
                                Número do Pedido:<br />
                                <asp:TextBox ID="txtSelPedidoId" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 boxPesquisa">
                                Cliente (nome, CNPJ ou CPF):<br />
                                <asp:TextBox ID="txtSelCliente" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-md-12 boxPesquisa text-right">
                                <asp:Button ID="btnSelecionar" runat="server" Text="Selecionar" SkinID="BtnDefault" OnClick="btnSelecionar_Click" />&nbsp;
                                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="BtnDefault" OnClick="btnLimpar_Click" />
                            </div>
                        </div>
                    </div>

                </fieldset>

                <fieldset class="mt-2 pad-5">
                    <asp:Localize ID="lblMensagemAviso" runat="server"></asp:Localize>
                    <h3>
                        <asp:Localize ID="lblTituloRelatorio" runat="server"></asp:Localize></h3>

                    <asp:GridView DataKeyNames="pedidoId"
                        runat="server"
                        ID="gvSelPedidos"
                        AutoGenerateColumns="False"
                        AllowPaging="True"
                        OnRowDataBound="gvSelPedidos_RowDataBound"
                        OnPageIndexChanging="gvSelPedidos_PageIndexChanging"
                        OnRowCommand="gvSelPedidos_RowCommand"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="pedidoId" HeaderText="Pedido" />
                            <asp:BoundField DataField="pedidoData" HeaderText="Data" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" />
                            <asp:BoundField DataField="pedidoValorTotal" HeaderText="Valor" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="estabelecimentoId" HeaderText="Loja" />
                            <asp:BoundField DataField="condicaoPagamentoDescricao" HeaderText="Condição Pagto" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" >
                                <ItemTemplate>
                                    <asp:Button ID="btnMostraConfirmCancel" runat="server" Text="Cancelar" SkinID="BtnDefault-xs" CommandName="MostrarConfirmCancel"
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

    <!--  ********************************  EDITOR/DETALHES  ********************************  -->

    <asp:UpdatePanel ID="updConfirmCancel" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlConfirmCancel" runat="server" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel">

                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Label ID="lblHeader1" Text="Confirmação de Cancelamento" runat="server" ForeColor="White" />
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imbConfirmCancelClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" OnClick="btnConfirmCancelClose_Click"
                                ToolTip="Fechar"
                                ImageUrl="~/Imagens/Fechar.png" />
                        </div>
                    </div>

                    <div class="painel_body">
                        <div class="mt-3" style="width: 96%; margin: auto;">
                            <h3>Pedido: <b>
                                <asp:Localize ID="lblPedidoId" runat="server"></asp:Localize></b>
                            </h3>
                            <div class="row mt-2">
                                <p><asp:Localize ID="lblInfoPedido" runat="server"></asp:Localize></p>
                                <fieldset class="center pad-5">
                                    <p>
                                        <b>Observações:</b>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="txtNotas" TextMode="MultiLine" Style="width: 50%; height: 90px; resize: none;" runat="server"
                                                onkeyup="return checkTamTexto('txtNotas', 'Observações', 'lblInfoTamNotas', 255)" /><br />
                                            <input type="text" class="LabelInfo" id="lblInfoTamNotas" />

                                    </p>
                                    <p>Clique abaixo para confirmar o cancelamento</p>
                                    <p>
                                        <asp:Button ID="btnConfirmCancel" runat="server" SkinID="BtnDanger" Text="Confirmar Cancelamento" OnClick="btnConfirmCancel_Click" />
                                    </p>
                                </fieldset>



                            </div>

                        </div>
                    </div>

                    <div class="painel_bottom">
                        <div class="center mt-1">
                            <asp:Button ID="btnConfirmCancelClose" runat="server" Text="Fechar" OnClick="btnConfirmCancelClose_Click" />
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
