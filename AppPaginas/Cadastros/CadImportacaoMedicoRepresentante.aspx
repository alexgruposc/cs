<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadImportacaoMedicoRepresentante.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadImportacaoMedicoRepresentante" %>

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
             <asp:PostBackTrigger ControlID="btnUpload" />
        </Triggers>
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppSimuladorImportacao" >
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <h2>
                <asp:Literal ID="ltrTitulo" runat="server" Text="Importação tabela Representante / Médico" />
            </h2>
            <fieldset style="left: 0.5%; width: 99%; height: 99%;">
                           <asp:Panel ID="pnlGvMedicoRep" runat="server" DefaultButton="btnPesquisaFiltro">
                <div style="border: solid 0px; margin-top: 21px;">
                    <div class="boxPesquisa">
                        <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                            <asp:FileUpload ID="fulArquivo" runat="server" />
                        </div>
                    </div>
                    <div class="boxPesquisa">
         <%--               <script type="text/javascript">
                            var updateProgress = null;

                            function postbackButtonClick() {
                                updateProgress = $find("<%= upLoading.ClientID %>");
                                //window.setTimeout("updateProgress.set_visible(true)", updateProgress.get_displayAfter());
                                updateProgress.style.display = 'block';
                                return true;
                            }


                        </script>--%>
                        <asp:Button ID="btnUpload" runat="server" Width="160px" Text="<%$ Resources:Resource, lblCarregar %>" OnClick="btnUpload_Click"  />
                    </div>
                    <div class="boxPesquisa">
                        <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                            <asp:ImageButton ID="btnExport" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                ImageUrl="~/Imagens/xlsx.png" OnClick="btnExport_Click" />
                        </div>

                    </div>
                </div>
     
                    <div style="display: table; width: 99.6%; height: 70%;">
                        <%--    <fieldset style="left: 0.5%; width: 99%; height: 10%; position: relative; _position: fixed;">
                             <legend>
                                 Filtro
                                 </legend>--%>
                        <br />
                        <div class="col-md-1">
                            <asp:TextBox ID="txtMedicoId" runat="server" MaxLength="50" SkinID="txtBootstrap2" placeholder="Médico Id" />
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtMedicoNome" runat="server" MaxLength="50" SkinID="txtBootstrap2" placeholder="Nome Médico" />
                        </div>

                        <div class="col-md-2">
                            <asp:TextBox ID="txtRepresentanteId" runat="server" MaxLength="50" SkinID="txtBootstrap2" placeholder="Código Representante" />
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtRepresentanteNome" runat="server" MaxLength="50" SkinID="txtBootstrap2" placeholder="Nome Representante" />
                        </div>

                        <div class="col-md-3">
                            <asp:LinkButton ID="btnPesquisaFiltro" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccess" OnClick="btnPesquisaFiltro_Click"> <span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                            <asp:LinkButton ID="btnLimparFiltro" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDanger" OnClick="btnLimparFiltro_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                        </div>
                        <br />

                        <%--</fieldset>--%>
                        <fieldset style="height: 95%; width: 99%; position: relative; _position: fixed;">
                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                <center />
                                <asp:GridView ID="gvMedicoRep" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="usuarioId,DataImportacao,medicoId,representanteId"
                                    OnRowDataBound="gvMedicoRep_RowDataBound"
                                    OnRowCommand="gvMedicoRep_RowCommand"
                                    OnPageIndexChanging="gvMedicoRep_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:BoundField DataField="LogId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="medicoId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="medicoNome" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="representanteId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="representanteNome" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="DataImportacao" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvMedicoRep" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvMedicoRep" EventName="PageIndexChanging" />
            <asp:PostBackTrigger ControlID="btnUpload" />
            <asp:PostBackTrigger ControlID="btnExport" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
