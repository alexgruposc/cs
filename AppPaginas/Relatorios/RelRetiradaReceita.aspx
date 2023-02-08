<%@ Page Title="Relatório de Retirada de Receitas" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelRetiradaReceita.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelRetiradaReceita" %>

<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .colorAzulKs {
            color: #14293E;
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

        .borderLeft {
            border-left: solid 1px #aaaaaa;
        }
    </style>

    <script type="text/javascript">

        function GerarProtocolosPdf() {
            // abre doc PDF para visualização
            window.open("RelRetiradaReceita.Report.aspx");
            return true;
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="updSelecao">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <h3 class="colorAzulKs">Relatório de Retirada de Receitas</h3>

    <asp:UpdatePanel ID="updSelecao" runat="server">
        <ContentTemplate>

            <fieldset class="pad-10">
                <h4 class="colorAzulKs">Selecionar Pedidos</h4>

                <div class="row">

                    <div class="col-md-2">
                        Pedido:<br />
                        <asp:TextBox ID="txt_SelPedido" runat="server" Style="width: 95%; max-width: 100px"></asp:TextBox>
                    </div>

                    <div class="col-md-4 borderLeft">
                        Cliente:<br />
                        <asp:TextBox ID="txt_SelCliente" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                    </div>

                    <div class="col-md-4 borderLeft">
                        Cidade:<br />
                        <asp:TextBox ID="txt_SelCidade" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                    </div>

                    <div class="col-md-2 borderLeft">
                        Loja:<br />
                        <asp:DropDownList ID="ddw_SelEstabelec" runat="server" Style="width: auto; max-width: 95%"></asp:DropDownList>
                    </div>

                </div>

                <div style="clear: both; height:8px"></div>
                <hr />

                <div class="row">

                    <div class="col-md-2">
                        Período:<br />
                        <asp:DropDownList ID="ddw_SelPeriodo" runat="server" Style="width: auto; max-width: 95%"></asp:DropDownList>
                    </div>

                    <div class="col-md-4 borderLeft">
                        Data Retirada:<br />
                        <div>
                            <div style="float: left; margin: 0">
                                <CtlData:ControlData ID="dat_SelDataRetirDe" runat="server" />
                            </div>
                            <div style="float: left; margin: 2px">até</div>
                            <div style="float: left; margin: 0">
                                <CtlData:ControlData ID="dat_SelDataRetirAte" runat="server" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 borderLeft text-right">
                        <asp:Button ID="btnSelecionar" runat="server" Text="Pesquisar" SkinID="BtnDefault-sm" OnClick="btnSelecionar_Click" />
                        &nbsp;
                        <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="BtnDefault-sm" OnClick="btnLimpar_Click" />
                    </div>
                    <div class="col-md-2 borderLeft text-right">
                        <input type="button" id="btnProtocolos" runat="server" value="Gerar Protocolos" onclick="GerarProtocolosPdf()" />
                    </div>
                </div>

                <div style="clear: both"></div>

            </fieldset>

            <div style="clear: both"></div>

            <div class="pad-5 mt-2">
                <h4 style="color: #ff6a00">
                    <asp:Localize ID="lbl_grv_SelecaoInfo" runat="server" /></h4>
            </div>

            <div class="mt-2">
                <!-- 
pedidoid
Loja
data
per
Seq
PERIODO
CEP
Logradouro
Numero
Complemento
Bairro
Cidade
UF
Cliente
medicoconsprofissional
medicoufidcrm
medicocrm
pedidoobservacoes
pedidosituacao
receitaarquivo
                    -->
                <asp:GridView ID="grv_Selecao" runat="server"
                    AutoGenerateColumns="false" AllowPaging="true" PageSize="20"
                    OnPageIndexChanging="grv_Selecao_PageIndexChanging"
                    EmptyDataText="Não foi encontrado nenhum resultado!">
                    <Columns>
                        <asp:BoundField DataField="Loja" HeaderText="Loja" />
                        <asp:BoundField DataField="data" HeaderText="Retirada" DataFormatString="{0: dd/MM/yyyy}" />
                        <asp:BoundField DataField="pedidoid" HeaderText="Pedido" />
                        <asp:BoundField DataField="PERIODO" HeaderText="Periodo" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                        <asp:BoundField DataField="Bairro" HeaderText="Bairro" />
                        <asp:BoundField DataField="Cidade" HeaderText="Cidade" />
                        <asp:BoundField DataField="UF" HeaderText="UF" />
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                </asp:GridView>
                <div class="text-center">
                    <asp:Localize ID="lbl_grv_Selecao_PageInfo" runat="server" />
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
