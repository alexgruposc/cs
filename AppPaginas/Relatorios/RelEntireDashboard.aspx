<%@ Page Title="Pedidos Entire - Dashboard" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelEntireDashboard.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelEntireDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../../Styles/font-awesome.css" rel="Stylesheet" type="text/css" />
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

        div.dashboard .borda {
            border: solid 2px #a0a0a0;
            border-radius: 6px;
            padding: 4px;
        }

        div.dashboard td {
            font-size: 2em;
            border-bottom: solid 1px #a0a0a0;
            border-top: solid 1px #a0a0a0;
            padding: 5px;
        }

        div.dashboard p {
            margin: 0px;
        }

        div.dashboard .vermelho {
            color: #dd0000;
            background-color: #eec0c0;
            border-color: #ee0000;
        }

        div.dashboard .amarelo {
            color: #777700;
            background-color: #eeeec0;
            border-color: #eed000;
        }

        /*cores*/
        .color-Laranja {
            color: #ff6a00;
        }

        .color-Verde {
            color: #60a643;
        }

        .bg-VerdeClaro {
            background-color: #c0eec0;
        }

        .color-Amarelo {
            color: #eed000;
        }

        .bg-AmareloClaro {
            background-color: #eeeec0;
        }

        .color-Vermelho {
            color: #ee0000;
        }

        .bg-VermelhoClaro {
            background-color: #eec0c0;
        }

        .border-Verde {
            border-color: #60a643;
        }

        .border-Amarelo {
            border-color: #eed000;
        }

        .border-Vermelho {
            border-color: #ee0000;
        }
    </style>

    <script type="text/javascript">
        function DashboardDetalhe(pValor) {
            document.getElementById("hid_comandoPost").value = "DashboardDetalhe";
            document.getElementById("hid_valorPost").value = pValor;
            form1.submit();
        }

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="updGeral" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="imbExportarExcel" />
        </Triggers>
        <ContentTemplate>
            <asp:HiddenField ID="hid_comandoPost" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hid_valorPost" runat="server" ClientIDMode="Static" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <h2 class="colorAzulKs">Pedidos Entire</h2>

    <asp:UpdatePanel ID="updDashboard" runat="server">
        <ContentTemplate>

            <fieldset class="pad-10">

                <div class="dashboard">
                    <div class="borda" style="padding: 2px 2px 2px 10px">
                        <h3>Alertas configurados para
                            <asp:Localize ID="lbl_infoAlertDias" runat="server"></asp:Localize>
                            dias. 
                            Alterar para
                            <asp:TextBox ID="txt_configAlertDias" runat="server" Style="width: 40px"></asp:TextBox>
                            dias. 
                            <asp:Button ID="btn_configAlertDias" runat="server" Text="Alterar" SkinID="BtnInfo-sm" OnClick="btn_configAlertDias_Click" />
                        </h3>
                    </div>
                </div>

                <div class="row dashboard mt-2">

                    <div class="col-md-3" style="width: 24%">
                        <div class="borda">
                            <h2>Pedidos Pendentes</h2>
                            <asp:Localize ID="lbl_DashBPendentes" runat="server"></asp:Localize>
                        </div>
                    </div>

                    <div class="col-md-3" style="width: 24%">
                        <div class="borda">
                            <h2>Pedidos Aprovados Sem Retorno</h2>
                            <asp:Localize ID="lbl_DashBSemretorno" runat="server"></asp:Localize>
                        </div>
                    </div>

                    <div class="col-md-3" style="width: 24%">
                        <div class="borda">
                            <h2>Pedidos Parados</h2>
                            <asp:Localize ID="lbl_DashBParados" runat="server"></asp:Localize>
                        </div>
                    </div>

                    <div class="col-md-3" style="width: 24%">
                        <div class="borda">
                            <h2>Notas NÃO Enviadas</h2>
                            <asp:Localize ID="lbl_DashBNFNaoEnviada" runat="server"></asp:Localize>
                        </div>
                    </div>

                </div>

            </fieldset>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updDetalhe" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel_GridDetalhe" runat="server">
                <fieldset class="pad-10">
                    <div class="row text-left">
                        <div class="col-md-7">
                            <h2>
                                <asp:Localize ID="lbl_Detalhes_Titulo" runat="server" /></h2>
                            <h3 class="color-Laranja">
                                <asp:Localize ID="lbl_Detalhes_Subtitulo" runat="server" /></h3>
                        </div>
                        <div class="col-md-3">
                            <asp:ImageButton ID="imbExportarExcel" ImageUrl="../../Imagens/xlsx.png" runat="server" OnClick="imbExportarExcel_Click" ToolTip="Exportar para Excel" Style="width: auto; height: 38px" />
                        </div>
                    </div>
                    <asp:GridView ID="grv_Detalhes" runat="server"
                        AutoGenerateColumns="true"
                        AllowPaging="true" PageSize="20"
                        OnPageIndexChanging="grv_Detalhes_PageIndexChanging" OnRowCommand="grv_Detalhes_RowCommand"
                        OnRowDataBound="grv_Detalhes_RowDataBound"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                    </asp:GridView>
                    <div class="text-center">
                        <asp:Localize ID="lbl_grv_Detalhes_PageInfo" runat="server" />
                    </div>

                </fieldset>
            </asp:Panel>


        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>
