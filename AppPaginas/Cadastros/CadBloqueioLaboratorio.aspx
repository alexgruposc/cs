<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadBloqueioLaboratorio.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadBloqueioLaboratorio" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlItensBLoqueados" runat="server">
        <asp:UpdatePanel ID="updCadBloqueioLaboratorio" runat="server">

            <ContentTemplate>
                <%-- PROGRESS --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updCadBloqueioLaboratorio">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <fieldset>
                    <legend>
                        <asp:Literal ID="Literal3" runat="server" Text="Bloquear Laboratórios" />
                    </legend>
                    <asp:UpdatePanel ID="updPnls" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gvClienteBloqueio" EventName="RowCommand" />
                            <asp:PostBackTrigger ControlID="btnSalvar" />
                            <asp:PostBackTrigger ControlID="btnLimpar" />
                            <asp:PostBackTrigger ControlID="btnVoltar" />
                            <asp:PostBackTrigger ControlID="btnNovoBloqueio" />
                            <asp:PostBackTrigger ControlID="txtClientePesquisa" />
                            <asp:PostBackTrigger ControlID="txtLaboratorioPesquisa" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="dvInclusao" runat="server" Visible="false">
                                <fieldset>
                                    <div style="display: table; float: right">
                                        <div style="text-align: right; display: table-cell; width: 100%; vertical-align: middle;">
                                            <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="ButtonLeftSave" TabIndex="6" OnClick="btnLimpar_Click" />
                                            <asp:Button ID="btnVoltar" runat="server" Text="Voltar" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnVoltar_Click" />
                                            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" SkinID="ButtonCenterClean" TabIndex="1" OnClick="btnSalvar_Click" />
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <asp:Label ID="lblHeaderCliente" runat="server" Text="Cliente:" />
                                    <asp:TextBox ID="txtHeaderClienteId" runat="server" SkinID="Pedido" MaxLength="50" TabIndex="7" />
                                    <asp:HiddenField ID="hdHeaderClienteIdERP" runat="server" />
                                    <asp:ImageButton ID="imbHeaderClienteCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" TabIndex="8" ImageUrl="~/Imagens/check.png" OnClick="imbHeaderClienteCheck_Click" />
                                    <asp:ImageButton ID="imbHeaderClienteBusca" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/find.png" OnClick="imbHeaderClienteBusca_Click" />
                                    <asp:Label ID="Label3" runat="server" Text="   Cliente Selecionado:" />
                                    <asp:Label ID="labelClienteSelecionado" runat="server" />
                                </fieldset>
                                <fieldset>
                                    <div style="width: 100%; display: table; height: 30px; padding: 14px 0 0 0">
                                        <div style="width: 30%; display: table-cell; vertical-align: top;">
                                            <div style="left: 0.5; display: table; width: 100%; margin-top: 2px;">
                                                <div style="width: 45%; height: 100%; display: table-cell;">
                                                    <fieldset style="height: 100%; width: auto;">
                                                        <legend>
                                                            <asp:Literal ID="Literal1" runat="server" Text="Selecione Laboratório para bloqueio" />
                                                        </legend>
                                                        <asp:Label ID="Label1" runat="server" Text="Laboratorio:" />
                                                        <asp:TextBox ID="txtLaboratorioFiltro" runat="server" SkinID="Pedido" MaxLength="50" Style="width: auto" AutoPostBack="false" placeholder="LaboratorioId ou Nome/Razão" />
                                                        <asp:Button ID="btnPEsquisarLaboratorio" runat="server" Text="Pesquisar" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnPEsquisarLaboratorio_Click" />

                                                        <asp:GridView DataKeyNames="fabricanteId,fabricanteNomeAbreviado"
                                                            runat="server"
                                                            Width="100%"
                                                            HorizontalAlign="Center"
                                                            ID="gvLaboratorios"
                                                            AutoGenerateColumns="False"
                                                            AllowPaging="True"
                                                            OnPageIndexChanging="gvLaboratorios_PageIndexChanging"
                                                            OnRowDataBound="gvLaboratorios_RowDataBound"
                                                            EmptyDataText="Não foi encontrado nenhum resultado!" Enabled="false">
                                                            <Columns>
                                                                <asp:TemplateField>

                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelectLab" runat="server" OnCheckedChanged="chkSelectLab_CheckedChanged" ItemStyle-HorizontalAlign="Center" onclick="CheckOne(this);" AutoPostBack="true" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="fabricanteCNPJ" HeaderText="CNPJ" ItemStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField DataField="fabricanteNomeAbreviado" HeaderText="Razão Social" ItemStyle-HorizontalAlign="Center" />
                                                            </Columns>
                                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </fieldset>
                                                </div>
                                                <div style="width: 45%; height: 100%; display: table-cell;">
                                                    <fieldset style="height: 100%; width: auto;">
                                                        <legend>
                                                            <asp:Literal ID="Literal2" runat="server" Text="Selecione a Exceção" />
                                                        </legend>
                                                        <asp:Label ID="Label2" runat="server" Text="Item:" />
                                                        <asp:TextBox ID="txtItemId" runat="server" SkinID="Pedido" MaxLength="50" Style="width: auto" AutoPostBack="false" placeholder="ItemId ou Nome" />
                                                        <asp:Button ID="btnPesquisarItens" runat="server" Text="Pesquisar" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnPesquisarItens_Click" />

                                                        <asp:GridView DataKeyNames="itemId,itemDescricao"
                                                            runat="server"
                                                            CssClass="table table-bordered table-striped table-hover"
                                                            Width="100%"
                                                            HorizontalAlign="Center"
                                                            ID="gvItem"
                                                            AutoGenerateColumns="False"
                                                            AllowPaging="True"
                                                            OnPageIndexChanging="gvItem_PageIndexChanging"
                                                            OnRowDataBound="gvItem_RowDataBound"
                                                            EmptyDataText="Não foi encontrado nenhum resultado!">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelectItem" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectItem_CheckedChanged" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:BoundField DataField="itemId" HeaderText="ItemID" ItemStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" ItemStyle-HorizontalAlign="Center" />

                                                            </Columns>
                                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </asp:Panel>
                            <asp:Panel ID="dvVisualizar" runat="server" Visible="true">
                                <fieldset>
                                    <fieldset>
                                        <div style="display: table; float: right">
                                            <div style="text-align: right; display: table-cell; width: 100%; vertical-align: middle;">
                                                <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" SkinID="ButtonLeftSave" TabIndex="1" OnClick="btnPesquisar_Click" />
                                                <asp:Button ID="btnLimparV" runat="server" Text="Limpar" SkinID="ButtonCenterClean" TabIndex="6" OnClick="btnLimparV_Click" />
                                                <asp:Button ID="btnNovoBloqueio" runat="server" Text="Novo" SkinID="ButtonRightVoltar" TabIndex="7" OnClick="btnNovoBloqueio_Click" />
                                            </div>
                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <asp:Label ID="Label4" runat="server" Text="Cliente:" />
                                        <asp:TextBox ID="txtClientePesquisa" runat="server" SkinID="Pedido" MaxLength="50" Style="width: 300px" placeholder="ClienteID ou Razão" />
                                        <asp:Label ID="Label7" runat="server" Text="Laboratorio:" />
                                        <asp:TextBox ID="txtLaboratorioPesquisa" runat="server" SkinID="Pedido" MaxLength="50" Style="width: 300px" placeholder="Laboratorio ID ou Laboratório" />
                                    </fieldset>
                                </fieldset>
                                <fieldset>
                                    <asp:GridView DataKeyNames="clienteBloqueioLaboratorioId,clienteId,ClienteDescricao,fabricanteId,fabricanteDescricao, listItensExecao"
                                        runat="server"
                                        Width="100%"
                                        HorizontalAlign="Center"
                                        ID="gvClienteBloqueio"
                                        AllowPaging="True"
                                        OnRowCommand="gvClienteBloqueio_RowCommand"
                                        EmptyDataText="Não foi encontrado nenhum resultado!">
                                        <Columns>
                                            <asp:BoundField DataField="clienteBloqueioLaboratorioId" HeaderText="Cliente Bloqueio ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="clienteId" HeaderText="clienteId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="ClienteDescricao" HeaderText="Nome Cliente" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />

                                            <asp:BoundField DataField="fabricanteId" HeaderText="Laboratorio ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="fabricanteDescricao" HeaderText="Laboratorio" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />


                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="deletar" ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="DeleteRow" SkinID="ImgGrid"
                                                        ToolTip="Excluir" CommandArgument='<%#((GridViewRow)Container).RowIndex + "|" + Eval("clienteId") + "|" + Eval("fabricanteId") + "|" + Eval("clienteBloqueioLaboratorioId")  %>'
                                                        ImageUrl="~/Imagens/trash.png" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Visualizar" ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" CommandName="UpdateRow" SkinID="ImgGrid"
                                                        ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%#((GridViewRow)Container).RowIndex + "|" + Eval("clienteId") + "|" + Eval("fabricanteId") + "|" + Eval("clienteBloqueioLaboratorioId")  %>'
                                                        ImageUrl="~/Imagens/find.png" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="listItensExecao" HeaderText="Lista Itens Exceção " ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />--%>
                                        </Columns>
                                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                    </asp:GridView>
                                </fieldset>

                            </asp:Panel>
                            <asp:Panel ID="pnlBuscaCliente" runat="server" DefaultButton="btnFiltrosClientePesquisa" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblClienteHeader" runat="server" Text="Pesquisar Cliente" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbFiltrosClose" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                                Height="25px" TabIndex="28" ImageUrl="~/Imagens/Fechar.png" OnClick="imbFiltrosClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrClienteHeader" Text="Pesquisar" runat="server" />
                                            </legend>
                                            <%-- FILTROS --%>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteId" runat="server" Text="ClienteId" />
                                                    <asp:TextBox ID="txtFiltrosClienteId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="29" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteIdERP" runat="server" Text="ClienteIdERP" />
                                                    <asp:TextBox ID="txtFiltrosClienteIdERP" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="30" />
                                                </div>
                                                <div id="dvCnpj" runat="server" class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteCnpj" runat="server" Text="Cnpj" />
                                                    <asp:TextBox ID="txtFiltrosClienteCnpj" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
                                                </div>
                                                <div id="dvCpf" runat="server" class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteCpf" runat="server" Text="Cpf" />
                                                    <asp:TextBox ID="txtFiltrosClienteCpf" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="30" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltrosClienteRazaoSocial" runat="server" Text="Razao Social" />
                                                    <asp:TextBox ID="txtFiltrosClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="31" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Button ID="btnFiltrosClientePesquisa" runat="server" SkinID="ButtonLeft" TabIndex="32" Text="Filtrar" OnClick="btnFiltrosClientePesquisa_Click" />
                                                    <asp:Button ID="btnFiltrosClienteLimpar" runat="server" SkinID="ButtonRight" TabIndex="33" Text="Limpar" OnClick="btnFiltrosClienteLimpar_Click" />
                                                </div>
                                            </div>
                                            <%-- GRID REGISTROS --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvClientes" runat="server" TabIndex="52" DataKeyNames="clienteId,clienteTipoPessoa,clienteCNPJ,clienteIsentoIE,clienteIE,clienteCPF,clienteRG,clienteRazaoSocial,clienteNomeAbreviado,
                                                    clienteRGOrgao,clienteRGDataEmissao,clienteDataCadastro,matrizFinanceira,clienteTipoCredito,clienteValorCredito,medicoId,
                                                    grupoFinanceiroId,clienteGrupoFinanceiroNomeAbreviado,grupoComercialId,canalVendaId,canalVendaDescricao,clienteIdERP,medicoConsProfissional,medicoCRM,medicoUFidCRM,
                                                    categoriaClienteId,categoriaClienteDescricao,mercadoId,mercadoDescricao,clienteInfoAtendentes,representanteId,representanteNomeAbreviado,representanteNome,medicoEnderecoCom,medicoNome,medicoMunicCom,medicoCEPCom,clienteRemConsig,BloqAudicon,AutorizaVacinas,AutorizaRetinoide,BloqMisoprostol,BloqFinanceiro,dataAlteracao,clienteContribuinteICMS,clienteGrupoComercialNome,clienteEmailComercial"
                                                    OnPageIndexChanging="gvClientes_PageIndexChanging" OnRowCommand="gvClientes_RowCommand"
                                                    OnRowDataBound="gvClientes_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" HeaderText="ClienteId">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteId" runat="server" Text='<%# FormataStringSaida(Eval("clienteId"), txtFiltrosClienteId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center" HeaderText="Cliente ERP">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteIdErp" runat="server" Text='<%# FormataStringSaida(Eval("clienteIdERP"), txtFiltrosClienteId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Razão Social">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltrosClienteRazaoSocial.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Wrap="true" Visible="false" HeaderText="Nome Fantasia">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteNomeFantasia" runat="server" Text='<%# Eval("clienteNomeAbreviado") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" HeaderText="CNPJ">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# Eval("clienteCNPJ") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" HeaderText="CPF">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCpf" Text='<%# Eval("clienteCPF") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrRepresentante" runat="server" Text='<%# Eval("representanteNome") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" HeaderText="Grupo Comercial">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteGrupoComercial" runat="server" Text='<%# Eval("clienteGrupoComercialNome") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" HeaderText="Venda Descrição">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrClienteCanalVenda" runat="server" Text='<%# Eval("canalVendaDescricao") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false" HeaderText="Cliente Descrição">
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

                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" HeaderText="Selecionar">
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
                            <asp:Panel ID="pnlAprovaPedido" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel" style="width: 45%; height: 20%; left: 25%; top: 25%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label runat="server" Text="Salvar Bloqueio" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbAprovacaoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="imbAprovacaoClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body" style="height: 40%;">
                                        <fieldset>
                                            <div style="left: 0%; position: relative;">
                                                <div style="display: table; width: 100%; height: 10%;">
                                                    <div style="display: table-cell; width: 100%; vertical-align: middle; text-align: left;">
                                                        <br />
                                                        <asp:Label Text="Tem certeza que deseja Salvar esse Bloqueio?" runat="server" />
                                                        <br />
                                                        <br />
                                                    </div>
                                                </div>

                                                <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                                    <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                        <asp:Button ID="btnAprovaPedidoOk" runat="server" SkinID="ButtonLeft" Text="Salvar" OnClick="btnAprovaPedidoOk_Click" />
                                                        <asp:Button ID="btnAprovaPedidoNOk" runat="server" SkinID="ButtonRight" Text="Cancelar" OnClick="btnAprovaPedidoNOk_Click" />
                                                    </div>
                                                </div>

                                            </div>
                                        </fieldset>

                                    </div>

                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlExcluir" runat="server" Visible="false" SkinID="PnlPopUp">
                                <div class="OpacityBackGround">
                                </div>
                                <div class="painel" style="width: 45%; height: 20%; left: 25%; top: 25%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="Label5" runat="server" Text="Excluir Bloqueio" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="btnClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="btnClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body" style="height: 40%;">
                                        <fieldset>
                                            <div style="left: 0%; position: relative;">
                                                <div style="display: table; width: 100%; height: 10%;">
                                                    <div style="display: table-cell; width: 100%; vertical-align: middle; text-align: left;">
                                                        <br />
                                                        <asp:Label ID="Label6" Text="Tem certeza que deseja excluir esse Bloqueio?" runat="server" />
                                                        <br />
                                                    </div>
                                                </div>

                                                <div style="display: table; width: 100%; height: 20%; text-align: center;">
                                                    <div style="display: table-cell; width: 100%; height: 100%; vertical-align: middle;">
                                                        <asp:Button ID="btnExcluir" runat="server" SkinID="ButtonLeft" Text="Excluir" OnClick="btnExcluir_Click" />
                                                        <asp:Button ID="btnCancelarExclusao" runat="server" SkinID="ButtonRight" Text="Cancelar" OnClick="btnCancelarExclusao_Click" />
                                                    </div>
                                                </div>

                                            </div>
                                        </fieldset>

                                    </div>

                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <script type="text/jscript">
        //$(function () {
        //    $('input.checkgroup').click(function () {
        //        if ($(this).is(":checked")) {
        //            $('input.checkgroup').attr('disabled', true);
        //            $(this).removeAttr('disabled');
        //        } else {
        //            $('input.checkgroup').removeAttr('disabled');
        //        }
        //    })
        //})

        function CheckOne(obj) {
            var grid = obj.parentNode.parentNode.parentNode;
            var inputs = grid.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == "checkbox") {
                    if (obj.checked && inputs[i] != obj && inputs[i].checked) {
                        inputs[i].checked = false;
                    }
                }
            }
        }

    </script>
</asp:Content>
