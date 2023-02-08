<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadEmpenhoPedido.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEmpenhoPedido" %>

<%-- CONTOLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%-- NAMESPACE --%>
<%@ Import Namespace="KRAFTSALES.DATAENTITIES.Entidades"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlEmpenhoPedido" runat="server">
        <asp:UpdatePanel ID="uppEmpenhoPedido" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppEmpenhoPedido">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                
                <%-- PAINEL FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosEmpenhoCodigoId" runat="server" />
                                <asp:TextBox ID="txtFiltrosEmpenhoCodigoId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="8" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteId" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteId" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="9" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteRazaoSocial" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="10" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosPedidoSituacao" runat="server" />
                                <asp:DropDownList ID="ddFiltrosPedidoSituacao" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="11" >
                                    <asp:ListItem Selected="True" Value="" Text="<%$ Resources:Resource, lblSelecione %>" />
                                    <asp:ListItem Value="CadastroEmAndamento" Text="<%$ Resources:Resource, lblEmpenhoStatusCadAberto %>" />
                                    <asp:ListItem Value="LiberadoFaturamento" Text="<%$ Resources:Resource, lblEmpenhoPedidoStatusLiberado %>" />
                                    <asp:ListItem Value="AlocadoTotalEMS" Text="<%$ Resources:Resource, lblEmpenhoPedidoStatusAlocadoTotal %>" />
                                    <asp:ListItem Value="Faturado" Text="<%$ Resources:Resource, lblEmpenhoPedidoStatusFaturado %>" />
                                    <asp:ListItem Value="Cancelado" Text="<%$ Resources:Resource, lblEmpenhoStatusCancelado %>" />
                                </asp:DropDownList>
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" 
                                        TabIndex="12" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" 
                                        TabIndex="13" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonRight" 
                                        TabIndex="14" onclick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" Visible="false"
                                        TabIndex="15" onclick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistrosPrincipal">
                            <asp:GridView ID="gvRegistrosPrincipal" runat="server" TabIndex="16"                                 
                                DataKeyNames="pedidoId,tipoPedidoId,estabelecimentoId,representanteId,clienteId,tipoEnderecoId
                                              ,pedidoTriangular,clienteIdTriangular,condicaoPagamentoId,tabelaPrecoId,tipoMotivoId
                                              ,pedidoMotivoDescricao,pedidoNumeroCliente,pedidoSituacao,pedidoSitEnvio,pedidoSitEnvioData
                                              ,pedidoSitIntegracao,pedidoSitIntegracaoMsg,pedidoSitIntegracaoData,pedidoEfetuaReserva
                                              ,pedidoNumeroIntegracao,naturezaOperacaoId,estabelecimentoIdNF,notaFiscalSerie,notaFiscalNumero
                                              ,pedidoObservacoes,pedidoObservacoesLogistica,pedidoUrgente,usuarioId,usuarioIdMotivo,unidadeNegocioId
                                              ,empenhoCodigoId,EmpenhoData,empenhoObservacao,empenhoStatus,empenhoMotivoCanc
                                              ,usuarioIdCanc,empenhoDataCanc,usuarioIdIncl,empenhoDataIncl,usuarioIdAlter,empenhoDataAlter,clienteRazaoSocial" 

                                onpageindexchanging="gvRegistrosPrincipal_PageIndexChanging" 
                                onrowcommand="gvRegistrosPrincipal_RowCommand" 
                                onrowdatabound="gvRegistrosPrincipal_RowDataBound" 
                                onrowdeleting="gvRegistrosPrincipal_RowDeleting"
                                onrowupdating="gvRegistrosPrincipal_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" Visible="false">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrEmpenhoCodigoId" runat="server" Text='<%# FormataStringSaida(Eval("empenhoCodigoId"), txtFiltrosEmpenhoCodigoId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteId" runat="server" Text='<%# FormataStringSaida(Eval("clienteId"), txtFiltrosClienteId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltrosClienteRazaoSocial.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="300px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPedidoSituacao" runat="server" Text='<%# Empenho.EmpenhoPedidoStatusDescricaoInterna(Eval("pedidoSituacao").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
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

                <%-- PAINEL DADOS --%>
                <asp:Panel ID="pnlEmpenhoPedidoDados" runat="server" Visible="false">
                    <fieldset style="height: 70%; width: 97%; position: fixed; margin-bottom: 80px;">
                        <legend>
                            <asp:Literal ID="ltrEmpenhoPedido" runat="server" Text="EMPENHO - EMISSÃO DE PEDIDOS" />
                        </legend>
                            
                            <%-- EMPENHO HEADER --%>
                            <fieldset style="position: relative; height: 30px;">                                
                                <ol>
                                    <li>
                                        <asp:Panel ID="pnlEmpenhoPedidoNumero" runat="server" DefaultButton="imbEmpenhoPedidoNumeroBuscar">
                                            <asp:Label ID="lblEmpenhoPedidoNumero" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtEmpenhoPedidoNumero" runat="server" />
                                            <asp:ImageButton ID="imbEmpenhoPedidoNumeroBuscar" runat="server" Width="25px" Height="25px"
                                                             ImageAlign="AbsMiddle" 
                                                             ToolTip="<%$ Resources:Resource, lblBuscar %>"
                                                             ImageUrl="~/Imagens/check.png" 
                                                             onclick="imbEmpenhoPedidoNumeroBuscar_Click" />
                                            <asp:ImageButton ID="imbEmpenhoPedidoNumeroPesquisar" runat="server" Width="25px" Height="25px"
                                                             ImageAlign="AbsMiddle" 
                                                             ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                             ImageUrl="~/Imagens/find.png" 
                                                             onclick="imbEmpenhoPedidoNumeroPesquisar_Click" />
                                            <asp:Label ID="lblEmpenhoPedidoEstabelecimento" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddlEmpenhoPedidoEstabelecimento" runat="server" Enabled="false" />
                                            <asp:Label ID="lblEmpenhoPedidoStatus" runat="server" SkinID="LabelForm" />
                                            <asp:Label ID="lblEmpenhoPedidoStatusDescricao" runat="server" ForeColor="Red" />
                                        </asp:Panel>
                                    </li>
                                </ol>
                            </fieldset>

                            <div style="width: 100%; display: table;">
                                <div style="width: 50%; display: table-cell; vertical-align: top;">
                                    <%-- EMPENHO CLIENTE --%>
                                    <fieldset>
                                        <ol>
                                            <li>
                                                <asp:Label ID="lblClienteId" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblClienteIdDescricao" runat="server" SkinID="LabelResposta" />
                                                <asp:Label ID="lblClienteCnpj" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblClienteCnpjDescricao" runat="server" SkinID="LabelResposta" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblClienteRazaoSocial" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblClienteRazaoSocialDescricao" runat="server" SkinID="LabelResposta" />
                                            </li>                            
                                            <li>
                                                <asp:Label ID="lblClienteNomeFantasia" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblClienteNomeFantasiaDescricao" runat="server" SkinID="LabelResposta" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblClienteCidadeUf" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblClienteCidadeUfDescricao" runat="server" SkinID="LabelResposta" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblEmpenhoCondicaoPagamento" runat="server" SkinID="LabelForm" />
                                                <asp:DropDownList ID="ddlEmpenhoCondicaoPagamento" runat="server" SkinID="DropFiltro" Enabled="false" />
                                                <asp:Label ID="lblEmpenhoTipoPedido" runat="server" />
                                                <asp:DropDownList ID="ddlEmpenhoTipoPedido" runat="server" SkinID="DropFiltro" />
                                            </li>
                                        </ol>
                                    </fieldset>
                                </div>

                                <div style="width: 50%; display: table-cell; vertical-align: top;">
                                    <%-- ENDEREÇO ENTREGA --%>
                                    <fieldset>
                                        <ol>
                                            <li>
                                                <asp:Label ID="lblEntregaEndereco" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblEntregaEnderecoDescricao" runat="server" SkinID="LabelResposta" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblEntregaNumero" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblEntregaNumeroDescricao" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblEntregaComplemento" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblEntregaComplementoDescricao" runat="server" SkinID="LabelResposta" />
                                            </li>                            
                                            <li>
                                                <asp:Label ID="lblEntregaCep" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblEntregaCepDescricao" runat="server" SkinID="LabelResposta" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblEntregaCidadeUf" runat="server" SkinID="LabelForm" />
                                                <asp:Label ID="lblEntregaCidadeUfDescricao" runat="server" SkinID="LabelResposta" />
                                            </li>
                                            <li>
                                                <div class="line">
                                                    <div class="line_itens_left">
                                                        <asp:Label ID="lblGradeDataEntregaEmpenho" runat="server" SkinID="LabelForm" />
                                                    </div>
                                                    <div class="line_itens">
                                                        <CtlData:ControlData ID="CtlDataGradeEntregaEmpenho" runat="server" DataEnabled="false" />
                                                    </div>
                                                </div>
                                            </li>
                                        </ol>
                                    </fieldset>
                                </div>
                            </div>
                            
                            <%-- ITENS CAMPOS --%>
                            <fieldset style="position: relative; height: 28px; vertical-align: middle;">
                                <ol>
                                    <li>
                                        <asp:Panel ID="pnlEmpenhoItem" runat="server" DefaultButton="imbItemPesquisar">
                                            <asp:Label ID="lblItemId" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtItemId" runat="server" SkinID="Pedido" MaxLength="30" />
                                            <asp:Label ID="lblItemDescricao" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtItemDescricao" runat="server" SkinID="Pedido" MaxLength="100" />
                                            <asp:Label ID="lblItemPregao" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtItemPregao" runat="server" SkinID="Pedido" MaxLength="20" />
                                            <asp:ImageButton ID="imbItemPesquisar" runat="server" Width="25px" Height="25px"
                                                             ValidationGroup="Validacao"
                                                             ImageAlign="AbsMiddle" 
                                                             ToolTip="<%$ Resources:Resource, lblPesquisar %>"
                                                             ImageUrl="~/Imagens/find.png" 
                                                             onclick="imbItemPesquisar_Click" />
                                        </asp:Panel>
                                    </li>
                                </ol>
                            </fieldset>
                            
                            <%-- BOTÕES --%>
                            <div style="width: 100%; padding-bottom: 3px; padding-top: 3px; display: table;">
                                <div style="text-align: right; padding-right: 5px; display: table-cell;">
                                    <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeft" ValidationGroup="Validacao" onclick="btnSalvar_Click" />
                                    <asp:Button ID="btnLiberar" runat="server" SkinID="ButtonCenter" ValidationGroup="Validacao" onclick="btnLiberar_Click" />
                                    <asp:Button ID="btnCancelar" runat="server" SkinID="ButtonCenter"  onclick="btnCancelar_Click" />
                                    <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonCenter" onclick="btnLimpar_Click" />
                                    <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonRight" onclick="btnVoltar_Click" />
                                </div>
                            </div>

                            <%-- ITENS GRADE --%>
                            <div style="left: 1%; width: 97%; height: 35%; position: fixed; display: table;">

                            <div style="left: 0%; width: 100%; height: 10%; display: table-row;">

                                <fieldset style="height: 20px;">
                                    <div style="width: 100%; padding-bottom: 3px; margin: 0 0 0 0;">
                                        <div style="text-align: right; padding-right: 5px; display: table; width: 100%;">
                                            <div style="width: 25%; display: table-cell; vertical-align: middle; text-align: right;">
                                                <asp:Label ID="lblGradeValorTotalPedido" runat="server" />
                                            </div>
                                            <div style="width: 25%; display: table-cell; vertical-align: middle; text-align: right;">
                                                <asp:Label ID="lblGradeValorTotalEmpenho" runat="server" />
                                            </div>
                                            <div style="width: 25%; display: table-cell; vertical-align: middle; text-align: right;">
                                                <asp:Label ID="lblGradeQuantidadeItensEmpenhoRestante" runat="server" />
                                            </div>
                                            <div style="width: 25%; display: table-cell; vertical-align: middle; text-align: right;">
                                                <asp:Label ID="lblGradeQuantidadeItensEmpenho" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                            </div>
                            
                            <%-- PAINEL GRADE - ITENS DO PEDIDO --%>
                            <div style="left: 0%; display: table-row;">
                                <asp:Panel ID="pnlGrade" runat="server" Visible="false">
                                    <fieldset style="height: 32%; width: 95.7%; position: fixed;">
                                        <div style="height: 100%; overflow-x: none; overflow-y: scroll;">
                                            <center />      
                                                <asp:GridView ID="gvGrade" runat="server"
                                                              DataKeyNames="itemSeq,itemId,empenhoCodigoId,clienteId" 
                                                              onpageindexchanging="gvGrade_PageIndexChanging" 
                                                              onrowdatabound="gvGrade_RowDataBound" 
                                                              onrowcommand="gvGrade_RowCommand">
                                                    <Columns>
                                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="itemDescricao" ItemStyle-Width="300px" />
                                                        <asp:BoundField DataField="unidadeMedidaSigla" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" />
                                                        <%-- Qtd Informada --%>
                                                        <asp:BoundField DataField="empenhoItemQtdeUnit" DataFormatString="{0:###,###,###,##0.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />                                            
                                                        <asp:BoundField DataField="empenhoQtdeSaldo" DataFormatString="{0:###,###,###,##0.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="empenhoItemQtdeEmbalagem" DataFormatString="{0:###,###,###,##0.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="quantidadeCaixas" DataFormatString="{0:###,###,###,##0.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="valorCaixa" DataFormatString="{0:###,###,###,##0.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="valorTotalCaixas" DataFormatString="{0:###,###,###,##0.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="130px" />
                                                        <%-- Vlalor Informado --%>
                                                        <asp:BoundField DataField="empenhoItemValor" DataFormatString="{0:###,###,###,##0.00}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="empenhoPregao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                                        <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" CommandName="Delete"
                                                                                 ImageUrl="~/Imagens/_trash.png" 
                                                                                 ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                                                 CommandArgument='<%# Container.DataItemIndex + "|" + Eval("itemSeq") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>                                            
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                        </div>
                                    </fieldset>
                                </asp:Panel>

                                </div>

                            </div>

                    </fieldset>
                </asp:Panel>

                <%-- EMPENHO PESQUISA --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppEmpenhoPesquisa" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbEmpenhoPedidoNumeroPesquisar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlEmpenhoPesquisa" runat="server" DefaultButton="btnFiltrosEmpenhoPesquisa" Visible="false">
                                <div class="OpacityBackGround"></div>
                                    <div class="painel">
                                        <div class="painel_header">
                                            <div class="painel_header_message">
                                                <asp:Label ID="lblEmpenhoPesquisaHeader" runat="server" ForeColor="White" />
                                            </div>
                                            <div class="alert_header_icon">
                                                <asp:ImageButton ID="imbEmpenhoPesquisaClose" runat="server" ImageAlign="AbsMiddle" 
                                                    Width="25px" Height="25px" 
                                                                 ToolTip="<%$ Resources:Resource, lblFechar %>" 
                                                                 ImageUrl="~/Imagens/Fechar.png" 
                                                                 onclick="imbEmpenhoPesquisaClose_Click" />
                                            </div>
                                        </div>
                                        <div class="painel_body">
                                            <fieldset>
                                                <legend>
                                                    <asp:Literal ID="ltrEmpenhoPesquisaHeader" runat="server" />
                                                </legend>
                                                <div class="navegacao">
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltrosEmpenhoId" runat="server" />
                                                        <asp:TextBox ID="txtFiltrosEmpenhoId" runat="server" SkinID="SmallFilter" MaxLength="20" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltrosEmpenhoClienteId" runat="server" />
                                                        <asp:TextBox ID="txtFiltrosEmpenhoClienteId" runat="server" SkinID="SmallFilter" MaxLength="30" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltrosEmpenhoClienteRazaoSocial" runat="server" />
                                                        <asp:TextBox ID="txtFiltrosEmpenhoClienteRazaoSocial" runat="server" SkinID="SmallFilter" MaxLength="30" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Label ID="lblFiltrosEmpenhoEstabelecimento" runat="server" />
                                                        <asp:DropDownList ID="ddlFiltrosEmpenhoEstabelecimento" runat="server" SkinID="DropSmallFilter" />
                                                    </div>
                                                    <div class="boxPesquisa">
                                                        <asp:Button ID="btnFiltrosEmpenhoPesquisa" runat="server" SkinID="ButtonLeft" onclick="btnFiltrosEmpenhoPesquisa_Click" />
                                                        <asp:Button ID="btnFiltrosEmpenhoLimpar" runat="server" SkinID="ButtonRight" onclick="btnFiltrosEmpenhoLimpar_Click" />
                                                    </div>
                                                </div>

                                                <%-- GRID REGISTROS --%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                <div class="gridRegistros">
                                                    <asp:GridView ID="gvEmpenhoPesquisa" runat="server"                                                       
                                                        DataKeyNames="empenhoCodigoId,clienteId,condicaoPagamentoId,estabelecimentoId,clienteNomeAbreviado,clienteRazaoSocial,
                                                                                clienteCNPJ,condicaoPagamentoDescricao,estabelecimentoRazaoSocial,empenhoStatus,empenhoData" 
                                                        onpageindexchanging="gvEmpenhoPesquisa_PageIndexChanging" 
                                                        onrowcommand="gvEmpenhoPesquisa_RowCommand" 
                                                        onrowdatabound="gvEmpenhoPesquisa_RowDataBound" 
                                                        onrowdeleting="gvEmpenhoPesquisa_RowDeleting" 
                                                        onrowupdating="gvEmpenhoPesquisa_RowUpdating">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="130px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrEmpenhoNumero" runat="server" Text='<%# FormataStringSaida(Eval("empenhoCodigoId"), txtFiltrosEmpenhoId.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrClienteId" runat="server" Text='<%# FormataStringSaida(Eval("clienteId"), txtFiltrosEmpenhoClienteId.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="300px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltrosEmpenhoClienteRazaoSocial.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150px">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrEmpenhoStatus" runat="server" Text='<%# Empenho.EmpenhoStatusDescricaoInterna(Eval("empenhoStatus").ToString()) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="condicaoPagamentoDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="160px" Visible="false" />
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ltrEstabelecimento" runat="server" Text='<%# FormataStringSaida(Eval("estabelecimentoRazaoSocial"), ddlFiltrosEmpenhoEstabelecimento.SelectedItem.Text) %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                                                ItemStyle-Width="50px">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imbSelect" runat="server" CommandName="Detalhes" SkinID="ImgGrid"
                                                                        ImageUrl="~/Imagens/check.png" ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                        CommandArgument='<%#  Container.DataItemIndex + "|" + Eval("empenhoCodigoId") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- ITEM PESQUISA --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="uppItem" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbItemPesquisar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlItemBusca" runat="server" DefaultButton="btnItemFiltrosPesquisar" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblItemHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbItemPanelClose" runat="server" ImageAlign="AbsMiddle" 
                                                Width="25px" Height="25px" 
                                                             ToolTip="<%$ Resources:Resource, lblFechar %>" 
                                                             ImageUrl="~/Imagens/Fechar.png" 
                                                             onclick="imbItemPanelClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrItemPanelHeader" runat="server" />
                                            </legend>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblItemFiltrosId" runat="server" />
                                                    <asp:TextBox ID="txtItemFiltrosId" runat="server" SkinID="SmallFilter" MaxLength="30" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblItemFiltrosDescricao" runat="server" />
                                                    <asp:TextBox ID="txtItemFiltrosDescricao" runat="server" SkinID="SmallFilter" MaxLength="100" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblItemFiltrosPregao" runat="server" />
                                                    <asp:TextBox ID="txtItemFiltrosPregao" runat="server" SkinID="SmallFilter" MaxLength="30" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Button ID="btnItemFiltrosPesquisar" runat="server" SkinID="ButtonLeft" onclick="btnItemFiltrosPesquisar_Click" />
                                                    <asp:Button ID="btnItemFiltrosLimpar" runat="server" SkinID="ButtonRight" onclick="btnItemFiltrosLimpar_Click" />
                                                </div>
                                            </div>

                                            <%-- GRID REGISTROS ITENS GRADE --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvItensPesquisa" runat="server" 
                                                    DataKeyNames="itemId,itemDescricao,unidadeMedidaId,unidadeMedidaSigla,empenhoPregao,empenhoItemQtdeEmbalagem,valorCaixa,itemSeq,empenhoItemQtdeUnit,empenhoQtdeSaldo"
                                                    onpageindexchanging="gvItensPesquisa_PageIndexChanging" 
                                                    onrowcommand="gvItensPesquisa_RowCommand" 
                                                    onrowdatabound="gvItensPesquisa_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrItemId" runat="server" Text='<%# FormataStringSaida(Eval("itemId"), txtItemFiltrosId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="150px" ItemStyle-Wrap="true">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrItemDescricao" runat="server" Text='<%# FormataStringSaida(Eval("itemDescricao"), txtItemFiltrosDescricao.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="unidadeMedidaSigla" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" />
                                                        <asp:TemplateField ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtItemQuantidadeUnitaria" runat="server" SkinID="Pedido" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="empenhoItemQtdeEmbalagem" DataFormatString="{0:###,###,###,##0.00}" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrSaldo" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtItemValorUnitario" runat="server" SkinID="Pedido" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>                                                        
                                                        <asp:BoundField DataField="valorCaixa" DataFormatString="{0:###,###,###,##0.00}" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtItemLocalEntrega" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="empenhoPregao" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" Visible="false" >
                                                            <ItemTemplate>
                                                                <CtlData:ControlData id="CtlDataEntregaItem" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbSelect" runat="server" CommandName="Select" SkinID="ImgGrid"
                                                                                 ImageUrl="~/Imagens/check.png" 
                                                                                 ToolTip="<%$ Resources:Resource, lblSelecionar %>"
                                                                                 CommandArgument='<%# Eval("itemId") + "|" + ((GridViewRow)Container).RowIndex %>' />
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

                <%-- PAINEL CONFIRMAR LIBERAÇÃO --%>
                <div style="position: absolute; z-index: 1;">
                    <asp:UpdatePanel ID="upConfirmarLiberacao" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlConfirmarLiberacao" runat="server" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="alert">
                                    <div class="alert_header">
                                        <div class="alert_header_message">
                                            <asp:Label ID="lblConfirmarLiberacaoHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="alert_body">
                                        <asp:Label ID="lblConfirmarLiberacaoMessage" runat="server" ForeColor="Black" />
                                    </div>
                                    <div class="alert_bottom">
                                        <div class="alert_bottom_button">
                                            <div class="alert_bottom_button_left">
                                                <asp:Button ID="btnConfirmarLiberacaoOk" runat="server" SkinID="ButtonLeft" onclick="btnConfirmarLiberacaoOk_Click" />
                                            </div>
                                            <div class="alert_bottom_button_right">
                                                <asp:Button ID="btnConfirmarLiberacaoNOK" runat="server" SkinID="ButtonRight" onclick="btnConfirmarLiberacaoNOK_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <asp:RequiredFieldValidator ID="rfvEmpenhoId" runat="server" ControlToValidate="txtEmpenhoPedidoNumero" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsmValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
