<%@ Page Title="Configuração de Parametros" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadConfigParametros.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadConfigParametros" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
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

    <h3 class="colorAzulKs">Configuração de Parametros</h3>

    <!--  *******************************  PESQUISA E SELEÇÃO  *******************************  -->
    <asp:UpdatePanel ID="updSelecao" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="imbExportarExcel" />
        </Triggers>
        <ContentTemplate>

            <div class="pad-5 mt-2">

                <div>
                    <fieldset class="pad-10">
                        <div class="row">
                            <div class="col-md-4">
                                Selecionar Parametro:<br />
                                <asp:DropDownList ID="ddw_selDescricaoId" Style="width: auto; max-width: 94%" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                Selecionar Valor:<br />
                                <asp:TextBox ID="txt_SelValor" Style="width: 120px; max-width: 94%" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 text-right">
                                <asp:Button ID="btn_Selecionar" runat="server" Text="Pesquisar" OnClick="btn_Selecionar_Click" SkinID="BtnInfo" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="btn_LimparSel" runat="server" Text="Limpar" OnClick="btn_LimparSel_Click" SkinID="BtnDefault" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="btn_IncluirParametros" runat="server" Text="Incluir Parametros" OnClick="btn_IncluirParametros_Click" SkinID="BtnInfo" UseSubmitBehavior="false" />
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div class="pad-5 mt-2">
                    <div class="row">
                        <div class="col-md-9">
                            <h4 style="color: #ff6a00">
                                <asp:Localize ID="lbl_grv_SelParametroInfo" runat="server" /></h4>
                        </div>
                        <div class="col-md-3 text-right">
                            <asp:ImageButton ID="imbExportarExcel" ImageUrl="../../Imagens/xlsx.png" runat="server" OnClick="imbExportarExcel_Click" ToolTip="Exportar para Excel" Style="width: auto; height: 38px" />
                        </div>
                    </div>
                </div>

                <div class="mt-2">
                    <asp:GridView ID="grv_SelParametro" runat="server" DataKeyNames="parametroId"
                        AutoGenerateColumns="false" AllowPaging="true" PageSize="50"
                        OnPageIndexChanging="grv_SelParametro_PageIndexChanging" OnRowCommand="grv_SelParametro_RowCommand"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="Descricao" HeaderText="Descrição" ItemStyle-Width="50%" />
                            <asp:BoundField DataField="parametroTipo" HeaderText="Tipo" ItemStyle-Width="20%" />
                            <asp:BoundField DataField="parametroValor" HeaderText="Valor" ItemStyle-Width="20%" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Excluir" ItemStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbExcluir" runat="server" CommandName="Excluir" Width="20px" Height="20px"
                                        ToolTip="Excluir" ImageUrl="~/Imagens/Fechar.png" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                    </asp:GridView>

                    <div class="text-center">
                        <asp:Localize ID="lbl_grv_SelParametro_PageInfo" runat="server" />
                    </div>
                </div>

            </div>


        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  *******************************  EDITOR  *******************************  -->

    <%----%>
    <asp:UpdatePanel ID="updEditor" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel_Editor" runat="server" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel">
                    <div class="painel_header">
                        <div style="padding: 10px; color: #ffffff">
                            <h3>Inclusão de Valores de Parametros</h3>
                        </div>

                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imgFecharEditor" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" OnClick="imgFecharEditor_Click"
                                ToolTip="Fechar" ImageUrl="~/Imagens/Fechar.png" />
                        </div>
                    </div>

                    <div class="painel_body">
                        <div class="mt-3" style="width: 96%; margin: auto;">

                            <div class="row">
                                <div class="col-md-6">
                                    Selecionar Parametro:<br />
                                    <asp:DropDownList ID="ddw_DescricaoId" Style="width: auto; max-width: 94%" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    Incluir Valor:&nbsp;
                                <asp:TextBox ID="txt_parametroValor" runat="server" Style="width: 30%; max-width: 120px"></asp:TextBox>
                                    &nbsp;
                                <asp:Button ID="btn_Gravar" runat="server" Text="Incluir" OnClick="btn_Gravar_Click" SkinID="BtnSuccess" UseSubmitBehavior="false" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
