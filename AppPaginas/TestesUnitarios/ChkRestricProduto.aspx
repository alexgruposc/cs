<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChkRestricProduto.aspx.cs" Inherits="KRAFTSALES.AppPaginas.TestesUnitarios.ChkRestricProduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Teste para Check de Restrições de Produtos</title>

    <style type="text/css">
        body {
            font-family: sans-serif;
            font-size: 10pt;
        }

        div {
            padding: 4px;            
            max-width: 900px;
        }

            div.col {
                display: inline-table;
                margin: 4px;
            }

                div.col .col4 {
                    width: 23%;
                }

                div.col .col3 {
                    width: 30%;
                }

                div.col .col2 {
                    width: 45%;
                }

        table {
            width: auto;
        }

        td {
            text-align: left;
            vertical-align: top;
            padding: 2px;
        }

        li {
            margin-bottom: 3px;
        }

        .borda {
            border: solid 1px #a0a0a0;
        }

        .pad8 {
            padding: 8px;
        }

        .center {
            text-align: center;
        }

        .bgRed {
            background-color: #ffcccc;
            border: solid 2px #ff0000;
        }

        .bgGreen {
            background-color: #ccffcc;
            border: solid 2px #00ff00;
        }

        .bgYellow {
            background-color: #ffffcc;
            border: solid 2px #ffff00;
        }

        .bgGray {
            background-color: #dddddd;
            border: solid 2px #777777;
        }

        .fitaPreta {
            background-color: #000000;
            color: #ffffff;
            font-weight: bold;
            padding: 3px;
        }

        .txBox {
            width: 85px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: auto">
            <h2>Teste Unitário para Checagem de Restrição de Produto</h2>
            <div class="bgGray center">
                <p>Valores para teste:</p>
               
                <asp:Localize ID="lbl_msgErro" runat="server"></asp:Localize>                

                <div>
                    <div class="col col4 borda">
                        <p class="fitaPreta">Cliente ID</p>
                        <asp:TextBox ID="txt_clienteId" CssClass="txBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col col4 borda">
                        <p class="fitaPreta">Tipo Endereço</p>
                        <asp:DropDownList ID="ddl_tipoEnderecoId" CssClass="txBox" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col col4 borda">
                        <p class="fitaPreta">Item ID</p>
                        <asp:TextBox ID="txt_itemId" CssClass="txBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col col4 borda">
                        <p class="fitaPreta">Estabelecimento ID</p>
                        <asp:TextBox ID="txt_estabelecimentoId" CssClass="txBox" runat="server"></asp:TextBox>
                    </div>
                </div>

                <p>
                    <asp:Localize ID="lbl_infoNumRestricoes" runat="server"></asp:Localize>
                </p>

                <div class="center">
                    <asp:Button ID="btn_testar" runat="server" Text="Testar"
                        CssClass="pad8" Style="min-width: 120px;" OnClick="btn_testar_Click" />
                    &nbsp;
                    <asp:Button ID="btn_limpar" runat="server" Text="Limpar"
                        CssClass="pad8" Style="min-width: 120px;" OnClick="btn_limpar_Click" />
                </div>

            </div>

            <hr />

            <div class="borda center">
                <h3>Valores obtidos e considerados</h3>

                    estabelecimento:  <b><asp:Localize ID="lbl_estabelecimentoId" runat="server"></asp:Localize></b>

                <div>
                    <table style="margin: auto">
                        <tr>
                            <td>
                                <p class="fitaPreta">Dados do Produto</p>
                                <table class="borda">
                                    <tr>
                                        <td>Item</td>
                                        <td>
                                            <asp:Localize ID="lbl_itemId" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Fabricante</td>
                                        <td>
                                            <asp:Localize ID="lbl_fabricanteId" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Familia Comercial</td>
                                        <td>
                                            <asp:Localize ID="lbl_familiaComercialId" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Familia Material</td>
                                        <td>
                                            <asp:Localize ID="lbl_familiaMaterialId" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Grupo de Estoque</td>
                                        <td>
                                            <asp:Localize ID="lbl_grupoEstoqueId" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Tipo de Produto</td>
                                        <td>
                                            <asp:Localize ID="lbl_tipoProdutoId" runat="server"></asp:Localize></td>
                                    </tr>

                                </table>
                            </td>

                            <td>
                                <p class="fitaPreta">Dados do Cliente</p>
                                <table class="borda">
                                    <tr>
                                        <td>cliente</td>
                                        <td>
                                            <asp:Localize ID="lbl_clienteId" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Pais</td>
                                        <td>
                                            <asp:Localize ID="lbl_pais" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Estado</td>
                                        <td>
                                            <asp:Localize ID="lbl_estado" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Cidade</td>
                                        <td>
                                            <asp:Localize ID="lbl_cidade" runat="server"></asp:Localize></td>
                                    </tr>

                                    <tr>
                                        <td>Tipo de Pessoa</td>
                                        <td>
                                            <asp:Localize ID="lbl_clienteTipoPessoa" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Grupo Comercial</td>
                                        <td>
                                            <asp:Localize ID="lbl_clienteGrupoComercialId" runat="server"></asp:Localize></td>
                                    </tr>
                                    <tr>
                                        <td>Canal de Venda</td>
                                        <td>
                                            <asp:Localize ID="lbl_canalVendaId" runat="server"></asp:Localize></td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>

                </div>

            </div>

            <div class="bgGray">
                <asp:GridView ID="gv_resultado" runat="server"
                    AutoGenerateColumns="false"
                    AllowPaging="false"
                    EmptyDataText="Não foi encontrado nenhum resultado!">
                    <Columns>
                        <asp:BoundField DataField="chaveOrigem" HeaderText="Chave Origem" />
                        <asp:BoundField DataField="valorOrigem" HeaderText="Valor Origem" />
                        <asp:BoundField DataField="chaveDestino" HeaderText="Chave Destino" />
                        <asp:BoundField DataField="valorDestino" HeaderText="Valor Destino" />
                        <asp:BoundField DataField="tipoRestricao" HeaderText="Tipo Restricao" />
                        <asp:BoundField DataField="restricaoId" HeaderText="ID Restric" />
                        <asp:BoundField DataField="restricaoNome" HeaderText="Nome Restric" />
                        <asp:BoundField DataField="userId" HeaderText="usuário" />
                        <asp:BoundField DataField="dataAtualiz" HeaderText="Data Atualiz" DataFormatString="{0:d}" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:Panel ID="panel_resultado" runat="server" CssClass="center">

                <p class="fitaPreta">Resultado</p>

                <p><asp:Localize ID="lbl_resultado" runat="server"></asp:Localize></p>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

