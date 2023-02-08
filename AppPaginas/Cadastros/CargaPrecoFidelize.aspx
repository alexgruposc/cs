<%@ Page Title="Importação - Preços Fidelize" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CargaPrecoFidelize.aspx.cs"
    Inherits="KRAFTSALES.AppPaginas.Cadastros.CargaPrecoFidelize" %>

<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .borderLeft {
            border-left: solid 1px #aaaaaa;
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

        .colorAzulKs {
            color: #14293E;
        }

        .bg-VermelhoClaro {
            background-color: #eec0c0;
        }

        .bg-AzulClaro {
            background-color: #c0c0ee;
        }

        /* CLASSES DO PROGRESS BAR */

        .areaTelaTransp {
            /* class = Quadro que cobre área total para boxes sobrepostos */
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            text-align: center;
            z-index: 2020;
            background-repeat: repeat;
            background-image: url('../../imagens/layout/bkb50.png');
        }

            .areaTelaTransp .b30 {
                background-image: url('../../imagens/layout/bkb30.png');
            }

        div.modal-dialogPostBack {
            width: 90%;
            max-width: 920px;
            margin: 50px auto;
            height: auto;
            max-height: 92%;
            overflow-y: auto;
        }

        /* outros */

        div.UploadDoc {
            margin: auto;
            background-color: #ffddaa;
            padding: 10px;
            width: 100%;
            min-height: 70px;
            text-align: center;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: 60px;
            background-image: url('../../imagens/layout/bgUploadDoc.png');
        }

        input.FileUpload {
            margin: auto;
            background-color: transparent;
            width: 100%;
            height: auto;
            padding: 20px 0px 20px 25%;
            text-align: center;
        }
    </style>

    <script type="text/javascript">

        function panel_StatusImport(pDisplay) {
            if (pDisplay == "") {
                document.getElementById("ContentPlaceHolder1_hid_modalVisible").value = "panel_StatusImport";
            }
            document.getElementById("panel_StatusImport").style.display = pDisplay;
        }

        function panel_StatusUpload(pDisplay) {
            if (pDisplay == "") {
                document.getElementById("ContentPlaceHolder1_hid_modalVisible").value = "panel_StatusUpload";
            }
            document.getElementById("panel_StatusUpload").style.display = pDisplay;
        }

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="colorAzulKs">Importação de Arquivo para Preços da Fidelize</h3>

    <asp:UpdatePanel ID="updGeral" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_panelUploadArq" />
            <asp:PostBackTrigger ControlID="btn_panelSelecao" />
            <asp:PostBackTrigger ControlID="btn_enviarArquivo" />
            <asp:PostBackTrigger ControlID="btn_ConfirmImport" />
            <asp:PostBackTrigger ControlID="btn_ExportErros" />
        </Triggers>

        <ContentTemplate>
            <asp:HiddenField ID="hid_modalVisible" runat="server" />
            <fieldset class="pad-10 text-right">
                <asp:Button ID="btn_panelUploadArq" runat="server" SkinID="BtnInfo" Text="Envio de Arquivo" OnClick="btn_panelUploadArq_Click" />
                &nbsp;
                <asp:Button ID="btn_panelSelecao" runat="server" SkinID="BtnInfo" Text="Visualizar Cargas" OnClick="btn_panelSelecao_Click" />
            </fieldset>
        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updSelecao" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel_Selecao" runat="server">
                <fieldset class="pad-10">
                    <div class="row">

                        <div class="col-md-4">
                            <div class="row">
                                <div class="col-md-6">
                                    Data de Importação de:<br />
                                    <CtlData:ControlData ID="dt_SelDataCargaDe" runat="server" />
                                </div>
                                <div class="col-md-6">
                                    Até<br />
                                    <CtlData:ControlData ID="dt_SelDataCargaAte" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            Código EAN:<br />
                            <asp:TextBox ID="txt_SelCodEAN" runat="server" Style="width: 96%; max-width: 150px"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            UF de Destino:<br />
                            <asp:DropDownList ID="ddw_SelUfDestino" runat="server" Style="width: 96%; max-width: 150px"></asp:DropDownList>
                        </div>

                        <div class="col-md-3">
                            <asp:Button ID="btn_Selecionar" runat="server" SkinID="BtnInfo" Text="Pesquisar" OnClick="btn_Selecionar_Click" />
                            &nbsp;
                            <asp:Button ID="btn_LimparSelecao" runat="server" SkinID="BtnDefault" Text="Limpar" OnClick="btn_LimparSelecao_Click" />
                        </div>


                    </div>

                    <div style="clear: both"></div>

                    <div class="mt-2 text-right">
                    </div>

                    <div class="mt-2 text-left">
                        <h4 style="color: orange">
                            <asp:Localize ID="lbl_infoSelCarga" runat="server"></asp:Localize></h4>
                        <asp:GridView ID="grv_SelCarga" runat="server" DataKeyNames="CodEAN, UfDestino"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="20"
                            OnPageIndexChanging="grv_SelCarga_PageIndexChanging"
                            OnRowCommand="grv_SelCarga_RowCommand"
                            EmptyDataText="Não foi encontrado nenhum resultado!">
                            <Columns>
                                <asp:BoundField DataField="DataCarga" HeaderText="Data Carga" DataFormatString="{0:dd/MM/yyyy HH:mm}" ItemStyle-Width="10%" />
                                <asp:BoundField DataField="CodEAN" HeaderText="Código EAN" ItemStyle-Width="10%" />
                                <asp:BoundField DataField="itemId" HeaderText="Item ID" ItemStyle-Width="6%" />
                                <asp:BoundField DataField="itemDescricao" HeaderText="Nome Produto" ItemStyle-Width="25%" />
                                <asp:BoundField DataField="fabricanteNome" HeaderText="Fabricante" ItemStyle-Width="25%" />
                                <asp:BoundField DataField="UfDestino" HeaderText="UF Dest" ItemStyle-Width="6%" />
                                <asp:BoundField DataField="PrecoFabrica" HeaderText="Preço Fábrica" DataFormatString="{0:N2}" ItemStyle-Width="6%" />
                                <asp:BoundField DataField="Usuario" HeaderText="Usuario" ItemStyle-Width="6%" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="6%">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/Fechar.png"
                                            CommandName="ExcluirRegCarga" ToolTip="Excluir" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                        </asp:GridView>
                        <div class="text-center">
                            <asp:Localize ID="lbl_grv_SelCarga_PageInfo" runat="server" />
                        </div>
                    </div>

                </fieldset>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updUploadArq" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel_UploadArq" runat="server">
                <fieldset class="pad-10">
                    <h4 class="colorAzulKs">Envio de Arquivo</h4>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="UploadDoc">
                                <asp:FileUpload ID="upl_UploadArq" runat="server" EnableViewState="true" CssClass="FileUpload" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btn_enviarArquivo" runat="server" Text="Enviar Arquivo" SkinID="BtnSuccess" OnClick="btn_enviarArquivo_Click" OnClientClick="panel_StatusUpload('')" />
                        </div>
                    </div>
                </fieldset>
            </asp:Panel>

            <div id="panel_StatusUpload" class="areaTelaTransp" style="display: none">
                <!-- MODAL - Aguardando... -->
                <div class="modal-dialogPostBack" style="margin-top: 150px">
                    <div class="modal-content">
                        <h3>ENVIANDO E PROCESSANDO ARQUIVO. AGUARDE ...</h3>
                        <div class="m-2 pad-10">
                            <p class="text-center">
                                <img alt="" src="../../Imagens/animProcessando.gif" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updPanelValidaTabela" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel_ValidaTabela" runat="server">
                <fieldset class="pad-10">
                    <h4 class="colorAzulKs">Validação dos Dados Enviados</h4>

                    <div class="row">
                        <div class="col-md-8">
                            <asp:Localize ID="lbl_ValidaTabela" runat="server"></asp:Localize>
                        </div>
                        <div class="col-md-4 text-center">
                            <asp:Button ID="btn_ConfirmImport" runat="server" Text="Confirmar Importação" SkinID="BtnSuccess"
                                OnClick="btn_ConfirmImport_Click" UseSubmitBehavior="false" OnClientClick="panel_StatusImport('')" />
                            &nbsp;
                            <asp:Button ID="btn_ExportErros" runat="server" Text="Exportar Erros" SkinID="BtnWarning"
                                OnClick="btn_ExportErros_Click" UseSubmitBehavior="false" />
                        </div>
                    </div>

                    <div class="mt-2">
                        <asp:GridView ID="grv_ValidaTabela" runat="server" DataKeyNames="linhaOk"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="50"
                            OnPageIndexChanging="grv_ValidaTabela_PageIndexChanging" OnRowDataBound="grv_ValidaTabela_RowDataBound"
                            EmptyDataText="Não foi encontrado nenhum resultado!">
                            <Columns>
                                <asp:BoundField DataField="Linha" HeaderText="Linha" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="CodEAN" HeaderText="Código EAN" ItemStyle-Width="8%" />
                                <asp:BoundField DataField="itemId" HeaderText="Item ID" ItemStyle-Width="5%" />
                                <asp:BoundField DataField="itemDescricao" HeaderText="Nome Produto" ItemStyle-Width="15%" />
                                <asp:BoundField DataField="fabricanteNome" HeaderText="Fabricante" ItemStyle-Width="15%" />
                                <asp:BoundField DataField="UfDestino" HeaderText="UF Dest" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="PrecoFabrica" HeaderText="Preço Fábrica" ItemStyle-Width="7%" />
                                <asp:BoundField DataField="Excluir" HeaderText="Excluir" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="infoValidacao" HeaderText="Validação" ItemStyle-Width="19%" />
                                <asp:BoundField DataField="result" HeaderText="Resultado" ItemStyle-Width="19%" />
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                        </asp:GridView>
                        <div class="text-center">
                            <asp:Localize ID="lbl_grv_ValidaTabela_PageInfo" runat="server" />
                        </div>
                    </div>

                </fieldset>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div style="min-height: 70px;">
        &nbsp;
    </div>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="updSelecao">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="updStatusImport" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" />
            <asp:PostBackTrigger ControlID="btn_CancelarTarefa" />
        </Triggers>
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Enabled="false" />
            <div id="panel_StatusImport" class="areaTelaTransp" style="display: <%= StatusImportDisplay %>">
                <!-- MODAL - Aguardando... -->
                <div class="modal-dialogPostBack" style="margin-top: 150px">
                    <div class="modal-content">
                        <h3>IMPORTANDO DADOS. AGUARDE...</h3>
                        <div class="m-2 pad-10">
                            <p>
                                <asp:Localize ID="lbl_InfoStatusImport" runat="server"></asp:Localize>
                            </p>
                            <div class="progress" style="height: 40px">
                                <asp:Localize ID="lbl_BarraStatusImport" runat="server"></asp:Localize>
                            </div>
                            <div class="m-3 pad12">
                                <asp:Button ID="btn_CancelarTarefa" runat="server" Text="Cancelar" SkinID="BtnDefault" OnClick="btn_CancelarTarefa_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

