<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadFormaPagamentoGalderma.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadFormaPagamentoGalderma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_initializeRequest(InitializeRequest);
        prm.add_endRequest(EndRequest);
        var postBackElement;

        function InitializeRequest(sender, args) {
            if (prm.get_isInAsyncPostBack()) {
                args.set_cancel(true);
            }

            postBackElement = args.get_postBackElement();

            if (postBackElement == undefined)
                return;
        }

        function EndRequest(sender, args) {

            if (postBackElement == undefined)
                return;
        }
    </script>
    <asp:Panel ID="pnlCadastroItem" runat="server">
        <asp:UpdatePanel ID="uppCadastroItem" runat="server">
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroItem">
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
                                    <asp:Label ID="lblId" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtId" Enabled="false" runat="server" MaxLength="30" TabIndex="5" />
                                </li>
                                <li>
                                    <asp:Label ID="lblDescricao" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtDescricao" Enabled="false" runat="server" MaxLength="30" TabIndex="5" />
                                </li>
                                <li>
                                    <asp:Label ID="lblCondicaoPagamento" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="cmbCondicaoPagamento" Enabled="true" runat="server" MaxLength="30" TabIndex="5" />
                                </li>
                            </ol>
                            <div class="line">
                                <asp:Button ID="btnSalvar" runat="server" TabIndex="14" SkinID="ButtonLeft" ValidationGroup="Validacao" OnClick="btnSalvar_Click" />
                                <asp:Button ID="btnBuscar" runat="server" TabIndex="15" SkinID="ButtonCenter" OnClick="btnBuscar_Click" />
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
                                                    <asp:Label ID="lblConfirmarDadosItemId" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemIdTexto" runat="server" SkinID="LabelResposta" />
                                                </li>

                                                <li>
                                                    <asp:Label ID="lblConfirmarDadosItemInfoComplementar" runat="server" SkinID="LabelForm" />
                                                    <asp:Label ID="lblConfirmarDadosItemInfoComplementarTexto" runat="server" SkinID="LabelResposta" />
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="17" OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="18" OnClick="btnConfirmarNo_Click" />
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
                                <asp:Label ID="lblFiltrosId" Text="Forma:" runat="server" />
                                <asp:TextBox ID="txtFiltrosForma" Enabled="true" SkinID="Filtro" runat="server" MaxLength="30" TabIndex="4" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="Label1" Text="Condição:" runat="server" />
                                <asp:DropDownList ID="ddlFiltrosCondicao" Enabled="true" SkinID="Filtro" runat="server" MaxLength="30" TabIndex="5" />
                            </div>

                        </div>
                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeft" TabIndex="26" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRight" TabIndex="27" OnClick="btnFiltrosLimpar_Click" />
                                </div>
                            </div>
                        </div>

                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="32"
                                DataKeyNames="Id,Descricao,condicaoPagamentoId,condicaoPagamentoDescricao"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowCommand="gvRegistros_RowCommand"
                                OnRowDataBound="gvRegistros_RowDataBound">
                                <Columns>

                                    <asp:BoundField DataField="Id" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />

                                    <asp:BoundField DataField="Descricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" ItemStyle-Wrap="true" />

                                    <asp:BoundField DataField="condicaoPagamentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />

                                    <asp:BoundField DataField="condicaoPagamentoDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Alterar" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                                ImageUrl="~/Imagens/find.png" />
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
