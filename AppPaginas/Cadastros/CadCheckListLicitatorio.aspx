<%@ Page Title="Check-List Licitatório " Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadCheckListLicitatorio.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCheckListLicitatorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- CONTROLES --%>
    <%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>
    <%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
    <%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

    <script src="../../Scripts/jquery-3.1.0.js"></script>
    <style type="text/css">
        .borderLeft {
            border-left: solid 1px #aaaaaa;
        }

        .LabelInfo {
            border-style: none;
            background-color: transparent;
            width: 100%;
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

        .tabNovoItem td {
            text-align: left;
            vertical-align: bottom;
        }

        ul, li {
            text-align: left;
        }

        div.right {
            text-align: right;
        }
    </style>
    <script language="javascript" type="text/javascript">

        function isDecimalNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;

            if (charCode != 44 && charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            else if (charCode == 46) {
                var srcElement = (window.event) ? window.event.srcElement : evt.target;
                if (srcElement.value.indexOf('.') >= 0)
                    return false;
            }
            else {
                return true;
            }
        }

        function LimparCamposData() {
            document.getElementById("ContentPlaceHolder1_dtCredenc_txtData").value = "";
            document.getElementById("ContentPlaceHolder1_dtAbertura_txtData").value = "";
            document.getElementById("ContentPlaceHolder1_dtLimite_txtData").value = "";
            document.getElementById("ContentPlaceHolder1_dtEnvioDoc_txtData").value = "";
            return true;
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 13 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

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

        function abreDocumentoPdf() {
            // abre doc PDF para visualização
            var id = document.getElementById("ContentPlaceHolder1_hid_checkListId").value;
            window.open("CadCheckList_Report.aspx?id=" + id);
            return true;
        }

        function autoEnter(evento, atrControle) {
            if (evento.keyCode == 13) {
                document.getElementById("ContentPlaceHolder1_hid_comandoPost").value = atrControle;
                form1.submit();
            }
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlGeral" runat="server">

        <asp:UpdatePanel ID="updPrincipal" runat="server">
            <ContentTemplate>

                <asp:HiddenField ID="hid_comandoPost" runat="server" />

                <asp:Panel ID="pnlDados" runat="server" Width="100%" Height="97%" Visible="false">

                    <fieldset class="mt-2">
                        <legend>Cadastro de Check List Licitatório</legend>
                        <div style="text-align: left; float: left; margin: 0; padding: 0 0 0 10px; display: table-cell; width: 50%; vertical-align: middle;">
                            <h2 style="color: #14293E">
                                <asp:Localize ID="lbl_checkListId" runat="server"></asp:Localize></h2>
                        </div>
                        <!--  UseSubmitBehavior="false" 
                            btnLimparCheckList = OnClientClick="return LimparCamposData()"
                            btnVoltar = OnClientClick="return LimparCamposData()"
                            -->
                        <div style="text-align: right; float: left; margin: 0; display: table-cell; width: 50%; vertical-align: middle;">
                            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" SkinID="BtnDefault" ValidationGroup="Validacao" OnClick="btnSalvar_Click" UseSubmitBehavior="false" />
                            &nbsp;<asp:Button ID="btnLimparCheckList" runat="server" Text="Limpar" SkinID="BtnDefault" OnClick="btnLimparCheckList_Click" UseSubmitBehavior="false" />
                            &nbsp;<asp:Button ID="btnVoltar" runat="server" Text="Voltar" SkinID="BtnDefault" OnClick="btnVoltar_Click" UseSubmitBehavior="false" />
                            &nbsp;<asp:Button ID="btnExportPdf" runat="server" OnClientClick="return abreDocumentoPdf()" Text="Imprimir" SkinID="BtnDefault" UseSubmitBehavior="false" />

                        </div>
                    </fieldset>

                    <!--  *******************************  DADOS DO CLIENTE - EDITOR  *******************************  -->

                    <asp:UpdatePanel ID="udpChkListCliente" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <fieldset>
                                        <legend class="legend_normal">Dados do cliente</legend>

                                        <div class="mt-1 mb-1">
                                            <div class="col-md-6 boxPesquisa">
                                                <asp:Label ID="lblCnpj" Text="CNPJ:" runat="server" /><br />
                                                <asp:TextBox ID="txtCnpjSelecao" runat="server" MaxLength="18" onkeyup="autoEnter(event, 'txtCnpjSelecao')" onkeypress="return isNumberKey(event)" />
                                                <asp:HiddenField ID="hid_checkListId" runat="server" Value="" />
                                                <asp:HiddenField ID="hid_clienteId" runat="server" Value="" />
                                                <asp:HiddenField ID="hdfContratoAlteracaoRepresentanteId" runat="server" Value="" />

                                                <asp:ImageButton ID="imgSelecClientePorCnpj" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                    ToolTip="<%$ Resources:Resource, lblBuscar %>"
                                                    ImageUrl="~/Imagens/check.png"
                                                    OnClick="imgSelecClientePorCnpj_Click" />&nbsp;

                                            <asp:ImageButton ID="imgSelecClientePelaGrid" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                ImageUrl="~/Imagens/find.png"
                                                OnClick="imgSelecClientePelaGrid_Click" />

                                                <div style="clear: both"></div>

                                                <div style="display: none; width: 84%; text-align: left; vertical-align: middle;">
                                                    <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 300px;">
                                                        <asp:Label ID="lblContratoHeaderCnpjDescricao" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 boxPesquisa">
                                                <asp:Label ID="lblUf" Text="UF:" runat="server" /><br />
                                                <asp:TextBox ID="txtUf" Enabled="false" runat="server" />
                                            </div>
                                            <div class="col-md-4 boxPesquisa">
                                                <asp:Label ID="lblIcms" Text="ICMS:" runat="server" /><br />
                                                <asp:TextBox ID="txtICMS" Enabled="false" runat="server" />
                                            </div>
                                        </div>

                                        <div class="mt-2 mb-1">
                                            <div class="col-md-12 boxPesquisa">
                                                <asp:Label ID="lblRazaoSocial" Text="Razão Social:" runat="server" /><br />
                                                <asp:TextBox ID="txtRazaoSocial" Enabled="false" runat="server" MaxLength="60" Style="width: 100%" />
                                            </div>
                                        </div>

                                        <div class="mt-2 mb-1">
                                            <div class="col-md-4 boxPesquisa">
                                                <asp:Label ID="lblCodigoErp" Text="Código ERP:" runat="server" /><br />
                                                <asp:TextBox ID="txtCOD" Enabled="false" runat="server" />
                                            </div>
                                            <div class="col-md-8 boxPesquisa">
                                                <asp:Label ID="lblModalidade" Text="Modalidade:" runat="server" /><br />
                                                <asp:DropDownList ID="ddlModalidade" runat="server">
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                        <div style="clear: both; min-height: 10px"></div>

                                    </fieldset>
                                </div>

                                <div class="col-md-6">
                                    <fieldset>
                                        <legend class="legend_normal">Observações</legend>
                                        <div class="mt-1">
                                            <asp:TextBox ID="txtObservacao" TextMode="MultiLine" Style="width: 90%; height: 90px; resize: none;" runat="server"
                                                onkeyup="return checkTamTexto('txtObservacao', 'Observações', 'lblInfoTamObs', 255)" /><br />
                                            <input type="text" class="LabelInfo" id="lblInfoTamObs" />

                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <div style="clear: both"></div>

                    <!--  *******************************  DADOS DO CHECKLIST - EDITOR  *******************************  -->

                    <asp:UpdatePanel ID="udpChkListEdital" runat="server">
                        <ContentTemplate>
                            <fieldset>
                                <legend class="legend_normal">Dados do Edital</legend>

                                <div class="row">

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblCodEdital" Text="Cod. Edital:" runat="server" /><br />
                                            <asp:TextBox ID="txtEdital" runat="server" MaxLength="18" />
                                        </div>
                                        <div class="mt-1 mb-1">
                                            <asp:Label ID="lblCodProcesso" Text="Cod. Processo:" runat="server" /><br />
                                            <asp:TextBox ID="txtProcesso" runat="server" MaxLength="18" />
                                        </div>
                                    </div>

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblTotalTitulos" Text="Total em títulos:" runat="server" /><br />
                                            <asp:TextBox ID="txtTotalTitulo" runat="server" MaxLength="18" Enabled="false" DataFormatString="{0:N2}" />
                                        </div>
                                        <div class="mt-1 mb-1">
                                            <asp:Label ID="lblTitulosAcima90d" Text="Títulos acima 90d:" runat="server" /><br />
                                            <asp:TextBox ID="txtTituloAcima90" runat="server" MaxLength="18" DataFormatString="{0:N2}" onkeypress="return isDecimalNumberKey(event)"
                                                OnTextChanged="txtTituloAcima90_TextChanged" />
                                        </div>
                                    </div>

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblDataAbertura" Text="Data-Abertura:" runat="server" /><br />
                                            <CtlData:ControlData ID="dtAbertura" runat="server" />
                                        </div>
                                        <div class="mt-1 mb-1">
                                            <asp:Label ID="lblHoraAbertura" Text="Hora-Abertura:" runat="server" /><br />
                                            <asp:TextBox ID="txtHoraAbertura" runat="server" MaxLength="8" Style="max-width: 70px" />
                                            <ucc:MaskedEditExtender
                                                ID="MaskedEditExtender2"
                                                runat="server"
                                                TargetControlID="txtHoraAbertura"
                                                Mask="99:99"
                                                MaskType="Time"
                                                MessageValidatorTip="true"></ucc:MaskedEditExtender>
                                        </div>
                                    </div>

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblDataLimite" Text="Data-Limite:" runat="server" /><br />
                                            <CtlData:ControlData ID="dtLimite" runat="server" style="max-width: 100%;" />
                                        </div>
                                        <div class="mt-1 mb-1">
                                            <asp:Label ID="lblHoraLimite" Text="Hora-Limite:" runat="server" /><br />
                                            <asp:TextBox ID="txtHoraLimite" runat="server" MaxLength="8" Style="max-width: 70px" />
                                            <ucc:MaskedEditExtender
                                                ID="MaskedEditExtender1"
                                                runat="server"
                                                TargetControlID="txtHoraLimite"
                                                Mask="99:99"
                                                MaskType="Time"
                                                MessageValidatorTip="true"></ucc:MaskedEditExtender>
                                        </div>
                                    </div>

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblDataCredenciam" Text="Data de Credenciamento:" runat="server" /><br />
                                            <CtlData:ControlData ID="dtCredenc" runat="server" />
                                        </div>
                                        <div class="mt-1 mb-1">
                                            <asp:Label ID="lblDataEnvioDocs" Text="Data Envio Docs:" runat="server" /><br />
                                            <CtlData:ControlData ID="dtEnvioDoc" runat="server" />
                                        </div>
                                    </div>

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblPrazoEntregaDias" Text="Prazo Entrega (dias):" runat="server" /><br />
                                            <asp:TextBox ID="txtPrazoEntregaDias" onkeypress="return isNumberKey(event)" runat="server" MaxLength="10" />
                                        </div>
                                        <div class="mt-1 mb-1">
                                            <asp:Label ID="lblFormaEnvio" Text="Forma de Envio:" runat="server" /><br />
                                            <asp:DropDownList ID="ddlFormaEnvio" runat="server" />
                                        </div>
                                    </div>

                                </div>

                                <div style="clear: both">
                                    <hr />
                                </div>

                                <div class="row">

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblVigenciaContrato" Text="Vigência Contrato:" runat="server" /><br />
                                            <asp:TextBox ID="txtVigencia" runat="server" MaxLength="30" />
                                        </div>

                                        <div class="mt-1 mb-1">
                                            <asp:Label ID="lblDescontoCap" Text="Desconto CAP:" runat="server" /><br />
                                            <asp:DropDownList ID="ddlCAPCheck" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCAPCheck_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <p id="panel_CAPPorcent" runat="server" visible="false">
                                                <asp:Label ID="lblCapPorcent" Text="Percent. Desconto CAP:" runat="server" /><br />
                                                <asp:TextBox ID="txtCAPPorcent" runat="server" MaxLength="6" Width="40px" AutoPostBack="true" OnTextChanged="txtCAPPorcent_TextChanged" />&nbsp;%
                                            </p>
                                        </div>

                                    </div>

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblImportancia" Text="Importância:" runat="server" /><br />
                                            <asp:DropDownList ID="ddlNivelImportancia" runat="server"
                                                OnSelectedIndexChanged="ddlNivelImportancia_SelectedIndexChanged" AutoPostBack="true" />
                                        </div>

                                        <div class="mt-1 mb-1">
                                            <asp:Panel ID="panel_ResponsConferenc1" runat="server">
                                                <asp:Label ID="lblResponsConferenc1" Text="Responsável Conferência (1):" runat="server" /><br />
                                                <asp:TextBox ID="txtResponsConferenc1" runat="server" MaxLength="30" />
                                            </asp:Panel>

                                            <asp:Panel ID="panel_ResponsConferenc2" runat="server">
                                                <asp:Label ID="lblResponsConferenc2" Text="Responsável Conferência (2):" runat="server" /><br />
                                                <asp:TextBox ID="txtResponsConferenc2" runat="server" MaxLength="30" />
                                            </asp:Panel>
                                        </div>
                                    </div>

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblResponsCaptacao" Text="Responsável Captação:" runat="server" /><br />
                                            <asp:TextBox ID="txtResponsCaptacao" runat="server" MaxLength="30" />
                                        </div>
                                        <div class="mt-1 mb-1">
                                            <asp:Label ID="lblResponsAutoriz" Text="Responsável Autorização:" runat="server" /><br />
                                            <asp:TextBox ID="txtResponsAutoriz" runat="server" MaxLength="30" />
                                        </div>
                                    </div>

                                    <div class="col-md-2 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblValidadeExigida" Text="Validade Exigida:" runat="server" /><br />
                                            <asp:TextBox ID="txtValidadeExigida" runat="server" MaxLength="30" />
                                        </div>
                                        <div class="mt-1 mb-1 pad-10" style="background-color: #aaaaaa">
                                            <asp:Label ID="lblStatusCheckList" Text="Status do CheckList:" runat="server" /><br />
                                            <asp:DropDownList ID="ddlStatus" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-md-4 boxPesquisa">
                                        <div class="mt-1">
                                            <asp:Label ID="lblObsSupervisor" Text="Observações do Supervisor:" runat="server" /><br />
                                            <asp:TextBox ID="txtobsSupervisor" TextMode="MultiLine" Style="width: 90%; height: 90px; resize: none;" runat="server"
                                                onkeyup="return checkTamTexto('txtobsSupervisor', 'Observações do Supervisor', 'lblInfoTamObsSup', 255)" />
                                            <input type="text" class="LabelInfo" id="lblInfoTamObsSup" />
                                        </div>
                                    </div>

                                </div>

                            </fieldset>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <!--  *******************************  DADOS DOS ITENS - EDITOR  *******************************  -->

                    <asp:UpdatePanel ID="updChklistItens" runat="server">
                        <ContentTemplate>

                            <fieldset>
                                <legend class="legend_normal">Dados dos Itens</legend>

                                <div class="row pad-5">
                                    <div class="col-md-9">
                                        <b>Item:</b>
                                        <br />
                                        <asp:TextBox ID="txtPesquisarItem" runat="server" MaxLength="18" onkeyup="autoEnter(event, 'txtPesquisarItem')" Width="150px" />
                                        &nbsp;
                                                    <asp:ImageButton ID="imgSelecItemPorId" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                        ToolTip="<%$ Resources:Resource, lblBuscar %>"
                                                        ImageUrl="~/Imagens/check.png"
                                                        OnClick="imgSelecItemPorId_Click" />
                                        &nbsp;

                                                     <asp:ImageButton ID="imgSelecItemPelaGrid" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                         ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                         ImageUrl="~/Imagens/find.png"
                                                         OnClick="imgSelecItemPelaGrid_Click" />
                                        &nbsp;
                                                    <asp:ImageButton ID="imgIncluiItemNaoRegistrado" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                        ToolTip="Incluir Item Não Registrado"
                                                        ImageUrl="~/Imagens/incluir.png"
                                                        OnClick="imgIncluiItemNaoRegistrado_Click" />
                                    </div>
                                    <div class="col-md-3 right">
                                        <div style="background-color: #aaaaaa; padding: 1px 5px 1px 3px">
                                            <h3 style="color: #14293E">Valor Total R$
                                                <asp:Localize ID="lblValorTotal" runat="server"></asp:Localize></h3>
                                        </div>
                                    </div>

                                </div>


                                <div id="panel_ItemNaoRegistr" runat="server" class="pad-10" visible="false">

                                    <table class="tabNovoItem">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblDescrINR" Text="Descrição do Item: " runat="server" /><br />
                                                <asp:TextBox ID="txtItemNaoRegistrDescr" runat="server" MaxLength="255" Width="140px" />
                                            </td>

                                            <td>
                                                <asp:Label ID="lblValorUnitINR" Text="Valor Unitário: " runat="server" /><br />
                                                <asp:TextBox ID="txtItemNaoRegistrValor" onkeypress="return isDecimalNumberKey(event)" runat="server" MaxLength="18" Width="80px" />
                                            </td>

                                            <td>
                                                <asp:Label ID="lblLaboratorioINR" Text="Laboratório: " runat="server" /><br />
                                                <asp:DropDownList ID="ddlLaboratorio" Style="width: auto" runat="server">
                                                </asp:DropDownList>
                                            </td>

                                            <td>
                                                <asp:Label ID="lblRegimeINR" Text="Regime: " runat="server" /><br />
                                                <asp:DropDownList ID="ddlRegime" Style="width: auto" runat="server">
                                                </asp:DropDownList>
                                            </td>

                                            <td>
                                                <asp:Button ID="btnSalvarItemNaoRegistr" runat="server" Text="Salvar Novo Item" OnClick="btnSalvarItemNaoRegistr_Click" />
                                            </td>

                                            <td>
                                                <asp:Button ID="btnCancelarItem" runat="server" Text="Cancelar" OnClick="btnCancelarItem_Click" />
                                            </td>

                                        </tr>
                                    </table>

                                </div>

                                <!--  *******************************  GRID DE ITENS  *******************************                        
                            -->
                                <div style="clear: both"></div>

                                <asp:GridView ID="gridItem" runat="server"
                                    DataKeyNames="sequencia,checkListId,itemLicitacaoId,itemId,ItemNome,laboratorio,qtdUNDCXA,qtdEdital,
                            valorUnitario,valorUnitDesc,valorTotal,desconto,regime,valorMinLance,autorizado,
                            estabelecimentoId,acaoJuridica,DescontAcaoJurid,itemRegistrado,DataRetornoLab,capAplicado,valorCompraCx"
                                    OnRowDataBound="gridItem_RowDataBound"
                                    OnRowCommand="gridItem_RowCommand" OnDataBinding="gridItem_DataBinding">
                                    <Columns>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Seq." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                            <ItemTemplate>
                                                <asp:Localize ID="lblSequenciaEdital" runat="server" />
                                                <asp:TextBox ID="txtSequencia" Width="40px" runat="server" Font-Bold="true" AutoPostBack="True" MaxLength="7" OnTextChanged="txtSequencia_TextChanged" />

                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" HeaderText="CÓDIGO" ItemStyle-Width="60px" ItemStyle-Wrap="true" />
                                        <asp:BoundField DataField="ItemNome" ItemStyle-HorizontalAlign="Center" HeaderText="ITEM" ItemStyle-Width="120px" ItemStyle-Wrap="true" />

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="VALOR COMPRA CX" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtValorCompraCx" onkeypress="return isDecimalNumberKey(event)" Width="80px" runat="server"
                                                    Font-Bold="true" AutoPostBack="True" MaxLength="14" OnTextChanged="txtValorCompraCx_TextChanged" DataFormatString="{0:N2}" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="CAP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:Localize ID="lblcapAplicado" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="AÇÃO JUDICIAL" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkAcaoJuridica" OnCheckedChanged="chkAcaoJuridica_CheckedChanged" AutoPostBack="True" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="DESCONTO AÇÃO JUDIC." ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDescontAcaoJurid" onkeypress="return isDecimalNumberKey(event)" runat="server" Width="40px" Font-Bold="true" MaxLength="6"
                                                    AutoPostBack="true" OnTextChanged="txtDescontAcaoJurid_TextChanged" />%
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="laboratorio" ItemStyle-HorizontalAlign="Center" HeaderText="LABORATÓRIO" ItemStyle-Width="120px" ItemStyle-Wrap="true" />

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="Qtd UNIT CX" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtqtdUNDCXA" onkeypress="return isNumberKey(event)" Width="50px" runat="server" Font-Bold="true" MaxLength="7"
                                                    AutoPostBack="True" OnTextChanged="txtqtdUNDCXA_TextChanged" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="QTD EDITAL" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtqtdEdital" onkeypress="return isNumberKey(event)" Width="50px" runat="server" Font-Bold="true" AutoPostBack="True" MaxLength="7" OnTextChanged="txtqtdEdital_TextChanged" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="valorUnitario" ItemStyle-HorizontalAlign="Center" HeaderText="PREÇO FÁBRICA" ItemStyle-Width="70px" DataFormatString="{0:N2}" ItemStyle-Wrap="true" />

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="VL UNIT. DESC." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                            <ItemTemplate>
                                                <asp:Localize ID="lblValorUnitDesc" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="valorTotal" ItemStyle-HorizontalAlign="Center" HeaderText="VL TOTAL" ItemStyle-Width="80px" DataFormatString="{0:N2}" ItemStyle-Wrap="true" />

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="DESCONTO" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtdesconto" runat="server" Width="50px" Font-Bold="true" MaxLength="16" AutoPostBack="true" OnTextChanged="txtdesconto_TextChanged" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="regime" ItemStyle-HorizontalAlign="Center" HeaderText="REGIME" ItemStyle-Width="60px" ItemStyle-Wrap="true" />

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="VALOR MIN LANCE" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtvalorMinLance" runat="server" Width="60px" Font-Bold="true" MaxLength="14" onkeypress="return isDecimalNumberKey(event)"
                                                    AutoPostBack="True" OnTextChanged="txtvalorMinLance_TextChanged" DataFormatString="{0:N2}" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="LOJA" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlEstabelecimentoId" runat="server"
                                                    class="vpb_dropdown" AutoPostBack="true" Width="70px" OnSelectedIndexChanged="ddlEstabelecimentoId_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="AUTORIZ." ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlAUT" runat="server"
                                                    class="vpb_dropdown" AutoPostBack="true" Width="50px" OnSelectedIndexChanged="ddlAUT_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" HeaderText="DATA RETORNO LAB" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDataRetornoLab" runat="server" MaxLength="10" Style="width: 80px" AutoPostBack="true" OnTextChanged="txtDataRetornoLab_TextChanged" />
                                                <ucc:MaskedEditExtender
                                                    ID="MaskedEditExtender3"
                                                    runat="server"
                                                    TargetControlID="txtDataRetornoLab"
                                                    Mask="99/99/9999"
                                                    MaskType="Date"
                                                    MessageValidatorTip="true"></ucc:MaskedEditExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Excluir" ItemStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbExcluir" runat="server" CommandName="ExcluirItemGridItem" Width="20px" Height="20px"
                                                    ToolTip="Excluir" ImageUrl="~/Imagens/Fechar.png" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>

                                </asp:GridView>
                            </fieldset>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>

        <!--  *******************************  PESQUISA E SELEÇÃO DE CHECKLISTS  *******************************  -->
        <asp:UpdatePanel ID="updSelecaoChkList" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnExportExcel" />
            </Triggers>
            <ContentTemplate>

                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend class="legend_normal">Cadastro de Check List Licitatório</legend>

                        <div style="margin-top: 10px;">
                            <div style="width: 100%; background-color: #13213C; text-align: left;" class="pad-5">
                                <asp:Label ID="lblFiltrosHeader" Text="SELECIONAR" runat="server" ForeColor="#ffffff" />
                            </div>

                            <asp:Panel ID="pnlFiltros" runat="server">

                                <div class="pad-5">

                                    <div class="row">

                                        <div class="col-md-3">
                                            Código do CheckList:<br />
                                            <asp:TextBox ID="txtSelCheckListID" onkeypress="return isNumberKey(event)" runat="server" Style="width: 95%; max-width: 120px" />
                                        </div>

                                        <div class="col-md-3 borderLeft">
                                            Status:<br />
                                            <asp:DropDownList ID="ddlSelCheckListStatus" runat="server" Style="width: 95%; max-width: 200px" />
                                        </div>

                                        <div class="col-md-6 borderLeft">
                                            <div style="width: auto">
                                                <div style="width: auto; float: left">
                                                    Data Lançamento de:<br />
                                                    <CtlData:ControlData ID="dt_SelDataCriacaoDe" runat="server" />
                                                </div>
                                                <div style="min-width: 30px; float: left">&nbsp;</div>
                                                <div style="width: auto; float: left">
                                                    Até<br />
                                                    <CtlData:ControlData ID="dt_SelDataCriacaoAte" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div style="clear: both; height: 8px;"></div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            Cod. Edital (pregão):<br />
                                            <asp:TextBox ID="txtSelCheckListEdital" runat="server" Style="width: 95%; max-width: 120px" />
                                        </div>
                                        <div class="col-md-3 borderLeft">
                                            UF:<br />
                                            <asp:DropDownList ID="ddlSelCheckListUf" runat="server" Style="width: 95%; max-width: 120px" />
                                        </div>
                                        <div class="col-md-3 borderLeft">
                                            Cliente/Razão Social:<br />
                                            <asp:TextBox ID="txtSelCheckListRazaoSocial" runat="server" Style="width: 95%; max-width: 200px" />
                                        </div>
                                        <div class="col-md-3 borderLeft">
                                            Cliente/CNPJ:<br />
                                            <asp:TextBox ID="txtSelCheckListCnpj" runat="server" Style="width: 95%; max-width: 200px" onkeypress="return isNumberKey(event)" />
                                        </div>
                                    </div>

                                    <div style="clear: both; height: 8px;"></div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            Responsável Captação:<br />
                                            <asp:TextBox ID="txtSelCheckListRespCaptacao" runat="server" Style="width: 95%; max-width: 200px" />
                                        </div>
                                        <div class="col-md-3 borderLeft">
                                            Produto:<br />
                                            <asp:DropDownList ID="ddlSelProduto" runat="server" Style="width: 95%; max-width: 200px"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3 borderLeft">
                                            Fabricante:<br />
                                            <asp:DropDownList ID="ddlSelFabricante" runat="server" Style="width: 95%; max-width: 200px"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3 borderLeft text-right">
                                            <asp:Button ID="btnFiltrosPesquisa" Text="Pesquisar" runat="server" SkinID="BtnInfo" OnClick="btnFiltrosPesquisa_Click" />&nbsp;
                                            <asp:Button ID="btnFiltrosLimpar" Text="Limpar" runat="server" SkinID="BtnDefault" OnClick="btnFiltrosLimpar_Click" />&nbsp;
                                            <asp:Button ID="btnFiltrosNovoCadastro" OnClientClick="return LimparCamposData()" Text="Novo" runat="server" SkinID="BtnInfo" OnClick="btnFiltrosNovoCadastro_Click" />&nbsp;
                                        </div>
                                    </div>

                                    <div style="clear: both;"></div>

                                </div>
                            </asp:Panel>
                        </div>

                        <div class="pad-5">
                            <div class="row">
                                <div class="col-md-9">
                                    <h3 style="color: orange">
                                        <asp:Localize ID="lbl_gvRegistrosInfo" runat="server"></asp:Localize></h3>
                                </div>
                                <div class="col-md-3 text-center">
                                    <asp:ImageButton ID="btnExportExcel" ImageUrl="../../Imagens/xlsx.png" runat="server" OnClick="btnExportExcel_Click" ToolTip="Exportar para Excel" Style="width: auto; height: 38px" />
                                </div>
                            </div>
                        </div>

                         <div style="clear: both;"></div>

                        <div class="pad-5" style="overflow-y: scroll">

                            <div style="clear: both;"></div>

                            <asp:GridView ID="gvRegistros" runat="server"
                                DataKeyNames="checkListId, razao"
                                PagerSettings-Visible="true"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                <Columns>
                                    <asp:BoundField DataField="checkListId" HeaderText="Cod. CheckList" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ClienteCNPJ" HeaderText="CNPJ" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="clienteId" HeaderText="Cod. Cliente" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="razao" HeaderText="Razão Social" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="UF" HeaderText="UF" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ICMS" HeaderText="ICMS %" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="totalTitulo" HeaderText="Total Titulos" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="responsCaptacao" HeaderText="Respons. Captação" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ValorTotal" HeaderText="Valor Total R$" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="DataCriacao" HeaderText="Data Lançamento" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="DtAbertura" HeaderText="Data Abertura" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Visualizar" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblNaoOk %>" CommandArgument='<%# Eval("checkListId") %>'
                                                ImageUrl="~/Imagens/find.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbExcluir" runat="server" CommandName="Excluir" SkinID="checkListId" Style="width: 32px; height: 32px"
                                                ToolTip="Excluir" CommandArgument='<%#   Eval("checkListId") + "|" + Eval("razao") %>'
                                                ImageUrl="~/Imagens/Fechar.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#000099" Font-Size="12pt" CssClass="GridPager" />
                            </asp:GridView>
                            <div class="center">
                                <asp:Localize ID="lblgvRegistrosPageInfo" runat="server"></asp:Localize>
                            </div>
                        </div>
                    </fieldset>
                </asp:Panel>

                <div style="min-height: 30px"></div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    <!--  *******************************  PESQUISA E SELEÇÃO DO CLIENTE  *******************************  -->
    <asp:UpdatePanel ID="updCliente" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="imgSelecClientePelaGrid" EventName="Click" />
        </Triggers>

        <ContentTemplate>

            <asp:Panel ID="pnlCliente" runat="server" DefaultButton="btnClienteBuscar" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel">
                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Label ID="lblSelClienteHeader" Text="BUSCAR CLIENTE" runat="server" ForeColor="White" />
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imgClienteClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                ImageUrl="~/Imagens/Fechar.png"
                                OnClick="imgClienteClose_Click" />
                        </div>
                    </div>
                    <div class="painel_body">
                        <fieldset>
                            <%-- FILTROS CLIENTES --%>
                            <div class="navegacao">

                                <div class="boxPesquisa">
                                    <asp:Label ID="lblClienteIdErp" Text="Código ERP do Cliente: " runat="server" />
                                    <asp:TextBox ID="txtSelClienteIdErp" onkeypress="return isNumberKey(event);" SkinID="Filtro" runat="server" MaxLength="30" />
                                </div>

                                <div class="boxPesquisa">
                                    <asp:Label ID="lblClienteCnpj" Text="CNPJ: " runat="server" />
                                    <asp:TextBox ID="txtSelClienteCnpj" onkeypress="return isNumberKey(event);" SkinID="Filtro" runat="server" MaxLength="20" />
                                </div>

                                <div class="boxPesquisa">
                                    <asp:Label ID="lblClienteRazaoSocial" Text="Razao Social:" runat="server" />
                                    <asp:TextBox ID="txtSelClienteRazSoc" SkinID="Filtro" runat="server" MaxLength="50" />
                                </div>

                                <div class="boxPesquisa">
                                    <asp:Button ID="btnClienteBuscar" Text="BUSCAR" runat="server" SkinID="ButtonLeft" OnClick="btnClienteBuscar_Click" />
                                    <asp:Button ID="btnClienteLimpar" Text="LIMPAR" runat="server" SkinID="ButtonRight" OnClick="btnClienteLimpar_Click" />
                                </div>

                            </div>

                            <!--  *******************************  GRID DE SELEÇÃO DO CLIENTE  *******************************  -->

                            <%-- GRID CLIENTES --%>
                            <div class="gvClientes">
                                <asp:GridView ID="gvClientes" runat="server"
                                    DataKeyNames="clienteId,clienteCNPJ,clienteIdERP,clienteRazaoSocial,representanteId,clienteTipoCredito"
                                    PagerSettings-Visible="true" OnPageIndexChanging="gvClientes_PageIndexChanging"
                                    OnRowCommand="gvClientes_RowCommand" OnRowDataBound="gvClientes_RowDataBound"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" HeaderText="ERP Id" />
                                        <asp:BoundField DataField="clienteCNPJ" ItemStyle-HorizontalAlign="Center" HeaderText="CNPJ" />
                                        <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" HeaderText="Razão Social" />
                                        <asp:BoundField DataField="clienteTipoCredito" ItemStyle-HorizontalAlign="Center" HeaderText="Tipo Crédito" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgClienteCheckInGrid" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle"
                                                    ImageUrl="~/Imagens/check.png"
                                                    CommandName="Select"
                                                    ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("clienteId") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />

                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvClientesPageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>
                        </fieldset>

                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  *******************************  PESQUISA E SELEÇÃO DO ITEM  *******************************  -->
    <asp:UpdatePanel ID="UpdItem" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="imgSelecItemPelaGrid" EventName="Click" />
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="painelItem" runat="server" DefaultButton="btnItemBuscar" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel">
                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Label ID="lblItemHeader" Text="BUSCAR ITEM" runat="server" ForeColor="White" />
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imgItemBtnFechar" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                ImageUrl="~/Imagens/Fechar.png"
                                OnClick="imgItemBtnFechar_Click" />
                        </div>
                    </div>
                    <div class="painel_body">
                        <fieldset>
                            <%-- FILTROS ITEM BUSCA --%>
                            <div class="navegacao">
                                <div class="boxPesquisa">
                                    <asp:Label ID="Label20" Text="Cód. Item: " runat="server" />
                                    <asp:TextBox ID="txtItemId" onkeypress="return isNumberKey(event)" runat="server" SkinID="Filtro" MaxLength="30" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="Label21" Text="Descricao: " runat="server" />
                                    <asp:TextBox ID="txtItemDescricao" SkinID="Filtro" runat="server" MaxLength="20" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Button ID="btnItemBuscar" Text="BUSCAR" runat="server" SkinID="ButtonLeft" OnClick="btnItemBuscar_Click" />
                                    <asp:Button ID="btnItemLimpar" Text="LIMPAR" runat="server" SkinID="ButtonRight" OnClick="btnItemLimpar_Click" />
                                </div>
                            </div>

                            <%-- GRID ITEM BUSCA --%>
                            <div class="gridItemBusca">
                                <asp:GridView ID="gridItemBusca" runat="server"
                                    DataKeyNames="itemId,ItemDescricao"
                                    PagerSettings-Visible="true"
                                    OnPageIndexChanging="gridItemBusca_PageIndexChanging"
                                    OnRowCommand="gridItemBusca_RowCommand" OnRowDataBound="gridItemBusca_RowDataBound"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <PagerStyle BackColor="#14293E" Font-Size="12pt" ForeColor="#ffffff" HorizontalAlign="Center" CssClass="GridPager" />
                                    <Columns>
                                        <asp:BoundField DataField="itemId" HeaderText="Código" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Nome do Produto" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbItemCheckInGrid" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle"
                                                    ImageUrl="~/Imagens/check.png"
                                                    CommandName="Select"
                                                    ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("itemId") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgridItemBuscaPageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="upSelecao" runat="server" AssociatedUpdatePanelID="updSelecaoChkList">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
