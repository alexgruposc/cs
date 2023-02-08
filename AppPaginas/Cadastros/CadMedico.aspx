<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" ValidateRequest="false"
CodeBehind="CadMedico.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadMedico" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <asp:Panel ID="pnlCadastroMedico" runat="server">
        <asp:UpdatePanel ID="uppCadastroMedico" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroMedico">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
            <asp:Panel ID="pnlDados" runat="server"  Visible="false">-
                <div style="width: 100%; display: table;">
                    <fieldset style="margin-bottom:100px;">
                        <legend>
                            <asp:Literal ID="ltrDadosHeader" runat="server" />
                        </legend>
                        <%-- FORMULÁRIO --%>
                        <div style="width: 100%; display: table;">
                            <div style="width: 30%; display: table-cell; vertical-align: top;">
                                <asp:Panel ID="pnlDadosEsquerda" runat="server">
                                    <ol>
                                        <li>
                                            <asp:Label ID="lblDadosMedicoId" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtDadosMedicoId" runat="server" MaxLength="30" TabIndex="1" Enabled="false" />
                                        <li>
                                            <asp:Label ID="lblDadosMedicoNome" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtDadosMedicoNome" runat="server" MaxLength="50" TabIndex="2" />
                                        </li>         
                                         <li>
                                            <div class="line">
                                                <div class="line_itens_left">
                                                    <asp:Label ID="lblDadosGenero" runat="server" SkinID="LabelForm" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:RadioButtonList ID="rblGenero" runat="server" RepeatDirection="Horizontal" TabIndex="3" >
                                                        <asp:ListItem Value="M" Text="<%$ Resources:Resource, lblSexoMasculino %>" Selected="True"/>
                                                        <asp:ListItem Value="F" Text="<%$ Resources:Resource, lblSexoFeminino %>" />
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>
                                        </li>                               
                                        <li>
                                            <div class="line">
                                                <div class="line_itens_left">
                                                    <asp:Label ID="lblClienteDtNascimento" runat="server" SkinID="LabelForm" />
                                                </div>
                                                <div class="line_itens">
                                                    <CtlData:ControlData ID="CtlClienteDtNascimento" runat="server" TabIndex="4" TabIndexBtn="5" />
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <asp:Label ID="lblDadosMedicoRG" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtDadosMedicoRG" runat="server" MaxLength="15" TabIndex="6" />
                                        </li>                               
                                        <li>
                                            <div class="line">
                                                <div class="line_itens_left">
                                                    <asp:Label ID="lblMedicoMedico" runat="server" SkinID="LabelForm" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:RadioButtonList ID="rblMedicoMedico" runat="server" RepeatDirection="Horizontal" TabIndex="7" >
                                                        <asp:ListItem Value="S" Text="<%$ Resources:Resource, lblSim %>" Selected="True"/>
                                                        <asp:ListItem Value="N" Text="<%$ Resources:Resource, lblNao%>" />
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>

                                        </li>
                                        <li>
                                            <asp:Label ID="lblMedicoConsProfissional" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddMedicoConsProfissional" runat="server"  TabIndex="8" AutoPostBack="true" 
                                                              SkinID="DropFiltro" onselectedindexchanged="ddMedicoConsProfissional_SelectedIndexChanged" />
                                                              <%--onselectedindexchanged="ddMedicoConsProfissional_SelectedIndexChanged">
                                                <asp:ListItem Text="Selecione..." Value=""  Selected="True" />
                                                <asp:ListItem Text="CRM" Value="crm"/>
                                                <asp:ListItem Text="CRMV" Value="crmv"/>
                                                <asp:ListItem Text="CRO" Value="cro"/>
                                                <asp:ListItem Text="CRBM" Value="crbm" />
                                            </asp:DropDownList>--%>
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblDadosMedicoCRM" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtDadosMedicoCRM" runat="server" MaxLength="7" TabIndex="9" 
                                                        AutoPostBack="true" OnTextChanged="txtDadosMedicoCRM_TextChanged"/>
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblMedicoUFIdCRM" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddMedicoUFIdCRM" runat="server" TabIndex="10" 
                                                              AutoPostBack="true" 
                                                              SkinID="DropFiltro"
                                                              onselectedindexchanged="ddMedicoUFIdCRM_SelectedIndexChanged" />
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblMedicoEspecialidade1" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddMedicoEspecialidade1" runat="server" TabIndex="11" SkinID="DropFiltro" />
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblMedicoEspecialidade2" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddMedicoEspecialidade2" runat="server"  TabIndex="12" SkinID="DropFiltro" />
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblMedicoRepresentante" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddMedicoRepresentante" runat="server"  TabIndex="12" SkinID="DropFiltro" />
                                           <asp:HiddenField ID="hdHeaderRepresentanteAntigo" runat="server" />

                                        </li>                               
                                        <li>
                                            <div class="line">
                                                <div class="line_itens_left">
                                                    <asp:Label ID="lblMedicoObservacao" runat="server" SkinID="LabelForm" />
                                                </div>
                                                <div class="line_itens">
                                                    <asp:TextBox ID="txtMedicoObservacao" runat="server" MaxLength="60" TabIndex="13" TextMode="MultiLine"/>
                                                </div>   
                                            </div>                                        
                                        </li>                               
                                    </ol>

                                    <%--<div class="line" style="margin-top:20px;">
                                        <asp:Button ID="btnSalvar" runat="server" TabIndex="29" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                        <asp:Button ID="btnBuscar" runat="server" TabIndex="30" SkinID="ButtonCenter" OnClick="btnBuscar_Click" />
                                        <asp:Button ID="btnLimpar" runat="server" TabIndex="31" SkinID="ButtonRight" OnClick="btnLimpar_Click" />
                                    </div>--%>
                                </asp:Panel>
                            </div>
                            <div style="width: 40%; display: table-cell; vertical-align: top;">
                                <asp:Panel ID="pnlDadosDireita" runat="server">
                                    <div class="alert_bottom_button">
                                        <ol>
                                        <li>
                                            <asp:Label ID="lblMedicoCEPCom" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtMedicoCEPCom" runat="server" MaxLength="9" TabIndex="14" />
                                        
                                            <asp:ImageButton ID="imbBuscaCep" runat="server" Width="25px" Height="25px"
                                                        ImageAlign="AbsMiddle" TabIndex="9" ImageUrl="~/Imagens/find.png" 
                                                        onclick="imbBuscaCep_Click" />
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblMedicoEnderecoCom" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtMedicoEnderecoCom" runat="server" MaxLength="100" TabIndex="15" />
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblMedicoBairroCom" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtMedicoBairroCom" runat="server" MaxLength="30" TabIndex="16" />
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblMedicoMunicCom" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtMedicoMunicCom" runat="server" MaxLength="30" TabIndex="17" />
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblDadosMedicoPais" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddDadosMedicoPais" runat="server"  TabIndex="18" 
                                            AutoPostBack="True"  onselectedindexchanged="ddDadosMedicoPais_SelectedIndexChanged" />
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblDadosMedicoUf" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddDadosMedicoUf" runat="server"  TabIndex="19" />
                                        </li>                               

                                        <li>
                                            <asp:Label ID="lblMedicoFax" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtMedicoFax" runat="server" MaxLength="15" TabIndex="20" />
                                        </li>                               
                                        <li>
                                            <li>
                                                <asp:Label ID="lblMedicoDDD1" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtMedicoDDD1" runat="server" MaxLength="3" TabIndex="21" Width="30"/>
                                    
                                                <asp:Label ID="lblMedicoTelCom1" runat="server"/>
                                                <asp:TextBox ID="txtMedicoTelCom1" runat="server" MaxLength="8" TabIndex="22" Width="70"/>
                                            </li>                                   
                                        </li>                               
                                        <li>
                                            <li>
                                                <asp:Label ID="lblMedicoDDD2" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtMedicoDDD2" runat="server" MaxLength="3" TabIndex="23" Width="30"/>
                                    
                                                <asp:Label ID="lblMedicoTelCom2" runat="server"/>
                                                <asp:TextBox ID="txtMedicoTelCom2" runat="server" MaxLength="8" TabIndex="24" Width="70"/>
                                            </li>                                   
                                        </li>                               
                                        <li>
                                            <li>
                                                <asp:Label ID="lblMedicoDDD4" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtMedicoDDD4" runat="server" MaxLength="3" TabIndex="25" Width="30"/>
                                    
                                                <asp:Label ID="lblMedicoTelCelular" runat="server"/>
                                                <asp:TextBox ID="txtMedicoTelCelular" runat="server" MaxLength="9" TabIndex="26" Width="70"/>
                                            </li>                                   
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblMedicoEmail1" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtMedicoEmail1" runat="server" MaxLength="45" TabIndex="27" />
                                        </li>                               
                                        <li>
                                            <asp:Label ID="lblMedicoEmail2" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtMedicoEmail2" runat="server" MaxLength="45" TabIndex="28" />
                                        </li>                               

                                        </ol>
                                    </div>
                                </asp:Panel>
                            </div>
                            <div style="width: 30%; display: table-cell; vertical-align: top;">
                                <asp:Panel ID="pnlNovosDados" runat="server">
                                    <ol>
                                        <li>
                                            <asp:Label ID="lblMedicoCurva" runat="server" SkinID="LabelForm" />
                                            <asp:DropDownList ID="ddlCurva" runat="server" SkinID="DropSmallFilter">
                                                <asp:ListItem Value="" Text="<%$ Resources:Resource, lblSelecione %>" Selected="True" />
                                                <asp:ListItem Value="A" Text="A" />
                                                <asp:ListItem Value="B" Text="B" />
                                                <asp:ListItem Value="C" Text="C" />
                                                <asp:ListItem Value="D" Text="D" />
                                                <asp:ListItem Value="E" Text="E" />
                                                <asp:ListItem Value="F" Text="F" />
                                            </asp:DropDownList>
                                        </li>
                                        <li>
                                            <asp:Label ID="lblSecretaria01" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtSecretaria01" runat="server" MaxLength="100" SkinID="Filtro" />
                                        </li>
                                        <li>
                                            <asp:Label ID="lblSecretariaEmail01" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtSecretariaEmail01" runat="server" MaxLength="100" SkinID="Filtro" />
                                        </li>
                                        <li>
                                            <div class="line">
                                                <div class="line_itens_left">
                                                    <asp:Label ID="lblSecretaria01Nascimento" runat="server" SkinID="LabelForm" />
                                                </div>
                                                <div class="line_itens">
                                                    <CtlData:ControlData ID="CtlSecretaria01Nascimento" runat="server" />
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <asp:Label ID="lblSecretaria02" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtSecretaria02" runat="server" MaxLength="100" SkinID="Filtro" />
                                        </li>
                                        <li>
                                            <asp:Label ID="lblSecretariaEmail02" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtSecretariaEmail02" runat="server" MaxLength="100" SkinID="Filtro" />
                                        </li>
                                        <li>
                                            <div class="line">
                                                <div class="line_itens_left">
                                                    <asp:Label ID="lblSecretaria02Nascimento" runat="server" SkinID="LabelForm" />
                                                </div>
                                                <div class="line_itens">
                                                    <CtlData:ControlData ID="CtlSecretaria02Nascimento" runat="server" />
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <asp:Label ID="lblSecretaria03" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtSecretaria03" runat="server" MaxLength="100" SkinID="Filtro" />
                                        </li>
                                        <li>
                                            <asp:Label ID="lblSecretariaEmail03" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtSecretariaEmail03" runat="server" MaxLength="100" SkinID="Filtro" />
                                        </li>
                                        <li>
                                            <div class="line">
                                                <div class="line_itens_left">
                                                    <asp:Label ID="lblSecretaria03Nascimento" runat="server" SkinID="LabelForm" />
                                                </div>
                                                <div class="line_itens">
                                                    <CtlData:ControlData ID="CtlSecretaria03Nascimento" runat="server" />
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div style="margin-left: 150px;">
                                                <asp:CheckBox ID="chkMedicoBloqueado" runat="server" TextAlign="Right" Font-Bold="true" />
                                            </div>
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
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosMedicoPais" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosMedicoPaisTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosMedicoUf" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosMedicoUfTexto" runat="server" SkinID="LabelResposta" />
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
                                <asp:Label ID="lblFiltroMedicoCrm" runat="server" />
                                <asp:TextBox ID="txtFiltroMedicoCrm" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="8" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroMedicoNome" runat="server" />
                                <asp:TextBox ID="txtFiltroMedicoNome" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="9" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroMedicoPais" runat="server" />
                                <asp:DropDownList ID="ddFiltroMedicoPais"  runat="server"  TabIndex="10" 
                                    AutoPostBack="True"  SkinID="DropFiltro"  onselectedindexchanged="ddFiltrosMedicoPais_SelectedIndexChanged" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroMedicoUf" runat="server" />
                                <asp:DropDownList ID="ddFiltroMedicoUf" SkinID="DropFiltro" runat="server"  TabIndex="11" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:CheckBox ID="chkFiltroMedicoBloqueado" runat="server" TextAlign="Right" 
                                              Font-Bold="true"
                                              TabIndex="12"
                                              Text="<%$ Resources:Resource, lblMostrarBloqueados %>" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind" 
                                        TabIndex="13" onclick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean" 
                                        TabIndex="14" onclick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonCenterNew" 
                                        TabIndex="15" onclick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRightCancel" 
                                        TabIndex="16" onclick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"                                 
                                DataKeyNames="medicoId,medicoNome,paisId,paisNome,ufId,estadoNome,medicoMedico,medicoRG,medicoCRM
                                              ,medicoUFidCRM,medicoEspecialidade1,medicoEspecialidade2,medicoDtNascto,medicoSexo
                                              ,medicoCEPCom,medicoEnderecoCom,medicoBairroCom,medicoMunicCom,medicoDDD,medicoFax
                                              ,medicoTelCom1,medicoDDD2,medicoTelCom2,medicoDDD4,medicoTelCelular,medicoEmail1
                                              ,medicoEmail2,medicoDtInclusao,medicoDtAlteracao,medicoDiaAniversario
                                              ,medicoMesAniversario,medicoConsProfissional,medicoObservacao,medicoEspecialidadeId1
                                              ,medicoEspecialidadeId2,representanteId,medicoCurva,medicoSecretaria1,medicoSecretaria1Nascimento
                                              ,medicoSecretaria2,medicoSecretaria2Nascimento,medicoSecretaria3,medicoSecretaria3Nascimento,medicoBloqueado
                                              ,medicoSecretariaEmail3,medicoSecretariaEmail2,medicoSecretariaEmail1" 
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
                                    <asp:BoundField DataField="medicoId"  ItemStyle-HorizontalAlign="Center" Visible="false" />
                                    <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrMedicoCrm" runat="server" Text='<%# FormataStringSaida(Eval("medicoCRM"), txtFiltroMedicoCrm.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrMedicoNome" runat="server" Text='<%# FormataStringSaida(Eval("medicoNome"), txtFiltroMedicoNome.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPaisNome" runat="server" Text='<%# FormataStringSaida(Eval("paisNome"), ddFiltroMedicoPais.SelectedItem.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="estadoNome" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="representanteNome" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                    <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrMedicoBloqueado" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbDelete" runat="server" 
                                                             SkinID="ImgGrid"
                                                             CommandName="Delete"
                                                             ToolTip="<%$ Resources:Resource, lblExcluir %>"
                                                             ImageUrl="~/Imagens/_trash.png"
                                                             CommandArgument='<%# Eval("medicoId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" 
                                                             SkinID="ImgGrid"
                                                             CommandName="Update"
                                                             ToolTip="<%$ Resources:Resource, lblEditar %>"
                                                             ImageUrl="~/Imagens/find.png" />
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
                <asp:RequiredFieldValidator ID="rfvMedicoId" runat="server" ControlToValidate="txtDadosMedicoId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
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
                

                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
