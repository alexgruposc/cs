<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadImportacaoRegraOl.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadImportacaoRegraOl" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
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

    <asp:UpdatePanel ID="uppSimuladorImportacao" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvTabela" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvTabela" EventName="PageIndexChanging" />
            <asp:PostBackTrigger ControlID="btnUpload" />

        </Triggers>
        <ContentTemplate>

            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppSimuladorImportacao">
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <fieldset style="left: 0.5%; width: 99%; height: 50%;">
                <legend>
                    <asp:Literal ID="ltrTitulo" runat="server" Text="<%$ Resources:Resource, lblCarregarTabela %>" />
                </legend>

                <div style="border: solid 0px; margin-top: 21px;">
                    <div class="boxPesquisa">
                        <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                            <asp:FileUpload ID="fulArquivo" runat="server" />
                        </div>
                    </div>

                    <div class="boxPesquisa">
                        <asp:Button ID="btnUpload" runat="server" Width="160px" Text="<%$ Resources:Resource, lblCarregar %>" OnClick="btnUpload_Click" />
                    </div>
                      <div class="boxPesquisa">
                        <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                            <asp:ImageButton ID="btnExport" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                ImageUrl="~/Imagens/xlsx.png"/>
                        </div>
                    </div>
                </div>
                <asp:Panel ID="pnlGvTabelaCusto" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">

                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">

                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                <center />

                                <asp:GridView ID="gvTabela" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="estabelecimentoId ,tipoRegraId ,medicoCli,itemId ,ValorVendaLiq ,PercDescontoIndustria
                                    ,PercDescontoFinanceiroInd ,InicioValidade ,FimValidade,mercadoId,itemInserido ,itemAtualizado,itemExcluido ,usuarioId ,DataImportacao,Projeto"
                                    OnRowDataBound="gvTabela_RowDataBound"
                                    OnRowCommand="gvTabela_RowCommand"
                                    OnPageIndexChanging="gvTabela_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="medicoCli" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="ValorVendaLiq" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="ValorVendaLiqMax" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="PercDescontoIndustria" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="PercDescontoFinanceiroInd" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="Projeto" ItemStyle-HorizontalAlign="Left" />
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrInicioValidade" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrFimValidade" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Left" />
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
                                                <asp:Literal ID="ltritemExcluido" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrItemSemAtualizacao" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

