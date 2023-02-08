<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="CadCondicaoPagamento.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCondicaoPagamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroCondicaoPagamento" runat="server">
        <asp:UpdatePanel ID="uppCadastroCondicaoPagamento" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroCondicaoPagamento">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>
                        <div class="alert_bottom_button">
                            <ol>
                                <li>
                                    <asp:Label ID="lblDadosCondicaoPagamentoId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosCondicaoPagamentoId" runat="server" MaxLength="30" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosCondicaoPagamentoDescricao" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosCondicaoPagamentoDescricao" runat="server" MaxLength="50" TabIndex="2" />
                                </li>
                                <li>
                                    <div class="line">
                                        <div class="line_itens">
                                            <asp:Label ID="lblDadosCondicaoPagamentoObservacao" runat="server" SkinID="LabelForm" />
                                        </div>
                                        <div class="line_itens">
                                            <asp:TextBox ID="txtDadosCondicaoPagamentoObservacao" runat="server" MaxLength="200"
                                                         TextMode="MultiLine" Columns="100" Rows="5" TabIndex="3" />
                                        </div>
                                    </div>
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="4" SkinID="ButtonLeft" ValidationGroup="Validacao" onclick="btnSalvar_Click" Visible="false"/>
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="5" SkinID="ButtonCenter" onclick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="6" SkinID="ButtonRight" onclick="btnLimpar_Click" Visible="false" />
                            </div>
                        </div>
                    </fieldset>
                </asp:Panel>

                <%-- CONFIRMAR DADOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upDadosConfirmar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlDadosConfirmar" runat="server" DefaultButton="btnConfirmarYes" Visible="false">
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
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoObservacao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCondicaoPagamentoObservacaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="7" onclick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="8" onclick="btnConfirmarNo_Click" />
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
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosCondicaoPagamentoId" runat="server" />
                                <asp:TextBox ID="txtFiltrosCondicaoPagamentoId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="9" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosCondicaoPagamentoDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltrosCondicaoPagamentoDescricao" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="10" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="11" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" TabIndex="12" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" TabIndex="13" onclick="btnFiltrosNovoCadastro_Click" Visible="false" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="14" onclick="btnFiltrosExcluir_Click" Visible="false" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="17"                                 
                                DataKeyNames="condicaoPagamentoId,condicaoPagamentoDescricao,condicaoPagamentoObservacao" 
                                onpageindexchanging="gvRegistros_PageIndexChanging" 
                                onrowcommand="gvRegistros_RowCommand" 
                                onrowdatabound="gvRegistros_RowDataBound" 
                                onrowdeleting="gvRegistros_RowDeleting" 
                                onrowupdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" Visible="false">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:BoundField DataField="condicaoPagamentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />--%>
                                    <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrCondicaoPagamentoId" runat="server" Text='<%# FormataStringSaida(Eval("condicaoPagamentoId"), txtFiltrosCondicaoPagamentoId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="300px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrCondicaoPagamentoDescricao" runat="server" Text='<%# FormataStringSaida(Eval("condicaoPagamentoDescricao"), txtFiltrosCondicaoPagamentoDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="condicaoPagamentoObservacao" />
                                    
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" Visible="false">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnParcela" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle"
                                                             CommandName="Parcela" ImageUrl="~/Imagens/parcelamento.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" 
                                                             CommandName="Update" 
                                                             SkinID="ImgGrid" ImageUrl="~/Imagens/find.png" />
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
                    <asp:Panel ID="pnlConfirmarExclusao" runat="server" Visible="false">
                        <div class="OpacityBackGround"></div>
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
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="15" onclick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="16" onclick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>


                                
            <%-- CONDICAO PAGAMENTO PARCELA--%>
            <div style="position: absolute;">
                <asp:UpdatePanel ID="upParcela" runat="server">
                    <%--<Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnParcela" EventName="Click" />
                    </Triggers>--%>
                    <ContentTemplate>
                        <asp:Panel ID="pnlParcela" runat="server" Visible="false">
                                <div class="OpacityBackGround"></div>
                                    <div class="painel">
                                        <div class="painel_header">
                                            <div class="painel_header_message">
                                                <asp:Label ID="lblEmpresaHeader" runat="server" ForeColor="White" />
                                                </div>
                                            <div class="alert_header_icon">
                                                      <asp:ImageButton ID="imbFiltrosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" TabIndex="16"
                                                                        ImageUrl="~/Imagens/Fechar.png" 
                                                                        onclick="imbFiltrosClose_Click" />
                                             </div>
                                        </div>
                                   <div class="painel_body">
                                        <iframe id="frameParcela" src="CadCondicaoPagamentoParcela.aspx" scrolling="auto" runat="server" />
                                 </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div> 
                                

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvCondicaoPagamentoId" runat="server" ControlToValidate="txtDadosCondicaoPagamentoId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvCondicaoPagamentoDescricao" runat="server" ControlToValidate="txtDadosCondicaoPagamentoDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
