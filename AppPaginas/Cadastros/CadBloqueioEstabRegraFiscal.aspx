<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadBloqueioEstabRegraFiscal.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadBloqueioEstabRegraFiscal" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <script src="../../Scripts/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <%--<script src="../../Scripts/jQuery-2.1.4.min.js"></script>--%>
    <script src="../../Scripts/bootstrap.js"></script>
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
                                    <h2>Cadastro Bloqueio Estabelecimento</h2>
                                    <div class="nav navbar-right panel_toolbox">
                                        <br />
                                        <br />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">

                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <asp:Label ID="lblEstabelecimento" runat="server" AssociatedControlID="ddlEstabelecimento" />
                                                <div class="form-group">

                                                    <asp:DropDownList ID="ddlEstabelecimento" runat="server" SkinID="ddlBootstrap1" />

                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <asp:Label ID="lblTipoVenda" runat="server" AssociatedControlID="ddlTipoVenda" />
                                                <div class="form-group">

                                                    <asp:DropDownList ID="ddlTipoVenda" runat="server" SkinID="ddlBootstrap1" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblContribuinte" runat="server" />
                                                <div class="form-group">

                                                    <asp:CheckBox ID="chkContribuinte" runat="server" Font-Bold="true" />
                                                </div>
                                            </div>
                                           


                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblEstadual" runat="server" />
                                                <div class="form-group">

                                                  <asp:RadioButtonList ID="rblTipoDestino" runat="server" TabIndex="5" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Selected="True" Text="<%$ Resources:Resource, lblAmbos %>" />
                                    <asp:ListItem Value="2" Text="Estadual" />
                                    <asp:ListItem Value="3" Text="Interestadual" />
                                </asp:RadioButtonList>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblUsuarioNome" runat="server" AssociatedControlID="txtUsuarioNome" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtUsuarioNome" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblDataImportacao" runat="server" AssociatedControlID="txtDataImportacao" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtDataImportacao" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    </fieldset>
                </asp:Panel>


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
                                <asp:Label ID="lblFiltroEstabelecimento" runat="server" AssociatedControlID="ddlFiltroEstabelecimento" />
                                <asp:DropDownList ID="ddlFiltroEstabelecimento" runat="server" SkinID="ddlBootstrap1" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroTipoVenda" runat="server" AssociatedControlID="ddlFiltroTipoVenda" />
                                <asp:DropDownList ID="ddlFiltroTipoVenda" runat="server" SkinID="ddlBootstrap1" />
                            </div>

                            <div class="boxPesquisa">
                                <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                    TabIndexDataInicio="1" TabIndexDataTermino="2"
                                    ShowHeaderLine="false" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnSuccess" TabIndex="26" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault" TabIndex="27" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="BtnDanger" TabIndex="29" OnClick="btnFiltrosExcluir_Click" />
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
                                DataKeyNames="importId,estabelecimentoId,TipoVenda,Contribuinte,TipoDestino,usuarioId,DataImportacao,itemInserido,itemAtualizado"
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
                                    <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="estabelecimentoRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="TipoVenda" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrContribuinte" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrEstadual" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


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
                <%--<asp:RequiredFieldValidator ID="rfvItemId" runat="server" ControlToValidate="txtDadosItemId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />--%>

                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>


