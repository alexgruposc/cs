<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="CadEstabelecimentoEX.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEstabelecimentoEX" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Panel ID="pnlCadastroEstabelecimento" runat="server">
        <asp:UpdatePanel ID="uppCadastroEstabelecimento" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroEstabelecimento">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <div style="width: 100%; display: table;">
                        <fieldset style="margin-bottom: 100px;">
                            <legend>
                                <asp:Literal ID="ltrDadosHeader" runat="server" />
                            </legend>
                            <%-- FORMULÁRIO --%>
                            <div style="width: 100%; display: table;">
                                <div style="width: 50%; display: table-cell; vertical-align: top;">
                                    <asp:Panel ID="pnlDadosEsquerda" runat="server">
                                        <ol>
                                            <li>
                                                <asp:Label ID="lblRegrasUFDistribuicaoExId" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtRegrasUFDistribuicaoExId" runat="server" MaxLength="30" TabIndex="1" Enabled="false" />
                                                </li>
                                                <li>
                                                    <%--<div class="line">--%>
                                                        <asp:Label ID="lblUFDestino" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddUFDestino" runat="server" TabIndex="10"
                                                            AutoPostBack="true"
                                                            SkinID="DropFiltro"
                                                            OnSelectedIndexChanged="ddUFDestino_SelectedIndexChanged" />
                                                    <%--</div>
                                                
                                                    <div class="line">--%>
                                                        <asp:Label ID="lblEstabelecimentoId" runat="server" SkinID="LabelForm" />
                                                        <asp:DropDownList ID="ddlEstabelecimentoId" runat="server" TabIndex="11"
                                                            AutoPostBack="true"
                                                            SkinID="DropFiltro" />

                                                   <%-- </div>--%>

                                                      <asp:Label ID="lblRegistrosPagina" runat="server" Text="<%$ Resources:Resource, lblSistemaEntrada %>" />
                                            <asp:DropDownList ID="ddlSistemaEntrada" runat="server" TabIndex="25" Enabled="false">
                                                <asp:ListItem   Value="" Text="Selecione um item..." />
                                                <asp:ListItem Value="Acessar" Text="Acessar" />       
                                                <asp:ListItem Selected="True" Value="Kraft" Text="Kraft" />                                                     
                                            </asp:DropDownList>
                                                </li>
                                            
                                        </ol>
                                    </asp:Panel>
                                </div>

                            </div>
                            <div style="width: 100%; display: table; text-align: center;">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="29" SkinID="ButtonLeftSave" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="30" SkinID="ButtonCenterVoltar" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="31" SkinID="ButtonRightClean" OnClick="btnLimpar_Click" />
                            </div>
                        </fieldset>
                    </div>
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
                                                    <asp:Label ID="lblConfirmarDadosMedicoId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosMedicoIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosMedicoNome" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosMedicoNomeTexto" runat="server" SkinID="LabelResposta" />
                                                </li>

                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft"
                                                    TabIndex="6" OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight"
                                                    TabIndex="7" OnClick="btnConfirmarNo_Click" />
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
                                <asp:Label ID="lblFiltroEstabelecimentoId" runat="server" />
                                <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" TabIndex="10"
                                    AutoPostBack="True" SkinID="DropFiltro" OnSelectedIndexChanged="ddFiltroEstabelecimentoId_SelectedIndexChanged" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroUf" runat="server" />
                                <asp:DropDownList ID="ddFiltroUf" SkinID="DropFiltro" runat="server" TabIndex="11" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:CheckBox ID="chkFiltroMedicoBloqueado" runat="server" Visible="false" TextAlign="Right"
                                    Font-Bold="true"
                                    TabIndex="12"
                                    Text="<%$ Resources:Resource, lblMostrarBloqueados %>" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind"
                                        TabIndex="13" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean"
                                        TabIndex="14" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenterNew"
                                        TabIndex="15" OnClick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRightCancel"
                                        TabIndex="16" OnClick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"
                                DataKeyNames="RegrasUFDistribuicaoExId,UFDestino,estabelecimentoId,DataCadastro,UsuarioIdCadastro,Excluido, UsuarioIdExclusao,estabelecimentoRazaoSocial"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                OnRowDeleting="gvRegistros_RowDeleting"
                                OnRowUpdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="RegrasUFDistribuicaoExId" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                    <asp:BoundField DataField="estadoNome" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="estabelecimentoRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                     <asp:BoundField DataField="sistemaEntrada" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="DataCadastro" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="UsuarioIdCadastro" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbDelete" runat="server"
                                                SkinID="ImgGrid"
                                                CommandName="Delete"
                                                ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                ImageUrl="~/Imagens/_trash.png"
                                                CommandArgument='<%# Eval("RegrasUFDistribuicaoExId") %>'    />
                                       
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server"
                                                SkinID="ImgGrid"
                                                CommandName="Update"
                                                ToolTip="<%$ Resources:Resource, lblEditar %>"
                                                ImageUrl="~/Imagens/find.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
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
                                            TabIndex="14" OnClick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight"
                                            TabIndex="15" OnClick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <%--<asp:RequiredFieldValidator ID="rfvMedicoId" runat="server" ControlToValidate="txtDadosMedicoId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvMedicoNome" runat="server" ControlToValidate="txtDadosMedicoNome" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvMedicoRG" runat="server" ControlToValidate="txtDadosMedicoRG" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" Enabled="false" />
                <asp:RequiredFieldValidator ID="rfvMedicoCRM" runat="server" ControlToValidate="txtDadosMedicoCRM" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvMedicoCEPCom" runat="server" ControlToValidate="txtMedicoCEPCom" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvMedicoEnderecoCom" runat="server" ControlToValidate="txtMedicoEnderecoCom" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvMedicoBairro" runat="server" ControlToValidate="txtMedicoBairroCom" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvMedicoMunicCom" runat="server" ControlToValidate="txtMedicoMunicCom" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvMedicoDDD1" runat="server" ControlToValidate="txtMedicoDDD1" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" Enabled="false" />
                <asp:RequiredFieldValidator ID="rfvMedicoTelcom1" runat="server" ControlToValidate="txtMedicoTelCom1" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" Enabled="false"/>
                <asp:RequiredFieldValidator ID="rfvMedicoEmail1" runat="server" ControlToValidate="txtMedicoEmail1" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" Enabled="false"/>
                

                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />--%>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
