<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"
    ValidateRequest="false" CodeBehind="CadClienteEstabelecimento.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadClienteEstabelecimento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroClienteEstabelecimento" runat="server">
        <asp:UpdatePanel ID="uppCadastroClienteEstabelecimento" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroClienteEstabelecimento">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
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
                                    <asp:Label ID="lblDadosEstabelecimentoId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosEstabelecimentoId" runat="server" MaxLength="30" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosEstabelecimentoRazaoSocial" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosEstabelecimentoRazaoSocial" runat="server" MaxLength="50" TabIndex="2" />
                                </li>
                                <li>
                                    <asp:Panel ID="panelEmpresa" runat="server" DefaultButton="imbDadosEmpresaCheck">
                                        <asp:Label ID="lblDadosEstabelecimentoEmpresaId" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosEstabelecimentoEmpresaId" runat="server" TabIndex="3" Width="70px" />
                                    
                                        <asp:ImageButton ID="imbDadosEmpresaCheck" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" TabIndex="4" ImageUrl="~/Imagens/check.png" onclick="imbDadosEmpresaCheck_Click" />
                                        <asp:ImageButton ID="imbDadosEmpresaBusca" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" TabIndex="5" ImageUrl="~/Imagens/find.png" onclick="imbDadosEmpresaBusca_Click" />
                                    
                                        <asp:Label ID="lblDadosEstabelecimentoEmpresaRazaoSocialTexto" runat="server" SkinID="LabelResposta" />
                                    </asp:Panel>
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="6" SkinID="ButtonLeft" ValidationGroup="Validacao"   OnClick="btnSalvar_Click" Visible="false"/>
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="7" SkinID="ButtonCenter" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="7" SkinID="ButtonRight" OnClick="btnLimpar_Click" Visible="false" />
                            </div>
                        </div>
                    </fieldset>
                </asp:Panel>

                <%-- PESQUISA EMPRESA --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upEmpresa" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imbDadosEmpresaBusca" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlBuscaEmpresa" runat="server" DefaultButton="btnFiltroPesquisar" Visible="false">
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
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrEmpresaHeader" runat="server" />
                                            </legend>
                                            <%-- FILTROS EMPRESA --%>
                                            <div class="navegacao">
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroEmpresaId" runat="server" />
                                                    <asp:TextBox ID="txtFiltroEmpresaId" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="17" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroEmpresaNomeFantasia" runat="server" />
                                                    <asp:TextBox ID="txtFiltroEmpresaNomeFantasia" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="18" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <asp:Label ID="lblFiltroEmpresaRazaoSocial" runat="server" />
                                                    <asp:TextBox ID="txtFiltroEmpresaRazaoSocial" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="19" />
                                                </div>
                                                <div class="boxPesquisa">
                                                    <div class="line">
                                                        <asp:Button ID="btnFiltroPesquisar" runat="server" SkinID="ButtonLeft" TabIndex="20" onclick="btnFiltroPesquisar_Click" />
                                                        <asp:Button ID="btnFiltroLimpar" runat="server" SkinID="ButtonRight" TabIndex="21" onclick="btnFiltroLimpar_Click" />
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- GRID REGISTROS EMPRESA --%>
                                            <div class="gridRegistros">
                                                <asp:GridView ID="gvRegistrosEmpresa" runat="server" TabIndex="37"
                                                    DataKeyNames="empresaId,empresaNomeFantasia,empresaRazaoSocial" 
                                                    onpageindexchanging="gvRegistros_PageIndexChanging" 
                                                    onrowcommand="gvRegistros_RowCommandEmpresa" onrowdatabound="gvRegistros_RowDataBoundEmpresa">
                                                    <Columns>                                                        
                                                        
                                                        <asp:TemplateField ItemStyle-Width="200px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrEmpresaId" runat="server" Text='<%# FormataStringSaida(Eval("empresaId"), txtFiltroEmpresaId.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="200px">
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrEmpresaNomeFantasia" runat="server" Text='<%# FormataStringSaida(Eval("empresaNomeFantasia"), txtFiltroEmpresaNomeFantasia.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltrEmpresaRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("empresaRazaoSocial"), txtFiltroEmpresaRazaoSocial.Text) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imbSelect" runat="server" Width="25px" Height="25px" ImageAlign="AbsMiddle" 
                                                                                 ImageUrl="~/Imagens/check.png" CommandName="Select" 
                                                                                 CommandArgument='<%# Eval("empresaId") + "|" + ((GridViewRow)Container).RowIndex %>' />
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
                                                    <asp:Label ID="lblConfirmarEstabeleximentoId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarEstabeleximentoIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarEstabelecimentoRazaoSocial" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarEstabelecimentoRazaoSocialTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                 <li>
                                                    <asp:Label ID="lblConfirmarEstabelecimentoEmpresa" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarEstabelecimentoEmpresaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>

                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="6"
                                                    OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="7"
                                                    OnClick="btnConfirmarNo_Click" />
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
                                <asp:Label ID="lblFiltrosEstabelecimentoId" runat="server" />
                                <asp:TextBox ID="txtFiltrosEstabelecimentoId" runat="server" MaxLength="10" TabIndex="8" SkinID="Filtro" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosEstabelecimentoRazaoSocial" runat="server" />
                                <asp:TextBox ID="txtFiltrosEstabelecimentoRazaoSocial" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="9" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosEmpresa" runat="server" />
                                <asp:TextBox ID="txtFiltrosEmpresa" runat="server" MaxLength="30" TabIndex="10" 
                                    SkinID="Filtro"  />
                            </div>

                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="11"
                                        OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" TabIndex="12"
                                        OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" TabIndex="13" Visible="false"
                                        OnClick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="14" Visible="false"
                                        OnClick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="17" 
                                DataKeyNames="estabelecimentoId,estabelecimentoRazaoSocial,empresaRazaoSocial,empresaId,empresaNomeFantasia"
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
                                    <%--
                                    <asp:BoundField DataField="estabelecimentoClienteId" DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="estabelecimentoClienteCodigoERP" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="grupoClienteNome" ItemStyle-HorizontalAlign="Left" />
                                    --%>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrEstabelecimentoEmpresaiD" runat="server" Text='<%# FormataStringSaida(Eval("estabelecimentoId"), txtFiltrosEstabelecimentoId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrEstabelecimentoRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("estabelecimentoRazaoSocial"), txtFiltrosEstabelecimentoRazaoSocial.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrEstabelecimentoEmpresa" runat="server" Text='<%# FormataStringSaida(Eval("empresaRazaoSocial"), txtFiltrosEmpresa.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:BoundField DataField="empresaId" ItemStyle-HorizontalAlign="Left" /> --%>

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
                                        <asp:Button ID="btnExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="15"
                                            OnClick="btnExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="16"
                                            OnClick="btnExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvEstabelecimentoId" runat="server" ControlToValidate="txtDadosEstabelecimentoId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvEstabelecimentoRazaoSocial" runat="server" ControlToValidate="txtDadosEstabelecimentoRazaoSocial" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvEstabelecimentoEmpresa" runat="server" ControlToValidate="txtDadosEstabelecimentoEmpresaId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
