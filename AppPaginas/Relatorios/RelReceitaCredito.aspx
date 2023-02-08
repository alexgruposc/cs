<%@ Page Title="Relatório de Receita de Crédito" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelReceitaCredito.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelReceitaCredito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>

    <style type="text/css">
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
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanelGeral" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="imbExportarExcel" />
        </Triggers>
    </asp:UpdatePanel>

    <!--  *******************************  RELATÓRIO  *******************************  -->
    <asp:UpdatePanel ID="updRelatorio" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlRelatorio" runat="server" Width="100%">

                <fieldset class="mt-2 pad-5">
                    <legend>Relatório de Receita de Crédito</legend>

                    <div class="col-lg-7">
                        <div class="row">

                            <div class="col-md-2">
                                Cliente ID:<br />
                                <asp:TextBox ID="txtSelclienteIdERP" runat="server" Width="70px"></asp:TextBox>
                            </div>

                            <div class="col-md-2 boxPesquisa">
                                Razão Social:<br />
                                <asp:TextBox ID="txtSelclienteRazaoSocial" runat="server" Width="120px"></asp:TextBox>
                            </div>

                            <div class="col-md-2 boxPesquisa">
                                Paciente:<br />
                                <asp:TextBox ID="txtSelPaciente" runat="server" Width="120px"></asp:TextBox>
                            </div>

                            <div class="col-md-2 boxPesquisa">
                                Tipo Documento:<br />
                                <asp:DropDownList ID="ddlSeltipoDocumentoId" runat="server" Width="110px" />
                            </div>

                            <div class="col-md-2 boxPesquisa">
                                Doc. Utilizado:<br />
                                <asp:DropDownList ID="ddlSelDocumentoUtilizado" runat="server" Width="110px" />
                            </div>

                            <div class="col-md-2 boxPesquisa">
                                Observações Doc.:<br />
                                <asp:TextBox ID="txtSelclienteDocObs" runat="server" Width="120px"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 boxPesquisa">
                        <div class="row">
                            <div class="col-md-6 boxPesquisa">
                                Data Doc.&nbsp;<CtlData:ControlData ID="dtSelDocDataDe" runat="server" />
                                Até:&nbsp;<CtlData:ControlData ID="dtSelDocDataAte" runat="server" />
                            </div>

                            <div class="col-md-6 boxPesquisa">
                                Validade Doc.&nbsp;<CtlData:ControlData ID="dtSelValidDataDe" runat="server" />
                                Até:&nbsp;<CtlData:ControlData ID="dtSelValidDataAte" runat="server" />
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2 boxPesquisa">
                        <div class="row">
                            <div class="col-md-8 boxPesquisa text-right">
                                <asp:Button ID="btnSelecionar" runat="server" Text="Selecionar" SkinID="BtnDefault-xs" OnClick="btnSelecionar_Click" />&nbsp;
                                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="BtnDefault-xs" OnClick="btnLimpar_Click" />
                            </div>
                            <div class="col-md-4 text-right">
                                <asp:ImageButton ID="imbExportarExcel" ImageUrl="../../Imagens/xlsx.png" runat="server" OnClick="imbExportarExcel_Click" ToolTip="Exportar para Excel" Style="width: auto; height: 38px" />
                            </div>
                        </div>

                    </div>
                </fieldset>

                <fieldset class="mt-2 pad-5">
                    <asp:Localize ID="lblMensagemAviso" runat="server"></asp:Localize>
                    <h3>
                        <asp:Localize ID="lblTituloRelatorio" runat="server"></asp:Localize></h3>

                    <asp:GridView DataKeyNames="clienteIdERP,clienteDocumentoDataCadastro"
                        runat="server"
                        ID="gvSelRegistros"
                        AutoGenerateColumns="False"
                        AllowPaging="True"
                        OnRowDataBound="gvSelRegistros_RowDataBound"
                        OnPageIndexChanging="gvSelRegistros_PageIndexChanging"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="clienteIdERP" HeaderText="Cliente ID" />
                            <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" />
                            <asp:BoundField DataField="nomePaciente" HeaderText="Paciente" />
                            <asp:BoundField DataField="tipoDocumentoDescricao" HeaderText="Tipo Documento" />
                            <asp:BoundField DataField="clienteDocumentoDataCadastro" HeaderText="Data Documento" />
                            <asp:BoundField DataField="clienteDocumentoHoraCadastro" HeaderText="Hora Documento" />
                            <asp:BoundField DataField="clienteDocumentoValidade" HeaderText="Data Validade" />
                            <asp:BoundField DataField="clienteDocumentoHoraValidade" HeaderText="Hora Validade" />
                            <asp:BoundField DataField="clienteDocumentoObservacoes" HeaderText="Observações" />
                            <asp:BoundField DataField="clienteDocumentoValido" HeaderText="Doc. Utilizado" />
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                    </asp:GridView>
                    <div class="center">
                        <asp:Localize ID="lblgvSelRegistrosPageInfo" runat="server"></asp:Localize>
                    </div>
                </fieldset>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  ********************************************************************************************************  -->

    <asp:UpdateProgress ID="upLoading" runat="server">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
