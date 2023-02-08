<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"
    CodeBehind="CadPerfilAcesso.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadPerfilAcesso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">

        function ValidaCheck(pnl1, msg) {
            var pnl = document.getElementById(pnl1);
            var chklst = pnl.getElementsByTagName("input");
            var chkCount = 0;

            for (var i = 0; i < chklst.length; i++) {
                if (chklst[i].type == 'checkbox') {
                    if (chklst[i].checked) {
                        ++chkCount;
                    }
                }
            }

            if (chkCount == 0) {
                window.alert(msg);

                if (window.event) {
                    event.returnValue = false;
                } else return false;
            }
        }

    </script>

    <asp:Panel ID="pnlCadastroPerfilAcesso" runat="server">
        <asp:UpdatePanel ID="uppCadastroPerfilAcesso" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroPerfilAcesso">
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

                        <br />
                        <div class="alert_bottom_button">
                            <ol>
                                <li>
                                    <asp:Label ID="lblDadosPerfilAcessoId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosPerfilAcessoId" runat="server" MaxLength="30" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDadosPerfilAcessoDescricao" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDadosPerfilAcessoDescricao" runat="server" MaxLength="50" TabIndex="2" />
                                </li>

                                <div style="display: none">
                                    <li>
                                        <div style="margin-left: 150px;">
                                            <asp:Label ID="lblDadosPerfilAcessoHeader" runat="server" SkinID="LabelFormPedido" />
                                            <hr />
                                        </div>
                                    </li>
                                    <li>
                                        <div style="margin-left: 150px;">
                                            <asp:CheckBox ID="chkDadosPerfilAcessoCadastro" runat="server" Font-Bold="true" TabIndex="3" Text="<%$ Resources:Resource, lblCadastro %>" />
                                        </div>
                                    </li>
                                    <li>
                                        <div style="margin-left: 150px;">
                                            <asp:CheckBox ID="chkDadosPerfilAcessoApoio" runat="server" Font-Bold="true" TabIndex="4" Text="<%$ Resources:Resource, lblApoio %>" />
                                        </div>
                                    </li>
                                    <li>
                                        <div style="margin-left: 150px;">
                                            <asp:CheckBox ID="chkDadosPerfilAcessoFinanceiro" runat="server" Font-Bold="true" TabIndex="5" Text="<%$ Resources:Resource, lblFinanceiro %>" />
                                        </div>
                                    </li>
                                    <li>
                                        <div style="margin-left: 150px;">
                                            <asp:CheckBox ID="chkDadosPerfilAcessoFiscal" runat="server" Font-Bold="true" TabIndex="6" Text="<%$ Resources:Resource, lblFiscal %>" />
                                        </div>
                                    </li>
                                    <br />
                                    <br />
                                </div>

                            </ol>
                            <br />
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="7" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="8" SkinID="ButtonRight" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" TabIndex="9" SkinID="ButtonRight" OnClick="btnLimpar_Click" />
                            </div>
                        </div>
                        <br />
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
                                <div class="OpacityBackGround"></div>
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
                                                    <asp:Label ID="lblConfirmarPerfilAcessoId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPerfilAcessoIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarPerfilAcessoDescricao" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPerfilAcessoDescricaoTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <%-- <li>
                                                    <asp:Label ID="lblConfirmarPerfilAcessoCadastro" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPerfilAcessoCadastroTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarPerfilAcessoApoio" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPerfilAcessoApoioTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarPerfilAcessoFinanceiro" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPerfilAcessoFinanceiroTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblConfirmarPerfilAcessoFiscal" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarPerfilAcessoFiscalTexto" runat="server" SkinID="LabelResposta" />
                                                </li>--%>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="10" OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="11" OnClick="btnConfirmarNo_Click" />
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
                                <asp:Label ID="lblFiltrosPerfilAcessoId" runat="server" />
                                <asp:TextBox ID="txtFiltrosPerfilAcessoId" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="12" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltrosPerfilAcessoDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltrosPerfilAcessoDescricao" runat="server" SkinID="Filtro" MaxLength="50" TabIndex="13" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="14" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonCenter" TabIndex="15" OnClick="btnFiltrosLimpar_Click" />
                                    <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="ButtonRight" TabIndex="16" OnClick="btnFiltrosNovoCadastro_Click" />
                                    <asp:Button ID="btnFiltrosExcluir" runat="server" SkinID="ButtonRight" TabIndex="17" OnClick="btnFiltrosExcluir_Click" />
                                </div>
                            </div>
                        </div>

                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="20"
                                DataKeyNames="perfilAcessoId,perfilAcessoDescricao,perfilAcessoWFCadastro,perfilAcessoWFApoio,perfilAcessoWFFinanceiro,perfilAcessoWFFiscal"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging" OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound" OnRowDeleting="gvRegistros_RowDeleting"
                                OnRowUpdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPerfilAcessoId" runat="server" Text='<%# FormataStringSaida(Eval("perfilAcessoId"), txtFiltrosPerfilAcessoId.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPerfilAcessoDescricao" runat="server" Text='<%# FormataStringSaida(Eval("perfilAcessoDescricao"), txtFiltrosPerfilAcessoDescricao.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="100px" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPerfilAcessoCadastro" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="100px" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPerfilAcessoApoio" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="100px" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPerfilAcessoFinanceiro" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="100px" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrPerfilAcessoFiscal" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Update" Width="25px" Height="25px"
                                                CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>"
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
                    <asp:Panel ID="pnlExclusao" runat="server" Visible="false">
                        <div class="OpacityBackGround"></div>
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
                                        <asp:Button ID="btnExclusaoYes" runat="server" SkinID="ButtonLeft" TabIndex="18" OnClick="btnExclusaoYes_Click" />
                                    </div>
                                    <div class="alert_bottom_button_right">
                                        <asp:Button ID="btnExclusaoNo" runat="server" SkinID="ButtonRight" TabIndex="19" OnClick="btnExclusaoNo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <%-- VALIDATION --%>
                <asp:RequiredFieldValidator ID="rfvPerfilAcessoId" runat="server" ControlToValidate="txtDadosPerfilAcessoId" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:RequiredFieldValidator ID="rfvPerfilAcessoDescricao" runat="server" ControlToValidate="txtDadosPerfilAcessoDescricao" Display="None" SetFocusOnError="true" Text="*" ValidationGroup="Validacao" />
                <asp:ValidationSummary ID="vsValidacao" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Validacao" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
