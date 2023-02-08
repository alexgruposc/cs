<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"  ValidateRequest="false"
CodeBehind="CadParametros.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadParametros" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroParametro" runat="server">
        <asp:UpdatePanel ID="uppCadastroPais" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroPais">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
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
                                    <asp:Label ID="lblDadosParametroId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosParametroId" runat="server" MaxLength="30" TabIndex="1" Enabled="false"/>
                                <li>
                                    <asp:Label ID="lblDadosParametroDescricao" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosParametroDescricao" runat="server" MaxLength="50" TabIndex="2" Enabled="false" />
                                </li>                               
                                <li>
                                    <asp:Label ID="lblDadosParametroTipo" runat="server" SkinID="LabelForm" Visible="false"/>
                                    <asp:TextBox ID="txtDadosParametroTipo" runat="server" MaxLength="50" TabIndex="2" Enabled="false" Visible="false"/>
                                </li>                               

                                <li>
                                    <asp:Label ID="lblDadosParametroValor" runat="server" SkinID="LabelForm" />
                                    
                                    <asp:TextBox ID="txtDadosParametroValorVarchar" runat="server" TabIndex="3" />
                                    <ucc:MaskedEditExtender ID="mskValidaNumerico" runat="server" ClearMaskOnLostFocus="true" MaskType="Number" TargetControlID="txtDadosParametroValorVarchar"  InputDirection="RightToLeft"  />
                                    <asp:CheckBox ID="cbDadosParametroValorBoolean" runat="server" TabIndex="3" />

                                    <asp:DropDownList ID="ddDadosParametroValorLista" runat="server" TabIndex="3" />
                                <li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="3" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="4" SkinID="ButtonRight" OnClick="btnBuscar_Click" />
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
                                                    <asp:Label ID="lblConfirmarDadosParametroId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosParametroIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>                                                
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosParametroDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosParametroDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosParametroTipo" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosParametroTipoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                               <li>
                                                    <asp:Label ID="lblConfirmarDadosParametroValor" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosParametroValorTexto" runat="server" SkinID="LabelResposta" />
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
                <asp:Panel ID="pnlGrid" runat="server" >
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"                                 
                                DataKeyNames="parametroId,parametroDescricao,parametroTipo,parametroMascara,parametroValor" 
                                onpageindexchanging="gvRegistros_PageIndexChanging" 
                                onrowcommand="gvRegistros_RowCommand" 
                                onrowdatabound="gvRegistros_RowDataBound" 
                                onrowdeleting="gvRegistros_RowDeleting"
                                onrowupdating="gvRegistros_RowUpdating">
                                <Columns>

                                    <asp:BoundField DataField="parametroId"         ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="parametroDescricao"  ItemStyle-HorizontalAlign="Center"  />
                                    <asp:BoundField DataField="parametroTipo"       ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" Visible="false"/>

                                     <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="500px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrParametroValor" runat="server"  />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75px">
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

                
                <%-- VALIDATION 
                <asp:RequiredFieldValidator ID="rfvPaisId" runat="server" ControlToValidate="txtDadosPaisId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                --%>
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
