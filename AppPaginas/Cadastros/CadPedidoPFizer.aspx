<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadPedidoPFizer.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadPedidoPFizer" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/font-awesome.css" rel="stylesheet" />
    <%--    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/bootstrap.js"></script>
    <link href="../../Styles/dataTables.bootstrap.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <script language="javascript" type="text/javascript">

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_initializeRequest(InitializeRequest);
        prm.add_endRequest(EndRequest);
        var postBackElement;

        function InitializeRequest(sender, args) {
            if (prm.get_isInAsyncPostBack()) {
                args.set_cancel(true);
            }

            postBackElement = args.get_postBackElement();

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnSalvar.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';
            }
        }

        function EndRequest(sender, args) {

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnSalvar.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';
            }
        }

        function ConsisteCampos() {
            var msg = '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liNomeMedico').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtDadosMedicoNome7PDV').value == '') ? "- Necessário informar nome do médico \r" : '';


            if (document.getElementById('ctl00_ContentPlaceHolder1_liConselhoProfissional').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_ddMedicoConsProfissional7PDV').value == '') ? "- Necessário selecionar o conselho profissional \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liCRM').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtDadosMedicoCRM7PDV').value == '') ? "- Necessário informar CRM ou CRO do médico \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liUFMedico').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_ddMedicoUf7PDV').value == '') ? "- Necessário selecionar UF do médico\r" : msg;

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteNomeAbreviado').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtNomeAbreviado7PDV').value == '') ? "- Necessário informar nome abreviado \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteNomeCompleto').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtNomeCompleto7PDV').value == '') ? "- Necessário informar nome completo \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteDataNascimento').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_CtlDataNascimento_txtData').value == '') ? "- Necessário informar a data de nascimento \r" : '';

            //if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteGenero').style.display != "none")
            //    msg += (document.getElementById('ctl00_ContentPlaceHolder1_rblGenero').value == '') ? "- Necessário informar nome do médico \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteCep').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEnderecoCep7PDV').value == '') ? "- Necessário informar o Cep do cliente \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteEndereco').style.display != "none") {
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEndereco7PDV').value == '') ? "- Necessário informar Endereço do cliente \r" : '';
                if (VerificaEndereco(document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEndereco7PDV').value) != 1) {
                    msg += "- Formato de endereço incorreto. \r  O formato de ser: ENDEREÇO, NÚMERO.";
                }
            }

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteBairro').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEnderecoBairro7PDV').value == '') ? "- Necessário informar Bairro do cliente \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteCidade').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEnderecoCidade7PDV').value == '') ? "- Necessário informar a Cidade do cliente \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteUF').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_ddClientUf7PDV').value == '') ? "- Necessário selecionar a UF do cliente \r" : '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteCelular').style.display != "none") {
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtDDDCelular7PDV').value == '') ? "- Necessário informar DDD do celular \r" : '';
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtNumeroCelular7PDV').value == '') ? "- Necessário informar número do Celular \r" : '';
            }

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteTelefone').style.display != "none") {
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtDDDTelefoneFixo7PDV').value == '') ? "- Necessário informar DDD do Telefone Fixo \r" : '';
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtTelefoneFixo7PDV').value == '') ? "- Necessário informar número do Telefone Fixo \r" : '';
            }

            if (document.getElementById('ctl00_ContentPlaceHolder1_liClienteEmail').style.display != "none")
                msg += (document.getElementById('ctl00_ContentPlaceHolder1_txtClienteEmail7PDV').value == '') ? "- Necessário informar o e-mail do cliente \r" : '';

            if (msg != '') {
                alert(msg);
                return false;
            } else {
                return true;
            }
        }

        function VerificaEndereco(enderecoCompleto) {
            if (enderecoCompleto.length > 0) {
                var x = enderecoCompleto.split("");
                var qtv = 0;

                for (i = 0; i < x.length; i++) {
                    qtv += (x[i] == ',') ? 1 : 0;
                }
                return qtv;
            } else {
                return 0;
            }
        }


        function ConsisteMotivoAprovacao() {
            var msg = '';

            if (document.getElementById('ctl00_ContentPlaceHolder1_txtMotivo').value == '')
                msg = "- Necessário informar o motivo para a APROVAÇÃO.";

            if (msg != '') {
                alert(msg);
                return false;
            } else {

                if (confirm('Confirma APROVAR o pedido?'))
                    return true;
                else
                    return false;
            }
        }


        function ConsisteMotivoReprovacao() {
            var msg = '';
            if (document.getElementById('ctl00_ContentPlaceHolder1_txtMotivo').value == '')
                msg = "- Necessário informar o motivo para a REPROVAÇÃO.";

            if (msg != '') {
                alert(msg);
                return false;
            } else {
                if (confirm('Confirma REPROVAR o pedido?'))
                    return true;
                else
                    return false;
            }
        }


    </script>

    <asp:Panel ID="pnlPedido" runat="server">
        <asp:UpdatePanel ID="uppPedido" runat="server" UpdateMode="Conditional">
            <Triggers>
                <%-- PRINCIPAL --%>
                <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnVoltar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnLimpar" EventName="Click" />
                <asp:PostBackTrigger ControlID="imbDownload" />
                <asp:PostBackTrigger ControlID="imbReenviar" />


                <%-- FILTROS --%>
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosPesquisa" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosNovoCadastro" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosExcluir" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvRegistros" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="gvRegistros" EventName="PageIndexChanging" />
                <%-- CLIENTE --%>



                <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteCheck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvClientes" EventName="RowCommand" />

                <%-- CLIENTE PESQUISA --%>
                <%--btnfiltrar--%>
                <asp:AsyncPostBackTrigger ControlID="btnfiltrar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosClientePesquisa" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosClienteLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbFiltrosClose" EventName="Click" />
                <%-- ITEM --%>
                <asp:AsyncPostBackTrigger ControlID="imbFiltrosItemClose" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosItemPesquisa" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFiltrosItemLimpar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvItens" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="gvItensPesquisa" EventName="RowCommand" />
                <%-- ITEM --%>
                <asp:AsyncPostBackTrigger ControlID="imbHeaderItemCheck" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbHeaderItemFind" EventName="Click" />

                <%-- TABELA DE PREÇOS --%>
                <asp:AsyncPostBackTrigger ControlID="btnTabelaPrecoConfirmarOk" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnTabelaPrecoConfirmarNOk" EventName="Click" />

                <%-- LOJA --%>
                <asp:AsyncPostBackTrigger ControlID="ddlHeaderEstabelecimento" EventName="SelectedIndexChanged" />
                <%-- UNIDADE DE NEGÓCIOS --%>
                <asp:AsyncPostBackTrigger ControlID="ddlHeaderUnidadeNegocio" EventName="SelectedIndexChanged" />



                <%-- PERFÍS ADM --%>
                <asp:AsyncPostBackTrigger ControlID="btnPerfisADMOk" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppPedido">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa" Width="100%" Height="100%">
                    <fieldset style="margin-bottom: 110px; left: 0.1%; width: 99%; Height: 100%;">
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>

                        <asp:UpdatePanel ID="uppFiltros" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="imbFiltros" EventName="Click" />
                            </Triggers>
                            <ContentTemplate>
                                <div style="width: 100%; margin-top: 10px;">
                                    <div style="width: 100%; background-color: #13213C; text-align: left;">
                                        <table style="width: auto;">
                                            <tr>
                                                <td valign="middle">
                                                    <asp:ImageButton ID="imbFiltros" runat="server" Height="15px" Width="15px" ImageAlign="AbsMiddle"
                                                        ImageUrl="~/Imagens/Colapse.png"
                                                        ToolTip="<%$ Resources:Resource, lblContrair %>"
                                                        OnClick="imbFiltros_Click" />
                                                </td>
                                                <td valign="middle">
                                                    <asp:Label ID="lblFiltrosHeader" runat="server" SkinID="lblLastShowHide" Text="<%$ Resources:Resource, lblFiltros %>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <asp:Panel ID="pnlFiltros" runat="server" SkinID="PnlMenu">
                                        <div style="display: table; text-align: center; width: 99%;">
                                            <div style="display: table; width: 100%;">
                                                <div class="navegacao">
                                                    <div class="boxPesquisa">
                                                        <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                                            TabIndexDataInicio="1" TabIndexDataTermino="2"
                                                            ShowHeaderLine="false" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="Label1" runat="server" Text="Código ERP:" />
                                                        <asp:TextBox ID="txtFiltroCodErp" runat="server" MaxLength="8"  TabIndex="4" SkinID="Filtro" />
                                                    </div>
                                                     <div class="boxPesquisa">
                                                        <asp:Label ID="Label2" runat="server" Text="Número Pedido TOTVS:" />
                                                        <asp:TextBox ID="txtFiltroPedidoTotvs" runat="server" MaxLength="6"  TabIndex="4" SkinID="Filtro"/>
                                                    </div>
                                                      <div class="boxPesquisa">
                                                        <asp:Label ID="Label3" runat="server" Text="CNPJ:" />
                                                        <asp:TextBox ID="txtFiltroCNPJ" runat="server"  MaxLength="14"  TabIndex="4" SkinID="Filtro" />
                                                    </div>
                                                     <div class="boxPesquisa">
                                                        <asp:Label ID="Label4" runat="server" Text="CPF:" />
                                                        <asp:TextBox ID="txtFiltroCPF" runat="server"  MaxLength="11"  TabIndex="4" SkinID="Filtro" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroPedidoId" runat="server" />
                                                        <asp:TextBox ID="txtFiltroPedidoId" runat="server" TabIndex="4" SkinID="SmallFilter" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroCliente" runat="server" />
                                                        <asp:TextBox ID="txtFiltroCliente" runat="server" MaxLength="30" TabIndex="4" SkinID="SmallFilter" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                                        <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" TabIndex="12" SkinID="DropSmallFilter" />
                                                    </div>                
                                                    <%--<div id="dvSituacao" runat="server" visible="false" class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroSituacao" runat="server" />
                                                        <asp:DropDownList ID="ddFiltroSituacao" runat="server" SkinID="DropSmallFilter" TabIndex="14" />
                                                    </div>--%>      
                                                    <div id="dvEmissor" runat="server" visible="true" class="boxPesquisa">
                                                        <asp:Label ID="lblFiltrosPedidoEmissor" runat="server" />
                                                        <asp:DropDownList ID="ddlFiltrosPedidoEmissor" runat="server" SkinID="DropSmallFilter" TabIndex="15" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltroPedidoItem" runat="server" Visible="false" />
                                                        <asp:DropDownList ID="ddFiltroPedidoItem" runat="server" SkinID="DropSmallFilter" TabIndex="16" Visible="false" />
                                                    </div>
                                                </div>
                                                <%--</div>
                                            <div style="display: table; width: 100%;">--%>
                                            </div>
                                            <div style="display: table; width: 100%; text-align: right;">
                                                <div class="navegacao">
                                                    <div class="boxPesquisa">
                                                        <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="20"
                                                            OnClick="btnFiltrosPesquisa_Click" />
                                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" TabIndex="21"
                                                            OnClick="btnFiltrosLimpar_Click" />
                                                        <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonRight" TabIndex="22"
                                                            OnClick="btnFiltrosNovoCadastro_Click" />
                                                        <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonCenterExcluir" TabIndex="23"
                                                            OnClick="btnFiltrosExcluir_Click" Visible="false" />

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <%-- GRID REGISTROS --%>
                        <center />
                        <div class="gridRegistros" style="margin-top: 10px; margin-bottom: 10px;">
                            <fieldset style="height: 30px; width: 98%; margin-bottom: 5px;">
                                <div style="display: table; text-align: left; width: 10%; height: 100%;">
                                    <div style="display: none; width: 85%; height: 30px; vertical-align: middle; text-align: left;">
                                        <div style="display: table; width: 100%; height: 100%;">
                                            <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgRed" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/LabelRed.png" />
                                            </div>
                                            <div style="display: table-cell; width: 20%; vertical-align: middle; text-align: left;">
                                                <asp:Label ID="lblRowDivergencia" runat="server" Text="<%$ Resources:Resource, lblPedidoLinhaDivergencia %>" />
                                            </div>
                                            <div style="display: table-cell; width: 5%; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgGreen" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/LabelOrange.png" />
                                            </div>
                                            <div style="display: table-cell; width: 80%; vertical-align: middle; text-align: left;">
                                                <asp:Label ID="lblRowAguardando" runat="server" Text="<%$ Resources:Resource, lblPedidoLinhaAguardando %>" />
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display: table-cell; width: 10%; height: 30px; vertical-align: middle; text-align: right;">
                                        <asp:Label ID="lblRegistrosQtd" runat="server" />
                                    </div>
                                    <div style="display: table-cell; width: 5%; height: 30px; vertical-align: middle; text-align: center;">
                                        <asp:Label ID="lblRegistrosQtdDescricao" runat="server" SkinID="LabelResposta" />
                                    </div>
                                </div>
                            </fieldset>

                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="24" DataKeyNames="pedidoIdTotvs,pedidoId,clienteId,estabelecimentoId,clienteTipoPessoa,Autoriza_Psico,Autoriza_Medic,AutorizaRetinoide,AutorizaVacinas,clienteRemConsig,clienteIdERP,clienteContribuinteICMS,clienteGrupoComercialNome,pedidoSituacao,pedidoData,usuarioId,clienteCNPJ,clienteCPF,clienteRazaoSocial,tipoPagamento,ArquivoGerado,NomeArquivo,Autoriza_Antibiotico,Autoriza_Imunosupressor"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging" OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound" OnRowDeleting="gvRegistros_RowDeleting"
                                OnRowUpdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:BoundField DataField="pedidoId" HeaderText="Nº PEDIDO" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                     <asp:BoundField DataField="pedidoIdTotvs" HeaderText="Nº PEDIDO TOTVS" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="CÓDIGO CLIENTE ERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="clienteCNPJ" HeaderText="CLIENTE CNPJ" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="clienteCPF" HeaderText="CLIENTE CPF" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="pedidoData" HeaderText="DATA PEDIDO" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="RAZÃO SOCIAL"  ItemStyle-Width="250px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrCliente" runat="server" Text='<%# FormataStringSaida(Eval("ClienteRazaoSocial"), txtFiltroCliente.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="STATUS"  ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPedidoSituacao" runat="server" Text='<%# GetResourceValue(Eval("pedidoSituacao").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="ATENDENTE"  ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioNome" runat="server" Text='<%# FormataStringSaida(Eval("DescricaoPedido"), (ddlFiltrosPedidoEmissor.SelectedItem != null) ? ddlFiltrosPedidoEmissor.SelectedItem.Text : string.Empty) %>' />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="valorBrutoPedido"  HeaderText="VALOR DO PEDIDO"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" DataFormatString="{0:###,###,###,##0.00}" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Update" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/find.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </asp:Panel>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <fieldset style="margin-bottom: 80px; margin-left: 0px; left: 0.5%; height: auto; width: 99%;">
                        <%--<fieldset style="margin-bottom: 80px; margin-left: 0px;>--%>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>

                        <%-- CORPO --%>
                        <%--<div style="padding: 0 0 0 0; display: table; width: 100%; height: 100%; position: fixed; _position: relative; background-color: Green;">--%>

                        <%-- HEADER --%>
                        <div style="display: table; width: 100%;">

                            <div style="width: 100%; padding-bottom: 3px; display: table;">
                                <%--<div style="text-align: left; padding-right: 5px; display: table-cell; width: 45%;">--%>
                                <div style="text-align: left; padding-right: 5px; display: table; width: 100%;">
                                    <div style="width: 100%; display: table;">
                                        <div style="width: 5%; display: table-cell; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoId" runat="server" />
                                        </div>
                                        <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoIdDescricao" runat="server" ForeColor="Blue" />
                                        </div>
                                        <div style="width: 5%; display: table-cell; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoData" runat="server" />
                                        </div>
                                        <div style="width: 20%; display: table-cell; text-align: center; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoDataDescricao" runat="server" ForeColor="Blue" />
                                        </div>
                                        <div style="width: 5%; display: table-cell; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoSituacao" runat="server" />
                                        </div>
                                        <div style="width: 10%; display: table-cell; text-align: center; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderPedidoSituacaoDescricao" runat="server" SkinID="LabelResposta" />
                                        </div>
                                        <div style="width: 5%; display: table-cell; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblHeaderMotivo" runat="server" />
                                        </div>
                                        <div style="width: 40%; display: table-cell; vertical-align: middle;">
                                            <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 320px; margin-left: 5px;">
                                                <asp:Label ID="lblHeaderMotivoDescricao" runat="server" SkinID="LabelResposta" />
                                            </div>
                                        </div>
                                    </div>

                                    <fieldset>
                                        <div style="width: 100%; display: none;">
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderLimiteCredito" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderLimiteCreditoValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderSaldoLimite" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderSaldoLimiteValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 13%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderValorAberto" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderValorAbertoValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderValorAtraso" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderValorAtrasoValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderSaldoConsig" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderSaldoConsigValor" runat="server" ForeColor="Blue" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: right; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderTransicao" runat="server" />
                                            </div>
                                            <div style="width: 7%; display: table-cell; text-align: center; vertical-align: middle;">
                                                <asp:Label ID="lblHeaderTransicaoValor" runat="server" ForeColor="Blue" />
                                            </div>

                                        </div>
                                    </fieldset>
                                </div>
                                <fieldset>
                                    <div style="display: table; width: 100%;">
                                        <div style="display: table-cell; width: 25%;">
                                            <asp:Label ID="lblHistoricoUsuario" runat="server" Font-Bold="true" ForeColor="Blue" />
                                        </div>
                                        <div style="text-align: right; display: table-cell; width: 50%; vertical-align: middle;">
                                            <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeftSave" TabIndex="1" ValidationGroup="Validacao" OnClick="btnSalvar_Click" OnClientClick="this.disabled=true; __doPostBack(this.name, '');" />
                                            <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonCenterClean" TabIndex="6" OnClick="btnLimpar_Click" />
                                            <asp:ImageButton ID="imbReenviar" runat="server"
                                                OnClick="imbReenviar_Click"
                                                CommandName="Reenviar" Width="25px" Height="25px" Style="margin-top: 10px;"
                                                ImageUrl="~/Imagens/update.png"
                                                ToolTip="<%$ Resources:Resource, lblpedidoReenvio %>" />
                                            <asp:ImageButton ID="imbDownload" runat="server" Width="25px" Height="25px" Style="margin-top: 10px;"
                                                CommandName="Download" OnClick="imbDownload_Click"
                                                ImageUrl="~/Imagens/download.png"
                                                ToolTip="<%$ Resources:Resource, lblDownload %>" />
                                            <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonVoltar" TabIndex="8" OnClick="btnVoltar_Click" Style="margin-top: -10px;" />
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <table>
                                        <tr>
                                            <td>
                                                <div class="Label" style="margin: 0 10px 0 10px; text-align: left !important">
                                                    <label>Cliente Contribuinte ICMS: </label>
                                                    <asp:Label ID="lblContribuinteICMS" runat="server" />
                                                </div>
                                            </td>
                                            <td>
                                                <div class="Label" style="text-align: left !important">
                                                    <label>Grupo Cliente: </label>
                                                    <asp:Label ID="lblGrupoCliente" runat="server" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </div>
                            <fieldset>
                                <ol>
                                    <li>
                                        <div style="width: 100%; display: table;">
                                            <asp:Panel ID="pnlLinha1" runat="server">
                                                <div style="width: 500px; display: table-cell;">
                                                    <asp:Panel ID="pnlHeaderCliente" runat="server" DefaultButton="imbHeaderClienteCheck">

                                                        <div style="width: 500px; display: table;">
                                                            <div style="display: table-cell; width: 320px;">

                                                                <asp:Label ID="lblHeaderCliente" runat="server" Width="99px" />
                                                                <asp:TextBox ID="txtHeaderClienteId" runat="server" SkinID="Pedido" MaxLength="50" TabIndex="7" />
                                                                <asp:HiddenField ID="hdHeaderClienteIdERP" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderclienteRemConsig" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderClienteIdCGC" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAgrupadorId" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderClienteVendaES" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAutoriEspecial" runat="server" />

                                                                <asp:HiddenField ID="hdHeaderBloqAudicon" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAutorizaVacinas" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAutorizaRetinoide" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderBloqMisoprostol" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderBloqFinanceiro" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAutorizaPsico" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAutorizaMedic" runat="server" />

                                                                 <asp:HiddenField ID="hdHeaderAutoriza_Imunosupressor" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAutoriza_Antibiotico" runat="server" />

                                                                <asp:ImageButton ID="imbHeaderClienteCheck" runat="server" Width="25px" Height="25px"
                                                                    ImageAlign="AbsMiddle" TabIndex="8" ImageUrl="~/Imagens/check.png" OnClick="imbHeaderClienteCheck_Click" />

                                                                <asp:ImageButton ID="imbHeaderClienteBusca" runat="server" Width="25px" Height="25px"
                                                                    ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/find.png" OnClick="imbHeaderClienteBusca_Click" />



                                                            </div>
                                                            <div style="display: table-cell; width: 200px;">
                                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 200px;">
                                                                    <asp:Label ID="lblHeaderClienteNome" runat="server" SkinID="LabelResposta" />
                                                                </div>
                                                                <asp:TextBox ID="txtClienteIdNone" runat="server" />
                                                            </div>

                                                        </div>
                                                    </asp:Panel>
                                                </div>

                                                <div style="width: 560px; display: table-cell; vertical-align: middle;">
                                                    <asp:Label ID="lblHeaderClienteTipoEndereco" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlHeaderClienteTipoEndereco" runat="server" SkinID="DropFiltro" TabIndex="12" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlHeaderClienteTipoEndereco_SelectedIndexChanged" Enabled="false" />

                                                    <asp:Label ID="lblHeaderCreditoLimite" Visible="false" runat="server" Width="80px" />
                                                    <asp:Label ID="lblHeaderCreditoLimiteValor" Visible="false" runat="server" ForeColor="Blue" />
                                                    <asp:Label ID="lblCidadeSelecionada" runat="server"> </asp:Label>

                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </li>
                                    <li>
                                        <div style="width: 100%; display: table;">
                                            <asp:Panel ID="pnlLinha2" runat="server">
                                                <div style="width: 500px; display: table-cell;">
                                                    <asp:Label ID="lblHeaderEstabelecimento" runat="server" Width="95px" />
                                                    <asp:DropDownList ID="ddlHeaderEstabelecimento" runat="server"
                                                        SkinID="DropFiltro" TabIndex="10" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlHeaderEstabelecimento_SelectedIndexChanged" />

                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </li>
                                    <li>
                                        <div style="width: 100%; display: table;">
                                            <asp:Panel ID="pnlLinha3" runat="server">
                                                <div style="width: 500px; display: table-cell;">
                                                    <div class="line_itens">
                                                        <asp:Label ID="lblTipoPagamento" runat="server" Width="90px" />
                                                    </div>
                                                    <div class="line_itens">
                                                        <asp:DropDownList ID="ddlTipoPagamento" runat="server" SkinID="DropFiltro" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoPagamento_SelectedIndexChanged">
                                                            <asp:ListItem Value="" Text="" Selected="True" />
                                                            <asp:ListItem Value="01" Text="01 - À Vista" />
                                                            <asp:ListItem Value="02" Text="02 - Prazo" />
                                                            <%--           <asp:ListItem Value="03" Text="03 - Prazo Especial" />--%>
                                                            <asp:ListItem Value="04" Text="04 - Pedido Bonificado" />
                                                        </asp:DropDownList>
                                                    </div>

                                                </div>
                                                <div style="width: 530px; display: table;">
                                                    <div class="line_itens">
                                                        <asp:Label ID="lblNumeroDiasPagto" runat="server" Width="90px" Visible="false" />
                                                        <%-- </div>
                                                    <div class="line_itens">--%>
                                                        <asp:TextBox ID="txtNumeroDiasPagto" runat="server" SkinID="Pedido" Visible="false" />
                                                    </div>
                                                </div>
                                                <div style="width: 530px; display: none;">
                                                    <asp:Label ID="lblHeaderUnidadeNegocio" runat="server" SkinID="LabelForm" />
                                                    <asp:DropDownList ID="ddlHeaderUnidadeNegocio" runat="server" AutoPostBack="true"
                                                        SkinID="DropFiltro" OnSelectedIndexChanged="ddlHeaderUnidadeNegocio_SelectedIndexChanged" />

                                                    <asp:Label ID="lblHeaderCreditoDisponivel" runat="server" Width="80px" />
                                                    <asp:Label ID="lblHeaderCreditoDisponivelValor" runat="server" />
                                                </div>


                                            </asp:Panel>
                                        </div>
                                    </li>
                                </ol>
                            </fieldset>

                            <%-- MEDICO PRESCRITO / RECEITA--%>
                            <div style="width: 100%; display: table; height: 100%;">
                                <div style="display: table; width: 100%;">
                                    <asp:Panel ID="pnlItem" runat="server" DefaultButton="imbHeaderItemCheck">
                                        <fieldset>
                                            <ol style="width: 100%;">
                                                <li style="width: 97%;">

                                                    <div style="display: table; width: 100%; height: 30px;">
                                                        <div style="display: table-cell; vertical-align: middle; width: 300px; height: 100%;">

                                                            <asp:Label ID="lblHeaderItemId" runat="server" Width="100px" />
                                                            <asp:TextBox ID="txtHeaderItemId" runat="server" SkinID="Pedido" MaxLength="50" TabIndex="21" AutoPostBack="true" OnTextChanged="txtHeaderItemId_TextChanged" />
                                                            <ucc:AutoCompleteExtender ID="aceItem" runat="server"
                                                                CompletionListCssClass="autocomplete_list1"
                                                                CompletionListItemCssClass="autocomplete_listitem"
                                                                CompletionListHighlightedItemCssClass="autocomplete_highlighted_listitem"
                                                                CompletionInterval="100"
                                                                EnableCaching="false"
                                                                MinimumPrefixLength="3"
                                                                UseContextKey="true"
                                                                TargetControlID="txtHeaderItemId"
                                                                ServiceMethod="GetItens"
                                                                ServicePath="~/AppWs/WsGetItens.asmx" />

                                                            <asp:ImageButton ID="imbHeaderItemCheck" runat="server" Width="25px" Height="25px" ValidationGroup="ValidaBuscaItem"
                                                                ImageAlign="AbsMiddle" TabIndex="22" ImageUrl="~/Imagens/check.png" OnClick="imbHeaderItemCheck_Click" Visible="false" />

                                                            <asp:ImageButton ID="imbHeaderItemFind" runat="server" Width="25px" Height="25px" ValidationGroup="ValidaBuscaItem"
                                                                ImageAlign="AbsMiddle" TabIndex="23" ImageUrl="~/Imagens/find.png" OnClick="imbHeaderItemFind_Click" />


                                                        </div>
                                                        <div style="display: table-cell; vertical-align: middle; width: auto; height: 100%;">
                                                            <div class="line" style="width: auto; text-align: left;">

                                                                <%--                                                            <div class="line_itens">
                                                                <asp:DropDownList ID="ddlHeaderItemEntregaPeriodo" runat="server" SkinID="DropFiltro">
                                                                    <asp:ListItem Value="" Text="<%$ Resources:Resource, lblSelecione %>" Selected="True" />
                                                                    <asp:ListItem Value="E" Text="<%$ Resources:Resource, lblPeriodoEmergencial %>" />
                                                                    <asp:ListItem Value="M" Text="<%$ Resources:Resource, lblPeriodoManha %>" />
                                                                    <asp:ListItem Value="T" Text="<%$ Resources:Resource, lblPeriodoTarde %>" />
                                                                    <asp:ListItem Value="H" Text="<%$ Resources:Resource, lblPeriodoHorarioComercial %>" />
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:Label ID="lblPrazoEntrega" runat="server" />
                                                            </div>
                                                            <div class="line_itens">
                                                                <asp:DropDownList ID="ddlPrazoEntrega" runat="server" SkinID="DropSmallFilter">
                                                                    <asp:ListItem Value="" Text="<%$ Resources:Resource, lblSelecione %>" Selected="True" />
                                                                    <asp:ListItem Value="24" Text="<%$ Resources:Resource, lblPrazo24 %>" />
                                                                    <asp:ListItem Value="48" Text="<%$ Resources:Resource, lblPrazo48 %>" />
                                                                    <asp:ListItem Value="72" Text="<%$ Resources:Resource, lblPrazo72 %>" />
                                                                    <asp:ListItem Value="96" Text="<%$ Resources:Resource, lblPrazo96 %>" />
                                                                </asp:DropDownList>
                                                            </div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </asp:Panel>
                                </div>

                                <div style="display: table; width: 100%; height: 20px;">
                                    <fieldset>
                                        <div style="display: table; width: 50%; height: 100%;">

                                            <div style="display: table-cell; width: 11%; height: 30px; vertical-align: middle; text-align: right;">
                                                <asp:Label ID="lblQtdRegistrosGrid" runat="server" />
                                            </div>
                                            <div style="display: table-cell; width: 3%; height: 30px; vertical-align: middle; text-align: center;">
                                                <asp:Label ID="lblQtdRegistrosGridDesc" runat="server" SkinID="LabelResposta" />
                                            </div>
                                            <div style="display: table-cell; width: 8%; height: 30px; vertical-align: middle; text-align: right;">
                                                <asp:Label ID="lblQtdItensGrid" runat="server" />
                                            </div>
                                            <div style="display: table-cell; width: 5%; height: 30px; vertical-align: middle; text-align: center;">
                                                <asp:DropDownList ID="ddlQtdItensGrid" runat="server"
                                                    TabIndex="50" Height="20px" Width="50px"
                                                    AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlQtdItensGrid_SelectedIndexChanged">
                                                    <asp:ListItem Value="10" Text="10" />
                                                    <asp:ListItem Value="20" Text="20" />
                                                    <asp:ListItem Value="30" Text="30" />
                                                    <asp:ListItem Value="40" Text="40" />
                                                    <asp:ListItem Value="50" Text="50" Selected="True" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>

                            <%-- BODY --%>
                            <asp:Panel ID="pnlGvItens" runat="server" Visible="false">
                                <div style="display: table; width: 99.6%; height: 40%;">
                                    <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                                        <div style="height: 100%; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                            <center />

                                            <asp:GridView ID="gvItens" runat="server" TabIndex="51"
                                                DataKeyNames="itemId,itemDescricao,unidadeMedidaSigla,familiaComercialDescricao,familiaMaterialDescricao,itemControladoValidado,informado,gravado,
                                                      grupoEstoqueDescricao,fabricanteNome,pedidoId,pedidoItemSeq,itemControlado,tabelaPrecoVlrTabela,tabelaPrecoVlrMinimo,tabelaPrecoVlrMaximo,saldo,IsentoFrete,
                                                      familiaMaterialId,fabricanteId,unidadeNegocioId,estabelecimentoId,clienteIdERP,itemInfComplementar,valDescontoEmissao,itemTipoPedido"
                                                OnPageIndexChanging="gvItens_PageIndexChanging"
                                                OnRowCommand="gvItens_RowCommand"
                                                OnRowDataBound="gvItens_RowDataBound"
                                                OnRowDeleting="gvItens_RowDeleting"
                                                OnRowUpdating="gvItens_RowUpdating">
                                                <Columns>
                                                    <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                                    <asp:BoundField DataField="itemDescricao" ItemStyle-Width="150px">
                                                        <ItemStyle Width="150px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="unidadeMedidaSigla" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="familiaComercialDescricao" ItemStyle-Width="130px">
                                                        <ItemStyle Width="130px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="familiaMaterialDescricao" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false">
                                                        <ItemStyle Width="150px" Wrap="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="grupoEstoqueDescricao" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false">
                                                        <ItemStyle Width="150px" Wrap="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="fabricanteNome" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false">
                                                        <ItemStyle Width="150px" Wrap="True" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtQuantidade" runat="server" SkinID="Currency50" Font-Bold="true" MaxLength="9" OnTextChanged="txtQuantidade_TextChanged" AutoPostBack="true" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <%-- <asp:HiddenField ID="hfValorDesconto" runat="server"
                                                                Value='<%# Eval("valDescontoEmissao", "{0:n2}") %>' />--%>
                                                            <asp:TextBox ID="txtValor" runat="server" SkinID="Currency100"
                                                                Font-Bold="true" MaxLength="18" />
                                                            <asp:HiddenField ID="hfValorMinimo" runat="server" Value="" />
                                                            <asp:HiddenField ID="hfValorMaximo" runat="server" Value="" />
                                                            <asp:HiddenField ID="hfPedidoId" runat="server" Value="" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbDelete" runat="server" SkinID="ImgGrid" CommandName="Delete"
                                                                ImageUrl="~/Imagens/_trash.png"
                                                                ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                CommandArgument='<%# Eval("pedidoId") + "|" + Eval("itemId") +   "|" +  ((GridViewRow)Container).RowIndex %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <asp:UpdatePanel ID="updBotao" runat="server" UpdateMode="Conditional">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnClickGrid" EventName="Click" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:Button ID="btnClickGrid" Width="1px" Height="1px" Style="opacity: 0; margin-left: -1200px;" runat="server" Text="" OnClick="btnClickGrid_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </fieldset>
                                </div>
                            </asp:Panel>




                            <%-- FOOTER --%>
                            <div style="display: table; width: 100%; height: 20%;">

                                <div style="width: 100%; display: table;">
                                    <fieldset>


                                        <div style="width: 100%; display: table-cell; margin-top: 5px; margin-bottom: 5px;">
                                            <asp:Panel ID="pnlTotais" runat="server">
                                                <%--<ol style="text-align: right;">
                                                <li>--%>
                                                <div style="width: 100%; vertical-align: middle; text-align: right;">
                                                    <asp:Panel ID="pnlTotalPedido" runat="server">
                                                        <asp:HiddenField ID="hdfQtdTotalItens" runat="server" Value="0,00" />
                                                        <asp:HiddenField ID="hdfVlrTotalItensBruto" runat="server" Value="0,00" />
                                                        <asp:HiddenField ID="hdfVlrTotalItens" runat="server" Value="0,00" />
                                                        <asp:HiddenField ID="hdfValorTotalPedido" runat="server" Value="0,00" />

                                                        <div style="display: none;">
                                                            <asp:Label ID="lblICMSBase" runat="server" Visible="true" />
                                                            <asp:TextBox ID="txtICMSBase" runat="server" SkinID="Currency80" Font-Bold="true" Enabled="false" Visible="true" />
                                                            <asp:Label ID="lblICMSValor" runat="server" Visible="true" />
                                                            <asp:TextBox ID="txtICMSValor" runat="server" SkinID="Currency80" Font-Bold="true" Enabled="false" Visible="true" />
                                                            <asp:Label ID="lblICMSSTBase" runat="server" Visible="true" />
                                                            <asp:TextBox ID="txtICMSSTBase" runat="server" SkinID="Currency80" Font-Bold="true" Enabled="false" Visible="true" />
                                                            <asp:Label ID="lblICMSSTValor" runat="server" Visible="true" />
                                                            <asp:TextBox ID="txtICMSSTValor" runat="server" SkinID="Currency80" Font-Bold="true" Enabled="false" Visible="true" />
                                                        </div>
                                                        <asp:Label ID="lblQuantidadeTotal" runat="server" />
                                                        <asp:TextBox ID="txtQuantidadeTotal" runat="server" SkinID="Currency80" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                        <asp:Label ID="lblTotalValorItensBruto" runat="server" />
                                                        <asp:TextBox ID="txtTotalValorItensBruto" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                        <asp:Label ID="lblTotalValorItens" runat="server" />
                                                        <asp:TextBox ID="txtTotalValorItens" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                        <asp:Label ID="lblTotalValor" runat="server" />
                                                        <asp:TextBox ID="txtTotalValor" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                        <asp:Label ID="lblTotalDescontoBoleto" runat="server" />
                                                        <asp:TextBox ID="txtTotalDescontoBoleto" runat="server" SkinID="Currency100" MaxLength="50" Font-Bold="true" Enabled="false" />
                                                    </asp:Panel>
                                                </div>
                                                <%--</li>
                                            </ol>--%>
                                            </asp:Panel>
                                        </div>
                                    </fieldset>
                                </div>

                                <asp:Panel ID="pnlMotivoAprovLimite" runat="server" Visible="false">
                                    <div style="width: 100%; display: table-cell; margin-top: 5px; margin-bottom: 5px; float: left;">
                                        <fieldset>
                                            <legend>Motivo aprovação por limite
                                            </legend>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gridViewMotivoAprovacao" runat="server"
                                                    DataKeyNames="apvMotivo,apvDataInclusao"
                                                    OnRowDataBound="gridViewMotivoAprovacao_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="apvMotivo" />
                                                        <asp:BoundField DataField="apvDataInclusao" />
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </fieldset>
                                    </div>
                                </asp:Panel>


                            </div>

                            <%--</div>--%>
                    </fieldset>
                </asp:Panel>

                <%-- PESQUISA CLIENTE --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upCliente" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteBusca" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlBuscaCliente" runat="server" DefaultButton="btnFiltrosClientePesquisa" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblClienteHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbFiltrosClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                                Height="25px" TabIndex="28" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrClienteHeader" runat="server" />
                                            </legend>
                                            <%-- FILTROS --%>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteId" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="29" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteIdERP" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteIdERP" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="30" />
                                                </div>
                                                <div id="dvCnpj" runat="server" class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteCnpj" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteCnpj" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
                                                </div>
                                                <div id="dvCpf" runat="server" class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteCpf" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteCpf" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteRazaoSocial" runat="server" />
                                                    <asp:TextBox ID="txtFiltrosClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="31" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Button ID="btnFiltrosClientePesquisa" runat="server" SkinID="ButtonLeft" TabIndex="32" OnClick="btnFiltrosClientePesquisa_Click" />
                                                    <asp:Button ID="btnFiltrosClienteLimpar" runat="server" SkinID="ButtonRight" TabIndex="33" OnClick="btnFiltrosClienteLimpar_Click" />
                                                </div>
                                            </div>
                                            <%-- GRID REGISTROS --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvClientes" runat="server" TabIndex="52" DataKeyNames="clienteId,clienteTipoPessoa,clienteCNPJ,clienteIsentoIE,clienteIE,clienteCPF,clienteRG,clienteRazaoSocial,clienteNomeAbreviado,
                                                    clienteRGOrgao,clienteRGDataEmissao,clienteDataCadastro,matrizFinanceira,clienteTipoCredito,clienteValorCredito,medicoId,
                                                    grupoFinanceiroId,clienteGrupoFinanceiroNomeAbreviado,grupoComercialId,canalVendaId,canalVendaDescricao,clienteIdERP,medicoConsProfissional,medicoCRM,medicoUFidCRM,
                                                    categoriaClienteId,categoriaClienteDescricao,mercadoId,mercadoDescricao,clienteInfoAtendentes,representanteId,representanteNomeAbreviado,representanteNome,medicoEnderecoCom,medicoNome,medicoMunicCom,medicoCEPCom,clienteRemConsig,BloqAudicon,AutorizaVacinas,AutorizaRetinoide,BloqMisoprostol,BloqFinanceiro,dataAlteracao,clienteContribuinteICMS,clienteGrupoComercialNome,Autoriza_Medic,clienteIdSap,clientegrupoativo,Autoriza_Antibiotico,Autoriza_Imunosupressor"
                                                    OnPageIndexChanging="gvClientes_PageIndexChanging" OnRowCommand="gvClientes_RowCommand"
                                                    OnRowDataBound="gvClientes_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteId" runat="server" Text='<%# FormataStringSaida(Eval("clienteId"), txtFiltrosClienteId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteIdErp" runat="server" Text='<%# FormataStringSaida(Eval("clienteIdERP"), txtFiltrosClienteId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Wrap="true">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltrosClienteRazaoSocial.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Wrap="true" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteNomeFantasia" runat="server" Text='<%# Eval("clienteNomeAbreviado") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCNPJ").ToString(), Comom.Utility.FormatOption.ApplyMask), txtFiltrosClienteCnpj.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCpf" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCPF").ToString(), Comom.Utility.FormatOption.ApplyMask, Comom.Utility.TipoDocumento.CPF), txtFiltrosClienteCpf.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentante" runat="server" Text='<%# Eval("representanteNome") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteGrupoComercial" runat="server" Text='<%# Eval("clienteGrupoComercialNome") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCanalVenda" runat="server" Text='<%# Eval("canalVendaDescricao") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCategoria" runat="server" Text='<%# Eval("categoriaClienteDescricao") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteMercado" runat="server" Text='<%# Eval("mercadoDescricao") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="clienteTipoCredito" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />

                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbClienteCheckInGrid" runat="server" SkinID="ImgGrid"
                                                                    ImageAlign="AbsMiddle" ImageUrl="~/Imagens/check.png" CommandName="Select"
                                                                    CommandArgument='<%# Eval("clienteId") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>



                <%-- PESQUISA ITEM --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppItem" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbHeaderItemFind" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlBuscaItem" runat="server" DefaultButton="btnFiltrosItemPesquisa" SkinID="PnlPopUp"
                                Visible="false">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblItemHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbFiltrosItemClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                                Height="25px" TabIndex="40" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosItemClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrItemHeader" runat="server" />
                                            </legend>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroFabricante" runat="server" />
                                                    <asp:DropDownList ID="ddFabricante" runat="server" SkinID="DropFiltro"
                                                        TabIndex="3" OnSelectedIndexChanged="ddFabricante_SelectedIndexChanged" AutoPostBack="true" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosNomeQuimico" runat="server" />
                                                    <asp:DropDownList ID="ddNomeQuimico" runat="server" SkinID="DropFiltro"
                                                        TabIndex="2" OnSelectedIndexChanged="ddNomeQuimico_SelectedIndexChanged" AutoPostBack="true" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosNomeComercial" runat="server" />
                                                    <asp:DropDownList ID="ddNomeComercial" runat="server" SkinID="DropFiltro"
                                                        TabIndex="1" />
                                                </div>

                                                <div class="boxPesquisa">
                                                    <div class="line">
                                                        <asp:Button ID="btnFiltrosItemPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="48"
                                                            OnClick="btnFiltrosItemPesquisa_Click" />
                                                        <asp:Button ID="btnFiltrosItemLimpar" runat="server" SkinID="ButtonRight" TabIndex="49"
                                                            OnClick="btnFiltrosItemLimpar_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                            <%-- GRID REGISTROS --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvItensPesquisa" runat="server" TabIndex="55"
                                                    DataKeyNames="itemId,itemDescricao,itemInfComplementar,itemPesoBruto,itemPesoLiquido,itemRefrigerado,itemControlado,
                                                                familiaComercialId,familiaComercialDescricao,familiaMaterialId,familiaMaterialDescricao,grupoEstoqueId,grupoEstoqueDescricao,
                                                                fabricanteId,fabricanteNome,fabricanteNomeAbreviado,classificacaoFiscalId,classificacaoFiscalDescricao,informado,gravado,saldo,
                                                                unidadeMedidaId,unidadeMedidaSigla,tabelaPrecoVlrTabela,tabelaPrecoVlrMinimo,tabelaPrecoVlrMaximo,IsentoFrete,
                                                                coeficienteDesconto,convenio87,tabelaPrecoImportacaoId"
                                                    OnPageIndexChanging="gvItensPesquisa_PageIndexChanging"
                                                    OnRowCommand="gvItensPesquisa_RowCommand"
                                                    OnRowDataBound="gvItensPesquisa_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                                                        <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                                        <asp:BoundField DataField="unidadeMedidaSigla" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                                                        <asp:BoundField DataField="familiaComercialDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                                        <asp:BoundField DataField="familiaMaterialDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                                        <asp:BoundField DataField="grupoEstoqueDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                                        <asp:BoundField DataField="fabricanteNome" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
                                                        <asp:BoundField DataField="classificacaoFiscalDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" Visible="false" />
                                                        <%--<asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrContribuinte" runat="server" Text='<%# (bool.Parse(!String.IsNullOrEmpty(Eval("contribuinte").ToString()) ? Eval("contribuinte").ToString() : "False") ? GetResourceValue("lblSim") : GetResourceValue("lblNao")).ToUpper() %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="coeficienteDesconto" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" />--%>
                                           <%--             <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="110px">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="ddlItemTipoPedido" runat="server" SkinID="DropSmallFilter" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="110px" />
                                                        </asp:TemplateField>--%>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid"
                                                                    ImageUrl="~/Imagens/check.png" CommandArgument='<%# Eval("itemId") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                           

                            <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>



                <%-- BLOCO CONFIRMAR INTEGRAÇÃO PENDENTE --%>
                <div style="position: absolute; z-index: 1;">
                    <asp:UpdatePanel ID="upConfirmarIntegracaoPendente" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlConfirmarIntegracaoPendente" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblConfirmarIntegracaoPendenteHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <asp:Label ID="lblConfirmarIntegracaoPendenteMessage" runat="server" ForeColor="Black" />
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnConfirmarIntegracaoPendenteOk" runat="server" SkinID="ButtonLeft"
                                                    OnClick="btnConfirmarIntegracaoPendenteOk_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnConfirmarIntegracaoPendenteNOK" runat="server" SkinID="ButtonRight"
                                                    OnClick="btnConfirmarIntegracaoPendenteNOK_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>


                <%-- CONFIRMAR ALTERAÇÃO TABELA PREÇO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upTabelaPrecoConfirmar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlHeaderEstabelecimento" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlHeaderUnidadeNegocio" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlTabelaPrecoConfirmar" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblTabelaPrecoConfirmarHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                                            <div style="width: 80%; height: 100%; display: table-cell; vertical-align: middle;">
                                                <asp:Label ID="lblTabelaPrecoConfirmarBody" runat="server" />
                                            </div>
                                            <div style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                                                <asp:Image ID="imgAlert" runat="server" Height="50%" Width="60%" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/question.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnTabelaPrecoConfirmarOk" runat="server" SkinID="ButtonLeft"
                                                    OnClick="btnTabelaPrecoConfirmarOk_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnTabelaPrecoConfirmarNOk" runat="server" SkinID="ButtonRight"
                                                    OnClick="btnTabelaPrecoConfirmarNOk_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>



                <%-- ENDEREÇOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppEnderecos" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlHeaderClienteTipoEndereco" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlEnderecos" runat="server" Visible="false" DefaultButton="imbEnderecosClose" SkinID="PnlPopUp">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblEnderecosHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbEnderecosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbEnderecosClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset style="height: 95%;">
                                            <legend>
                                                <asp:Literal ID="ltrEnderecosHeader" runat="server" />
                                            </legend>

                                            <ol>
                                                <li>
                                                    <asp:Label ID="lblEnderecoTipo" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoTipoDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEndereco" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoNro" runat="server" SkinID="LabelForm" Visible="false" />
                                                    <asp:Label ID="lblEnderecoNroDescricao" runat="server" SkinID="LabelResposta" Visible="false" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoCompl" runat="server" SkinID="LabelForm" Visible="false" />
                                                    <asp:Label ID="lblEnderecoComplDescricao" runat="server" SkinID="LabelResposta" Visible="false" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoCep" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoCepDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoBairro" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoBairroDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoCidadeUf" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoCidadeUfDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <div style="margin-left: 150px;">
                                                        <br />
                                                        <asp:Label ID="lblContatosLine" runat="server" SkinID="LabelResposta" Text="<%$ Resources:Resource, lblDadosContato %>" />
                                                        <hr />
                                                    </div>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoContatoNome" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoContatoNomeDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoEmail" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoEmailDescricao" runat="server" ForeColor="#13213C" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoRamal" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoRamalDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoFone" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoFoneDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoCelular" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoCelularDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblEnderecoObservacoes" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblEnderecoObservacoesDescricao" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>

                                        </fieldset>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>


          

                <asp:ValidationSummary ID="vsmValidaBuscaItem" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ValidaBuscaItem" />
                <%-- </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>--%>

 
                </div>
                  
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>


    <%--POPUP DE PHARMASYSTEM--%>
    <div style="position: absolute;">
        <asp:UpdatePanel ID="UpdatePanelPharmaSystem" runat="server" UpdateMode="Conditional">

            <ContentTemplate>
                <asp:Panel ID="pnlPharmaSystem" runat="server" Visible="false" SkinID="PnlPopUp">

                    <div class="OpacityBackGround">
                    </div>
                    <%--<div class="painel">--%>
                    <div class="painel" style="width: 40%; height: 55%; left: 30%; top: 20%;">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblEPharmaDados" runat="server" ForeColor="White" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <legend>
                                    <asp:Literal ID="ltrPharmaSystem" runat="server" />
                                </legend>

                                <br />
                                <br />
                                <ol>
                                    <li>
                                        <asp:Label ID="lblPharmaSystemProjeto" runat="server" SkinID="LabelForm" />
                                        <asp:DropDownList ID="ddlPharmaSystemProjeto" CssClass="DropDownList" runat="server" TabIndex="12" AutoPostBack="true" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblPharmaSystemCartao" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtPharmaSystemCartao" runat="server" CssClass="txtNormal" Width="258px" TabIndex="12" />
                                    </li>

                                    <li>
                                        <div style="width: 95%; margin-top: 20px; border: solid 0px; text-align: right; margin-right: 30px;">
                                            <asp:Button ID="btnPharmaSystemconfirmar" runat="server" SkinID="ButtonOk" CssClass="ButtonLeft" />
                                            <asp:Button ID="btnPharmaSystemCancelar" runat="server" SkinID="ButtonCancel" CssClass="ButtonRight" />
                                            <asp:Button ID="btnPharmaSystemFechar" runat="server" SkinID="ButtonCancel" CssClass="ButtonRight" />
                                        </div>
                                    </li>
                                </ol>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>


        <%-- BLOCO INFROMA PEDIDO BLOQUEADO --%>
        <%--  <div style="position: absolute;">
            <asp:UpdatePanel ID="upValorLimiteBloqueado" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInfoBloqueadoValorLimite" EventName="Click" />
                </Triggers>
                <ContentTemplate>--%>
        <asp:Panel ID="pnlInfoPedidoBloqueado" runat="server" Visible="false">
            <div class="OpacityBackGround"></div>
            <div class="alert">
                <div class="alert_header">
                    <div class="alert_header_message">
                        <asp:Label ID="Label6" runat="server" ForeColor="White" />
                    </div>
                </div>
                <div class="alert_body">
                    <div style="width: 100%; height: 100%; display: table; margin-top: 0px;">
                        <div style="width: 80%; height: 100%; display: table-cell; vertical-align: middle;">
                            <asp:Label ID="Label7" runat="server" ForeColor="Black" />
                        </div>
                        <div style="width: 20%; height: 100%; display: table-cell; vertical-align: middle; text-align: center;">
                            <asp:Image ID="Image1" runat="server" Height="50%" Width="60%" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/question.png" />
                        </div>
                    </div>
                </div>
                <div class="alert_bottom">
                    <div class="alert_bottom_button">

                        <div class="alert_bottom_button_right">
                            <asp:Button ID="btnInfoBloqueadoValorLimite" runat="server" SkinID="ButtonRight" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <%--  </ContentTemplate>
            </asp:UpdatePanel>--%>


        <%--PAINEL DE APROVAÇÃO--%>
        <asp:UpdatePanel ID="uppAprovaLimite" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlAprovaLimite" runat="server" Visible="false" SkinID="PnlPopUp">
                    <div class="OpacityBackGround">
                    </div>
                    <div class="painel" style="width: 45%; height: 60%; left: 25%; top: 25%;">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblAprovarReprovar" runat="server" ForeColor="White" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="imbAprovacaoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png" />
                            </div>
                        </div>
                        <div class="painel_body" style="height: 75%;">
                            <fieldset>
                                <div style="left: 0%; position: relative; width: 99.5%; height: 100%;">
                                    <div style="display: table; width: 100%; height: 10%;">
                                        <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle; text-align: left;">
                                            <br />
                                            <asp:Label ID="lblTextoAprovacao" runat="server" />
                                        </div>
                                    </div>
                                    <div style="display: table; width: 100%; height: 10%;">
                                        <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle; text-align: left;">
                                            <asp:Label ID="lblConfirmarAprovacao" runat="server" />
                                        </div>
                                    </div>
                                    <div style="display: table; width: 100%; height: 60%;">
                                        <asp:TextBox ID="txtMotivo" runat="server" Columns="100" Rows="5" TextMode="MultiLine" MaxLength="250" Height="100%" Width="98%" />
                                    </div>
                                    <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                        <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                            <asp:Button ID="btnAprovaLimiteOk" runat="server" SkinID="ButtonLeft" />
                                            <asp:Button ID="btnAprovaLimiteNOk" runat="server" SkinID="ButtonRight" />
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

        <%-- PAINEL PERFÍS ADM --%>
        <asp:UpdatePanel ID="uppTipoPedidoAgrup" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlTipoPedidoAgrup" runat="server" Visible="false" SkinID="PnlPopUp">
                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label8" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblTipoPedidos %>" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="imgTipoPedidoAgrupClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset style="height: 85%;">
                                <legend>
                                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, lblTipoPedidosDisponivel %>" />
                                </legend>

                                <div style="width: 100%; height: 98%; display: table;">
                                    <div style="width: 100%; height: 100%; display: table-cell;">
                                        <asp:RadioButtonList ID="rdlTipoPedido" runat="server"
                                            RepeatColumns="1"
                                            RepeatDirection="Vertical" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="painel_bottom">
                            <div class="painel_bottom_button">
                                <asp:Button ID="btnTipoPedidoAgrupOk" runat="server"
                                    Text="<%$ Resources:Resource, lblOk %>" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>



    </div>



    <asp:UpdatePanel ID="updModalTransportadora" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlModalTransportadora" runat="server" CssClass="Modal" Visible="false">
                <%-- <div class="bs-example-modal-lg">--%>
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <asp:ImageButton ID="imgFechar" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                ImageUrl="~/Imagens/Fechar.png"
                                OnClick="imgFechar_Click" />
                            <h4 class="modal-title" id="myModalLabel">Informações Transporte</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="pnlInfoTransporte" runat="server">
                            </asp:Panel>

                        </div>
                        <div class="modal-footer">

                            <asp:ImageButton ID="btnNF" runat="server" SkinID="ImgList" Width="45px" Height="45px"
                                ImageUrl="~/Imagens/list_zoom.png" ToolTip="Visualizar NF" />
                            <asp:Button Text="Fechar" SkinID="BtnDanger" CommandArgument="ModalPesquisaItem" ID="btnCancelarModal" runat="server" OnClick="btnCancelarModal_Click" />

                        </div>
                    </div>
                </div>
                <%--       </div>--%>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%-- PAINEL PERFÍS ADM --%>
    <asp:UpdatePanel ID="uppPerfisADM" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlPerfisADM" runat="server" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Label ID="lblPerfisADMHeader" runat="server" ForeColor="White" Text="<%$ Resources:Resource, lblSelecaoPerfil %>" />
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imbPerfisADMClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                ImageUrl="~/Imagens/Fechar.png"
                                OnClick="imbPerfisADMClose_Click" />
                        </div>
                    </div>
                    <div class="painel_body">
                        <fieldset style="height: 85%;">
                            <legend>
                                <asp:Literal ID="ltrHeaderPerfilADM" runat="server" Text="<%$ Resources:Resource, lblPerfilDisponivel %>" />
                            </legend>

                            <div style="width: 100%; height: 98%; display: table;">
                                <div style="width: 100%; height: 100%; display: table-cell;">
                                    <asp:RadioButtonList ID="rblPerfisADM" runat="server"
                                        RepeatColumns="1"
                                        RepeatDirection="Vertical" />
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="painel_bottom">
                        <div class="painel_bottom_button">
                            <asp:Button ID="btnPerfisADMOk" runat="server"
                                Text="<%$ Resources:Resource, lblOk %>"
                                OnClick="btnPerfisADMOk_Click" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>


    <asp:UpdatePanel ID="UpdateHIstoricoCliente" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlHistorioCliente" runat="server" CssClass="Modal" Visible="false">
                <div class="bs-example-modal-lg">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div style="float: right">
                                    <asp:ImageButton ID="imgButtonFecharHistoricoCompra" runat="server" ImageUrl="~/Imagens/Fechar.png" OnClick="imgButtonFecharHistoricoCompra_Click" Width="20" Height="20" ImageAlign="Left" />
                                </div>
                                <h1>Historico de Compra</h1>

                            </div>
                            <div class="modal-body">

                                <asp:Panel ID="Panel2" runat="server" DefaultButton="btnfiltrar" SkinID="PnlMenu">
                                    <table border="0" cellspacing="1" cellpadding="1" style="vertical-align: baseline"
                                        width="100%">
                                        <tr>
                                            <td>
                                                <CtlPeriodo:ControlPeriodo ID="CtlHistoricoPeido" runat="server" TabIndexDataInicio="1" TabIndexDataTermino="2"
                                                    ShowHeaderLine="false" />
                                            </td>
                                            <td valign="bottom">
                                                <asp:Label ID="lblloja" runat="server">Loja  : </asp:Label>
                                                <asp:DropDownList ID="drpEstab" runat="server" AutoPostBack="True" Width="150px">
                                                </asp:DropDownList>
                                                <asp:Label ID="lblproduto" runat="server">Produto  : </asp:Label>
                                                <asp:DropDownList ID="drpProd" runat="server" AutoPostBack="True" Width="150px">
                                                </asp:DropDownList>
                                                <asp:Label ID="lblTipoBusc" runat="server">Cliente : </asp:Label>

                                            </td>
                                            <td valign="bottom">
                                                <asp:Button ID="btnfiltrar" runat="server" Text="Pequisar"
                                                    OnClick="btnfiltrar_Click" />
                                            </td>

                                            <td valign="bottom">
                                                <asp:Button ID="btxls" runat="server" Text="Excel" OnClick="btxls_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>



                                <asp:GridView ID="gvHistoricoCliente" runat="server" SkinID="GRIDVIEW" AllowPaging="True"
                                    ShowHeaderWhenEmpty="True" CellPadding="1" ForeColor="#333333" GridLines="None"
                                    OnPageIndexChanging="gvHistoricoCliente_PageIndexChanging" AutoGenerateColumns="False"
                                    Width="100%" BorderStyle="Solid" BorderWidth="1px" OnRowCommand="gvHistoricoCliente_RowCommand" OnRowDataBound="gvHistoricoCliente_RowDataBound">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="pedido" HeaderText="Pedido" />
                                        <asp:BoundField DataField="estabelecimento" HeaderText="Loja" ItemStyle-Width="70px">
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="notaFiscal" HeaderText="Nota Fiscal" ItemStyle-Width="70px"
                                            ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dataEmissao" HeaderText="Data Saida" />
                                        <asp:BoundField DataField="itemCodigo" HeaderText="Codigo" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" ItemStyle-Width="230px">
                                            <ItemStyle Width="230px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qtItemNota" HeaderText="Qt. Fatur." ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="precoUnit" HeaderText="Preço" DataFormatString="{0:c}"
                                            ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Justify">
                                            <ItemStyle Width="76px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="valorTotalNf" HeaderText="Total NF" DataFormatString="{0:c}"
                                            ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Justify">
                                            <ItemStyle Width="76px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="condpago" HeaderText="Cond. Pagto" ItemStyle-Width="150px"
                                            ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="natuOper" HeaderText="Natureza" />
                                        <asp:TemplateField HeaderText="Observação" ControlStyle-Width="100px">
                                            <ItemTemplate>
                                                <%#Eval("obsNota").ToString().Length >= 35 ? Eval("obsNota").ToString().Substring(0, 35) + "..." : Eval("obsNota").ToString()%>
                                            </ItemTemplate>
                                            <ControlStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="10px" ItemStyle-Wrap="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="InfoOBS" runat="server" ImageUrl="~/Imagens/info.png" Width="20" Height="20" ImageAlign="Left" />


                                            </ItemTemplate>
                                            <ItemStyle Width="10px" Wrap="False" />
                                        </asp:TemplateField>


                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#13213C" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" Height="2px" BorderStyle="Solid"
                                        BorderWidth="1" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
