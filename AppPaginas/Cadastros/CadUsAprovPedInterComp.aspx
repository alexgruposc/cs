<%@ Page Title="Cadastro de Aprovadores de Pedido Intercompany" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadUsAprovPedInterComp.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadUsAprovPedInterComp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .GridView td {
            text-align: center;
        }

        table.table-striped td {
            text-align: center;
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

    <fieldset class="pad-5 mt-2">
        <legend>Cadastro de Aprovadores de Pedido Intercompany</legend>

        <div class="row mt-2">

            <!--  *********************************  COLUNA 1 - USUARIOS ONCOPROD  *********************************  -->
            <div class="col-md-6">
                <asp:UpdatePanel runat="server" ID="updColUsOncoprod">
                    <ContentTemplate>
                        <fieldset>
                            <legend>Usuários Oncoprod</legend>
                            <div class="row pad-5 mb-3">
                                <!-- Filtro -->
                                       <div class="col-md-3">
                                    Pesquisar ID:<br />
                                    <asp:TextBox ID="txtUsuarioId" runat="server" MaxLength="30" Style="width: 70%; max-width: 220px;"></asp:TextBox>
                                </div>
                                <div class="col-md-5">
                                    Pesquisar Nome:<br />
                                    <asp:TextBox ID="txt_SelUsuario" runat="server" MaxLength="30" Style="width: 70%; max-width: 220px;"></asp:TextBox>
                                </div>
                                <div class="col-md-4 text-right">
                                    <asp:Button ID="btnSelUsuario" runat="server" Text="Pesquisar" SkinID="BtnDefault-sm" OnClick="btnSelUsuario_Click" />&nbsp;
                                    <asp:Button ID="btnSelUsTodos" runat="server" Text="Limpar" SkinID="BtnDefault-sm" OnClick="btnSelUsTodos_Click" />
                                </div>
                            </div>
                            <asp:Localize ID="lblMsggvUsuarios" runat="server"></asp:Localize>
                            <div style="clear: both"><span style="margin-top: 5px"></span></div>
                            <div class="pad-5">
                                <!-- Grid -->
                                <asp:GridView DataKeyNames="usuarioId, PedidoSituacao"
                                    runat="server"
                                    ID="gvUsuarios"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvUsuarios_PageIndexChanging"
                                    OnRowDataBound="gvUsuarios_RowDataBound"
                                    OnRowCommand="gvUsuarios_RowCommand"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:BoundField DataField="usuarioId" HeaderText="ID" ItemStyle-Width="35%" />
                                        <asp:BoundField DataField="usuarioNome" HeaderText="Usuário" ItemStyle-Width="35%" />
                                        <asp:BoundField DataField="usuarioTipoDescricao" HeaderText="Tipo" ItemStyle-Width="15%" />
                                        <asp:BoundField DataField="PedidoSituacao" HeaderText="Status Pedido" ItemStyle-Width="15%" />
                                        <asp:TemplateField HeaderText="Autorização" ItemStyle-Width="35%">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlPedidoSituacao" runat="server" Style="width: auto; margin-bottom: 3px" />
                                                <asp:Button ID="btnAutorizUsuario" runat="server" Text="Autorizar" CommandName="Autorizar" SkinID="BtnDefault-xs"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                                <asp:Button ID="btnConfirmUsuario" runat="server" Text="Confirmar" CommandName="Confirmar" SkinID="BtnSuccess-xs"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvUsuariosPageInfo" runat="server"></asp:Localize>
                                </div>

                            </div>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


            <!--  *********************************  COLUNA 2 - USUARIOS AUTORIZADOS  *********************************  -->
            <div class="col-md-6">
                <asp:UpdatePanel runat="server" ID="updColUsAutoriz">
                    <ContentTemplate>
                        <fieldset>
                            <legend>Usuários Autorizados</legend>
                            <div class="row pad-5 mb-3">
                                <!-- Filtro -->
                                <div class="col-md-2">
                                    ID:<br />
                                    <asp:TextBox ID="txt_SelUsAutorizID" runat="server" MaxLength="30" Style="width: 100%; max-width: 220px;"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    Nome:<br />
                                    <asp:TextBox ID="txt_SelUsAutorizNome" runat="server" MaxLength="30" Style="width: 100%; max-width: 220px;"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    Tipo:<br />
                                    <asp:DropDownList ID="ddl_SelUsAutorizTipo" runat="server" Style="width: 100%; max-width: 220px;"></asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    Status Pedido:<br />
                                    <asp:DropDownList ID="ddl_SelUsAutorizStatus" runat="server" Style="width: 100%; max-width: 220px;"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btnSelUsAutoriz" runat="server" Text="Pesquisar" SkinID="BtnDefault-sm" OnClick="btnSelUsAutoriz_Click" />&nbsp;
                                    <asp:Button ID="btnSelUsAutorizTodos" runat="server" Text="Limpar" SkinID="BtnDefault-sm" OnClick="btnSelUsAutorizTodos_Click" />
                                </div>
                            </div>
                            <div class="pad-5">
                                <!-- Grid -->
                                <!-- , usuarioNome, usuarioTipoDescricao, PedidoSituacao -->
                                <asp:GridView DataKeyNames="usuarioId"
                                    runat="server"
                                    ID="gvUsAutorizados"
                                    AllowPaging="True"
                                    SkinID="GridViewTable"
                                    OnPageIndexChanging="gvUsAutorizados_PageIndexChanging"
                                    OnRowDataBound="gvUsAutorizados_RowDataBound"
                                    OnRowCommand="gvUsAutorizados_RowCommand"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:BoundField DataField="usuarioId" HeaderText="ID" />
                                        <asp:BoundField DataField="usuarioNome" HeaderText="Usuário" />
                                        <asp:BoundField DataField="usuarioTipoDescricao" HeaderText="Tipo" />
                                        <asp:BoundField DataField="PedidoSituacao" HeaderText="Status Pedido" />
                                        <asp:TemplateField HeaderText="Autorização">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgDesautoriz" runat="server" CommandName="Desautorizar" ToolTip="Desautorizar Usuário"
                                                    ImageUrl="~/Imagens/Fechar.png" Width="25px" Height="25px"
                                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="center">
                                    <asp:Localize ID="lblgvUsAutorizadosPageInfo" runat="server"></asp:Localize>
                                </div>
                            </div>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>
    </fieldset>

</asp:Content>
