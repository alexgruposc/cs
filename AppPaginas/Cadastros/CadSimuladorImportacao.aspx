<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" EnableEventValidation="false" MaintainScrollPositionOnPostback="true" CodeBehind="CadSimuladorImportacao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadSimuladorImportacao" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>

        function abrirPopUp() {
            document.getElementById('ContentPlaceHolder1_upLoading').style.display = 'block';
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="uppSimuladorImportacao" runat="server">



        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvTabelaCusto" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvTabelaCusto" EventName="PageIndexChanging" />
            <asp:AsyncPostBackTrigger ControlID="gvTabelaRegra" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="gvTabelaRegra" EventName="PageIndexChanging" />
            <asp:PostBackTrigger ControlID="btnUploadRegraPE" />
            <asp:PostBackTrigger ControlID="btnUploadArquivo" />
            <asp:PostBackTrigger ControlID="btnUploadRegra" />
            <asp:PostBackTrigger ControlID="btnUploadCargaRegrasST" />
            <%--     <asp:PostBackTrigger ControlID="btnUpload"   />
            <asp:PostBackTrigger ControlID="btnUploadRegra" />--%>
        </Triggers>
        <ContentTemplate>

            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppSimuladorImportacao">
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>


                  <fieldset style="left: 0.5%; width: 99%; height: auto;">
                <legend>
                    <asp:Literal ID="Literal2" runat="server" Text="Carga Regras PE" />
                </legend>

                <div style="border: solid 0px; margin-top: 21px;">
                    <div class="boxPesquisa">
                        <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                            <asp:FileUpload ID="fulArquivoRegrasPE" text="ST" runat="server" />
                        </div>
                    </div>
                    <div class="boxPesquisa">
                        <asp:Button ID="btnUploadRegraPE" runat="server" Width="160px" Text="Carregar Regras PE" OnClientClick="return abrirPopUp()" OnClick="btnUploadRegraPE_Click" />
                    </div>
                </div>

                <fieldset style="width: 99%; height: auto">
                    <div class="navegacao" style="width: 100%">
                        <div class="boxPesquisaCurta" style="width: 200px;">
                            <asp:Panel ID="Panel2" runat="server">
                                <div class="boxPesquisaCurta">
                                    <asp:Label ID="Label3" Text="Codigo Item:" runat="server" />
                                    <asp:TextBox ID="txtCadidoItemEncargo" SkinID="Filtro" runat="server" TabIndex="50" />
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="boxPesquisaCurta">
                            <asp:Label ID="Label4" Text="Data Importação:" runat="server" />
                            <CtlPeriodo:ControlPeriodo ID="dataPeriodoEncargas" runat="server"
                                TabIndexDataInicio="1" TabIndexDataTermino="2"
                                ShowHeaderLine="false" />
                        </div>
                      
                        <div class="boxPesquisa">
                            <asp:Button ID="btnPesquisaRegraPE" runat="server" SkinID="ButtonLeftFind" Text="Pesquisar" TabIndex="54" OnClick="btnPesquisaRegraPE_Click" />
                            <asp:Button ID="btnLimpaRegraPE" runat="server" SkinID="ButtonRightClean" Text="Limpar" TabIndex="55" OnClick="btnLimpaRegraPE_Click" />
                        </div>
                    </div>
                </fieldset>
                <fieldset style="height: auto; width: 99%; position: relative; _position: fixed;">

                    <div style="height: auto; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                        <center />

                        <asp:GridView ID="gvEncargos" runat="server"
                            CssClass="table table-bordered table-striped table-hover"
                            DataKeyNames="estabelecimentoId,codigoItem,ufOrigemFornec,ufDestinoCliente,contribuinte,encargos,dataImportacao,usuarioId"
                            OnRowDataBound="gvEncargos_RowDataBound"
                            OnRowCommand="gvEncargos_RowCommand"
                            OnPageIndexChanging="gvEncargos_PageIndexChanging"
                            AutoGenerateColumns="False"
                            AllowPaging="True">
                            <Columns>
                                <asp:BoundField HeaderText="Estabelecimento" DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                <asp:BoundField HeaderText="ItemId" DataField="codigoItem" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Uf Origem Fornec" DataField="ufOrigemFornec" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Uf Destino Fornec" DataField="ufDestinoCliente" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Contribuinte" DataField="contribuinte" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Encargos" DataField="encargos" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Data Importacão" DataField="dataImportacao" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Usuario" DataField="usuarioId" ItemStyle-HorizontalAlign="Center" />

                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>

                </fieldset>
            </fieldset>

            <fieldset style="left: 0.5%; width: 99%; height: auto;">
                <legend>
                    <asp:Literal ID="Literal1" runat="server" Text="Carga Regras ST" />
                </legend>

                <div style="border: solid 0px; margin-top: 21px;">
                    <div class="boxPesquisa">
                        <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                            <asp:FileUpload ID="fulArquivoRegrasST" text="ST" runat="server" />
                        </div>
                    </div>
                    <div class="boxPesquisa">
                        <asp:Button ID="btnUploadCargaRegrasST" runat="server" Width="160px" Text="Carregar Regras ST" OnClientClick="return abrirPopUp()" OnClick="btnUploadCargaRegrasST_Click" />
                    </div>
                </div>

                <fieldset style="width: 99%; height: auto">
                    <div class="navegacao" style="width: 100%">
                        <div class="boxPesquisaCurta" style="width: 200px;">
                            <asp:Panel ID="Panel1" runat="server">
                                <div class="boxPesquisaCurta">
                                    <asp:Label ID="Label1" Text="Item:" runat="server" />
                                    <asp:TextBox ID="txtItemId" SkinID="Filtro" runat="server" TabIndex="50" />
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="boxPesquisaCurta">
                            <asp:Label ID="Label2" Text="Data Importação:" runat="server" />
                            <CtlPeriodo:ControlPeriodo ID="CtlDataImportacao" runat="server"
                                TabIndexDataInicio="1" TabIndexDataTermino="2"
                                ShowHeaderLine="false" />
                        </div>
                        <%-- <div class="boxPesquisaCurta">
                            <asp:Label ID="Label2" runat="server" />
                            <asp:DropDownList ID="DropDownList1" runat="server" TabIndex="12" SkinID="DropSmallFilter" />
                        </div>--%>

                        <%--  <div class="boxPesquisaCurta">
                            <CtlPeriodo:ControlPeriodo ID="ControlPeriodo1" runat="server"
                                TabIndexDataInicio="1" TabIndexDataTermino="2"
                                ShowHeaderLine="false" />
                        </div>--%>

                        <%--     <div class="boxPesquisaCurta">
                            <asp:Label ID="Label3" runat="server" />
                            <asp:DropDownList ID="DropDownList2" runat="server" SkinID="DropSmallFilter" TabIndex="15" />
                        </div>--%>

                        <div class="boxPesquisa">
                            <asp:Button ID="btnPesquisarRegrasST" runat="server" SkinID="ButtonLeftFind" Text="Pesquisar" TabIndex="54" OnClick="btnPesquisarRegrasST_Click" />
                            <asp:Button ID="btnLImparRegrasST" runat="server" SkinID="ButtonRightClean" Text="Limpar" TabIndex="55" OnClick="btnLImparRegrasST_Click" />
                        </div>
                    </div>
                </fieldset>
                <fieldset style="height: auto; width: 99%; position: relative; _position: fixed;">

                    <div style="height: auto; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                        <center />

                        <asp:GridView ID="gridRegrasST" runat="server"
                            CssClass="table table-bordered table-striped table-hover"
                            DataKeyNames="estabelecimentoId,itemId,classeFiscal,perfilCliente,estadoDestino,aliquota,PMC,icmsInterno,dataImportacao,usuarioId"
                            OnRowDataBound="gridRegrasST_RowDataBound"
                            OnRowCommand="gridRegrasST_RowCommand"
                            OnPageIndexChanging="gridRegrasST_PageIndexChanging"
                            AutoGenerateColumns="False"
                            AllowPaging="True">
                            <Columns>
                                <asp:BoundField HeaderText="Estabelecimento" DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                <asp:BoundField HeaderText="ItemId" DataField="itemId" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Classe Fiscal" DataField="classeFiscal" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Perfil Cliente" DataField="perfilCliente" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Estado Destino" DataField="estadoDestino" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="PMC" DataField="PMC" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="ICMS S/ Venda" DataField="icmsInterno" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Data Importacão" DataField="dataImportacao" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Usuario" DataField="usuarioId" ItemStyle-HorizontalAlign="Center" />

                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>

                </fieldset>
            </fieldset>
            <fieldset style="left: 0.5%; width: 99%; height: 50%;">
                <legend>
                    <asp:Literal ID="ltrTitulo" runat="server" Text="<%$ Resources:Resource, lblExecSimuladorCargaCustos %>" />
                </legend>

                <div style="border: solid 0px; margin-top: 21px;">
                    <div class="boxPesquisa">
                        <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                            <asp:FileUpload ID="fulArquivo" runat="server" />
                        </div>
                    </div>

                    <div class="boxPesquisa">
                        <asp:Button ID="btnUploadArquivo" runat="server" Width="160px" Text="<%$ Resources:Resource, lblExecSimuladorCargaCustos %>" OnClientClick="return abrirPopUp()" OnClick="btnUpload_Click" />
                    </div>
                </div>
                <asp:Panel ID="pnlGvTabelaCusto" runat="server">
                    <div style="display: table; float: right; width: 100%; height: 40%;">


                        <fieldset style="width: 99%; height: auto">
                            <div class="navegacao" style="width: 100%">
                                <div class="boxPesquisaCurta" style="width: 200px;">
                                    <asp:Panel ID="pnlFiltrosPlanilha" runat="server">
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltrosPlanilha" runat="server" />
                                            <asp:TextBox ID="txtFiltrosPlanilha" SkinID="Filtro" runat="server" TabIndex="50" />
                                        </div>
                                    </asp:Panel>

                                </div>

                                <div class="boxPesquisaCurta">
                                    <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                    <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" TabIndex="12" SkinID="DropSmallFilter" />
                                </div>

                                <div class="boxPesquisaCurta">
                                    <CtlPeriodo:ControlPeriodo ID="CtlPeriodoPedidoInclusao" runat="server"
                                        TabIndexDataInicio="1" TabIndexDataTermino="2"
                                        ShowHeaderLine="false" />
                                </div>

                                <div class="boxPesquisaCurta">
                                    <asp:Label ID="lblFiltrosPedidoEmissor" runat="server" />
                                    <asp:DropDownList ID="ddlFiltrosPedidoEmissor" runat="server" SkinID="DropSmallFilter" TabIndex="15" />
                                </div>

                                <div class="boxPesquisa">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind" TabIndex="54" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRightClean" TabIndex="55" OnClick="btnFiltrosLimpar_Click" />

                                </div>
                            </div>
                        </fieldset>

                        <fieldset style="height: auto; width: 99%; position: relative; _position: fixed;">

                            <div style="height: auto; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                <center />

                                <asp:GridView ID="gvTabelaCusto" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="estabelecimentoId,itemId,ufIdOrigem,itemDescricao,laboratorioNome,tipo,exclusivoHospitalar,NCM,listaDescricao,categoria,resolucao13,
	                                        tratamentoICMSEstab,precoFabrica,descontoComercial,descontoAdicional,percRepasse,precoAquisicao,percReducaoBase,percICMSe,valorCreditoICMS,
	                                        percIPI,valorIPI,percPisCofins,valorPisCofins,	pmc17,descST,mva,valorICMSST,aplicacaoRepasse,reducaoST_MVA,estabelecimentoNome,estabelecimentoUf,
	                                        custoPadrao,aliquotaInternaICMS,percPmc,itemControlado,capAplicado,capDescontoPrc,itemInserido,itemAtualizado,itemExcluido,	DataAlteracao,usuarioId,
	                                        pathArquivo,NomeArquivo"
                                    OnRowDataBound="gvTabelaCusto_RowDataBound"
                                    OnRowCommand="gvTabelaCusto_RowCommand"
                                    OnPageIndexChanging="gvTabelaCusto_PageIndexChanging"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbDownload" runat="server" CssClass="ImageButtonGrid" CommandName="Download"
                                                    ToolTip="<%$ Resources:Resource, lblDownload %>"
                                                    CommandArgument='<%#  Eval("NomeArquivo") + "|" +   Eval("pathArquivo") + "|" +  Eval("itemId") + "|" + Eval("estabelecimentoId")  %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="NomeArquivo" ItemStyle-HorizontalAlign="Left" />
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrDataCadastro" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Left" />
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

            <fieldset style="width: 99%; height: auto">
                <legend>
                    <asp:Literal ID="ltrTituloRegra" runat="server" Text="<%$ Resources:Resource, lblExecSimuladorCargaRegras %>" />
                </legend>

                <div style="border: solid 0px; margin-top: 21px;">
                    <div class="boxPesquisa">
                        <div style="display: table-cell; width: 90%; height: 100%; vertical-align: middle;">
                            <asp:FileUpload ID="fulArquivoRegra" runat="server" />
                        </div>
                    </div>

                    <div class="boxPesquisa">
                        <asp:Button ID="btnUploadRegra" runat="server" Width="160px" Text="<%$ Resources:Resource, lblExecSimuladorCargaRegras %>" OnClientClick="return abrirPopUp()" OnClick="btnUploadRegra_Click" />
                    </div>
                </div>

                <asp:Panel ID="pnlGvTabela" runat="server">
                    <div style="display: table; width: 99.6%; height: 40%;">
                        <fieldset style="width: 99%; height: auto">
                            <div class="navegacao">
                                <div class="boxPesquisaCurta" style="width: 200px;">
                                    <asp:Panel ID="pnlFiltrosPlanilhaRegra" runat="server">
                                        <div class="boxPesquisaCurta">
                                            <asp:Label ID="lblFiltrosPlanilhaRegra" runat="server" />
                                            <asp:TextBox ID="txtFiltrosPlanilhaRegra" SkinID="Filtro" runat="server" TabIndex="50" />
                                        </div>
                                    </asp:Panel>

                                </div>

                                <div class="boxPesquisaCurta">
                                    <asp:Label ID="lblFiltroEstabelecimentoRegra" runat="server" />
                                    <asp:DropDownList ID="ddFiltroEstabelecimentoRegra" runat="server" TabIndex="12" SkinID="DropSmallFilter" />
                                </div>

                                <div class="boxPesquisaCurta">
                                    <CtlPeriodo:ControlPeriodo ID="CtlPeriodoRegraInclusao" runat="server"
                                        TabIndexDataInicio="1" TabIndexDataTermino="2"
                                        ShowHeaderLine="false" />
                                </div>

                                <div class="boxPesquisaCurta">
                                    <asp:Label ID="lblFiltrosPedidoEmissorRegra" runat="server" />
                                    <asp:DropDownList ID="ddlFiltrosPedidoEmissorRegra" runat="server" SkinID="DropSmallFilter" TabIndex="15" />
                                </div>

                                <div class="boxPesquisa">
                                    <asp:Button ID="btnFiltrosPesquisaRegra" runat="server" SkinID="ButtonLeftFind" TabIndex="54" OnClick="btnFiltrosPesquisaRegra_Click" />
                                    <asp:Button ID="btnFiltrosLimparRegra" runat="server" SkinID="ButtonRightClean" TabIndex="55" OnClick="btnFiltrosLimparRegra_Click" />

                                </div>
                            </div>
                        </fieldset>
                        <fieldset style="height: auto; width: 99%; position: relative; _position: fixed;">
                            <div style="height: auto; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">

                                <center />
                                <asp:GridView ID="gvTabelaRegra" runat="server"
                                    CssClass="table table-bordered table-striped table-hover"
                                    DataKeyNames="estabelecimentoId,convenioId ,ufDestino,perfilCliente,resolucaoId,icmsStValor,usoExclusivoHospitalar,
                                                  icmsSobreVenda,icmsStSobreVenda,ajusteRegimeFiscal ,itemInserido,itemExcluido,itemAtualizado,dataAtualizacao, 
                                                    usuarioId,pathArquivo,NomeArquivo"
                                    OnRowDataBound="gvTabelaRegra_RowDataBound"
                                    OnRowCommand="gvTabelaRegra_RowCommand"
                                    OnPageIndexChanging="gvTabelaRegra_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbDownload" runat="server" CssClass="ImageButtonGrid" CommandName="Download"
                                                    ToolTip="<%$ Resources:Resource, lblDownload %>"
                                                    CommandArgument='<%#  Eval("NomeArquivo") + "|" +   Eval("pathArquivo") +  "|" + Eval("estabelecimentoId")  %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="NomeArquivo" ItemStyle-HorizontalAlign="Left" />
                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrDataCadastro" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="convenioId" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="ufDestino" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Left" />
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
