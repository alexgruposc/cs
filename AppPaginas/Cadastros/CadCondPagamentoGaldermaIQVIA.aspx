<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadCondPagamentoGaldermaIQVIA.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCondPagamentoGaldermaIQVIA" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<%@ Register Src="~/AppControles/Mensagem.ascx" TagPrefix="MsgBox" TagName="Mensagem" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <%-- <script src="../../Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="../../Styles/Style.css" rel="stylesheet" />
    <script src="../../Scripts/tooltip.js" type="text/javascript"></script>
    <script src="../../Scripts/popover.js" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">


       

        $(document).ready(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm != null) {
                prm.add_endRequest(function () {
                    Init();

                });
                prm.add_initializeRequest(InitializeRequest);
                prm.add_endRequest(EndRequest);
                var postBackElement;
            }


            Init();


        });



        function Init() {
            $('.ui-tooltip').remove();
            $('[data-toggle="tooltip"]').tooltip();
        }
    </script>

    <asp:Panel ID="pnlCadCondicao" runat="server">

        <asp:UpdatePanel ID="uppCadastroItem" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
                <asp:PostBackTrigger ControlID="gvRegistros" />
            </Triggers>
            <ContentTemplate>

                <MsgBox:Mensagem runat="server" ID="MensagemBox" />
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
                                <asp:Button ID="btnVoltar" runat="server" TabIndex="15" SkinID="BtnSuccess" OnClick="btnVoltar_Click" />
                       
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Cadastro condição pagamento IQVIA
                                    </h2>
                                    <div class="nav navbar-right panel_toolbox">
                                        <br />
                                        <br />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">
                                            <div class="form-group col-md-2">
                                                <asp:HiddenField ID="hdHeadercodigoId" runat="server" />
                                                <asp:Label ID="lblFormaCondicaoId" runat="server" />
                                                <asp:TextBox ID="txtFormaCondicaoId" runat="server" Enabled="false" SkinID="txtBootstrap4" />
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:Label ID="lblFormaCondicaoIdDescricao" runat="server" />
                                                <asp:TextBox ID="txtFormaCondicaoIdDescricao" Enabled="false" runat="server" SkinID="txtBootstrap4" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">
                                            <div class="form-group col-md-2">
                                                <asp:Label ID="lblTipoPagamentoId" runat="server" />
                                                <asp:TextBox ID="txtTipoPagamentoId" runat="server" SkinID="txtBootstrap4" Enabled="false" />
                                            </div>

                                            <div class="form-group col-md-2">
                                                <asp:Label ID="lblTipoPagamentoDescricao" runat="server" />
                                                <asp:TextBox ID="txtTipoPagamentoDescricao" runat="server" SkinID="txtBootstrap4" Enabled="false" />
                                            </div>


                                        </div>
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblCodigoPrazoDeterminado" runat="server" AssociatedControlID="txtCodigoPrazoDeterminado" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCodigoPrazoDeterminado" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <asp:Label ID="lblNumeroDiasPrazo" runat="server" AssociatedControlID="txtNumeroDiasPrazo" />
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtNumeroDiasPrazo" Enabled="false" runat="server" SkinID="txtBootstrap3" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="demo-container">
                                            <div class="form-group col-md-4">
                                                <asp:Label ID="lblCondicaoPagamentoId" runat="server" />
                                                <asp:DropDownList ID="dplCondicaoPagamentoId" SkinID="ddlBootstrap1" runat="server" />
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </fieldset>
                </asp:Panel>
                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        <div class="navegacao">
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFormaId" runat="server" />
                                <asp:TextBox ID="txtFiltrosFormaId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="19" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroTipoPagamentoId" runat="server" />
                                <asp:DropDownList ID="dplFiltroTipoPagamentoId" SkinID="DropFiltro" runat="server" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltroCondicaoPagamentoId" runat="server" />
                                <asp:DropDownList ID="dplFiltroCondicaoPagamentoId" SkinID="DropFiltro" runat="server" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnSuccess" TabIndex="26" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault" TabIndex="27" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                        ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                        ImageUrl="~/Imagens/xlsx.png" TabIndex="6" />
                                </div>
                            </div>
                        </div>





                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="32"
                                DataKeyNames="codigoId,Id,Descricao,tipoPagamento,tipoPagamentoDesc,codigoPrazoDeterminado,numeroDiasPrazo,condicaoPagamentoId,condicaoPagamentoDescricao,condicaoPagamentoDesc,tipoPagamentoDescricao"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="Id" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="Descricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="tipoPagamentoDesc" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="codigoPrazoDeterminado" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                    <asp:BoundField DataField="numeroDiasPrazo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                  <%--  <asp:BoundField DataField="condicaoPagamentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />--%>
                                    <asp:BoundField DataField="condicaoPagamentoDesc" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />

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

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>
