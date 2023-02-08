<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadLimiteValorPedido.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadLimiteValorPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript">
        function ConsisteValor() {
            var msg = "";
            if (document.getElementById("ContentPlaceHolder1_txtValorLimite").value == "") {
                msg = "Necessário informar o valor limitador!";
            }

            if (msg != "") {
                alert(msg);
                return false;
            } else {
                return true;
            }
        }
    </script>

    <fieldset>
        <legend>
            <asp:Literal ID="ltrDadosHeader" runat="server" />
        </legend>
        <%-- FORMULÁRIO --%>
        <div style="padding: 8px; text-align: left; margin-top: 20px;">Valor Limite de Pedido Pessoa Física</div>
        <div style="padding-left: 8px; margin-bottom: 40px; text-align: left;">
            R$
            <asp:TextBox ID="txtValorLimite" class="TextBox_Currency" runat="server" Width="80" MaxLength="9" TabIndex="1" />&nbsp;&nbsp;<asp:Button ID="btnSalvar" runat="server" TabIndex="3" SkinID="ButtonCenter" ValidationGroup="Validacao" OnClick="btnSalvar_Click" Visible="true" />
        </div>
    </fieldset>

    <%--GRID DE LOGS DE ALTERAÇÃO DE VALORES --%>
    <fieldset style="height: auto; margin-top: 10px;">
        <legend class="legend_normal">
            <asp:Literal ID="lblLogsLimite" runat="server" />
        </legend>
        <div class="gridRegistros">
            <asp:GridView ID="gridValoresLimite" runat="server"
                DataKeyNames="limiteValor,usuarioId, limiteDataCadastro,limiteExcluido"
                OnRowDataBound="gridValoresLimite_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="limiteValor">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="usuarioId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="limiteDataCadastro">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="limiteExcluido" Visible="false" />
                </Columns>
            </asp:GridView>
            <br />
        </div>
    </fieldset>
</asp:Content>
