<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadClienteGrupoComercial.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadClienteGrupoComercial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="pnlCadastroClienteGrupoComercial" runat="server">
        <asp:UpdatePanel ID="uppCadastroClienteGrupoComercial" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroClienteGrupoComercial">
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
                                    <asp:Label ID="lblDadosClienteGrupoComercialId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteGrupoComercialId" runat="server" MaxLength="30" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteGrupoComercialNomeAbrev" runat="server" SkinID="LabelForm"  Visible="false"  />
                                    <asp:TextBox ID="txtDadosClienteGrupoComercialNomeAbrev" runat="server" MaxLength="30" TabIndex="2"  Visible="false"  />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteGrupoComercialNome" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteGrupoComercialNome" runat="server" MaxLength="50" TabIndex="3" />
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="4" SkinID="ButtonLeft" Visible="false"
                                    ValidationGroup="Validacao" onclick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="5" SkinID="ButtonCenter" 
                                    onclick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="6" SkinID="ButtonRight" Visible="false"
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
                                                    <asp:Label ID="lblConfirmarClienteGrupoComercialId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteGrupoComercialIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteGrupoComercialNomeAbrev" runat="server" SkinID="LabelForm"  Visible="false"/>
                                                    <asp:Label ID="lblConfirmarClienteGrupoComercialNomeAbrevTexto" runat="server" SkinID="LabelResposta" Visible="false" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarClienteGrupoComercialNome" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarClienteGrupoComercialNomeTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" 
                                                    TabIndex="7" onclick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" 
                                                    TabIndex="8" onclick="btnConfirmarNo_Click" />
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
                                <asp:Label ID="lblFiltrosClienteGrupoComercialId" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteGrupoComercialId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="9" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteGrupoComercialNomeAbrev" runat="server" Visible="false"/>
                                <asp:TextBox ID="txtFiltrosClienteGrupoComercialNomeAbrev" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="10" Visible="false" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteGrupoComercialNome" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteGrupoComercialNome" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="11" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" 
                                        TabIndex="12" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" 
                                        TabIndex="13" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" Visible="false"
                                        TabIndex="14" onclick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" Visible="false"
                                        TabIndex="15" onclick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="18"                                 
                                DataKeyNames="clienteGrupoComercialId,clienteGrupoComercialNome" 
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
                                    <asp:BoundField DataField="clienteGrupoComercialId" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                    <%--
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrDominioServidor" runat="server" Text='<%# FormataStringSaida(Eval("clienteGrupoComercialNomeAbreviado"), txtFiltrosClienteGrupoComercialNomeAbrev.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    --%>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrDominioLDAP" runat="server" Text='<%# FormataStringSaida(Eval("clienteGrupoComercialNome"), txtFiltrosClienteGrupoComercialNome.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAlterar" runat="server" CommandName="Update" 
                                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                        Text="<%$ Resources:Resource, lblVisualizar %>" />
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
                                            TabIndex="16" onclick="btnExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnExclusaoNo" runat="server" SkinID="ButtonRight" 
                                            TabIndex="17" onclick="btnExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvClienteGrupoComercialId" runat="server" ControlToValidate="txtDadosClienteGrupoComercialId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteGrupoComercialNomeAbrev" runat="server" ControlToValidate="txtDadosClienteGrupoComercialNomeAbrev" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteGrupoComercialNome" runat="server" ControlToValidate="txtDadosClienteGrupoComercialNome" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
