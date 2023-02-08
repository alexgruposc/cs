<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadEstabelecimentoReposicaoCross.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEstabelecimentoReposicaoCross" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroEstabelecimento" runat="server">
        <asp:UpdatePanel ID="uppCadastroEstabelecimento" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroEstabelecimento">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <div style="width: 100%; display: table;">
                        <fieldset style="margin-bottom: 100px;">
                            <legend>
                                <asp:Literal ID="ltrDadosHeader" runat="server" />
                            </legend>
                            <%-- FORMULÁRIO --%>
                            <div style="width: 100%; display: table;">
                                <div style="display: table-cell; vertical-align: top;">
                                    <asp:Panel ID="pnlDadosEsquerda" runat="server">
                                        <ol>
                                            <li>
                                                <%--<div style="width: 100%; display: table-cell;">--%>
                                                    <asp:Panel ID="pnlHeaderCliente" runat="server" DefaultButton="imbHeaderClienteCheck">
                                                        <div style=" display: table;">
                                                            <div style="display: table-cell; ">
                                                                <asp:Label ID="lblHeaderCliente" runat="server" Width="150px" />
                                                                <asp:TextBox ID="txtHeaderClienteId" runat="server" SkinID="Pedido" MaxLength="50" TabIndex="7" />
                                                                <asp:HiddenField ID="hdHeaderClienteIdERP" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderClienteIdCGC" runat="server" />
                                                                <asp:HiddenField ID="hdclienteContribuinteICMS" runat="server" />
                                                                <asp:HiddenField ID="hdClienteVendaES" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAutoriEspecial" runat="server" />

<%--                                                                <asp:HiddenField ID="hdHeaderBloqAudicon" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderAutorizaVacinas" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderBloqRetinoide" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderBloqMisoprostol" runat="server" />
                                                                <asp:HiddenField ID="hdHeaderBloqFinanceiro" runat="server" />--%>


                                                                <asp:HiddenField ID="hdHeaderPedidoEstabEx" runat="server" />
                                                                <asp:ImageButton ID="imbHeaderClienteCheck" runat="server" Width="25px" Height="25px"
                                                                    ImageAlign="AbsMiddle" TabIndex="8" ImageUrl="~/Imagens/check.png" OnClick="imbHeaderClienteCheck_Click" />

                                                                <asp:ImageButton ID="imbHeaderClienteBusca" runat="server" Width="25px" Height="25px"
                                                                    ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/find.png" OnClick="imbHeaderClienteBusca_Click" />


                                                            </div>
                                                            <div style="display: table-cell; width: 380px;">
                                                                <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 180px;">
                                                                    <asp:Label ID="lblHeaderClienteNome" runat="server" SkinID="LabelResposta" />
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                <%--</div>--%>
                                            </li>
                                            <li>

                                                <%--<div class="line">--%>
                                                <asp:Label ID="Label1" Text="Solicitante" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddEstabelecimentoIdSolicitante" runat="server" TabIndex="10"  OnSelectedIndexChanged="ddEstabelecimentoIdSolicitante_SelectedIndexChanged" 
                                                    AutoPostBack="true"
                                                    SkinID="DropFiltro"  />
                                                <%--</div>
                                                
                                                    <div class="line">--%>
                                                <asp:Label ID="Label2" Text="Repositor" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddlEstabelecimentoIdRepositor" runat="server" TabIndex="11" Enabled="false"
                                                    AutoPostBack="true"
                                                    SkinID="DropFiltro" />

                                                <%-- </div>--%>
                                            </li>
                                        </ol>
                                    </asp:Panel>
                                </div>

                            </div>
                            <div style="width: 100%; display: table; text-align: center;">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="29" SkinID="ButtonLeftSave" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="30" SkinID="ButtonCenterVoltar" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="31" SkinID="ButtonRightClean" OnClick="btnLimpar_Click" />
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>

                        <fieldset>
                            <div class="navegacao">
                                        <div class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroCliente" runat="server" />
                                                        <asp:TextBox ID="txtFiltroCliente" runat="server" MaxLength="30" TabIndex="4" SkinID="SmallFilter" />
                                                    </div>
                                                    <div class="boxPesquisaCurta">
                                                        <asp:Label ID="lblFiltroClienteIdErp" runat="server" />
                                                        <asp:TextBox ID="txtFiltroClienteIdErp" runat="server" MaxLength="30" TabIndex="5" SkinID="SmallFilter" />
                                                    </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="Label3" Text="Solicitante:" runat="server" />
                                    <asp:DropDownList ID="ddFiltroEstabelecimentoIdSolicitante" runat="server" TabIndex="10"
                                        AutoPostBack="True" SkinID="DropFiltro" />
                                </div>
                                <div class="boxPesquisa">
                                    <asp:Label ID="Label4" Text="Repositor" runat="server" />
                                    <asp:DropDownList ID="ddFiltroEstabelecimentoIdRepositor" SkinID="DropFiltro" runat="server" TabIndex="11" />
                                </div>

                                <div class="boxPesquisa">
                                    <div class="line">
                                        <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind"
                                            TabIndex="13" OnClick="btnFiltrosPesquisa_Click" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean"
                                            TabIndex="14" OnClick="btnFiltrosLimpar_Click" />
                                        <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenterNew"
                                            TabIndex="15" OnClick="btnFiltrosNovoCadastro_Click" />
                                        <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRightCancel"
                                            TabIndex="16" OnClick="btnFiltrosExcluir_Click" />
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <%-- GRID REGISTROS --%>

                        <fieldset>
                            <div class="gridRegistros">
                                <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"
                                    DataKeyNames="ReposicaoId,	EstabelecimentoIdSolicitante,clienteId,clienteRazaoSocial,clienteIdERP,	estabelecimentoRazaoSocialSolicitante,	EstabelecimentoIdRepositor,	estabelecimentoRazaoSocialRepositor,usuarioId,DataCadastro"
                                    OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                    OnRowCommand="gvRegistros_RowCommand"
                                    OnRowDataBound="gvRegistros_RowDataBound"
                                    OnRowDeleting="gvRegistros_RowDeleting"
                                    OnRowUpdating="gvRegistros_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chlAll" runat="server" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="clienteId" HeaderText="Código" ItemStyle-HorizontalAlign="Center"   />
                                        <asp:BoundField DataField="clienteIdERP" HeaderText="ERP" ItemStyle-HorizontalAlign="Center"   />
                                        <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Razão Social" ItemStyle-HorizontalAlign="Center"   />
                                        <asp:BoundField DataField="EstabelecimentoIdSolicitante" HeaderText="Solicitante ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="estabelecimentoRazaoSocialSolicitante" HeaderText="Solicitante" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="EstabelecimentoIdRepositor" HeaderText="Repositor ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="estabelecimentoRazaoSocialRepositor" HeaderText="Repositor" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="usuarioId" HeaderText="UsuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:BoundField DataField="DataCadastro" HeaderText="Data Cadastro" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Excluir" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbDelete" runat="server"
                                                    SkinID="ImgGrid"
                                                    CommandName="Delete"
                                                    ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                    ImageUrl="~/Imagens/_trash.png"
                                                    CommandArgument='<%# Eval("ReposicaoId")  %>' />

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Alterar" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnAlterar" runat="server"
                                                    SkinID="ImgGrid"
                                                    CommandName="Update"
                                                    ToolTip="<%$ Resources:Resource, lblEditar %>"
                                                    ImageUrl="~/Imagens/find.png"
                                                    CommandArgument='<%# Eval("ReposicaoId") +"|"+  Eval("EstabelecimentoIdSolicitante") +"|"+ Eval("EstabelecimentoIdRepositor")  +"|"+  Eval("clienteId") +"|"+  Eval("clienteIdERP")+"|"+  Eval("clienteRazaoSocial")  %>'   />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </fieldset>
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
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft"
                                            TabIndex="14" OnClick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight"
                                            TabIndex="15" OnClick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    <%-- PESQUISA CLIENTE --%>
    <div style="position: absolute;">
        <asp:UpdatePanel ID="upCliente" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="imbHeaderClienteBusca" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlBuscaCliente" runat="server" DefaultButton="btnFiltrosClientePesquisa" Visible="false" SkinID="PnlPopUp">
                    <div class="OpacityBackGround">
                    </div>
                    <div class="painel">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblClienteHeader" runat="server" ForeColor="White" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="imbFiltrosClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                    Height="25px" TabIndex="28" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosClose_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <legend>
                                    <asp:Literal ID="ltrClienteHeader" runat="server" />
                                </legend>
                                <%-- FILTROS --%>
                                <div class="navegacao">
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosClienteId" runat="server" />
                                        <asp:TextBox ID="txtFiltrosClienteId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="29" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosClienteIdERP" runat="server" />
                                        <asp:TextBox ID="txtFiltrosClienteIdERP" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="30" />
                                    </div>
                                    <div id="dvCnpj" runat="server" class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosClienteCnpj" runat="server" />
                                        <asp:TextBox ID="txtFiltrosClienteCnpj" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
                                    </div>
                                    <div id="dvCpf" runat="server" class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosClienteCpf" runat="server" />
                                        <asp:TextBox ID="txtFiltrosClienteCpf" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosClienteRazaoSocial" runat="server" />
                                        <asp:TextBox ID="txtFiltrosClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="31" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltrosClientePesquisa" runat="server" SkinID="ButtonLeft" TabIndex="32" OnClick="btnFiltrosClientePesquisa_Click" />
                                        <asp:Button ID="btnFiltrosClienteLimpar" runat="server" SkinID="ButtonRight" TabIndex="33" OnClick="btnFiltrosClienteLimpar_Click" />
                                    </div>
                                </div>
                                <%-- GRID REGISTROS --%>
                                <div class="gridRegistros">
                                    <asp:GridView ID="gvClientes" runat="server" TabIndex="52" DataKeyNames="clienteId,clienteTipoPessoa,clienteCNPJ,clienteIsentoIE,clienteIE,clienteCPF,clienteRG,clienteRazaoSocial,clienteNomeAbreviado,
                                                    clienteRGOrgao,clienteRGDataEmissao,clienteDataCadastro,matrizFinanceira,clienteTipoCredito,clienteValorCredito,medicoId,clienteContribuinteICMS,
                                                    grupoFinanceiroId,clienteGrupoFinanceiroNomeAbreviado,grupoComercialId,canalVendaId,canalVendaDescricao,clienteIdERP,medicoConsProfissional,medicoCRM,medicoUFidCRM,
                                                    categoriaClienteId,categoriaClienteDescricao,mercadoId,mercadoDescricao,clienteInfoAtendentes,representanteId,representanteNomeAbreviado,representanteNome,medicoEnderecoCom,medicoNome,medicoMunicCom,medicoCEPCom,clienteRemConsig,clienteIdSap"
                                        OnPageIndexChanging="gvClientes_PageIndexChanging" OnRowCommand="gvClientes_RowCommand"
                                        OnRowDataBound="gvClientes_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteId" runat="server" Text='<%# FormataStringSaida(Eval("clienteId"), txtFiltrosClienteId.Text) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteIdErp" runat="server" Text='<%# FormataStringSaida(Eval("clienteIdERP"), txtFiltrosClienteId.Text) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Wrap="true">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltrosClienteRazaoSocial.Text) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Wrap="true" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteNomeFantasia" runat="server" Text='<%# Eval("clienteNomeAbreviado") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCNPJ").ToString(), Comom.Utility.FormatOption.ApplyMask), txtFiltrosClienteCnpj.Text) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteCpf" runat="server" Text='<%# FormataStringSaida(Comom.Utility.FormataDocumentos(Eval("clienteCPF").ToString(), Comom.Utility.FormatOption.ApplyMask, Comom.Utility.TipoDocumento.CPF), txtFiltrosClienteCpf.Text) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="150px">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrRepresentante" runat="server" Text='<%# Eval("representanteNome") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="150px">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteGrupoComercial" runat="server" Text='<%# Eval("clienteGrupoComercialNome") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteCanalVenda" runat="server" Text='<%# Eval("canalVendaDescricao") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteCategoria" runat="server" Text='<%# Eval("categoriaClienteDescricao") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltrClienteMercado" runat="server" Text='<%# Eval("mercadoDescricao") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="clienteTipoCredito" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />

                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imbClienteCheckInGrid" runat="server" SkinID="ImgGrid"
                                                        ImageAlign="AbsMiddle" ImageUrl="~/Imagens/check.png" CommandName="Select"
                                                        CommandArgument='<%# Eval("clienteId") + "|" + ((GridViewRow)Container).RowIndex %>' />
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
</asp:Content>
