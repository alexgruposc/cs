<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" ValidateRequest="false"
CodeBehind="CadFabricante.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadFabricante" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCadastroFabricante" runat="server">
        <asp:UpdatePanel ID="uppCadastroFabricante" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroFabricante">
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
                                    <asp:Label ID="lblDadosFabricanteId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteId" runat="server" MaxLength="30" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteNomeAbreviado" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteNomeAbreviado" runat="server" MaxLength="50" TabIndex="2" />
                                </li>                               
                                <li>
                                    <asp:Label ID="lblDadosFabricanteNome" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteNome" runat="server" MaxLength="80" TabIndex="3" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteCnpj" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteCnpj" runat="server" MaxLength="20" TabIndex="4" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteIE" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteIE" runat="server" MaxLength="20" TabIndex="5" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteEndereco" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteEndereco" runat="server" MaxLength="100" TabIndex="6" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteEnderecoNumero" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteEnderecoNumero" runat="server" MaxLength="30" TabIndex="7" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteEnderecoComplemento" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteEnderecoComplemento" runat="server" MaxLength="100" TabIndex="8" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteEnderecoCep" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteEnderecoCep" runat="server" MaxLength="30" TabIndex="9" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricantePais" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddDadosFabricantePais" runat="server"  TabIndex="10" 
                                        AutoPostBack="True"  onselectedindexchanged="ddDadosFabricantePais_SelectedIndexChanged" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteUf" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddDadosFabricanteUf" runat="server"  TabIndex="11" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteTelefone" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteTelefone" runat="server" MaxLength="30" TabIndex="12" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteTelefone2" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteTelefone2" runat="server" MaxLength="30" TabIndex="13" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteContato" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteContato" runat="server" MaxLength="100" TabIndex="14" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteEmail" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosFabricanteEmail" runat="server" MaxLength="100" TabIndex="15" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosFabricanteObservacoes" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosfabricanteObservacoes" runat="server" MaxLength="500" TabIndex="16" TextMode="MultiLine"/>
                                </li>


                            </ol>
                            <div class="line" style="margin-bottom:60px;">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="17" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click" Visible="false" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="18" SkinID="ButtonCenter" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="19" SkinID="ButtonRight" OnClick="btnLimpar_Click" Visible="false" />
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
                                                    <asp:Label ID="lblConfirmarDadosFabricanteId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>                                                
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteNomeAbreviado" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteNomeAbreviadoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteNome" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteNomeTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteCnpj" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteCnpjTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteIE" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteIETexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEndereco" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEnderecoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEnderecoNumero" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEnderecoNumeroTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEnderecoComplemento" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEnderecoComplementoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEnderecoCep" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEnderecoCepTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricantePais" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricantePaisTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteUf" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteUfTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteTelefone" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteTelefoneTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteTelefone2" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteTelefone2Texto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteContato" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteContatoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEmail" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteEmailTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosFabricanteObservacoes" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosFabricanteObservacoesTexto" runat="server" SkinID="LabelResposta" />
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
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFabricanteId" runat="server"  />
                                <asp:TextBox ID="txtFiltrosFabricanteId" SkinID="Filtro" runat="server"  MaxLength="30" TabIndex="8" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFabricanteNomeAbreviado" runat="server" />
                                <asp:TextBox ID="txtFiltrosFabricanteNomeAbreviado" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="9" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFabricanteNome" runat="server" />
                                <asp:TextBox ID="txtFiltrosFabricanteNome" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="10" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFabricanteCnpj" runat="server" />
                                <asp:TextBox ID="txtFiltrosFabricanteCnpj" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="10" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFabricantePais" runat="server"  />
                                <asp:DropDownList   ID="ddFiltrosFabricantePais" runat="server"  TabIndex="10" 
                                                    AutoPostBack="True"  SkinID="DropFiltro"  onselectedindexchanged="ddFiltrosFabricantePais_SelectedIndexChanged" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosFabricanteUf" runat="server"  />
                                <asp:DropDownList ID="ddFiltrosFabricanteUf" runat="server"  TabIndex="11"   SkinID="DropFiltro"/>
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
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"                                 
                                DataKeyNames="fabricanteId,fabricanteNomeAbreviado,fabricanteNome,fabricanteCnpj,fabricanteIE,fabricanteEndereco,fabricanteEnderecoNumero,fabricanteEnderecoComplemento,fabricanteEnderecoCep,paisId,paisNome,ufId,estadoNome,fabricanteTelefone,fabricanteTelefone2,fabricanteContato,fabricanteEmail,fabricanteObservacoes" 
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
                                            <asp:Literal ID="ltrRepresentanteId" runat="server" Text='<%# FormataStringSaida(Eval("FabricanteId"), txtFiltrosFabricanteId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrRepresentanteNomeAbreviado" runat="server" Text='<%# FormataStringSaida(Eval("FabricanteNomeAbreviado"), txtFiltrosFabricanteNomeAbreviado.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrRepresentanteNome" runat="server" Text='<%# FormataStringSaida(Eval("FabricanteNome"), txtFiltrosFabricanteNome.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                   <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrRepresentanteCnpj" runat="server" Text='<%# FormataStringSaida(Eval("FabricanteCnpj"), txtFiltrosFabricanteCnpj.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="paisNome"    DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="EstadoNome"  DataFormatString="{0:d3}" ItemStyle-HorizontalAlign="Center" />

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
                                            TabIndex="14" onclick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" 
                                            TabIndex="15" onclick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvFabricanteId" runat="server" ControlToValidate="txtDadosFabricanteId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvFabricanteNomeAbreviado" runat="server" ControlToValidate="txtDadosFabricanteNomeAbreviado" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvFabricanteNome" runat="server" ControlToValidate="txtDadosFabricanteNome" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvFabricanteCnpj" runat="server" ControlToValidate="txtDadosFabricanteCNpj" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvFabricanteIE" runat="server" ControlToValidate="txtDadosFabricanteIe" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvFabricanteEndereco" runat="server" ControlToValidate="txtDadosFabricanteEndereco" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvFabricanteEnderecoNumero" runat="server" ControlToValidate="txtDadosFabricanteEnderecoNumero" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <%--<asp:RequiredFieldValidator ID="rfvFabricanteEnderecoComplemento" runat="server" ControlToValidate="txtDadosFabricanteEnderecoComplemento" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />--%>
                <asp:RequiredFieldValidator ID="rfvFabricanteEnderecoCep" runat="server" ControlToValidate="txtDadosFabricanteEnderecoCep" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvFabricanteTelefone" runat="server" ControlToValidate="txtDadosFabricanteTelefone" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <%--<asp:RequiredFieldValidator ID="rfvFabricanteTelefone2" runat="server" ControlToValidate="txtDadosFabricanteTelefone2" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />--%>
                <%--<asp:RequiredFieldValidator ID="rfvFabricanteContato" runat="server" ControlToValidate="txtDadosFabricanteContato" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />--%>
                <asp:RequiredFieldValidator ID="rfvFabricanteEmail" runat="server" ControlToValidate="txtDadosFabricanteEmail" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <%--<asp:RequiredFieldValidator ID="rfvFabricanteObservacoes" runat="server" ControlToValidate="txtDadosFabricanteObservacoes" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />--%>
                
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
