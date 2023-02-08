<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" ValidateRequest="false"
CodeBehind="CadRepresentante.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadRepresentante" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroRepresentante" runat="server">
        <asp:UpdatePanel ID="uppCadastroRepresentante" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroRepresentante">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
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
                                    <asp:Label ID="lblDadosRepresentanteId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosRepresentanteId" runat="server" MaxLength="30" TabIndex="1" />
                                <li>
                                    <asp:Label ID="lblDadosRepresentanteNomeAbreviado" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosRepresentanteNomeAbreviado" runat="server" MaxLength="50" TabIndex="2" />
                                </li>                               
                                <li>
                                    <asp:Label ID="lblDadosRepresentanteNome" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosRepresentanteNome" runat="server" MaxLength="50" TabIndex="3" />
                                <li>

                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="3" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click" Visible="false" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="4" SkinID="ButtonCenter" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="5" SkinID="ButtonRight" OnClick="btnLimpar_Click" Visible="false" />
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
                                                    <asp:Label ID="lblConfirmarDadosRepresentanteId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosRepresentanteIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>                                                
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosRepresentanteNomeAbreviado" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosRepresentanteNomeAbreviadoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosRepresentanteNome" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosRepresentanteNomeTexto" runat="server" SkinID="LabelResposta" />
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
                                <asp:Label ID="lblFiltrosRepresentanteId" runat="server" />
                                <asp:TextBox ID="txtFiltrosRepresentanteId" runat="server" MaxLength="30" TabIndex="8" SkinID="Filtro" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosRepresentanteNomeAbreviado" runat="server" />
                                <asp:TextBox ID="txtFiltrosRepresentanteNomeAbreviado" runat="server" MaxLength="50" TabIndex="9" SkinID="Filtro" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosRepresentanteNome" runat="server" />
                                <asp:TextBox ID="txtFiltrosRepresentanteNome" runat="server" MaxLength="50" TabIndex="10" SkinID="Filtro" />
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
                                DataKeyNames="representanteId,representanteNomeAbreviado,representanteNome" 
                                onpageindexchanging="gvRegistros_PageIndexChanging" 
                                onrowcommand="gvRegistros_RowCommand" 
                                onrowdatabound="gvRegistros_RowDataBound" 
                                onrowdeleting="gvRegistros_RowDeleting"
                                onrowupdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrRepresentanteId" runat="server" Text='<%# FormataStringSaida(Eval("representanteId"), txtFiltrosRepresentanteId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrRepresentanteNomeAbreviado" runat="server" Text='<%# FormataStringSaida(Eval("representanteNomeAbreviado"), txtFiltrosRepresentanteNomeAbreviado.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrRepresentanteNome" runat="server" Text='<%# FormataStringSaida(Eval("representanteNome"), txtFiltrosRepresentanteNome.Text) %>' />
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
                                            TabIndex="15" onclick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" 
                                            TabIndex="16" onclick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvRepresentanteId" runat="server" ControlToValidate="txtDadosRepresentanteId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvRepresentanteNomeAbreviado" runat="server" ControlToValidate="txtDadosRepresentanteNomeAbreviado" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvRepresentanteNome" runat="server" ControlToValidate="txtDadosRepresentanteNome" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
