<%@ Page Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadConfigSiglaIntegracao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadConfigSiglaIntegracao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Scripts/jquery-3.1.0.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap-select.js" type="text/javascript"></script>

    <asp:UpdatePanel ID="updCadastro" runat="server">
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updCadastro">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <asp:Panel ID="pnlGrid" runat="server" Width="100%" Height="100%">

                <%-- PAINEL FILTROS --%>
                <asp:Panel ID="pnlFiltros" runat="server" Height="100%" DefaultButton="btnFiltrosPesquisa">
                    <div style="height:10px"></div>

                    <%-- BACKGROUND - BODY --%>
                    <div style="left: 0.5%; width: 99%; height: 20%;">
                        <fieldset style="left: 0.5%; width: 99%;" class="fieldset">

                            <legend class="legend">
                                Configuração Sigla Integração
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroSigla" runat="server" Text="Sigla" /><br />
                                        <asp:TextBox ID="txtFiltroSigla" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroSistemaEntrada" runat="server" Text="Sistema Entrada" />
                                        <asp:DropDownList ID="ddlFiltroSistemaEntrada" runat="server" SkinID="SmallFilter"></asp:DropDownList>
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroFabricante" runat="server" Text="Fabricante" /><br />
                                        <asp:TextBox ID="txtFiltroFabricante" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroSiglaNomeArquivo" runat="server" Text="Sigla Nome Arquivo" />
                                        <asp:TextBox ID="txtFiltroSiglaNomeArquivo" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <div class="line">
                                            <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnDefault"
                                                OnClick="btnFiltrosPesquisa_Click" Text="Pesquisar" />
                                            <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnDefault"
                                                OnClick="btnFiltrosLimpar_Click" Text="Limpar" />
                                            <asp:Button ID="btnFiltrosNovoCadastro" runat="server" SkinID="BtnDefault" Text="Novo"
                                                OnClick="btnFiltrosNovoCadastro_Click" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </fieldset>
                    </div>

                     <%-- GRID REGISTROS --%>
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                            <asp:GridView ID="grdConfigSiglaIntegracao" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                OnPageIndexChanging="grdConfigSiglaIntegracao_PageIndexChanging"
                                OnRowCommand="grdConfigSiglaIntegracao_RowCommand"
                                AutoGenerateColumns="False"
                                AllowPaging="True"
                                PageSize="10">
                                <Columns>
                                    <asp:BoundField DataField="configId" HeaderText="Config Id" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Sigla" HeaderText="Sigla" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="sistemaEntrada" HeaderText="Sistema Entrada" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="fabricanteId" HeaderText="Fabricante Id" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="fabricanteNomeAbreviado" HeaderText="Fabricante" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="SiglaNomeArquivo" HeaderText="Sigla Nome Arquivo" ItemStyle-HorizontalAlign="Center" />
                                    <asp:CheckBoxField DataField="BloqueiaPedido" HeaderText="Bloqueia Pedido" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:CheckBoxField DataField="AtendimentoParcial" HeaderText="Atendimento Parcial" ItemStyle-HorizontalAlign="Center" />
                                    <asp:CheckBoxField DataField="HabilitarValor" HeaderText="Habilitar Valor" ItemStyle-HorizontalAlign="Center" />
                                    <asp:CheckBoxField DataField="HabilitarDescBoleto" HeaderText="Habilitar Desconto Boleto" ItemStyle-HorizontalAlign="Center" />
                                    <asp:CheckBoxField DataField="PossuiCancelamento" HeaderText="Possui Cancelamento" ItemStyle-HorizontalAlign="Center" />
                                    <asp:CheckBoxField DataField="PossuiDevolucao" HeaderText="Possui Devolução" ItemStyle-HorizontalAlign="Center" />
                                    <asp:CheckboxField DataField="FaturarPara" HeaderText="Faturar Para" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server" CommandName="Atualizar" SkinID="ImgGrid"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>" CommandArgument='<%# Eval("configId")%>'
                                                ImageUrl="~/Imagens/find.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>

            </asp:Panel>

            <asp:Panel ID="pnlDados" runat="server">
                <asp:UpdatePanel ID="updDados" runat="server">
                    <ContentTemplate>
                        <div class="form-row">
                            <div class="col-lg-10"></div>
                            <div class="col-lg-2">
                                <asp:Button ID="btnSalvar" runat="server" SkinID="BtnDefault" Text="Salvar" OnClick="btnSalvar_Click" UseSubmitBehavior="false" />
                                <asp:Button ID="btnVoltar" runat="server" SkinID="BtnDefault" Text="Voltar" OnClick="btnVoltar_Click" UseSubmitBehavior="false" />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-md-12">
                                <fieldset>
                                    <legend>Configuração Sigla Integração</legend>

                                    <asp:HiddenField ID="hidConfigId" runat="server" />
                                    <asp:HiddenField ID="hidFabricanteId" runat="server" />

                                    <div class="form-group">
                                        <br />
                                        <label ID="lblSigla" runat="server" class="col-md-2 Label">Sigla</label>
                                        <asp:TextBox ID="txtSigla" runat="server" SkinID="Filtro" MaxLength="50" />
                                    </div>
                                    <div class="form-group">
                                        <br />
                                        <label ID="lblSistemaEntrada" runat="server" class="col-md-2 Label">Sistema Entrada</label>
                                        <asp:DropDownList ID="ddlSistemaEntrada" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <br />
                                        <label ID="lblFabricante" runat="server" class="col-md-2 Label">Fabricante Id</label>
                                        <asp:TextBox ID="txtFabricante" runat="server" SkinID="Filtro" Enabled="false"></asp:TextBox>
                                        <asp:ImageButton ID="imbFabricante" runat="server"
                                            ImageAlign="AbsMiddle" Width="16px" Height="16px"
                                            ImageUrl="~/Imagens/find.png"
                                            OnClick="imbFabricante_Click" />
                                    </div>
                                    <div class="form-group">
                                        <br />
                                        <label ID="lblSiglaNomeArquivo" runat="server" class="col-md-2 Label">Sigla Nome Arquivo</label>
                                        <asp:TextBox ID="txtSiglaNomeArquivo" runat="server" SkinID="Filtro"  MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 Label" >Bloqueia Pedido</label>
                                        <asp:CheckBox ID="chkBloqueiaPedido" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 Label">Atendimento Parcial</label>
                                        <asp:CheckBox ID="chkAtendimentoParcial" runat="server" />
                                    </div>                                            
                                    <div class="form-group">
                                        <label class="col-md-2 Label">Habilitar Valor</label>
                                        <asp:CheckBox ID="chkHabilitarValor" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 Label">Habilitar Desconto Boleto</label>
                                        <asp:CheckBox ID="chkHabilitarDescBoleto" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 Label">Possui Cancelamento</label>
                                        <asp:CheckBox ID="chkPossuiCancelamento" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 Label">Possui Devolução</label>
                                        <asp:CheckBox ID="chkPossuiDevolucao" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 Label">Faturar Para</label>
                                        <asp:CheckBox ID="chkFaturarPara" runat="server" />
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>

            <asp:Panel ID="pnlSelecionaFabricante" runat="server" Width="100%" Height="100%" Visible="false">
                <%-- PAINEL SELEÇÃO FABRICANTE --%>
                <asp:Panel ID="pnlFiltroFabricante" runat="server" Height="100%" DefaultButton="btnFiltrosPesquisaFabricante">
                    <div style="height:10px"></div>

                    <%-- Filtros --%>
                    <div style="left: 0.5%; width: 99%; height: 20%;">
                        <fieldset style="left: 0.5%; width: 99%;">

                            <legend>
                                Seleção de Fabricante
                            </legend>

                            <div style="display: table; width: 100%;">
                                <div class="navegacao">
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroFabricanteId" runat="server" Text="Fabricante Id" />
                                        <asp:TextBox ID="txtFiltroFabricanteId" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>
                                    <div class="boxPesquisaCurta">
                                        <asp:Label ID="lblFiltroFabricanteNome" runat="server" Text="Fabricante Nome" />
                                        <asp:TextBox ID="txtFiltroFabricanteNome" runat="server" MaxLength="30" SkinID="SmallFilter" />
                                    </div>
                                    <div class="boxPesquisa">
                                        <div class="line">
                                            <asp:Button ID="btnFiltrosPesquisaFabricante" runat="server" SkinID="BtnDefault"
                                                OnClick="btnFiltrosPesquisaFabricante_Click" Text="Pesquisar" />
                                            <asp:Button ID="btnFiltrosLimparFabricante" runat="server" SkinID="BtnDefault"
                                                OnClick="btnFiltrosLimparFabricante_Click" Text="Limpar" />
                                            <asp:Button ID="btnFiltrosFabricanteVoltar" runat="server" SkinID="BtnDefault"
                                                OnClick="btnFiltrosFabricanteVoltar_Click" Text="Voltar" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                    <%-- Grid Fabricante --%>
                    <div style="left: 0.5%; width: 100%; height: 80%; margin-top: 5px;">
                        <div style="width: 99%; margin-bottom: 5px; overflow-x: scroll;">
                            <asp:GridView ID="grdSelecaoFabricante" runat="server"
                                CssClass="table table-bordered table-striped table-hover"
                                OnPageIndexChanging="grdSelecaoFabricante_PageIndexChanging"
                                OnSelectedIndexChanged="grdSelecaoFabricante_SelectedIndexChanged"
                                AutoGenerateColumns="False"
                                AllowPaging="True"
                                PageSize="10">
                                <Columns>
                                    <asp:BoundField DataField="fabricanteId" HeaderText="Fabicante Id" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="fabricanteNomeAbreviado" HeaderText="Nome Abreviado" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="fabricanteNome" HeaderText="Nome" />
                                    <asp:CommandField ButtonType="Image" 
                                        SelectImageUrl="~/Imagens/check.png" 
                                        ShowSelectButton="true" 
                                        ControlStyle-Height="25px" 
                                        ControlStyle-Width="25px" 
                                        ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-VerticalAlign="Middle" />
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                <EmptyDataTemplate ><asp:Label ID="lblFabricanteVazio" runat="server" Text="Nenhum registro encontrado"></asp:Label></EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
