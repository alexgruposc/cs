<%@ Page Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadProdutoPrecoFastChannel.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadProdutoPrecoFastChannel" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-3.1.0.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="updPrincipal" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpload" />
            <%--<asp:PostBackTrigger ControlID="btnFiltrosPesquisa" />--%>
        </Triggers>
        <ContentTemplate>           
            <asp:Panel ID="pnlGrid" runat="server">
                <div style="height:10px"></div>

                <div style="left: 0.5%; width: 99%; height: 20%;">
                    <fieldset>
                        <legend>
                            Importação Preços B2C
                        </legend>
                        <div class="row">
                            <div class="col-md-4">
                                Período
                                <CtlPeriodo:ControlPeriodo ID="CtlPeriodoImportacao" runat="server"
                                    TabIndexDataInicio="1" TabIndexDataTermino="2"
                                    ShowHeaderLine="false" />
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                Código Produto
                                <asp:TextBox ID="txtFiltroCodigoProduto" runat="server" Style="width: 95%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaCurta">
                                Nome Produto
                                <asp:TextBox ID="txtFiltroNomeProduto" runat="server" Style="width: 95%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                Código Tabela Preço
                                <asp:TextBox ID="txtFiltroCodigoTabelaPreco" runat="server" Style="width: 95%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaCurta">
                                Nome Tabela Preço
                                <asp:TextBox ID="txtFiltroNomeTabelaPreco" runat="server" Style="width: 95%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="boxPesquisaMaisCurta">
                                Sucesso
                                <asp:DropDownList ID="dplFiltroResultado" runat="server" Style="width: 95%; max-width: 200px;">
                                    <asp:ListItem Text="Selecione..." Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Sucesso" Value="true"></asp:ListItem>
                                    <asp:ListItem Text="Falha" Value="false"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-right">
                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnInfo" Text="Pesquisar" OnClick="btnFiltrosPesquisa_Click" />&nbsp;
                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault" Text="Limpar" OnClick="btnFiltrosLimpar_Click" />&nbsp;
                                <asp:ImageButton ID="btnImportarExcel" runat="server" Height="25px" Width="25px"  OnClick="btnImportarExcel_Click" ImageAlign="AbsMiddle"
                                    ImageUrl="~/Imagens/ImportXLS.png" 
                                    ToolTip="Importar Excel" AlternateText="Importar Excel" />
                            </div>
                        </div>
                    </fieldset>
                </div>

                <fieldset class="pad-10">
                    <div class="gridRegistros">
                        <asp:GridView ID="grdRegistros" runat="server"
                            DataKeyNames="Codigo_Produto,Codigo_Tabela_Preco,Usuario,DataImportacao,Sucesso"
                            OnPageIndexChanging="grdRegistros_PageIndexChanging"
                            OnRowCommand="grdRegistros_RowCommand"
                            EmptyDataText="Não foi encontrado nenhum resultado!">
                            <Columns>
                                <asp:BoundField DataField="Codigo_Produto" HeaderText="Código Produto" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Nome_Produto" HeaderText="Nome Produto"/>
                                <asp:BoundField DataField="Codigo_Tabela_Preco" HeaderText="Código Tabela" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Nome_Tabela_Preco" HeaderText="Nome Tabela"/>
                                <asp:BoundField DataField="Preco_Lista" HeaderText="Preço Lista" ItemStyle-HorizontalAlign="Right"/>
                                <asp:BoundField DataField="Preco_Venda" HeaderText="Preço Venda" ItemStyle-HorizontalAlign="Right"/>
                                <asp:BoundField DataField="Usuario" HeaderText="Usuário" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="DataImportacao" HeaderText="Data Importação" DataFormatString="{0:dd/MM/yyyy HH:mm:ss.fff}" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Sucesso" HeaderText="Sucesso" ItemStyle-HorizontalAlign="Center"/>
                                <asp:TemplateField HeaderText="Visualizar" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnVisualizar" runat="server" CommandName="Visualizar" SkinID="ImgGrid"
                                            ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                            ImageUrl="~/Imagens/find.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </fieldset>

                <asp:Panel ID="pnlModalUpload" runat="server" Visible="false" CssClass="Modal">
                    <div class="OpacityBackGround" style="z-index: 0;"></div>
                    <div id="divUpdateProgress" class="ProgressBackGround" style="display: none">
                    </div>
                    <div id="divModal">
                        <div class="modal-dialog modal-md">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:ImageButton ID="btnModalUploadClose" CssClass="close" runat="server" ImageAlign="AbsMiddle" Width="25px"
                                        Height="25px" TabIndex="28" ImageUrl="~/Imagens/Fechar.png" OnClick="btnModalUploadClose_Click" />
                                    <h4 class="modal-title">
                                        <asp:Label ID="lblModalUpload" runat="server">Importar Arquivo Excel</asp:Label>
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <asp:FileUpload ID="fulArquivo" runat="server" />
                                    <asp:Button ID="btnUpload" runat="server" Text="Enviar Arquivo" SkinID="BtnSuccess" OnClick="btnUpload_Click" OnClientClick="document.getElementById('divUpdateProgress').style.display = 'initial';" />
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnModalUploadCancel" runat="server" Text="Cancelar" SkinID="BtnDanger" OnClick="btnModalUploadCancel_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="pnlDados" runat="server" Visible="false">

                    <ContentTemplate>
                        <div class="form-row">
                            <div class="col-md-10"></div>
                            <div class="col-md-2">
                                <asp:Button ID="btnDadosVoltar" runat="server" SkinID="BtnDefault" Text="Voltar" OnClick="btnDadosVoltar_Click" UseSubmitBehavior="False" CausesValidation="False" />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12">
                                <fieldset>
                                    <legend>Importação Preços B2C</legend>
                                    <div class="form-group">
                                        <label class="col-md-2">Código Produto</label>
                                        <asp:TextBox ID="txtCodigoProduto" runat="server" SkinID="Filtro" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2">Nome Produto</label>
                                        <asp:TextBox ID="txtNomeProduto" runat="server" SkinID="Filtro" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2">Código Tabela</label>
                                        <asp:TextBox ID="txtCodigoTabelaPreco" runat="server" SkinID="Filtro" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2">Nome Tabela</label>
                                        <asp:TextBox ID="txtNomeTabelaPreco" runat="server" SkinID="Filtro" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2">Preço Lista</label>
                                        <asp:TextBox ID="txtPrecoLista" runat="server" SkinID="Currency100" ReadOnly="true" ></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2">Preço Venda</label>
                                        <asp:TextBox ID="txtPrecoVenda" runat="server" SkinID="Currency100" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2">Usuário</label>
                                        <asp:TextBox ID="txtUsuario" runat="server" SkinID="Filtro" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2">Data Importação</label>
                                        <asp:TextBox ID="txtDataImportacao" runat="server" SkinID="Filtro" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2">Sucesso</label>
                                        <asp:TextBox ID="txtSucesso" runat="server" SkinID="Filtro" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2">Retorno</label>
                                        <div class="col-md-10">
                                            <textarea id="txaRetorno" runat="server" readonly="readonly" rows="12" cols="100" style="width:100%;resize:none"></textarea>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </ContentTemplate>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <%-- PROGRESS BACKGROUND --%>
    <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updPrincipal">
        <ProgressTemplate>
            <div class="ProgressBackGround"></div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
