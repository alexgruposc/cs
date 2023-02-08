<%@ Page Title="Configuração de Convenios Epharma com CFOP" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CfgConvenioEpharmaCFOP.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CfgConvenioEpharmaCFOP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../../Styles/font-awesome.css" rel="Stylesheet" type="text/css" />

    <style type="text/css">
        .colorAzulKs {
            color: #14293E;
        }

        .GridPager a {
            margin: 3px;
            color: #ffffff;
        }

            .GridPager a:hover, .GridPager a:active {
                color: #00ffff;
            }

            .GridPager a:visited {
                color: #e4e4e4;
            }

        .GridPager td, .GridPager span {
            margin: 3px;
            color: #00ffff;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="colorAzulKs">Configuração Epharma - Convênios com CFOP</h2>

    <asp:UpdatePanel ID="UpdatePanelGeral" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_RelatorioGeral" />
        </Triggers>
        <ContentTemplate>
            <fieldset class="pad-10 text-right">
                <asp:Button ID="btn_RelatorioGeral" runat="server" SkinID="BtnInfo" Text="Relatório Geral (Excel)" OnClick="btn_RelatorioGeral_Click" />
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updConfig" runat="server">
        <ContentTemplate>

            <div class="pad-5 mt-2">
                <!-- 
                <div>
                    <fieldset class="center pad-5">
                        <div class="row">
                            <div class="col-md-8">(label com nome do convenio)</div>
                            <div class="col-md-4">(botão para salvar)</div>
                        </div>
                    </fieldset>
                </div>-->

                <div class="row mt-2">
                    <!-- ====================================================================== -->
                    <!--  COLUNA ESQUERDA  -->
                    <div class="col-md-6">

                        <fieldset>
                            <legend>Selecionar o Convênio
                            </legend>

                            <div class="row pad-5">
                                <div class="col-md-6">
                                    Convênio:<br />
                                    <asp:TextBox ID="txt_SelConvenio" runat="server" MaxLength="50" placeholder="Código ou nome do convênio" Style="width: 95%; max-width: 220px" />
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="btn_SelConvenioNome" runat="server" SkinID="BtnInfo-sm" Text="Procurar" OnClick="btn_SelConvenioNome_Click" />&nbsp;
                                    <asp:Button ID="btn_SelConvenioTodos" runat="server" SkinID="BtnInfo-sm" Text="Todos" OnClick="btn_SelConvenioTodos_Click" />&nbsp;
                                    <asp:Button ID="btn_SelConvenioLimpar" runat="server" SkinID="BtnDefault-sm" Text="Limpar" OnClick="btn_SelConvenioLimpar_Click" />&nbsp;
                                </div>
                            </div>

                            <div class="pad-10 mt-2">
                                <!--
                                CodigoConvenio	NomeConvenio	TipoReceita	TipoConvenio	TipoTabelaPreco	estabelecimentoId
                                -->

                                <asp:GridView DataKeyNames="CodigoConvenio, NomeConvenio"
                                    runat="server"
                                    ID="gvSelConvenio"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvSelConvenio_PageIndexChanging"
                                    OnRowCommand="gvSelConvenio_RowCommand"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnk_editarConvenio" runat="server" CommandName="EditarConvenio" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'>
                                                <p class="fa fa-edit fa-2x text-info" style="margin:0px; padding:0px"></p></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CodigoConvenio" HeaderText="Código" />
                                        <asp:BoundField DataField="NomeConvenio" HeaderText="Convênio" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lbl_gvSelConvenioPageInfo" runat="server"></asp:Localize>
                                </div>

                            </div>
                        </fieldset>

                    </div>

                    <!-- ====================================================================== -->
                    <!--  COLUNA DIREITA  -->
                    <div class="col-md-6">
                        <fieldset>
                            <legend>CFOPs Atribuidas
                            </legend>
                            <div class="row pad-5">
                                <div class="col-md-8">
                                    <h2 class="text-info">
                                        <asp:Localize ID="lbl_InfoEditConvenio" runat="server"></asp:Localize></h2>
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btn_Salvar" runat="server" Text="Gravar Configuração" SkinID="BtnSuccess" OnClick="btn_Salvar_Click" />
                                </div>
                            </div>

                            <div style="min-height: 6px"></div>

                            <div class="pad-10 mt-2">

                                <!-- tipoPedidoId	tipoPedidoDescricao	tipoPedidoTriangular	tipoPedidoSiglaId	tipoPedidoAgrupadorId	tipoPedidoAgrupadorDescricao -->
                                <asp:GridView DataKeyNames="tipoPedidoId, Selected"
                                    runat="server"
                                    ID="gvTipoPedido"
                                    AutoGenerateColumns="False"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvTipoPedido_PageIndexChanging"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelTipoPedido" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelTipoPedido_CheckedChanged" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="tipoPedidoId" HeaderText="Código" />
                                        <asp:BoundField DataField="tipoPedidoDescricao" HeaderText="Descrição" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lbl_gvTipoPedidoPageInfo" runat="server"></asp:Localize>
                                </div>

                            </div>

                        </fieldset>
                    </div>

                    <!-- ====================================================================== -->

                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
