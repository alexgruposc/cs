<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadAutorizaReserva.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadAutorizaReserva" %>

<%-- NAMESPACES --%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">

        function TrataCampos(txtId, txtNome, lblNome, pnl) {
            if (document.getElementById(pnl).style.display == "none") {
                document.getElementById(txtId).value = "";
                document.getElementById(txtNome).value = "";
                document.getElementById(lblNome).innerHTML = "";
                document.getElementById(txtNome).disabled = false;
            }
            else
                document.getElementById(txtNome).disabled = true;
        }

        function ConsisteMotivoBlock() {
            var msg = '';
            if (document.getElementById('ContentPlaceHolder1_txtBlockMotivo').value == '')
                msg = "- Necessário informar o motivo.";

            if (msg != '') {
                alert(msg);
                return false;
            } else {
                return true;
            }
        }

    </script>

    <asp:Panel ID="pnlCadastroUsuario" runat="server">
        <asp:UpdatePanel ID="uppCadastroUsuario" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnConfirmarYes" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroUsuario">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME OS DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <fieldset style="height: 100%; width: 99%">
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnVoltar" runat="server" TabIndex="33" OnClick="btnBuscar_Click" />
                                </div>
                            </div>
                        </div>

                        <%-- FORMULÁRIO --%>
                        <div style="width: 100%; height: 100%; display: table;">
                            <div style="display: table-cell; width: 50%;">
                                <ol style="width: 100%; height: 100%;">
                                    <li>
                                        <asp:Label ID="lblDadosId" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosId" runat="server" MaxLength="50" TabIndex="1" />
                                    </li>
                                    <li>
                                        <div style="display: table-cell; width: 50%; height: 100%;">
                                            <fieldset style="width: 98%; height: 98%; position: relative;">
                                                <legend>
                                                    <asp:Literal ID="Literal1" runat="server" Text="Usuários não selecionados" />
                                                </legend>
                                                <div class="navegacao">
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblCodigoNaoSelecionado" runat="server" />
                                                        <asp:TextBox ID="txtCodigoNaoSelecionado" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="17" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblNomeNaoSelecionado" runat="server" />
                                                        <asp:TextBox ID="txtNomeNaoSelecionado" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="18" />
                                                    </div>
                                                    <div>
                                                        <asp:Button ID="btnPesquisarNaoSelecionado" runat="server" SkinID="ButtonLeft" TabIndex="20" OnClick="btnPesquisarNaoSelecionado_Click" />
                                                        <asp:Button ID="btnLimparNaoSelecionado" runat="server" SkinID="ButtonRight" TabIndex="21" OnClick="btnLimparNaoSelecionado_Click" />
                                                    </div>

                                                </div>
                                                <div style="display: table; width: 100%;">
                                                    <asp:GridView ID="gvUsuariosNaoSelecionados" runat="server" TabIndex="36"
                                                        DataKeyNames="usuarioId,usuarioNome"
                                                        OnPageIndexChanging="gvUsuariosNaoSelecionados_PageIndexChanging" OnRowDataBound="gvUsuariosNaoSelecionados_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chlAllNaoSelecionados" runat="server" AutoPostBack="true" OnCheckedChanged="chlAllNaoSelecionados_CheckedChanged" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="50px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrUsuarioId" runat="server" Text='<%# FormataStringSaida(Eval("usuarioId"), txtFiltrosUsuarioId.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="100px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrUsuarioNome" runat="server" Text='<%# FormataStringSaida(Eval("usuarioNome"), txtFiltrosUsuarioNome.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>

                                            </fieldset>
                                        </div>
                                    </li>


                                </ol>

                            </div>
                            <div style="display: table-cell; width: 50%; height: 100%;">

                                <ol style="width: 100%; height: 100%;">
                                    <li>
                                        <asp:Label ID="lblDadosNome" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosNome" runat="server" MaxLength="50" TabIndex="1" />
                                    </li>
                                    <li>



                                        <div style="display: table; width: 90%;">
                                            <fieldset style="width: 98%; height: 98%; position: relative;">
                                                <legend>
                                                    <asp:Literal ID="ltrSimulador" runat="server" Text="Usuários Selecionados" />
                                                </legend>
                                                <div class="navegacao">
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblCodigoSelecionado" runat="server" />
                                                        <asp:TextBox ID="txtCodigoSelecionado" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="17" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblNomeSelecionado" runat="server" />
                                                        <asp:TextBox ID="txtNomeSelecionado" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="18" />
                                                    </div>

                                                    <div>
                                                        <asp:Button ID="btnPesquisarSelecionado" runat="server" SkinID="ButtonLeft" TabIndex="20" OnClick="btnPesquisarSelecionado_Click" />
                                                        <asp:Button ID="btnLimparSelecionado" runat="server" SkinID="ButtonRight" TabIndex="21" OnClick="btnLimpaSelecionado_Click" />
                                                    </div>

                                                </div>
                                                <div style="display: table; width: 100%;">
                                                    <asp:GridView ID="gvUsuariosSelecionados" runat="server" TabIndex="36"
                                                        DataKeyNames="usuarioId,usuarioNome"
                                                        OnPageIndexChanging="gvUsuariosSelecionados_PageIndexChanging" OnRowDataBound="gvUsuariosSelecionados_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chlAll" runat="server" AutoPostBack="true" OnCheckedChanged="chlAll_CheckedChanged" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="50px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrUsuarioId" runat="server" Text='<%# FormataStringSaida(Eval("usuarioId"), txtFiltrosUsuarioId.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="100px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrUsuarioNome" runat="server" Text='<%# FormataStringSaida(Eval("usuarioNome"), txtFiltrosUsuarioNome.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>

                                            </fieldset>
                                        </div>



                                    </li>


                                </ol>


                            </div>
                        </div>

                        <div style="display: table; width: 100%;">
                            <div style="display: table-cell; width: 100%; height: 60px; vertical-align: middle; text-align: center;">
                                <asp:Button ID="btnAdicionarUsuario" runat="server" SkinID="ButtonLeft" TabIndex="14" OnClick="btnAdicionarUsuario_Click" />
                                <asp:Button ID="btnExcluirUsuario" runat="server" SkinID="ButtonRight" TabIndex="16" OnClick="btnExcluirUsuario_Click" />
                            </div>
                        </div>

                    </fieldset>
                </asp:Panel>

                <%-- PESQUISA REPRESENTANTE --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upRepresentante" runat="server" UpdateMode="Conditional">
                        <%--        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbDadosRepresentanteBusca" EventName="Click" />
                        </Triggers>--%>
                        <ContentTemplate>
                            <asp:Panel ID="pnlBuscaRepresentante" runat="server" DefaultButton="btnFiltroPesquisar" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblRepresentanteHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbFiltrosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" TabIndex="16"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbFiltrosClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrRepresentanteHeader" runat="server" />
                                            </legend>
                                            <%-- FILTROS --%>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroRepresentanteId" runat="server" />
                                                    <asp:TextBox ID="txtFiltroRepresentanteId" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="17" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroRepresentanteNomeAbrev" runat="server" />
                                                    <asp:TextBox ID="txtFiltroRepresentanteNomeAbrev" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="18" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroRepresentanteNome" runat="server" />
                                                    <asp:TextBox ID="txtFiltroRepresentanteNome" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="19" />
                                                </div>

                                                <div class="boxPesquisa">
                                                    <div class="line">
                                                        <asp:Button ID="btnFiltroPesquisar" runat="server" SkinID="ButtonLeft" TabIndex="20" OnClick="btnFiltroPesquisar_Click" />
                                                        <asp:Button ID="btnFiltroLimpar" runat="server" SkinID="ButtonRight" TabIndex="21" OnClick="btnFiltroLimpar_Click" />
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- GRID REGISTROS --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvRegistros" runat="server" TabIndex="37"
                                                    DataKeyNames="representanteId,representanteNomeAbreviado,representanteNome"
                                                    OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                                    OnRowCommand="gvRegistros_RowCommand" OnRowDataBound="gvRegistros_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="representanteId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                        <asp:TemplateField ItemStyle-Width="200px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentanteNomeAbrev" runat="server" Text='<%# FormataStringSaida(Eval("representanteNomeAbreviado"), txtFiltroRepresentanteNomeAbrev.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentanteNome" runat="server" Text='<%# FormataStringSaida(Eval("representanteNome"), txtFiltroRepresentanteNome.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbSelect" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle"
                                                                    ImageUrl="~/Imagens/check.png" CommandName="Select"
                                                                    CommandArgument='<%# Eval("representanteId") + "|" + ((GridViewRow)Container).RowIndex %>' />
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

                        <ContentTemplate>
                            <asp:Panel ID="pnlDadosConfirmar" runat="server" Visible="false">
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
                                                    <asp:Label ID="lblConfirmarId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarTipoUsuario" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarTipoUsuarioTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarPerfilAcessoUsuario" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPerfilAcessoUsuarioTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarNome" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarNomeTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarEMail" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarEMailTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDominio" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDominioTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarAutentica" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarAutenticaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarSexo" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarSexoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarSimuladorVisualizacao" runat="server" SkinID="LabelForm" Text="Simulador Visualização:" />
                                                    <asp:Label ID="lblConfirmarSimuladorVisualizacaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarSimuladorQuadro" runat="server" SkinID="LabelForm" Text="Simulador Quadro:" />
                                                    <asp:Label ID="lblConfirmarSimuladorQuadroTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="22" OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="23" OnClick="btnConfirmarNo_Click" />
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
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosUsuarioId" runat="server" />
                                <asp:TextBox ID="txtFiltrosUsuarioId" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="24" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosUsuarioNome" runat="server" />
                                <asp:TextBox ID="txtFiltrosUsuarioNome" runat="server" SkinID="Filtro" MaxLength="100" TabIndex="25" />
                            </div>

                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosUsuarioTipo" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosUsuarioTipo" runat="server" SkinID="DropFiltro" TabIndex="27" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosPerfilAcessoUsuario" runat="server" />
                                <asp:DropDownList ID="ddFiltrosPerfilAcessoUsuario" runat="server" SkinID="DropFiltro" TabIndex="27" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosDominio" runat="server" Visible="true" />
                                <asp:DropDownList ID="ddlFiltrosDominio" runat="server" SkinID="DropFiltro" TabIndex="28" Visible="true" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblUsuarioStatus" Text="Status" runat="server" />
                                <asp:DropDownList ID="ddlUsuarioStatus" runat="server" SkinID="DropFiltro" TabIndex="9" />
                            </div>
                            <div class="boxPesquisaCurta" style="text-align: center;">
                                <asp:CheckBox ID="chkFiltrosAutenticaAD" runat="server" Font-Bold="true" TabIndex="29" Text="<%$ Resources:Resource, lblAutenticaAD %>" />
                            </div>
                            <div class="boxPesquisaCurta" style="text-align: center;">
                                <asp:CheckBox ID="chkAdmVendasFiltro" runat="server" Font-Bold="true" TabIndex="29" Text="<%$ Resources:Resource, lblAdmVendas %>" />
                            </div>
                        </div>
                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="30" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" TabIndex="31" OnClick="btnFiltrosLimpar_Click" />

                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros" style="margin-bottom: 100px;">
                            <asp:GridView ID="gvRegistrosPesquisa" runat="server" TabIndex="36"
                                DataKeyNames="usuarioId,usuarioNome,usuarioAtivo,usuarioAutenticaAD,usuarioEmail,usuarioSexo,usuarioTipoId,usuarioSimuladorVisualizacao,
                                              dominioId,perfilAcessoId,representanteId,representanteNome,representanteNomeAbreviado,usuarioSimuladorQuadro"
                                OnPageIndexChanging="gvRegistrosPesquisa_PageIndexChanging"
                                OnRowCommand="gvRegistrosPesquisa_RowCommand"
                                OnRowDataBound="gvRegistrosPesquisa_RowDataBound"
                                OnRowDeleting="gvRegistrosPesquisa_RowDeleting"
                                OnRowUpdating="gvRegistrosPesquisa_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="130px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioId" runat="server" Text='<%# FormataStringSaida(Eval("usuarioId"), txtFiltrosUsuarioId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioNome" runat="server" Text='<%# FormataStringSaida(Eval("usuarioNome"), txtFiltrosUsuarioNome.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="usuarioEmail" ItemStyle-Width="300px" Visible="false" />
                                    <asp:BoundField DataField="perfilAcessoDescricao" ItemStyle-Width="300px" />
                                    <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioTipo" runat="server" Text='<%# FormataStringSaida(GetTipoUsuario(Eval("usuarioTipoId").ToString()), ddlFiltrosUsuarioTipo.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="usuarioSexo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="false" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrDominioId" runat="server" Text='<%# FormataStringSaida(Eval("dominioId"), ddlFiltrosDominio.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>


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
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
