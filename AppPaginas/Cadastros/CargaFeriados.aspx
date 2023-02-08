<%@ Page Title="Importação - Feriados" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CargaFeriados.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CargaFeriados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">

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

        function panel_WaitUpload(pDisplay) {
            document.getElementById("panel_WaitUpload").style.display = pDisplay;
        }

    </script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <h3 class="colorAzulKs">Importação de Arquivo para Feriados</h3>

    <asp:UpdatePanel ID="updGeral" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_panelUploadArq" />
            <asp:PostBackTrigger ControlID="btn_enviarArquivo" />
            <asp:PostBackTrigger ControlID="btn_ConfirmImport" />
            <asp:PostBackTrigger ControlID="btn_ExportErros" />
        </Triggers>

        <ContentTemplate>
            <asp:HiddenField ID="hid_modalVisible" runat="server" />
            <fieldset class="pad-10 text-right">
                <asp:Button ID="btn_panelUploadArq" runat="server" SkinID="BtnInfo" Text="Enviar Arquivo" OnClick="btn_panelUploadArq_Click" />
                &nbsp;
                <a href="CadFeriados.aspx" class="btn btn-info">Editar Feriados</a>
            </fieldset>
                <div style="min-height: 10px;"></div>
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
                            <asp:Button ID="btn_enviarArquivo" runat="server" Text="Enviar Arquivo" SkinID="BtnSuccess"
                                OnClick="btn_enviarArquivo_Click" OnClientClick="panel_WaitUpload('')" />
                        </div>

                    </div>

                </fieldset>
            </asp:Panel>

            <div id="panel_WaitUpload" class="ProgressBackGround" style="display: none">
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
                                <asp:BoundField DataField="FeriadoMes" HeaderText="Mes" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="FeriadoDia" HeaderText="Dia" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="UF" HeaderText="UF" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="Cidade" HeaderText="Cidade" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="Descricao" HeaderText="Descrição" ItemStyle-Width="4%" />
                                 <asp:BoundField DataField="NomeImpactoOrigem" HeaderText="Impacto Origem" ItemStyle-Width="4%" />
                                 <asp:BoundField DataField="NomeImpactoDestino" HeaderText="Impacto Destino" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="NomeExcluir" HeaderText="Excluir" ItemStyle-Width="4%" />
                                <asp:BoundField DataField="infoValidacao" HeaderText="Validação" ItemStyle-Width="12%" />
                                <asp:BoundField DataField="result" HeaderText="Resultado" ItemStyle-Width="12%" />
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

        <asp:UpdatePanel ID="updStatusImport" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" />
            <asp:PostBackTrigger ControlID="btn_CancelarTarefa" />
        </Triggers>
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Enabled="false" />
            <div id="panel_StatusImport" class="areaTelaTransp" style="display: <%= StatusImportDisplay %>">
                <!-- MODAL - Progress Importando... -->
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
