<%@ Page Title="Relatório de Restrições de Produtos" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelRestricaoProduto.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelRestricaoProduto" %>

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

        function alternaFiltro(pControl) {
            var limpaControl = "";
            switch (pControl) {
                case "txt_SelClienteId":
                    limpaControl = "txt_SelClienteCnpj";
                    break;
                case "txt_SelClienteCnpj":
                    limpaControl = "txt_SelClienteId";
                    break;
            }
            document.getElementById("ContentPlaceHolder1_" + limpaControl).value = "";
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

    <h3 class="colorAzulKs">Relatório de Restrições de Produtos</h3>

    <asp:UpdatePanel ID="updSelecao" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="imbExportarExcel" />
        </Triggers>
        <ContentTemplate>

            <fieldset class="pad-10">
                <h4 class="colorAzulKs">Selecionar Restrições</h4>

                <div class="row">
                    <div class="col-md-3">
                        ID Produto:<br />
                        <asp:TextBox ID="txt_SelItemId" runat="server" Style="width: 95%; max-width: 200px" MaxLength="12"></asp:TextBox>
                    </div>
                    <div class="col-md-3 borderLeft">
                        Cod. Cliente (ERP):<br />
                        <asp:TextBox ID="txt_SelClienteId" runat="server" Style="width: 95%; max-width: 200px" MaxLength="12" onkeyup="alternaFiltro('txt_SelClienteId')"></asp:TextBox>
                    </div>
                    <div class="col-md-3 borderLeft">
                        CNPJ Cliente:<br />
                        <asp:TextBox ID="txt_SelClienteCnpj" runat="server" Style="width: 95%; max-width: 200px" MaxLength="20" onkeyup="alternaFiltro('txt_SelClienteCnpj')"></asp:TextBox>
                    </div>
                    <div class="col-md-3 borderLeft">
                        Estabelecimento:<br />
                        <asp:DropDownList ID="ddw_SelEstabelec" runat="server" Style="width: auto; max-width: 95%"></asp:DropDownList>
                    </div>
                </div>

                <div style="clear: both"></div>

                <div class="row mt-2">
                    <div class="col-md-3">
                        Nome Restrição:<br />
                        <asp:TextBox ID="txt_SelNomeRestricao" runat="server" Style="width: 95%; max-width: 200px" MaxLength="60"></asp:TextBox>
                    </div>
                    <div class="col-md-3 borderLeft">
                        Tipo Restrição:<br />
                        <asp:DropDownList ID="ddw_SelTipoRestr" runat="server" Style="width: auto; max-width: 95%"></asp:DropDownList>
                    </div>
                    <div class="col-md-3 borderLeft">
                        Chave Origem:<br />
                        <asp:DropDownList ID="ddw_SelChaveOrig" runat="server" Style="width: auto; max-width: 95%"></asp:DropDownList>
                    </div>
                    <div class="col-md-3 borderLeft">
                        Chave Destino:<br />
                        <asp:DropDownList ID="ddw_SelChaveDest" runat="server" Style="width: auto; max-width: 95%"></asp:DropDownList>
                    </div>
                </div>

                <div style="clear: both">
                    &nbsp;
                </div>
                <hr />

                <div class="row mt-2">
                    <div class="col-md-7">
                        <b>Dados pesquisados:</b><br />
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Localize ID="lbl_InfoOrigem" runat="server"></asp:Localize>
                            </div>
                            <div class="col-md-6">
                                <asp:Localize ID="lbl_InfoDestino" runat="server"></asp:Localize>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 borderLeft pad-10 text-right">
                        <asp:ImageButton ID="imbExportarExcel" ImageUrl="../../Imagens/xlsx.png" runat="server" OnClick="imbExportarExcel_Click" ToolTip="Exportar para Excel" Style="width: auto; height: 38px" />
                    </div>
                    <div class="col-md-3 borderLeft pad-10 text-right">
                        <asp:Button ID="btn_SelRestricoes" runat="server" Text="Selecionar" SkinID="BtnInfo" OnClick="btn_SelRestricoes_Click" />&nbsp;
                        <asp:Button ID="btn_SelLimpar" runat="server" Text="Limpar" SkinID="BtnDefault" OnClick="btn_SelLimpar_Click" />&nbsp;
                    </div>
                </div>

                <div style="clear: both"></div>

                <div class="mt-2">
                    <!-- descrOrigem (4),  descrDestino (7), CNPJ (8), IdERP (9) -->
                    <asp:GridView ID="grv_Selecao" runat="server"
                        AutoGenerateColumns="false" AllowPaging="true" PageSize="20"
                        OnPageIndexChanging="grv_Selecao_PageIndexChanging"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="restricaoId" HeaderText="ID Restricão" />
                            <asp:BoundField DataField="restricaoNome" HeaderText="Nome Restrição" />
                            <asp:BoundField DataField="chaveOrigem" HeaderText="Chave Origem" />
                            <asp:BoundField DataField="valorOrigem" HeaderText="Valor Origem" />
                            <asp:BoundField DataField="descrOrigem" HeaderText="Descr. Origem" />
                            <asp:BoundField DataField="chaveDestino" HeaderText="Chave Destino" />
                            <asp:BoundField DataField="valorDestino" HeaderText="Valor Destino" />
                            <asp:BoundField DataField="descrDestino" HeaderText="Descr Destino" />
                            <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                            <asp:BoundField DataField="IdERP" HeaderText="Id ERP" />
                            <asp:BoundField DataField="tipoRestricao" HeaderText="Tipo Restricao" />
                            <asp:BoundField DataField="status" HeaderText="Status" />
                            <asp:BoundField DataField="dataCriacao" HeaderText="Criação" DataFormatString="{0: dd/MM/yyyy}" />
                            <asp:BoundField DataField="userId" HeaderText="Usuário" />
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                    </asp:GridView>
                    <div class="text-center">
                        <asp:Localize ID="lbl_grv_Selecao_PageInfo" runat="server" />
                    </div>
                </div>

            </fieldset>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div style="min-height: 30px">&nbsp;</div>

</asp:Content>
