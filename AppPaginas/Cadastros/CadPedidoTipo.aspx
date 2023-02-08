<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"
    CodeBehind="CadPedidoTipo.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadPedidoTipo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroPedidoTipo" runat="server">
        <asp:UpdatePanel ID="uppCadastroPedidoTipo" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroPedidoTipo">
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
                                    <asp:Label ID="lblDadosPedidoTipoId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosPedidoTipoId" runat="server" MaxLength="30" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosPedidoTipoDescricao" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosPedidoTipoDescricao" runat="server" MaxLength="50" TabIndex="2" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosPedidoTipoSigla" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosPedidoTipoSigla" runat="server" />
                                </li>
                                <li>
                                    <div style="margin-left: 150px;">
                                        <asp:CheckBox ID="chkDadosPedidoTipoTriangular" runat="server" Font-Bold="true" TabIndex="3" Text="<%$ Resources:Resource, lblPedidoTipoTriangular %>" />
                                    </div>
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="4" SkinID="ButtonLeft" ValidationGroup="Validacao" onclick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="5" SkinID="ButtonCenter" onclick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="6" SkinID="ButtonRight" onclick="btnLimpar_Click"  />
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
                                                    <asp:Label ID="lblConfirmarPedidoTipoId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPedidoTipoIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarPedidoTipoDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPedidoTipoDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarPedidoTipoSiglaDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPedidoTipoSiglaDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarPedidoTipoTriangular" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPedidoTipoTriangularTexto" runat="server" SkinID="LabelResposta" />
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
                                <asp:Label ID="lblFiltrosPedidoTipoId" runat="server" />
                                <asp:TextBox ID="txtFiltrosPedidoTipoId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="9" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosPedidoTipoDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltrosPedidoTipoDescricao" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="10" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:CheckBox ID="chkFiltrosPedidoTipoTriangular" runat="server" Font-Bold="true" TabIndex="11" Text="<%$ Resources:Resource, lblPedidoTipoTriangular %>" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="12" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" TabIndex="13" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" TabIndex="14" onclick="btnFiltrosNovoCadastro_Click" Visible="false"/>
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="15" onclick="btnFiltrosExcluir_Click"  Visible="false"/>
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="18" 
                                DataKeyNames="tipoPedidoId,tipoPedidoDescricao,tipoPedidoTriangular,tipoPedidoSiglaId,tipoPedidoSiglaDescricao" 
                                onpageindexchanging="gvRegistros_PageIndexChanging" 
                                onrowcommand="gvRegistros_RowCommand" onrowdatabound="gvRegistros_RowDataBound" 
                                onrowdeleting="gvRegistros_RowDeleting" onrowupdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" Visible="false">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPedidoTipoId" runat="server" Text='<%# FormataStringSaida(Eval("tipoPedidoId"), txtFiltrosPedidoTipoId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPedidoTipoDescricao" runat="server" Text='<%# FormataStringSaida(Eval("tipoPedidoDescricao"), txtFiltrosPedidoTipoDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="200px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPedidoTipoSiglaId" runat="server" Text='<%# Eval("tipoPedidoSiglaDescricao").ToString().ToUpper() %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPedidoTipoTriangular" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" 
                                                             CommandName="Update"
                                                             SkinID="ImgGrid"
                                                             ImageUrl="~/Imagens/find.png"
                                                             Text="<%$ Resources:Resource, lblVisualizar %>" 
                                                             CommandArgument='<%# ((GridViewRow)Container).RowIndex  %>' />
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
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="16" onclick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="17" onclick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvPedidoTipoId" runat="server" ControlToValidate="txtDadosPedidoTipoId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvPedidoTipoDescricao" runat="server" ControlToValidate="txtDadosPedidoTipoDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
