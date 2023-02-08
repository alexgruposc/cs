<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"
    CodeBehind="CadUnidadeMedidaItem.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadUnidadeMedidaItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroUnidadeMedida" runat="server">
        <asp:UpdatePanel ID="uppCadastroUnidadeMedida" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroUnidadeMedida">
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
                                    <asp:Label ID="lblDadosUnidadeMedidaId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosUnidadeMedidaId" runat="server" MaxLength="10" TabIndex="1" />
                                </li>                           
                                <li>
                                    <asp:Label ID="lblDadosUnidadeMedidaDescricao" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosUnidadeMedidaDescricao" runat="server" MaxLength="50" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosUnidadeMedidaSigla" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosUnidadeMedidaSigla" runat="server" MaxLength="2" TabIndex="2" />
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="4" SkinID="ButtonLeft" Visible="false"
                                    ValidationGroup="Validacao" onclick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="5" SkinID="ButtonCenter" 
                                    onclick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="6" SkinID="ButtonRight"  Visible="false"
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
                                <div class="OpacityBackGround">
                                </div>
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
                                                    <asp:Label ID="lblConfirmarUnidadeMedidaId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarUnidadeMedidaIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>

                                                <li>
                                                    <asp:Label ID="lblConfirmarUnidadeMedidaDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarUnidadeMedidaDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarUnidadeMedidaSigla" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarUnidadeMedidaSiglaTexto" runat="server" SkinID="LabelResposta" />
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
                                <asp:Label ID="lblFiltrosUnidadeMedidaId" runat="server" />
                                <asp:TextBox ID="txtFiltrosUnidadeMedidaId" SkinID="Filtro" runat="server" MaxLength="10" TabIndex="9" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosUnidadeMedidaSigla" runat="server" />
                                <asp:TextBox ID="txtFiltrosUnidadeMedidaSigla" SkinID="Filtro" runat="server" MaxLength="2" TabIndex="10" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosUnidadeMedidaDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltrosUnidadeMedidaDescricao" SkinID="Filtro" runat="server" MaxLength="30" TabIndex="11" />
                            </div>

                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" 
                                        TabIndex="12" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" 
                                        TabIndex="13" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter"  Visible="false"
                                        TabIndex="14" onclick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" Visible="false"
                                        TabIndex="15" onclick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="18"                                 
                                DataKeyNames="unidadeMedidaId,unidadeMedidaSigla,unidadeMedidaDescricao" 
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
                                    <%--
                                    <asp:BoundField DataField="unidadeMedidaItemId" DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="unidadeMedidaItemSigla" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />--%>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUnidadeMedidaId" runat="server" Text='<%# FormataStringSaida(Eval("unidadeMedidaId"), txtFiltrosUnidadeMedidaId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUnidadeMedidaSigla" runat="server" Text='<%# FormataStringSaida(Eval("unidadeMedidaSigla"), txtFiltrosUnidadeMedidaSigla.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField >
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUnidadeMedida" runat="server" Text='<%# FormataStringSaida(Eval("unidadeMedidaDescricao"), txtFiltrosUnidadeMedidaDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <%--<asp:BoundField DataField="unidadeMedidaItemDescricao" ItemStyle-HorizontalAlign="Left" />

                                    <asp:BoundField DataField="unidadeMedidaItemDataCadastro" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px" /> --%>
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
                        <div class="OpacityBackGround">
                        </div>
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
                <asp:RequiredFieldValidator ID="rfvUMId" runat="server" ControlToValidate="txtDadosUnidadeMedidaiD" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />                
                <asp:RequiredFieldValidator ID="rfVUMDescricao" runat="server" ControlToValidate="txtDadosUnidadeMedidaDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />                
                <asp:RequiredFieldValidator ID="rfvUMSigla" runat="server" ControlToValidate="txtDadosUnidadeMedidaSigla" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />                
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
