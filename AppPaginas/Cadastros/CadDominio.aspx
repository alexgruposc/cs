<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadDominio.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadDominio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="pnlCadastroDominio" runat="server">
        <asp:UpdatePanel ID="uppCadastroDominio" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroDominio">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" DefaultButton="btnSalvar" Visible="false">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>
                        <div class="alert_bottom_button">
                            <ol>
                                <li>
                                    <asp:Label ID="lblDadosDominioId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosDominioId" runat="server" MaxLength="30" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosDominioDescricao" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosDominioDescricao" runat="server" MaxLength="50" TabIndex="2" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosDominioServidor" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosDominioServidor" runat="server" MaxLength="50" TabIndex="3" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosDominioLDAP" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosDominioLDAP" runat="server" MaxLength="50" TabIndex="4" />
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="5" SkinID="ButtonLeft" 
                                    ValidationGroup="Validacao" onclick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="6" SkinID="ButtonCenter" 
                                    onclick="btnBuscar_Click"  />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="7" SkinID="ButtonRight" 
                                    onclick="btnLimpar_Click"  />
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
                                                    <asp:Label ID="lblConfirmarDominioId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDominioIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDominioDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDominioDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDominioServidor" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDominioServidorTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDominioLDAP" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDominioLDAPTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" 
                                                    TabIndex="8" onclick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" 
                                                    TabIndex="9" onclick="btnConfirmarNo_Click" />
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
                                <asp:Label ID="lblFiltrosDominioId" runat="server" />
                                <asp:TextBox ID="txtFiltrosDominioId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="10" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosDominioServidor" runat="server" />
                                <asp:TextBox ID="txtFiltrosDominioServidor" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="13" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosDominioLDAP" runat="server" />
                                <asp:TextBox ID="txtFiltrosDominioLDAP" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="14" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" 
                                        TabIndex="15" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" 
                                        TabIndex="16" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" 
                                        TabIndex="17" onclick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" 
                                        TabIndex="18" onclick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="21"                                 
                                DataKeyNames="dominioId,dominioDescricao,dominioServidor,dominioLDAP" 
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
                                    <asp:BoundField DataField="dominioId" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="dominioDescricao"  />
                                    <asp:TemplateField ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrDominioServidor" runat="server" Text='<%# FormataStringSaida(Eval("dominioServidor"), txtFiltrosDominioServidor.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrDominioLDAP" runat="server" Text='<%# FormataStringSaida(Eval("dominioLDAP"), txtFiltrosDominioLDAP.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAlterar" runat="server" CommandName="Update" 
                                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                        Text="<%$ Resources:Resource, lblEditar %>" />
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
                                            TabIndex="19" onclick="btnExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnExclusaoNo" runat="server" SkinID="ButtonRight" 
                                            TabIndex="20" onclick="btnExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvDominioId" runat="server" ControlToValidate="txtDadosDominioId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvDominioDescricao" runat="server" ControlToValidate="txtDadosDominioDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvDominioServidor" runat="server" ControlToValidate="txtDadosDominioServidor" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvDominioLDAP" runat="server" ControlToValidate="txtDadosDominioLDAP" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
