<%@ Page Title="Condição de Pagamento - Config. Isenção de Frete" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadCondPagtoIsencaoFrete.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadCondPagtoIsencaoFrete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .colorAzulKs {
            color: #14293e;
        }

        .colorLaranja {
            color: #ff5500;
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

    <h3 class="colorAzulKs">Condição de Pagamento - Config. Isenção de Frete</h3>

    <asp:UpdatePanel ID="UpdGeral" runat="server">
        <ContentTemplate>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="UpdEditor" runat="server">
        <ContentTemplate>

            <div class="row mt-2">

                <!-- ============================================================================ -->
                <!-- COLUNA ESQUERDA -->
                <div class="col-md-6">
                    <fieldset>
                        <legend>Condições de Pagamento SEM Isenção de Frete</legend>
                        <div class="row pad-5">
                            <div class="col-md-8">
                                Filtrar:&nbsp;
                            <asp:TextBox ID="txt_SelCondPagto" runat="server" Style="width: 70%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btn_SelCondPagto" runat="server" SkinID="BtnInfo-sm" Text="Pesquisar" OnClick="btn_SelCondPagto_Click" />
                                &nbsp;
                            <asp:Button ID="btn_LimparSelCondPagto" runat="server" SkinID="BtnDefault-sm" Text="Limpar" OnClick="btn_LimparSelCondPagto_Click" />
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="pad-5">
                            <h4 class="colorLaranja"><asp:Localize ID="lbl_gvCondPagtoInfo" runat="server"></asp:Localize></h4>
                        </div>
                        <div class="pad-5">
                            <asp:GridView DataKeyNames="condicaoPagamentoId"
                                runat="server"
                                ID="gvCondPagto"
                                AutoGenerateColumns="False"
                                AllowPaging="True"
                                SkinID="GridViewTable"
                                OnPageIndexChanging="gvCondPagto_PageIndexChanging"
                                OnRowCommand="gvCondPagto_RowCommand"
                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                <Columns>
                                    <asp:BoundField DataField="condicaoPagamentoId" HeaderText="ID" ItemStyle-Width="20%" />
                                    <asp:BoundField DataField="condicaoPagamentoDescricao" HeaderText="Descrição" ItemStyle-Width="65%" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbIncluir" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/arrow.png"
                                                CommandName="Incluir" ToolTip="Isentar" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                            </asp:GridView>
                            <div class="center">
                                <asp:Localize ID="lbl_gvCondPagtoPageInfo" runat="server"></asp:Localize>
                            </div>
                        </div>
                    </fieldset>
                </div>

                <!-- ============================================================================ -->
                <!-- COLUNA DIREITA -->
                <div class="col-md-6">
                    <fieldset>
                        <legend>Condições de Pagamento COM Isenção de Frete</legend>
                        <div class="row pad-5">
                            <div class="col-md-8">
                                Filtrar:&nbsp;
                            <asp:TextBox ID="txt_SelIsencaoFrete" runat="server" Style="width: 70%; max-width: 200px;"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btn_SelIsencaoFrete" runat="server" SkinID="BtnInfo-sm" Text="Pesquisar" OnClick="btn_SelIsencaoFrete_Click" />
                                &nbsp;
                            <asp:Button ID="btn_LimparSelIsencaoFrete" runat="server" SkinID="BtnDefault-sm" Text="Limpar" OnClick="btn_LimparSelIsencaoFrete_Click" />
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="pad-5">
                            <h4 class="colorLaranja"><asp:Localize ID="lbl_gvIsencaoFreteInfo" runat="server"></asp:Localize></h4>
                        </div>
                        <div class="pad-5">
                            <asp:GridView DataKeyNames="condicaoPagamentoId"
                                runat="server"
                                ID="gvIsencaoFrete"
                                AutoGenerateColumns="False"
                                AllowPaging="True"
                                SkinID="GridViewTable"
                                OnPageIndexChanging="gvIsencaoFrete_PageIndexChanging"
                                OnRowCommand="gvIsencaoFrete_RowCommand"
                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                <Columns>
                                    <asp:BoundField DataField="condicaoPagamentoId" HeaderText="ID" ItemStyle-Width="20%" />
                                    <asp:BoundField DataField="condicaoPagamentoDescricao" HeaderText="Descrição" ItemStyle-Width="65%" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbExcluir" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/fechar.png" style="width: 24px; height: 24px;"
                                                CommandName="Excluir" ToolTip="Excluir dos Isentos" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                            </asp:GridView>
                            <div class="center">
                                <asp:Localize ID="lbl_gvIsencaoFretePageInfo" runat="server"></asp:Localize>
                            </div>
                        </div>
                    </fieldset>
                </div>

            </div>

            <div style="clear: both; height: 10px"></div>

            <div style="height: 20px"></div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
