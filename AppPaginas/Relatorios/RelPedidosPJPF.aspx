<%@ Page Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelPedidosPJPF.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelPedidosPJPF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- CONTROLE --%>
    <%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
    <%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
    <%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades" %>
    <%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <%-- NAMESPACES --%>
    <%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlRelPedidosPJPF" runat="server">
        <asp:UpdatePanel ID="uppRelPedidosPJPF" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGerarExcel" />
            </Triggers>

            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppRelPedidosPJPF">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>                

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlFiltros" runat="server" Height="100%" DefaultButton="btnFiltrosPesquisar">
                    <div style="height:10px"></div>
                    <%-- BACKGROUND - BODY --%>
                    <div style="left: 0.5%; width: 99%; height: 20%;">
                        <fieldset style="left: 0.5%; width: 99%;">
                            <legend>
                                Relatório Pedidos PF e PJ
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblPeriodo" runat="server" Text="Período"></asp:Label>
                                        <CtlPeriodo:ControlPeriodo ID="ctpPedido" runat="server" ShowHeaderLine="false" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:RadioButtonList ID="rblFiltrosTipoPessoa" runat="server" TextAlign="Right" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="" Text="Todas" Selected="True" />
                                            <asp:ListItem Value="J" Text="<%$ Resources:Resource, lblTipoPessoaJuridica %>" />
                                            <asp:ListItem Value="F" Text="<%$ Resources:Resource, lblTipoPessoaFisica %>" />
                                            <%-- <asp:ListItem Value="E" Text="<%$ Resources:Resource, lblTipoPessoaEstrangeira %>" />--%>
                                        </asp:RadioButtonList>
                                    </div>

                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroPedidoId" runat="server" Text='<%$ Resources:Resource, lblNumeroPedido %>' />
                                        <asp:TextBox ID="txtFiltroPedidoId" runat="server" SkinID="Size70" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroCliente" runat="server" Text='<%$ Resources:Resource, lblCliente %>'/>
                                        <asp:TextBox ID="txtFiltroCliente" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroClienteIdErp" runat="server" Text='<%$ Resources:Resource, lblCodigoERP %>' />
                                        <asp:TextBox ID="txtFiltroClienteIdErp" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>
                                    <div id="dvContrato" runat="server" class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroContratoId" runat="server" Text='<%$ Resources:Resource, lblContrato %>' />
                                        <asp:TextBox ID="txtFiltroContratoId" runat="server" MaxLength="50" SkinID="SmallFilter" TabIndex="6" />
                                    </div>
                                    <div id="divEmpenho" runat="server" class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroEmpenhoId" runat="server" Text='<%$ Resources:Resource, lblEmpenho %>' />
                                        <asp:TextBox ID="txtFiltroEmpenhoId" runat="server" MaxLength="50" SkinID="SmallFilter" TabIndex="7" />
                                    </div>
                                </div>
                            </div>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div id="dvCpfFiltro" runat="server" class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroClienteCpf" runat="server" Text='<%$ Resources:Resource, lblCpf %>' />
                                        <asp:TextBox ID="txtFiltroClienteCpf" runat="server" SkinID="SmallFilter" MaxLength="14" />
                                    </div>
                                    <div id="dvTelefone" runat="server" class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroClienteTelefone" runat="server" Text='<%$ Resources:Resource, lblFone %>'/>
                                        <asp:TextBox ID="txtFiltroClienteTelefone" runat="server" SkinID="SmallFilter" MaxLength="20" />
                                    </div>
                                    <div id="divFiltroNotaFiscal" runat="server" class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroPedidoNotaFiscal" runat="server" Text='<%$ Resources:Resource, lblNF %>' />
                                        <asp:TextBox ID="txtFiltroPedidoNotaFiscal" runat="server" SkinID="SmallFilter" MaxLength="30" />
                                    </div>

                                    <div id="dvGruUsuario" runat="server" class="boxPesquisa" visible="false">
                                        <asp:Label ID="lblFiltroGrupoUsuario" runat="server" Text='<%$ Resources:Resource, lblFiltroGrupoUsuario %>' />
                                        <asp:DropDownList ID="ddFiltroGrupoUsuario" runat="server" SkinID="DropSmallFilter" />
                                    </div>

                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltroEstabelecimento" runat="server" Text='<%$ Resources:Resource, lblClienteEstabelecimento %>' />
                                        <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" SkinID="DropSmallFilter" />
                                    </div>

                                    <div id="dvSituacao" runat="server" visible="false" class="boxPesquisa">
                                        <asp:Label ID="lblFiltroSituacao" runat="server" Text='<%$ Resources:Resource, lblStatus %>'/>
                                        <asp:DropDownList ID="ddFiltroSituacao" runat="server" SkinID="DropSmallFilter" />
                                    </div>

                                    <div id="dvEmissor" runat="server" class="boxPesquisa">
                                        <asp:Label ID="lblFiltrosPedidoEmissor" runat="server" Text='<%$ Resources:Resource, lblAtendente %>'/>
                                        <asp:DropDownList ID="ddlFiltrosPedidoEmissor" runat="server" SkinID="DropSmallFilter" />
                                    </div>

                                    <div id="divFiltroPedidoItem" runat="server" class="boxPesquisa">
                                        <asp:Label ID="lblFiltroPedidoItem" runat="server" Text='<%$ Resources:Resource, lblItem %>' />
                                        <asp:DropDownList ID="ddFiltroPedidoItem" runat="server" SkinID="DropSmallFilter" />
                                    </div>
                                </div>
                            </div>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">

                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltroPedidoTriangular" runat="server" Text='<%$ Resources:Resource, lblPedidoTipoTriangular %>' />
                                        <asp:CheckBox ID="chkFiltroPedidoTriangular" runat="server" />
                                    </div>

                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltroVendaDireta" runat="server" Text='<%$ Resources:Resource, lblVendaDireta %>' />
                                        <asp:CheckBox ID="chkFiltroVendaDireta" runat="server" />
                                    </div>

                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltroAguardaCliente" runat="server" Text="<%$ Resources:Resource, lblAguardaIntegracaoCliente %>" />
                                        <asp:CheckBox ID="chkFiltroAguardaCliente" runat="server" />
                                    </div>

                                    <div class="boxPesquisa">
                                        <asp:Label ID="lblFiltroPedidoBionexo" runat="server" Text='<%$ Resources:Resource, lblBionexo %>' />
                                        <asp:CheckBox ID="chkFiltroPedidoBionexo" runat="server" />

                                        <asp:Label ID="lblFiltroPedidoAmil" runat="server" Text='<%$ Resources:Resource, lblPedidoAmil %>' />
                                        <asp:CheckBox ID="chkFiltroPedidoAmil" runat="server" />

                                        <asp:Label ID="lblFiltroPedidoGalderma" runat="server" Text='<%$ Resources:Resource, lblPedidoGalderma %>' />
                                        <asp:CheckBox ID="chkFiltroPedidoGalderma" runat="server" />

                                        <asp:Label ID="lblFiltroPedidoEDI" runat="server" Text='<%$ Resources:Resource, lblPedidoEDI %>' />
                                        <asp:CheckBox ID="chkFiltroPedidoEDI" runat="server" AutoPostBack="true" OnCheckedChanged="chkFiltroPedidoEDI_CheckedChanged" />

                                        <div id="divFiltroSistemaEntrada" runat="server" visible="false">
                                            <asp:Label ID="lblFiltroSistemaEntrada" runat="server" Text='<%$ Resources:Resource, lblSistemaEntradaEDI %>' />
                                            <asp:DropDownList ID="ddlFiltroSistemaEntrada" SkinID="DropFiltro" runat="server" />
                                        </div>
                                    </div>

                                    <div id="divFormatoRelatorio" runat="server" visible="false" class="boxPesquisa">
                                        <asp:Label ID="lblOpcaoRelatorio" runat="server" Text="Formato do Relatório" ></asp:Label>
                                        <asp:RadioButtonList ID="rblOpcaoRelatorio" runat="server" 
                                            RepeatDirection="Vertical" 
                                            TextAlign="Left" 
                                            AutoPostBack="true" 
                                            OnSelectedIndexChanged="rblOpcaoRelatorio_SelectedIndexChanged">
                                            <asp:ListItem Value="A" Text="Analitico" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="R" Text="Resumido"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>

                                    <div class="boxPesquisa">
                                        <asp:Button ID="btnFiltrosPesquisar" runat="server" Text="Pesquisar" SkinID="ButtonLeftFind" OnClick="btnFiltrosPesquisar_Click" />
                                        <asp:Button ID="btnFiltrosLimpar" runat="server" Text="Limpar" SkinID="ButtonCenterClean" OnClick="btnFiltrosLimpar_Click" />
                                        <asp:ImageButton ID="btnGerarExcel" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle" OnClick="btnGerarExcel_Click"
                                            ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                            ImageUrl="~/Imagens/xlsx.png" />
                                    </div>                                    
                                </div>
                            </div>
                        </fieldset>

                    </div>

                     <%-- GRID REGISTROS --%>
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                            <center />
                            <asp:GridView ID="grdPedidosPJPFAnalitico" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                AllowPaging="True" 
                                AutoGenerateColumns="true"
                                DataKeyNames="pedidoId"
                                OnPageIndexChanging="grdPedidosPJPFAnalitico_PageIndexChanging"
                                Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="pedidoData" HeaderText="Data Pedido" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="pedidoHora" HeaderText="Hora Pedido" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="pedidoId" HeaderText="Nº Pedido" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="pedidoValorTotal" HeaderText="Valor Total Pedido" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="ERP" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="pedidoDataEntrega" HeaderText="Data Entrega" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="pedidoItemDataReserva" HeaderText="Data de Reserva" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="embarque" HeaderText="Embarque" />
                                    <asp:BoundField DataField="notaFiscalNumero" HeaderText="NF" />
                                    <asp:BoundField DataField="notaFiscalNumeroTri" HeaderText="NF Triangular" />
                                    <asp:BoundField DataField="clienteRazaoSocialTriangular" HeaderText="Cliente Triangular" />
                                    <asp:BoundField DataField="condicaoPagamentoDescricao" HeaderText="Condição de Pagamento" />
                                    <asp:BoundField DataField="pedidoSituacao" HeaderText="Status" />
                                    <asp:BoundField DataField="atendente" HeaderText="Atendente" />
                                    <asp:TemplateField HeaderText="C" >
                                        <ItemTemplate>
                                            <asp:Image ID="imgConferencia" runat="server" ImageAlign="AbsMiddle" Width="15px" Height="15px"
                                                Visible='<%# Eval("backOfficeConferencia").ToString().Equals("Sim") %>'
                                                ToolTip="<%$ Resources:Resource, lblBackOfficeConferencia %>"
                                                ImageUrl="~/Imagens/saveCheck_2.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="R" >
                                        <ItemTemplate>
                                            <asp:Image ID="imgConferencia" runat="server" ImageAlign="AbsMiddle" Width="15px" Height="15px"
                                                Visible='<%# Eval("backOfficeReceita").ToString().Equals("Sim") %>'
                                                ToolTip="<%$ Resources:Resource, lblBackOfficeReceita %>"
                                                ImageUrl="~/Imagens/saveCheck_2.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="F" >
                                        <ItemTemplate>
                                            <asp:Image ID="imgConferencia" runat="server" ImageAlign="AbsMiddle" Width="15px" Height="15px"
                                                Visible='<%# Eval("backOfficeFinanceiro").ToString().Equals("Sim") %>'
                                                ToolTip="<%$ Resources:Resource, lblBackOfficeFinanceiro %>"
                                                ImageUrl="~/Imagens/saveCheck_2.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="itemId" HeaderText="Código" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="itemDescricao" HeaderText="ITEM"/>
                                    <asp:BoundField DataField="pedidoItemQuantidade" HeaderText="Quantidade" DataFormatString="{0:N4}" ItemStyle-HorizontalAlign="Right"/>
                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>

                            <asp:GridView ID="grdPedidosPJPFResumido" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                AllowPaging="True" 
                                AutoGenerateColumns="true"
                                DataKeyNames="pedidoId"
                                Visible="false"
                                OnPageIndexChanging="grdPedidosPJPFResumido_PageIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="pedidoData" HeaderText="Data Pedido" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="pedidoHora" HeaderText="Hora Pedido" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="pedidoId" HeaderText="Nº Pedido" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="pedidoValorTotal" HeaderText="Valor Total Pedido" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="ERP" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="pedidoDataEntrega" HeaderText="Data Entrega" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="clienteRazaoSocialTriangular" HeaderText="Cliente Triangular" />
                                    <asp:BoundField DataField="condicaoPagamentoDescricao" HeaderText="Condição de Pagamento" />
                                    <asp:BoundField DataField="pedidoSituacao" HeaderText="Status" />
                                    <asp:BoundField DataField="atendente" HeaderText="Atendente" />
                                    <asp:TemplateField HeaderText="C" >
                                        <ItemTemplate>
                                            <asp:Image ID="imgConferencia" runat="server" ImageAlign="AbsMiddle" Width="15px" Height="15px"
                                                Visible='<%# Eval("backOfficeConferencia").ToString().Equals("Sim") %>'
                                                ToolTip="<%$ Resources:Resource, lblBackOfficeConferencia %>"
                                                ImageUrl="~/Imagens/saveCheck_2.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="R" >
                                        <ItemTemplate>
                                            <asp:Image ID="imgConferencia" runat="server" ImageAlign="AbsMiddle" Width="15px" Height="15px"
                                                Visible='<%# Eval("backOfficeReceita").ToString().Equals("Sim") %>'
                                                ToolTip="<%$ Resources:Resource, lblBackOfficeReceita %>"
                                                ImageUrl="~/Imagens/saveCheck_2.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="F" >
                                        <ItemTemplate>
                                            <asp:Image ID="imgConferencia" runat="server" ImageAlign="AbsMiddle" Width="15px" Height="15px"
                                                Visible='<%# Eval("backOfficeFinanceiro").ToString().Equals("Sim") %>'
                                                ToolTip="<%$ Resources:Resource, lblBackOfficeFinanceiro %>"
                                                ImageUrl="~/Imagens/saveCheck_2.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ufId" HeaderText="UF" />
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>