<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadUsuario.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadUsuario" ValidateRequest="false" %>

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
                <asp:Panel ID="pnlDados" runat="server" DefaultButton="btnSalvar" Visible="false">
                    <fieldset style="height: 100%; width: 99%">
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>

                        <%-- FORMULÁRIO --%>
                        <div style="width: 100%; height: 100%; display: table;">
                            <div style="display: table-cell; width: 50%;">
                                <ol style="width: 100%; height: 100%;">
                                    <li>
                                        <asp:Label ID="lblDadosId" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosId" runat="server" MaxLength="50" TabIndex="1" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosTipoUsuario" runat="server" SkinID="LabelForm" />
                                        <asp:DropDownList ID="ddlDadosTipoUsuario" runat="server" TabIndex="2" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosPerfilAcessoUsuario" runat="server" SkinID="LabelForm" />
                                        <asp:DropDownList ID="ddlDadosPerfilAcessoUsuario" runat="server" TabIndex="3" />
                                    </li>
                                    <li>
                                        <asp:Panel ID="pnlDadosRepresentante" runat="server" DefaultButton="imbDadosRepresentanteCheck">
                                            <asp:Label ID="lblDadosRepresentante" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtDadosRepresentante" runat="server" SkinID="Pedido" TabIndex="4" />
                                            <asp:ImageButton ID="imbDadosRepresentanteCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" TabIndex="5" ImageUrl="~/Imagens/check.png" OnClick="imbDadosRepresentanteCheck_Click" />
                                            <asp:ImageButton ID="imbDadosRepresentanteBusca" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" TabIndex="6" ImageUrl="~/Imagens/find.png" OnClick="imbDadosRepresentanteBusca_Click" />
                                            <asp:Label ID="lblDadosRepresentanteNome" runat="server" SkinID="LabelFormPedido" />
                                        </asp:Panel>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosNome" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosNome" runat="server" MaxLength="100" TabIndex="7" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosEmail" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosEmail" runat="server" MaxLength="100" TabIndex="8" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosDominio" runat="server" SkinID="LabelForm" />
                                        <asp:DropDownList ID="ddlDadosDominio" runat="server" TabIndex="9" />
                                    </li>
                                    <li>
                                        <div style="margin-left: 150px;">
                                            <asp:CheckBox ID="chkAutenticaAD" runat="server" Font-Bold="true" TabIndex="10" Text="<%$ Resources:Resource, lblAutenticaAD %>" />
                                        </div>
                                        <div style="margin-left: 150px;">
                                            <asp:CheckBox ID="chkSolicitaNovaSenha" runat="server" Font-Bold="true" TabIndex="10" Text="<%$ Resources:Resource, lblSolicitaSenha %>" />
                                        </div>
                                        <div style="margin-left: 150px;">
                                            <asp:CheckBox ID="chkBloqueado" runat="server" Font-Bold="true" TabIndex="10" Text="<%$ Resources:Resource, lblUsuarioBloqueado %>" AutoPostBack="true" OnCheckedChanged="chkBloqueado_CheckedChanged" />
                                        </div>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosLogin" runat="server" SkinID="LabelForm" Visible="false" />
                                        <asp:TextBox ID="txtDadosLogin" runat="server" MaxLength="50" TabIndex="11" Visible="false" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosSenha" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosSenha" runat="server" TextMode="Password" MaxLength="20" TabIndex="12" />
                                    </li>
                                    <li>
                                        <div class="line">
                                            <div class="line_itens_left">
                                                <asp:Label ID="lblDadosGenero" runat="server" SkinID="LabelForm" />
                                            </div>
                                            <div class="line_itens">
                                                <asp:RadioButtonList ID="rblGenero" runat="server" RepeatDirection="Horizontal" TabIndex="13">
                                                    <asp:ListItem Selected="True" Value="M" Text="<%$ Resources:Resource, lblSexoMasculino %>" />
                                                    <asp:ListItem Value="F" Text="<%$ Resources:Resource, lblSexoFeminino %>" />
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                    </li>

                                    <div style="position: relative; border: solid 1px #ccc; border-radius: 6px; background-color: #CCC; width: 380px; height: auto; margin-left: 100px; padding: 10px;">
                                        <asp:Label ID="lblRegrasSenha" runat="server" />
                                    </div>
                                </ol>

                            </div>
                            <div style="display: table-cell; width: 50%; height: 100%;">
                                <fieldset style="width: 98%; height: 98%; position: relative;">
                                    <legend>
                                        <asp:Literal ID="ltrSimulador" runat="server" Text="Acesso ao Simulador" />
                                    </legend>

                                    <div style="display: table; width: 100%;">
                                        <asp:RadioButtonList ID="rblVisao" runat="server" RepeatDirection="Vertical" AutoPostBack="true" OnSelectedIndexChanged="rblVisao_SelectedIndexChanged">
                                            <asp:ListItem Value="CP" Text="Visualização Completa" />
                                            <asp:ListItem Value="RS" Text="Visualização Resumida" />
                                        </asp:RadioButtonList>
                                    </div>
                                    <div style="display: table; margin-left: 50px;">
                                        <asp:RadioButtonList ID="rblVisaoQuadro" runat="server" RepeatDirection="Vertical">
                                            <asp:ListItem Value="SM" Text="Quadro Sumarizado" />
                                            <asp:ListItem Value="RS" Text="Quadro Resumido" />
                                        </asp:RadioButtonList>
                                    </div>

                                </fieldset>
                            </div>
                        </div>

                        <div style="display: table; width: 100%;">
                            <div style="display: table-cell; width: 100%; height: 60px; vertical-align: middle; text-align: center;">
                                <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeft" TabIndex="14" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" SkinID="ButtonCenter" TabIndex="15" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonRight" TabIndex="16" OnClick="btnLimpar_Click" />
                            </div>
                        </div>

                    </fieldset>
                </asp:Panel>

                <%-- PESQUISA REPRESENTANTE --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upRepresentante" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbDadosRepresentanteBusca" EventName="Click" />
                        </Triggers>
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
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                        </Triggers>
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
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" TabIndex="31" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" TabIndex="32" OnClick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="33" OnClick="btnFiltrosExcluir_Click" />
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
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
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


                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioAtivo" runat="server" Text='<%# (Eval("usuarioAtivo").ToString().ToLower().Trim() == "true")?"Ativo":"Inativo" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioAutenticaAD" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            <div style="display: table; width: 100%;">
                                                <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: center;">
                                                    <asp:CheckBox ID="chkSelectFlagAll" runat="server" />
                                                </div>
                                                <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: center;">
                                                    <asp:ImageButton ID="imbAdmVendas" runat="server" CommandName="SaveAdmVendas"
                                                        ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                        ImageUrl="~/Imagens/agree.png"
                                                        ToolTip="<%$ Resources:Resource, lblSalvar %>" />
                                                </div>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelectFlag" runat="server" Checked='<%# Bind("permiteAlterarRepreGrpCli") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAlterar" runat="server" CommandName="Update" />
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
                                        <asp:Button ID="btnExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="34" OnClick="btnExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="35" OnClick="btnExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>


                <%-- BLOCK E UNBLOCK USUÁRIO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppBloqueiaUsuario" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlBlockUser" runat="server" Visible="false">
                                <div class="OpacityBackGround"></div>

                                <div class="painel-medio">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblBloqueioDesbloqueio" runat="server" ForeColor="White" />
                                        </div>

                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="ImageFechaBloqueio" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" TabIndex="16"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="ImageFechaBloqueio_Click" />
                                        </div>

                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrDadosUsuario" runat="server" />
                                            </legend>
                                            <div style="float: left; width: 100%; margin-top: 20px;">
                                                <asp:Label ID="lblBlockUsuario" style="font-weight:bold" runat="server" />&nbsp;<asp:TextBox ID="txtBlockUsuarioId" Enabled="false" runat="server"></asp:TextBox>
                                            </div>
                                            <div style="float: left; width: 100%; margin-top: 10px;">
                                                <asp:Label ID="lblBLockMotivo" style="font-weight:bold;" runat="server" /><br>
                                                <asp:TextBox ID="txtBlockMotivo" runat="server" Width="90%" TabIndex="9" Rows="7" TextMode="MultiLine" />
                                            </div>

                                            <%--BUTTONS--%>
                                            <div style="float: left; width: 100%; margin-top: 20px;">
                                                <div class="painel_bottom_button_left">
                                                    <asp:Button ID="btnBlockUser" runat="server" SkinID="ButtonLeft" OnClick="btnBlockUser_Click" />
                                                </div>
                                                <div class="painel_bottom_button_left">
                                                    <asp:Button ID="btnUnBlockUser" runat="server" SkinID="ButtonLeft" OnClick="btnUnBlockUser_Click" />
                                                </div>
                                                <div class="painel_bottom_button_right">
                                                    <asp:Button ID="btnBlockCancel" runat="server" SkinID="ButtonRight" OnClick="btnBlockCancel_Click" />
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtDadosNome" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvId" runat="server" ControlToValidate="txtDadosId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtDadosEmail" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />


                <%--<asp:RequiredFieldValidator ID="rfvSenha" runat="server" ControlToValidate="txtDadosSenha" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />--%>


                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtDadosEmail" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>
