<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadCNAES.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCNAES" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <link href="../../Content/select2.css" rel="stylesheet" />
    <script src="../../Scripts/select2.js" type="text/javascript"></script>
    <script src="../../Scripts/select2.full.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">

        $(document).ready(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm != null) {
                prm.add_endRequest(function () {
                    init();
                });
            }

            init();
        });

        function init() {
            $('.js-example-basic-single').select2();
        }



    </script>
    <asp:Panel ID="pnlCadastroMotivo" runat="server">
        <asp:UpdatePanel ID="uppCadastroCNAE" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="gvRegistros" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="gvRegistros" EventName="PageIndexChanging" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroCNAE">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" DefaultButton="btnSalvar" Visible="false">
                    <%-- FORMULÁRIO --%>
                    <div class="form-row">
                        <div class="col-lg-10"></div>
                        <div class="col-lg-2">
                            <asp:Button ID="btnSalvar" runat="server" TabIndex="5" SkinID="BtnSuccess" UseSubmitBehavior="false"
                                ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                            <asp:Button ID="btnBuscar" runat="server" TabIndex="6" SkinID="BtnDanger"
                                OnClick="btnBuscar_Click" />
                            <asp:Button ID="btnLimpar" runat="server" TabIndex="7" SkinID="BtnWarning"
                                OnClick="btnLimpar_Click" />

                        </div>
                    </div>
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Cadastro de CNAE válidos  
                            </h2>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="container body">


                                <div class="form-row">
                                    <div class="form-group col-md-1">
                                        <label for="txtcnaeID">Código</label>
                                        <asp:TextBox ID="txtcnaeID" runat="server" MaxLength="30" SkinID="txtBootstrap" Enable="false" />
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="txtCNAE">CNAE</label>
                                        <asp:TextBox ID="txtCNAE" runat="server" MaxLength="50" SkinID="txtBootstrap" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="ddlHeaderEstabelecimento">Loja</label>
                                        <asp:DropDownList ID="ddlHeaderEstabelecimento" runat="server"
                                            SkinID="ddlBootstrapSelect" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-2">
                                        <label for="txtUsuarioId">Usuário</label>
                                        <asp:TextBox ID="txtUsuarioId" runat="server" MaxLength="50" SkinID="txtBootstrap" Enabled="false" />
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="txtDataCadastro">Data Cadastro</label>
                                        <asp:TextBox ID="txtDataCadastro" runat="server" MaxLength="50" SkinID="txtBootstrap" Enabled="false" />
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>



                </asp:Panel>


                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <asp:UpdatePanel ID="uppFiltros" runat="server">
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnGerarExcel" />
                        </Triggers>
                        <ContentTemplate>
                            <div style="display: table; text-align: center; width: 99%;">
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
                                                        <asp:Label ID="lblFiltrosCNAE" runat="server" />
                                                        <asp:TextBox ID="txtFiltrosCNAE" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="10" />
                                                    </div>


                                                    <div class="boxPesquisa">
                                                               <div class="col-md-2">
                                                        <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                                                   </div>
                                                        <div class="col-md-6">
                                                            <asp:DropDownList ID="dplFiltroEstabelecimento" runat="server"
                                                                SkinID="ddlBootstrapSelect" />
                                                        </div>
                                                    </div>


                                                    <div class="boxPesquisa">
                                                        <div class="line">
                                                            <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnDefault"
                                                                TabIndex="15" OnClick="btnFiltrosPesquisa_Click" />
                                                            <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault"
                                                                TabIndex="16" OnClick="btnFiltrosLimpar_Click" />
                                                            <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnDefault"
                                                                TabIndex="17" OnClick="btnFiltrosNovoCadastro_Click" />
                                                            <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="BtnDefault"
                                                                TabIndex="18" OnClick="btnFiltrosExcluir_Click" />

                                                            <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                                                ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                                                ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <fieldset>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="21"
                                DataKeyNames="cnaeID,CNAE,estabelecimentoId,usuarioId,DataCadastro"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand" OnRowDataBound="gvRegistros_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CNAE" />
                                    <asp:BoundField DataField="estabDescricao" />
                                    <asp:BoundField DataField="usuarioId" />
                                    <asp:BoundField DataField="DataCadastro" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" Width="32px" Height="32px" CommandName="visualizar" SkinID="ImgList"
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
                    <asp:Panel ID="pnlExclusao" runat="server" Visible="false">
                        <div class="OpacityBackGround"></div>
                        <div class="alert">
                            <div class="alert_header">
                                <div class="alert_header_message">
                                    <asp:Label ID="lblExclusaoHeader" runat="server" ForeColor="White" />
                                </div>
                            </div>
                            <div class="alert_body">
                                <asp:Label ID="lblExclusaoBody" runat="server" ForeColor="Black" />
                            </div>
                            <div class="alert_bottom">
                                <div class="alert_bottom_button">
                                    <div class="alert_bottom_button_left">
                                        <asp:Button ID="btnExclusaoYes" runat="server" SkinID="ButtonLeft"
                                            TabIndex="19" OnClick="btnExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnExclusaoNo" runat="server" SkinID="ButtonRight"
                                            TabIndex="20" OnClick="btnExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
