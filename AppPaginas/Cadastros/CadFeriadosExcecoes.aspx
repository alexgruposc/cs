<%@ Page Title="Cadastro de Exceções para Feriados" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadFeriadosExcecoes.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadFeriadosExcecoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../../Styles/font-awesome.css" rel="Stylesheet" type="text/css" />

    <style type="text/css">
        .colorAzulKs {
            color: #14293e;
        }

        .colorLaranja {
            color: #ff5500;
        }

        p.fa {
            margin: 0px;
            /* color: #0000dd; */
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

    <h3 class="colorAzulKs">Configuração de Clientes com Exceção</h3>

    <asp:UpdatePanel ID="UpdConfigClientes" runat="server">
        <ContentTemplate>

            <div class="row mt-2">

                <!-- ============================================================================ -->
                <!-- COLUNA ESQUERDA -->
                <div class="col-md-6">
                    <fieldset>
                        <legend>Clientes SEM Exceção em Feriados</legend>
                        <div class="row pad-5">
                            <div class="col-md-8">
                                Filtrar:&nbsp;
                            <asp:TextBox ID="txt_SelClienteLista" runat="server" Style="width: 70%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btn_SelClienteLista" runat="server" SkinID="BtnInfo-sm" Text="Pesquisar" OnClick="btn_SelClienteLista_Click" />
                                &nbsp;
                            <asp:Button ID="btn_LimparSelClienteLista" runat="server" SkinID="BtnDefault-sm" Text="Limpar" OnClick="btn_LimparSelClienteLista_Click" />
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="pad-5">
                            <h4 class="colorLaranja">
                                <asp:Localize ID="lbl_gvClienteListaInfo" runat="server"></asp:Localize></h4>
                        </div>
                        <div class="pad-5">
                            <asp:GridView DataKeyNames="clienteId"
                                runat="server"
                                ID="gvClienteLista"
                                AutoGenerateColumns="False"
                                AllowPaging="True"
                                SkinID="GridViewTable"
                                OnPageIndexChanging="gvClienteLista_PageIndexChanging"
                                OnRowCommand="gvClienteLista_RowCommand"
                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                <Columns>
                                    <asp:BoundField DataField="clienteId" HeaderText="ID" ItemStyle-Width="15%" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="ID ERP" ItemStyle-Width="15%" />
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" ItemStyle-Width="60%" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="lnk_Incluir" runat="server" ToolTip="Incluir nas Exceções"
                                                CommandName="Incluir" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'><p class="fa fa-arrow-right fa-2x" style="color: #00dd00"></p></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                            </asp:GridView>
                            <div class="center">
                                <asp:Localize ID="lbl_gvClienteListaPageInfo" runat="server"></asp:Localize>
                            </div>
                        </div>
                    </fieldset>
                </div>

                <!-- ============================================================================ -->
                <!-- COLUNA DIREITA -->
                <div class="col-md-6">
                    <fieldset>
                        <legend>Clientes COM Exceção em Feriados</legend>
                        <div class="row pad-5">
                            <div class="col-md-8">
                                Filtrar:&nbsp;
                            <asp:TextBox ID="txt_SelExcecaoCliente" runat="server" Style="width: 70%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btn_SelExcecaoCliente" runat="server" SkinID="BtnInfo-sm" Text="Pesquisar" OnClick="btn_SelExcecaoCliente_Click" />
                                &nbsp;
                            <asp:Button ID="btn_LimparSelExcecaoCliente" runat="server" SkinID="BtnDefault-sm" Text="Limpar" OnClick="btn_LimparSelExcecaoCliente_Click" />
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="pad-5">
                            <h4 class="colorLaranja">
                                <asp:Localize ID="lbl_gvExcecaoClienteInfo" runat="server"></asp:Localize></h4>
                        </div>
                        <div class="pad-5">
                            <asp:GridView DataKeyNames="ClienteId"
                                runat="server"
                                ID="gvExcecaoCliente"
                                AutoGenerateColumns="False"
                                AllowPaging="True"
                                SkinID="GridViewTable"
                                OnPageIndexChanging="gvExcecaoCliente_PageIndexChanging"
                                OnRowCommand="gvExcecaoCliente_RowCommand"
                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                <Columns>
                                    <asp:BoundField DataField="ClienteId" HeaderText="ID" ItemStyle-Width="15%" />
                                    <asp:BoundField DataField="clienteIdERP" HeaderText="ID ERP" ItemStyle-Width="15%" />
                                    <asp:BoundField DataField="clienteRazaoSocial" HeaderText="Cliente" ItemStyle-Width="60%" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk_Excluir" runat="server" ToolTip="Excluir das Exceções"
                                                CommandName="Excluir" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'><p class="fa fa-times fa-2x" style="color: #ee0000"></p></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                            </asp:GridView>
                            <div class="center">
                                <asp:Localize ID="lbl_gvExcecaoClientePageInfo" runat="server"></asp:Localize>
                            </div>
                        </div>
                    </fieldset>
                </div>

                <!-- ============================================================================ -->

            </div>

            <div style="clear: both; height: 10px"></div>

            <div style="height: 20px"></div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
