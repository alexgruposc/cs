<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadTabelaPrecoImportacao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadTabelaPrecoImportacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript">
        function VerificaArquivo() {
            if (document.getElementById("ContentPlaceHolder1_fulArquivo").value == "") {
                alert('Selecione o arquivo');
                return false;
            } else {
                return true;
            }
        }
    </script>
    <fieldset style="left: 0.5%; width: 99%; height: 103px;">
        <legend>
            <asp:Literal ID="ltrTitulo" runat="server"/>
        </legend>

        <div style="border: solid 0px; margin-top: 21px;">
            <div class="boxPesquisa">
                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                    <asp:FileUpload ID="fulArquivo" runat="server" />
                </div>
            </div>

            <div class="boxPesquisa">
                <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" />
            </div>
        </div>
    </fieldset>
</asp:Content>

