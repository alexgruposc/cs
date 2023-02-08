<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CadGrupoClienteTabela.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadGrupoClienteTabela" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <script type="text/javascript">

        function isNumber(evt) {
            var iKeyCode = (evt.which) ? evt.which : evt.keyCode
            if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
                return false;

            return true;
        }

        function LimparCamposERP() {
            document.getElementById("ContentPlaceHolder1_txtfiltro_Grupo_nao_selec_ClienteIdERP").value = "";
            document.getElementById("ContentPlaceHolder1_txtfiltro_Grupo_selec_ClienteIdERP").value = "";
        }



        function LimparCamposRazao() {
            document.getElementById("ContentPlaceHolder1_txtfiltro_Grupo_nao_selec_clienteRazaoSocial").value = "";
            document.getElementById("ContentPlaceHolder1_txtfiltro_Grupo_selec_clienteRazaoSocial").value = "";
        }

    </script>
    <asp:Panel ID="pnlCadastroGrupos" runat="server">
        <asp:UpdatePanel ID="updCadastroGrupos" runat="server">
              <Triggers>
            
            <asp:PostBackTrigger ControlID="imbItensExportar" />
        </Triggers>
            <%--<Triggers>
                <asp:AsyncPostBackTrigger ControlID="gvRegistros" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="gvRegistros" EventName="PageIndexChanging" />
            </Triggers>--%>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updCadastroGrupos">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Width="100%" Height="100%" Visible="false">
                    <div style="width: 100%; height: 100%; display: table;">

                        <fieldset>
                            <div style="display: table; width: 100%;">
                                <div style="text-align: right; display: table-cell; width: 100%; vertical-align: middle;">
                                    <asp:Button ID="btnSalvar" runat="server" SkinID="ButtonLeftSave" TabIndex="1" ValidationGroup="Validacao" OnClick="btnSalvar_Click" OnClientClick="this.disabled=true; __doPostBack(this.name, '');" />
                                    <asp:Button ID="btnLimpar" runat="server" SkinID="ButtonCenterClean" TabIndex="6" OnClick="btnLimpar_Click" />
                                    <asp:Button ID="btnVoltar" runat="server" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnVoltar_Click" />

                                </div>
                            </div>
                        </fieldset>
                        <%-- FORMULÁRIO --%>
                        <fieldset>
                            <div style="display: table-cell; width: 40%; height: 100%; vertical-align: middle; text-align: right;">
                                <asp:Label ID="lblNomeGrupo" runat="server" Text="<%$ Resources:Resource, lblDescricao %>" />
                            </div>
                            <div style="display: table-cell; width: 60%; height: 100%; vertical-align: middle; text-align: center;">
                                <asp:TextBox ID="txtNomeGrupo" runat="server" Width="100%" MaxLength="50" />
                            </div>
                        </fieldset>
                        <div style="width: 100%; display: table;">
                            <div style="width: 30%; display: table-cell; vertical-align: top;">
                                <div style="left: 0.5; display: table; width: 100%; margin-top: 2px;">



                                    <%-- Grupo Não Selecionados --%>
                                    <div style="width: 45%; height: 100%; display: table-cell;">
                                        <asp:Label ID="lblfiltro_Grupo_nao_selec_ClienteIdERP" runat="server" AssociatedControlID="txtfiltro_Grupo_nao_selec_ClienteIdERP" Text="<%$ Resources:Resource, lblCodigoERP %>"></asp:Label>

                                        <asp:TextBox ID="txtfiltro_Grupo_nao_selec_ClienteIdERP" onkeypress="javascript:return isNumber(event)" onfocus="LimparCamposRazao();" SkinID="Size70" runat="server"></asp:TextBox>

                                        <asp:Label ID="lblfiltro_Grupo_nao_selec_clienteRazaoSocial" runat="server" AssociatedControlID="txtfiltro_Grupo_nao_selec_clienteRazaoSocial" Text="<%$ Resources:Resource, lblRazaoSocialNome %>"></asp:Label>

                                        <asp:TextBox ID="txtfiltro_Grupo_nao_selec_clienteRazaoSocial" onfocus="LimparCamposERP();" runat="server"></asp:TextBox>

                                        <asp:Button ID="btnFiltrarNaoSelect" runat="server" Text="Filtrar" SkinID="ButtonLeftSave" OnClick="btnFiltrarNaoSelect_Click" />
                                        <asp:Button ID="btnLimparGrupoNaoSelect" runat="server" Text="Limpar" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnLimparGrupoNaoSelect_Click" />



                                        <fieldset style="height: 100%; width: auto;">
                                            <legend>
                                                <asp:Literal ID="Literal1" runat="server" Text="Clientes não selecionados" />
                                            </legend>
                                            <asp:GridView DataKeyNames="clienteId,clienteIdERP,clienteRazaoSocial,grupoId"
                                                runat="server"
                                                Width="100%"
                                                HorizontalAlign="Center"
                                                ID="gdvGrupoNaoSelecionado"
                                                AutoGenerateColumns="False"
                                                AllowPaging="True"
                                                OnPageIndexChanging="gdvGrupoNaoSelecionado_PageIndexChanging"
                                                OnRowDataBound="gdvGrupoNaoSelecionado_RowDataBound"
                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkAllGrupoNaoSel" AutoPostBack="true" OnCheckedChanged="chkAllGrupoNaoSel_CheckedChanged" runat="server" />
                                                        </HeaderTemplate>
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("clienteIdERP") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDescricao" runat="server" Text='<%# Eval("clienteRazaoSocial") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </fieldset>
                                    </div>

                                    <div style="width: 3%; display: table-cell;">
                                        <asp:Button ID="btnAdicionar" runat="server" Text=">" OnClick="btnAdcionarGrupo_Click" />
                                        <asp:Button ID="btnRemover" runat="server" Text="<" OnClick="btnRemoverGrupo_Click" />
                                    </div>

                                    <%--Grupos Selecionados --%>
                                    <div style="width: 45%; height: 100%; display: table-cell;">

                                        <asp:Label ID="lblfiltro_Grupo_selec_ClienteIdERP" runat="server" AssociatedControlID="txtfiltro_Grupo_selec_ClienteIdERP" Text="<%$ Resources:Resource, lblCodigoERP %>"></asp:Label>
                                        <asp:TextBox ID="txtfiltro_Grupo_selec_ClienteIdERP" onkeypress="javascript:return isNumber(event)" onfocus="LimparCamposRazao();" SkinID="Size70" runat="server"></asp:TextBox>
                                        <asp:Label ID="lblfiltro_Grupo_selec_clienteRazaoSocial" runat="server" AssociatedControlID="txtfiltro_Grupo_selec_clienteRazaoSocial" Text="<%$ Resources:Resource, lblRazaoSocialNome %>"></asp:Label>
                                        <asp:TextBox ID="txtfiltro_Grupo_selec_clienteRazaoSocial" onfocus="LimparCamposERP();" runat="server"></asp:TextBox>


                                        <asp:Button ID="btnFiltrarGrupoSelect" runat="server" Text="Filtrar" SkinID="ButtonLeftSave" OnClick="btnFiltrarGrupoSelect_Click" />
                                        <asp:Button ID="btnLimparGrupoSelect" runat="server" Text="Limpar" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnLimparGrupoSelect_Click" />
                                        <fieldset style="height: 100%; width: auto;">
                                            <legend>
                                                <asp:Literal ID="Literal2" runat="server" Text="Clientes  selecionados" />
                                            </legend>

                                            <asp:GridView DataKeyNames="clienteId,clienteIdERP,clienteRazaoSocial,grupoId"
                                                runat="server"
                                                CssClass="table table-bordered table-striped table-hover"
                                                Width="100%"
                                                HorizontalAlign="Center"
                                                ID="gdvGruposSelecionados"
                                                AutoGenerateColumns="False"
                                                AllowPaging="True"
                                                OnPageIndexChanging="gdvGruposSelecionados_PageIndexChanging"
                                                OnRowDataBound="gdvGruposSelecionados_RowDataBound"
                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkAllGrupoSel" AutoPostBack="true" OnCheckedChanged="chkAllGrupoSel_CheckedChanged" runat="server" />
                                                        </HeaderTemplate>
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCodigo" HeaderText="Código" runat="server" Text='<%# Eval("clienteIdERP") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Descrição">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDescricao" runat="server" Text='<%# Eval("clienteRazaoSocial") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </fieldset>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </asp:Panel>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa" Width="100%" Height="100%">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>
                        <asp:UpdatePanel ID="uppFiltros" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="imbFiltros" EventName="Click" />
                            </Triggers>
                            <ContentTemplate>
                                <div style="display: table; text-align: center; width: 99%;">
                                    <div style="width: 100%; margin-top: 10px;">
                                        <div style="width: 100%; background-color: #13213C; text-align: left;">
                                            <table style="width: auto;">
                                                <tr>
                                                    <td valign="middle">
                                                        <asp:ImageButton ID="imbFiltros" runat="server" Height="15px" Width="15px" ImageAlign="AbsMiddle"
                                                            ImageUrl="~/Imagens/Colapse.png"
                                                            ToolTip="<%$ Resources:Resource, lblContrair %>"
                                                            OnClick="imbFiltros_Click" />
                                                    </td>
                                                    <td valign="middle">
                                                        <asp:Label ID="lblFiltrosHeader" runat="server" SkinID="lblLastShowHide" Text="<%$ Resources:Resource, lblFiltros %>" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <asp:Panel ID="pnlFiltros" runat="server" SkinID="PnlMenu">
                                            <div style="display: table; text-align: center; width: 99%;">
                                                <div style="display: table; width: 100%;">

                                                    <div class="navegacao">
                                                        <div class="boxPesquisa">
                                                            <asp:Label ID="lblFiltroGrupoId" runat="server" />
                                                            <asp:TextBox ID="txtFiltroGrupoId" runat="server" SkinID="SmallFilter" TabIndex="3" />
                                                        </div>
                                                        <div class="boxPesquisa">
                                                            <asp:Label ID="lblFiltroGrupoDesc" runat="server" />
                                                            <asp:TextBox ID="txtFiltroGrupoDesc" runat="server" TabIndex="4" />
                                                        </div>

                                                        <div class="boxPesquisa">
                                                            <div class="line">
                                                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind"
                                                                    TabIndex="13" OnClick="btnFiltrosPesquisa_Click" />
                                                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenterClean"
                                                                    TabIndex="14" OnClick="btnFiltrosLimpar_Click" />
                                                                <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonRightCancel"
                                                                    TabIndex="15" OnClick="btnFiltrosNovoCadastro_Click" />
                                                                <asp:ImageButton ID="imbItensExportar" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                                                                    ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                                                                    ImageUrl="~/Imagens/xlsx.png" OnClick="imbItensExportar_Click" />
                                                            </div>

                                                        </div>
                                                        <div class="boxPesquisa">
                                                            <div style="float: left">
                                                                <asp:Button ID="btnExcluirSelecionados" Text="Excluir Selecionados" runat="server" SkinID="ButtonLeftFind"
                                                                    TabIndex="13" OnClick="btnExcluirSelecionados_Click" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="16"
                                DataKeyNames="grupoId,grupoDescricao,dataCadastro,usuarioId"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="20px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="checkAll" runat="server" OnCheckedChanged="checkAll_CheckedChanged" AutoPostBack="true"  />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="checkAnItem" runat="server" AutoPostBack="true"  OnCheckedChanged="checkAnItem_CheckedChanged" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="grupoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="grupoDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="dataCadastro" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Visualizar" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/find.png" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbExcluir" runat="server" CommandName="Excluir" SkinID="ImgGrid"
                                                ToolTip="Excluir" CommandArgument='<%# Eval("grupoId") + "|" + Eval("grupoDescricao") %>'
                                                ImageUrl="~/Imagens/Fechar.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    

</asp:Content>
