<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadImportacaoMetaUsuario.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadImportacaoMetaUsuario" %>

<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
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

            if (postBackElement.id == '<%= bntUploadUNMeta.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'block';
            }
        }

        function EndRequest(sender, args) {

            if (postBackElement == undefined)
                return;

            if (postBackElement.id == '<%= btnUpload.ClientID %>') {
                document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';


                if (postBackElement.id == '<%= bntUploadUNMeta.ClientID %>') {
                    document.getElementById('<%= upLoading.ClientID %>').style.display = 'none';
                }
            }
        }
    </script>


    <asp:UpdatePanel ID="uppSimuladorImportacao" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvMeta" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvMeta" EventName="PageIndexChanging" />
            <asp:PostBackTrigger ControlID="btnUpload" />
               <asp:PostBackTrigger ControlID="imbItensExportar" />
            <asp:AsyncPostBackTrigger ControlID="gvUnidadeNegocioMeta" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvUnidadeNegocioMeta" EventName="PageIndexChanging" />
            <asp:PostBackTrigger ControlID="bntUploadUNMeta" />            
             <asp:PostBackTrigger ControlID="imbItensExportarMetas" />
        </Triggers>
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppSimuladorImportacao">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <fieldset style="left: 0.5%; width: 99%; height: 50%;">
                <legend>
                    <asp:Literal ID="ltrTitulo" runat="server" Text="<%$ Resources:Resource, lblCarregarMetaUsuario %>" />
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

                    <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                        <asp:ImageButton ID="imbItensExportar" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                            ImageUrl="~/Imagens/xlsx.png" OnClick="imbItensExportar_Click" />
                    </div>
                </div>
                <asp:Panel ID="pnlgvRegraEstab" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">

                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">

                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                <center />

                                <asp:GridView ID="gvMeta" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="usuarioId,usuarioMeta,usuarioConta"
                                    OnRowDataBound="gvMeta_RowDataBound"
                                    OnRowCommand="gvMeta_RowCommand"
                                    OnPageIndexChanging="gvMeta_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <%--<asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Left" />--%>
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="usuarioMeta" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="usuarioConta" ItemStyle-HorizontalAlign="Center" />


                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>

                        </fieldset>
                    </div>
                </asp:Panel>
            </fieldset>

            <fieldset style="left: 0.5%; width: 99%; height: 50%;">
                <legend>
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, lblCarregarMetaUnidade %>" />
                </legend>

                <div style="border: solid 0px; margin-top: 21px;">
                    <div class="boxPesquisa">
                        <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                            <asp:FileUpload ID="fulArquivoMeta" runat="server" />
                        </div>
                    </div>

                    <div class="boxPesquisa">
                        <asp:Button ID="bntUploadUNMeta" runat="server" Width="160px" Text="<%$ Resources:Resource, lblCarregar %>" OnClick="bntUploadUNMeta_Click" />
                    </div>

                    <div style="display: table-cell; width: 5%; height: 100%; vertical-align: middle; text-align: center">
                        <asp:ImageButton ID="imbItensExportarMetas" runat="server" Width="30px" Height="30px"   ImageAlign="AbsMiddle"
                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                            ImageUrl="~/Imagens/xlsx.png" OnClick="imbItensExportarMetas_Click" />
                    </div>
                </div>
                <asp:Panel ID="Panel1" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">

                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">

                            <div style="height: 100%; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                <center />

                                <asp:GridView ID="gvUnidadeNegocioMeta" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="unidadeNegocioId,unidadeNegocioMeta,unidadeNegocioConta"
                                    OnRowDataBound="gvUnidadeNegocioMeta_RowDataBound"
                                    OnRowCommand="gvUnidadeNegocioMeta_RowCommand"
                                    OnPageIndexChanging="gvUnidadeNegocioMeta_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <%--<asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Left" />--%>
                                        <asp:BoundField DataField="unidadeNegocioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="unidadeNegocioMeta" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="unidadeNegocioConta" ItemStyle-HorizontalAlign="Center" />


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
