<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadImportacaoDescontoFinanceiro.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadImportacaoDescontoFinanceiro" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

            if (postBackElement.id == '<%= btnUpload.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';
            }


        }

        function EndRequest(sender, args) {

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnUpload.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';
            }

        }
    </script>
    <asp:Panel ID="pnlCadastroItem" runat="server">
        <asp:UpdatePanel ID="uppCadastroItem" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
                <asp:PostBackTrigger ControlID="btnUpload" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroItem">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">




                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>

                        <div class="form-row">
                            <div class="col-lg-10"></div>
                            <div class="col-lg-2">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="14" SkinID="BtnDefault" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="15" SkinID="BtnSuccess" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="16" SkinID="BtnDanger" OnClick="btnLimpar_Click" Visible="false" />
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Cadastro Percentual  Desconto Boleto</h2>
                                    <div class="nav navbar-right panel_toolbox">
                                        <br />
                                        <br />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <div class="form-group">
                                                    <asp:Label ID="lblDadosItemId" runat="server" SkinID="lblBoot2" AssociatedControlID="txtDadosItemId" />
                                                    <asp:TextBox ID="txtDadosItemId" AutoPostBack="true" OnTextChanged="txtDadosItemId_TextChanged" SkinID="txtBootstrap3" runat="server" MaxLength="30" TabIndex="5" />

                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <asp:Label ID="lblDadosItemDescricao" runat="server" SkinID="lblBoot2" AssociatedControlID="txtDadosItemDescricao" />
                                                <div class="form-group">

                                                    <asp:TextBox ID="txtDadosItemDescricao" Enabled="false" runat="server" MaxLength="30" SkinID="txtBootstrap3" />

                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <asp:HiddenField ID="hdHeaderClienteIdERP" runat="server" />
                                                <asp:HiddenField ID="hdClienteEmail" runat="server" />
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

                                                <asp:Label ID="lblHeaderCliente" runat="server" SkinID="lblBoot2" />

                                                <div class="input-group">
                                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                                        <asp:TextBox ID="txtHeaderClienteId" runat="server" SkinID="txtBootstrap3" MaxLength="50" />

                                                    </div>
                                                    <div class="input-group-btn">
                                                        <asp:ImageButton ID="imbHeaderClienteCheck" runat="server" Width="25px" Height="25px"
                                                            ImageAlign="AbsMiddle" TabIndex="8" ImageUrl="~/Imagens/check.png" OnClick="imbHeaderClienteCheck_Click" />
                                                        <asp:ImageButton ID="imbHeaderClienteBusca" runat="server" Width="25px" Height="25px"
                                                            ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/find.png" OnClick="imbHeaderClienteBusca_Click" />
                                                        <asp:Label ID="lblHeaderClienteNome" runat="server" SkinID="LabelResposta" />
                                                        <asp:TextBox ID="txtClienteIdNone" runat="server" Visible="false" />
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblValorPercentual" runat="server" SkinID="lblBoot2" />
                                                <div class="form-group">

                                                    <asp:TextBox ID="txtValorPercentual" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblUsuarioNome" runat="server" SkinID="lblBoot2" AssociatedControlID="txtUsuarioNome" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtUsuarioNome" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblDataImportacao" runat="server" SkinID="lblBoot2" AssociatedControlID="txtDataImportacao" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtDataImportacao" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                                                    <asp:TextBox ID="txtFiltrosClienteRazaoSocialModal" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="31" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Button ID="btnFiltrosClientePesquisa" runat="server" SkinID="ButtonLeft" TabIndex="32" OnClick="btnFiltrosClientePesquisa_Click" />
                                                    <asp:Button ID="btnFiltrosClienteLimpar" runat="server" SkinID="ButtonRight" TabIndex="33" OnClick="btnFiltrosClienteLimpar_Click" />
                                                </div>
                                            </div>
                                            <%-- GRID REGISTROS --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvClientes" runat="server" TabIndex="52" DataKeyNames="clienteId,clienteTipoPessoa,clienteCNPJ,clienteIsentoIE,clienteIE,clienteCPF,clienteRG,clienteRazaoSocial,clienteNomeAbreviado,clienteRGOrgao,clienteRGDataEmissao,clienteDataCadastro,matrizFinanceira,clienteTipoCredito,clienteValorCredito,medicoId,grupoFinanceiroId,clienteGrupoFinanceiroNomeAbreviado,grupoComercialId,canalVendaId,canalVendaDescricao,clienteIdERP,medicoConsProfissional,medicoCRM,medicoUFidCRM,categoriaClienteId,categoriaClienteDescricao,mercadoId,mercadoDescricao,clienteInfoAtendentes,representanteId,representanteNomeAbreviado,representanteNome,medicoEnderecoCom,medicoNome,medicoMunicCom,medicoCEPCom,clienteRemConsig,BloqAudicon,AutorizaVacinas,AutorizaRetinoide,BloqMisoprostol,BloqFinanceiro,dataAlteracao,clienteContribuinteICMS,clienteGrupoComercialNome,clienteEmailComercial,Autoriza_Medic,clienteIdSap,clientegrupoativo,Autoriza_Antibiotico,Autoriza_Imunosupressor"
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

                <%-- CONFIRMAR DADOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upDadosConfirmar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlDadosConfirmar" runat="server" DefaultButton="btnConfirmarYes" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblDadosConfirmarHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrDadosConfirmarHeader" runat="server" />
                                            </legend>
                                            <ol>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>

                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemInfoComplementar" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemInfoComplementarTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="BtnSuccess" TabIndex="17" OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="BtnDanger" TabIndex="18" OnClick="btnConfirmarNo_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        <div class="navegacao">
                            <%-- <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosItemId" runat="server" />
                                <asp:TextBox ID="txtFiltrosItemId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="19" />
                            </div>--%>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="Label1" Text="Item:" runat="server" />
                                <asp:TextBox ID="txtFiltrosItemDescricao" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="20" />
                            </div>
                            <div class="boxPesquisa">
                                <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                    TabIndexDataInicio="1" TabIndexDataTermino="2"
                                    ShowHeaderLine="false" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroClienteIdERP" runat="server" Text=" Código ERP " />
                                <asp:TextBox ID="txtFiltroClienteIdERP" runat="server" TabIndex="3" SkinID="Size70" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="Label3" Text="RAZÃO SOCIAL:" runat="server" Style="margin-left: 120px" />
                                <asp:TextBox ID="txtFiltrosClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="3" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnSuccess" TabIndex="26" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault" TabIndex="27" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="BtnDanger" TabIndex="29" OnClick="btnFiltrosExcluir_Click"   />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnWarning" TabIndex="28" OnClick="btnFiltrosNovoCadastro_Click" />
                                    <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                        ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                        ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />
                                </div>
                            </div>
                        </div>



                        <div style="border: solid 0px; margin-top: 21px;">
                            <div class="boxPesquisa">
                                <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                                    <asp:FileUpload ID="fulArquivo" runat="server" />
                                </div>
                            </div>

                            <div class="boxPesquisa">
                                <asp:Button ID="btnUpload" runat="server" Width="160px" SkinID="BtnSuccess" Text="<%$ Resources:Resource, lblCarregar %>" OnClick="btnUpload_Click" />
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="32"
                                DataKeyNames="	 importId,clienteIdERP,itemId,itemDescricao,percentualDesconto,usuarioId,usuarioNome,DataImportacao,clienteRazaoSocial,itemInserido,itemAtualizado,clienteId"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound">
                                <Columns>
                                      <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chlAll" runat="server" AutoPostBack="true" OnCheckedChanged="chlAll_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemDescricao" runat="server" Text='<%# FormataStringSaida(Eval("itemDescricao"), txtFiltrosItemDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="percentualDesconto" DataFormatString="{0:n2}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrDataCadastro" runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltritemInserido" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltritemAtualizado" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrItemSemAtualizacao" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Alterar" SkinID="ImgGrid"
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

                <%-- CONFIRMAR EXCLUSÃO --%>
                <div style="position: absolute;">
                    <asp:Panel ID="pnlConfirmarExclusao" runat="server" Visible="false">
                        <div class="OpacityBackGround">
                        </div>
                        <div class="alert">
                            <div class="alert_header">
                                <div class="alert_header_message">
                                    <asp:Label ID="lblConfirmarExclusaoHeader" runat="server" ForeColor="White" />
                                </div>
                            </div>
                            <div class="alert_body">
                                <asp:Label ID="lblConfirmarExclusaoBody" runat="server" ForeColor="Black" />
                            </div>
                            <div class="alert_bottom">
                                <div class="alert_bottom_button">
                                    <div class="alert_bottom_button_left">
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="30" OnClick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="31" OnClick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvItemId" runat="server" ControlToValidate="txtDadosItemId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />

                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

