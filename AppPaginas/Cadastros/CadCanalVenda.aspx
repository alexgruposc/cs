<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="CadCanalVenda.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCanalVenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroCanalVenda" runat="server">
        <asp:UpdatePanel ID="uppCadastroCanalVenda" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroCanalVenda">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server"  Visible="false">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>
                        <div class="alert_bottom_button">
                            <ol>
                                <li>
                                    <asp:Label ID="lblId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosCanalVendaId" runat="server" MaxLength="30" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosCanalVenda" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosCanalVenda" runat="server" MaxLength="50" TabIndex="2" />
                                </li>
                                <li>
                                   <%-- 
                                       <div class="line">
                                        <div class="line_itens">
                                            <asp:Label ID="lblDadosCanalVendaObs" runat="server" SkinID="LabelForm" />
                                        </div>
                                        <div class="line_itens">
                                            <asp:TextBox ID="txtDadosCanalVendaObs" runat="server" MaxLength="200"
                                                TextMode="MultiLine" Columns="100" Rows="2" TabIndex="2" />
                                        </div>
                                    </div>
                                     --%>
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="3" SkinID="ButtonLeft" Visible="false"
                                    ValidationGroup="Validacao" onclick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="4" SkinID="ButtonCenter" 
                                    onclick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="5" SkinID="ButtonRight" Visible="false"
                                    onclick="btnLimpar_Click" />
                            </div>
                        </div>
                    </fieldset>
                </asp:Panel>
                <%-- CONFIRMAR DADOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upConfirmar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlConfirmar" runat="server" DefaultButton="btnConfirmarYes" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblConfirmarHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrConfirmarHeader" runat="server" />
                                            </legend>
                                            <ol>
                                                <li>
                                                    <asp:Label ID="lblConfirmarCanalVendaId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCanalVendaIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarCanalVenda" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCanalVendaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarCanalVendaObs" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarCanalVendaObsTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" 
                                                    TabIndex="6" onclick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" 
                                                    TabIndex="7" onclick="btnConfirmarNo_Click" />
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
                                <asp:Label ID="lblFiltrosCanalVendaId" runat="server" />
                                <asp:TextBox ID="txtFiltrosCanalVendaId" runat="server" SkinID="Filtro" MaxLength="10" TabIndex="8" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosCanalVenda" runat="server" />
                                <asp:TextBox ID="txtFiltrosCanalVenda" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="10" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" 
                                        TabIndex="11" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" 
                                        TabIndex="12" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" Visible="false"
                                        TabIndex="13" onclick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" Visible="false"
                                        TabIndex="14" onclick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="17"                                 
                                DataKeyNames="canalVendaId,canalVendaDescricao" 
                                onpageindexchanging="gvRegistros_PageIndexChanging" 
                                onrowcommand="gvRegistros_RowCommand" onrowdatabound="gvRegistros_RowDataBound" 
                                onrowdeleting="gvRegistros_RowDeleting" onrowupdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:BoundField DataField="canalVendaId" DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" /> --%>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrCanalVendaId" runat="server" Text='<%# FormataStringSaida(Eval("canalVendaId"), txtFiltrosCanalVendaId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrCanalVenda" runat="server" Text='<%# FormataStringSaida(Eval("canalVendaDescricao"), txtFiltrosCanalVenda.Text) %>' />
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
                                        <asp:Button ID="btnExclusaoYes" runat="server" SkinID="ButtonLeft" 
                                            TabIndex="15" onclick="btnExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnExclusaoNo" runat="server" SkinID="ButtonRight" 
                                            TabIndex="16" onclick="btnExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <%-- VALIDATION --%> 
                <asp:RequiredFieldValidator ID="rfvCVId" runat="server" ControlToValidate="txtDadosCanalVendaId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvCVNome" runat="server" ControlToValidate="txtDadosCanalVenda" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
