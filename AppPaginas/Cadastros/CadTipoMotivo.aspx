<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"
    CodeBehind="CadTipoMotivo.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadTipoMotivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroTipoMotivo" runat="server">
        <asp:UpdatePanel ID="uppCadastroTipoMotivo" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroTipoMotivo">
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
                                    <asp:Label ID="lblDadosTipoMotivoId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosTipoMotivoId" runat="server" MaxLength="30" TabIndex="1" />
                               </li>
                               <li>
                                    <asp:Label ID="lblDadosTipoMotivoCategoria" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddDadosCategoria" runat="server" TabIndex="1">
                                        <asp:ListItem Value="aprovacao"     Text="<%$ Resources:Resource, lblAprovacao %>" />
                                        <asp:ListItem Value="cancelamento"  Text="<%$ Resources:Resource, lblCancelamento %>" />
                                        <asp:ListItem Value="reprovacao"  Text="<%$ Resources:Resource, lblReprovacao %>" />
                                        <asp:ListItem Value="revisao"  Text="<%$ Resources:Resource, lblRevisar %>" />
                                    </asp:DropDownList>
                                </li>

                               <li>
                                    <asp:Label ID="lblDadosTipoMotivoDescricao" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosTipoMotivoDescricao" runat="server" MaxLength="50" TabIndex="3" />
                               </li>                                    
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="3" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="4" SkinID="ButtonCenter" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="5" SkinID="ButtonRight" OnClick="btnLimpar_Click" />
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
                            <asp:Panel ID="pnlDadosConfirmar" runat="server" DefaultButton="btnConfirmarYes"
                                Visible="false">
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
                                                    <asp:Label ID="lblConfirmarDadosTipoMotivoId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosTipoMotivoIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosTipoMotivoDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosTipoMotivoDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosTipoMotivoCategoria" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosTipoMotivoCategoriaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="6" OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="7" OnClick="btnConfirmarNo_Click" />
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
                                <asp:Label ID="lblFiltrosTipoMotivoId" runat="server" />
                                <asp:TextBox ID="txtFiltrosTipoMotivoId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="8" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosTipoMotivoCategoria" runat="server" />
                                <asp:DropDownList ID="ddFiltrosTipoMotivoCategoria" runat="server" TabIndex="9">
                                    <asp:ListItem Value=""              Text="<%$ Resources:Resource, lblSelecione %>" />
                                    <asp:ListItem Value="aprovacao"     Text="<%$ Resources:Resource, lblAprovacao %>" />
                                    <asp:ListItem Value="cancelamento"  Text="<%$ Resources:Resource, lblCancelamento %>" />
                                </asp:DropDownList>
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosTipoMotivoDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltrosTipoMotivoDescricao" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="10" />
                            </div>                            
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="11" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" TabIndex="12" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" TabIndex="13" OnClick="btnFiltrosNovoCadastro_Click"/>
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="14" OnClick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="17" 
                                DataKeyNames="tipoMotivoId,tipoMotivoDescricao,tipoMotivoCategoria"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging" OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound" OnRowDeleting="gvRegistros_RowDeleting"
                                OnRowUpdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrTipoMotivoId" runat="server" Text='<%# FormataStringSaida(Eval("tipoMotivoId"), txtFiltrosTipoMotivoId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    

                                    <asp:BoundField DataField="tipoMotivoCategoria"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" /> 
                                    <asp:TemplateField>

                                        <ItemTemplate>
                                            <asp:Literal ID="ltrTipoMotivoDescricao" runat="server" Text='<%# FormataStringSaida(Eval("tipoMotivoDescricao"), txtFiltrosTipoMotivoDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAlterar" runat="server" CommandName="Update"
                                                        Text="<%$ Resources:Resource, lblVisualizar %>"
                                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
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
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="15" OnClick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="16" OnClick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvTipoMotivoId" runat="server" ControlToValidate="txtDadosTipoMotivoId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvTipoMotivoDescricao" runat="server" ControlToValidate="txtDadosTipoMotivoDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
