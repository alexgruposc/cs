<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadCliente.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCliente" %>

<%-- CONTROLE DATA --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script language="javascript" type="text/javascript">

    function MontaLayoutFormulario(rbl) {

        if (rbl == "F") {
            document.getElementById('ContentPlaceHolder1_pnlDadosCnpj').style.display = "none"
            document.getElementById('ContentPlaceHolder1_pnlDadosCpf').style.display = "block"
            document.getElementById('ContentPlaceHolder1_rfvClienteCnpj').enabled = false;
            document.getElementById('ContentPlaceHolder1_rfvClienteIE').enabled = false;
            document.getElementById('ContentPlaceHolder1_rfvClienteRazaoSocial').enabled = false;
            document.getElementById('ContentPlaceHolder1_rfvClienteCpf').enabled = true;
            document.getElementById('ContentPlaceHolder1_rfvClienteNome').enabled = true;                       

            if(document.getElementById('ContentPlaceHolder1_pnlDadosCnpj').style.display == "none")
                document.getElementById('ContentPlaceHolder1_rfvClienteIE').enabled = false;
        }
        else if (rbl == "J") {
            document.getElementById('ContentPlaceHolder1_pnlDadosCpf').style.display = "none"
            document.getElementById('ContentPlaceHolder1_pnlDadosCnpj').style.display = "block"
            document.getElementById('ContentPlaceHolder1_rfvClienteCnpj').enabled = true;
            document.getElementById('ContentPlaceHolder1_rfvClienteRazaoSocial').enabled = true;
            document.getElementById('ContentPlaceHolder1_rfvClienteCpf').enabled = false;
            document.getElementById('ContentPlaceHolder1_rfvClienteNome').enabled = false;

            if (document.getElementById('ContentPlaceHolder1_chkDadosClienteIsentoIE').checked)
                document.getElementById('ContentPlaceHolder1_rfvClienteIE').enabled = false;
            else
                document.getElementById('ContentPlaceHolder1_rfvClienteIE').enabled = true;

            if (document.getElementById('ContentPlaceHolder1_pnlDadosCnpj').style.display == "none")
                document.getElementById('ContentPlaceHolder1_rfvClienteIE').enabled = false;           
        }
    } 

    function MontaLayoutFiltros(rbl) {

        if (rbl == "F") {
            document.getElementById('ContentPlaceHolder1_pnlFiltrosCnpj').style.display = "none"
            document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCnpj').value = "";
            document.getElementById('ContentPlaceHolder1_pnlFiltrosCpf').style.display = "block"
        }
        else if (rbl == "J") {
            document.getElementById('ContentPlaceHolder1_pnlFiltrosCnpj').style.display = "block"
            document.getElementById('ContentPlaceHolder1_txtFiltrosClienteCpf').value = "";
            document.getElementById('ContentPlaceHolder1_pnlFiltrosCpf').style.display = "none"
        }
    }

    function CheckIe(chk) {
        if (document.getElementById('ContentPlaceHolder1_chkDadosClienteIsentoIE').checked) {
            document.getElementById('ContentPlaceHolder1_txtDadosClienteIE').value = "";
            document.getElementById('ContentPlaceHolder1_txtDadosClienteIE').disabled = true;
            document.getElementById('ContentPlaceHolder1_rfvClienteIE').enabled = false;
        }
        else {
            document.getElementById('ContentPlaceHolder1_txtDadosClienteIE').disabled = false;
            document.getElementById('ContentPlaceHolder1_rfvClienteIE').enabled = true;
        }
    }

</script>

<asp:Panel ID="pnlCadastroCliente" runat="server">
        <asp:UpdatePanel ID="uppCadastroCliente" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroCliente">
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
                                    <asp:Label ID="lblDadosClienteId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteId" runat="server" MaxLength="30" TabIndex="1" />
                                </li>
                                <li>
                                    <div class="line">
                                        <div class="line_itens_left">
                                            <asp:Label ID="lblDadosClienteTipoPessoa" runat="server" SkinID="LabelForm" />
                                        </div>
                                        <div class="line_itens">
                                            <asp:RadioButtonList ID="rblDadosTipoPessoa" runat="server" RepeatDirection="Horizontal" TabIndex="2">
                                                <asp:ListItem Selected="True" 
                                                              onclick="MontaLayoutFormulario('F');" 
                                                              Value="<%$ Resources:Resource, lblTipoPessoaFisicaValue %>" 
                                                              Text="<%$ Resources:Resource, lblTipoPessoaFisica %>" />
                                                <asp:ListItem onclick="MontaLayoutFormulario('J');" 
                                                              Value="<%$ Resources:Resource, lblTipoPessoaJuridicaValue %>" 
                                                              Text="<%$ Resources:Resource, lblTipoPessoaJuridica %>" />
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </li>
                                <asp:Panel ID="pnlDadosCnpj" runat="server">
                                    <li>
                                        <asp:Label ID="lblDadosClienteCnpj" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosClienteCnpj" runat="server" MaxLength="20" TabIndex="3" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosClienteRazaoSocial" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosClienteRazaoSocial" runat="server" MaxLength="50" TabIndex="4" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosClienteNomeFantasia" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosClienteNomeFantasia" runat="server" MaxLength="50" TabIndex="5" />
                                    </li>
                                    <li>
                                        <div style="margin-left: 150px;">
                                            <asp:CheckBox ID="chkDadosClienteIsentoIE" runat="server" Font-Bold="true" TabIndex="6" 
                                                          Text="<%$ Resources:Resource, lblIsentoIE %>"
                                                          onclick="CheckIe('ContentPlaceHolder1_chkDadosClienteIsentoIE');" />
                                        </div>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosClienteIE" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosClienteIE" runat="server" MaxLength="50" TabIndex="7" />
                                    </li>
                                </asp:Panel>
                                <asp:Panel ID="pnlDadosCpf" runat="server">
                                    <li>
                                        <asp:Label ID="lblDadosClienteCpf" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosClienteCpf" runat="server" MaxLength="20" TabIndex="8" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosClienteNome" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosClienteNome" runat="server" MaxLength="50" TabIndex="9" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosClienteRg" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosClienteRg" runat="server" MaxLength="20" TabIndex="10" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDadosClienteRgOrgao" runat="server" SkinID="LabelForm" />
                                        <asp:TextBox ID="txtDadosClienteRgOrgao" runat="server" MaxLength="20" TabIndex="11" />
                                    </li>
                                    <li>
                                        <div class="line">
                                            <div class="line_itens_left">
                                                <asp:Label ID="lblDadosClienteRgDataEmissao" runat="server" SkinID="LabelForm" />
                                            </div>
                                            <div class="line_itens">
                                                <CtlData:ControlData ID="CtlDataDadosClienteRgDataEmissao" runat="server" />
                                            </div>
                                        </div>
                                    </li>
                                </asp:Panel>
                                <li>
                                    <div style="margin-left: 150px;">
                                        <asp:CheckBox ID="chkDadosClienteMatrizFinanceira" runat="server" Font-Bold="true" TabIndex="13" Text="<%$ Resources:Resource, lblMatrizFinanceira %>" />
                                    </div>
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteGrupoFinanceiroId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosClienteGrupoFinanceiroId" runat="server" TabIndex="14" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteGrupoComercialId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosClienteGrupoComercialId" runat="server" TabIndex="15" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteCanalVendaId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosClienteCanalVendaId" runat="server" TabIndex="16" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteCategoriaId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosClienteCategoriaId" runat="server" TabIndex="17" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteMercadoId" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlDadosClienteMercadoId" runat="server" TabIndex="18" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteTipoCredito" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteTipoCredito" runat="server" MaxLength="30" TabIndex="19" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosClienteValorCredito" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosClienteValorCredito" runat="server" MaxLength="30" TabIndex="20" />
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="21" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="22" SkinID="ButtonCenter" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="23" SkinID="ButtonRight" OnClick="btnLimpar_Click" />
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
                                                    <asp:Label ID="lblConfirmarDadosClienteId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteTipoPessoa" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteTipoPessoaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteCnpj" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteCnpjTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteRazaoSocial" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteRazaoSocialTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteNomeFantasia" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteNomeFantasiaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteIsentoIE" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteIsentoIETexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteIE" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteIETexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteCpf" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteCpfTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteNome" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteNomeTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteRg" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteRgTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteOrgao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteOrgaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteRgDataEmissao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteRgDataEmissaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteMatrizFinanceira" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteMatrizFinanceiraTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteGrupoFinanceiro" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteGrupoFinanceiroTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteGrupoComercial" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteGrupoComercialTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteCanalVenda" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteCanalVendaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteCategoria" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteCategoriaTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteMercado" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteMercadoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteTipoCredito" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteTipoCreditoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosClienteValorCredito" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosClienteValorCreditoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="24" onclick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="25" onclick="btnConfirmarNo_Click" />
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
                            <div class="boxPesquisa" style="text-align: left;">
                                <asp:RadioButtonList ID="rblFiltrosTipoPessoa" runat="server" RepeatDirection="Horizontal" TabIndex="26">
                                    <asp:ListItem Selected="True" 
                                                  onclick="MontaLayoutFiltros('F');"
                                                  Value="<%$ Resources:Resource, lblTipoPessoaFisicaValue %>" 
                                                  Text="<%$ Resources:Resource, lblTipoPessoaFisica %>" />
                                    <asp:ListItem onclick="MontaLayoutFiltros('J');"
                                                  Value="<%$ Resources:Resource, lblTipoPessoaJuridicaValue %>" 
                                                  Text="<%$ Resources:Resource, lblTipoPessoaJuridica %>" />
                                </asp:RadioButtonList>
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosClienteGrupoFinanceiro" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosClienteGrupoFinanceiro" runat="server" TabIndex="27" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosClienteGrupoComercial" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosClienteGrupoComercial" runat="server" TabIndex="28" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosClienteCanalVenda" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosClienteCanalVenda" runat="server" TabIndex="29" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosClienteCategoria" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosClienteCategoria" runat="server" TabIndex="30" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisaCurta">
                                <asp:Label ID="lblFiltrosClienteMercado" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosClienteMercado" runat="server" TabIndex="31" SkinID="DropFiltro" />
                            </div>
                        </div>
                        <div class="navegacao">
                            <div class="boxPesquisaCurta" style="width: 200px;">
                                <asp:Panel ID="pnlFiltrosCnpj" runat="server">
                                    <asp:Label ID="lblFiltrosClienteCnpj" runat="server" />
                                    <asp:TextBox ID="txtFiltrosClienteCnpj" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="32" />
                                </asp:Panel>
                                <asp:Panel ID="pnlFiltrosCpf" runat="server">
                                    <asp:Label ID="lblFiltrosClienteCpf" runat="server" />
                                    <asp:TextBox ID="txtFiltrosClienteCpf" SkinID="Filtro" runat="server" MaxLength="20" TabIndex="33" />
                                </asp:Panel>
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteId" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="34" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosClienteRazaoSocial" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteRazaoSocial" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="35" />
                            </div>
                            <div class="boxPesquisa" style="display: none;">
                                <asp:Label ID="lblFiltrosClienteNome" runat="server" />
                                <asp:TextBox ID="txtFiltrosClienteNome" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="36" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="37" OnClick="btnFiltrosPesquisa_Click" />
                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" TabIndex="38" OnClick="btnFiltrosLimpar_Click" />
                                <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenter" TabIndex="39" OnClick="btnFiltrosNovoCadastro_Click" />
                                <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="40" OnClick="btnFiltrosExcluir_Click" />
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="43"                                 
                                DataKeyNames="clienteId,clienteTipoPessoa,clienteCNPJ,clienteIsentoIE,clienteIE,clienteCPF,clienteRG,clienteRazaoSocial,clienteNomeAbreviado,
                                              clienteRGOrgao,clienteRGDataEmissao,clienteDataCadastro,matrizFinanceira,clienteTipoCredito,clienteValorCredito,
                                              grupoFinanceiroId,clienteGrupoFinanceiroNomeAbreviado,grupoComercialId,clienteGrupoComercialNomeAbreviado,
                                              canalVendaId,canalVendaDescricao,categoriaClienteId,categoriaClienteDescricao,mercadoId,mercadoDescricao" 
                                onpageindexchanging="gvRegistros_PageIndexChanging" 
                                onrowcommand="gvRegistros_RowCommand" 
                                onrowdatabound="gvRegistros_RowDataBound" 
                                onrowdeleting="gvRegistros_RowDeleting"
                                onrowupdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chlAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteId" runat="server" Text='<%# FormataStringSaida(Eval("clienteId"), txtFiltrosClienteId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteRazaoSocial" runat="server" Text='<%# FormataStringSaida(Eval("clienteRazaoSocial"), txtFiltrosClienteRazaoSocial.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Wrap="true" Visible="false">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteNomeFantasia" runat="server" Text='<%# FormataStringSaida(Eval("clienteNomeAbreviado"), txtFiltrosClienteNome.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteCnpj" runat="server" Text='<%# FormataStringSaida(Eval("clienteCNPJ"), txtFiltrosClienteCnpj.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteCpf" runat="server" Text='<%# FormataStringSaida(Eval("clienteCPF"), txtFiltrosClienteCpf.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteGrupoFinanceiro" runat="server" Text='<%# FormataStringSaida(Eval("clienteGrupoFinanceiroNomeAbreviado"), ddlFiltrosClienteGrupoFinanceiro.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteGrupoComercial" runat="server" Text='<%# FormataStringSaida(Eval("clienteGrupoComercialNomeAbreviado"), ddlFiltrosClienteGrupoComercial.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteCanalVenda" runat="server" Text='<%# FormataStringSaida(Eval("canalVendaDescricao"), ddlFiltrosClienteCanalVenda.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteCategoria" runat="server" Text='<%# FormataStringSaida(Eval("categoriaClienteDescricao"), ddlFiltrosClienteCategoria.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="true" Visible="false">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrClienteMercado" runat="server" Text='<%# FormataStringSaida(Eval("mercadoDescricao"), ddlFiltrosClienteMercado.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbContatos" runat="server" CommandName="Contatos" SkinID="ImgGrid"
                                                             ImageUrl="~/Imagens/contatos.png"
                                                             ToolTip="<%$ Resources:Resource, lblContatosHeader %>"
                                                             CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbDocumentos" runat="server" CommandName="Documentos" SkinID="ImgGrid"
                                                             ImageUrl="~/Imagens/documentos.png"
                                                             ToolTip="<%$ Resources:Resource, lblDocumentosHeader %>"
                                                             CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbEndereco" runat="server" CommandName="Endereco" SkinID="ImgGrid"
                                                             ImageUrl="~/Imagens/enderecos.png"
                                                             ToolTip="<%$ Resources:Resource, lblEnderecoHeader %>"
                                                             CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbTipoPedido" runat="server" CommandName="TipoPedido" SkinID="ImgGrid"
                                                             ImageUrl="~/Imagens/tipoPedido.png"
                                                             ToolTip="<%$ Resources:Resource, lblTipoPedidoHeader %>"
                                                             CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75px">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAlterar" runat="server" CommandName="Update"
                                                        Text="<%$ Resources:Resource, lblEditar %>"
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
                                        <asp:Button ID="btnConfirmarExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="41" onclick="btnConfirmarExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnConfirmarExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="42" onclick="btnConfirmarExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- CLIENTE CONTATOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upContatos" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlContatos" runat="server" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblContatosHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbContatosClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" TabIndex="44" ImageUrl="~/Imagens/Fechar.png" 
                                                onclick="imbContatosClose_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <iframe ID="frmContatos" runat="server" style="width: 99%; height: 100%;" />
                                    </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- CLIENTE DOCUMENTOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upDocumentos" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlDocumentos" runat="server" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblDocumentosHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbDocumentos" runat="server" ImageAlign="AbsMiddle"  Width="25px" Height="25px" 
                                            TabIndex="45" ImageUrl="~/Imagens/Fechar.png" onclick="imbDocumentos_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <iframe ID="frmDocumentos" runat="server" style="width: 99%; height: 100%;" />
                                    </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- CLIENTE ENDEREÇO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="UpEndereco" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlEndereco" runat="server" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblEnderecoHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="AbsMiddle"  Width="25px" Height="25px" TabIndex="46" ImageUrl="~/Imagens/Fechar.png" 
                                                onclick="imbEndereco_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <iframe ID="frmEndereco" runat="server" style="width: 99%; height: 100%;" />
                                    </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- CLIENTE TIPO PEDIDO --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="UpTipoPedido" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlTipoPedido" runat="server" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblTipoPedidoHeader" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                            <asp:ImageButton ID="imbTipoPedido" runat="server" ImageAlign="AbsMiddle"  Width="25px" Height="25px" TabIndex="47" ImageUrl="~/Imagens/Fechar.png" 
                                                onclick="imbTipoPedido_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <iframe ID="frmTipoPedido" runat="server" style="width: 99%; height: 100%;" />
                                    </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvClienteId" runat="server" ControlToValidate="txtDadosClienteId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteCnpj" runat="server" ControlToValidate="txtDadosClienteCnpj" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteIE" runat="server" ControlToValidate="txtDadosClienteIE" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteCpf" runat="server" ControlToValidate="txtDadosClienteCpf" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteRazaoSocial" runat="server" ControlToValidate="txtDadosClienteRazaoSocial" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvClienteNome" runat="server" ControlToValidate="txtDadosClienteNome" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
