<%@ Page Title="Cadastro de EANS Secundários" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadEanSecundario.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEanSecundario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        .GridView td {
            text-align: center;
        }

        .borderLeft {
            border-left: solid 1px #aaaaaa;
        }
    </style>

    <script type="text/javascript">
        function Ocultapanel_ConsultarEan() {
            document.getElementById("panel_ConsultarEan").style.display = "none";
        }

        function ChecarEanDigitado() {
            if (document.getElementById("txt_eankraft").value.length < 13) {
                document.getElementById("panel_infoEditProduto").style.display = "none";
                return;
            }
            var sEan = document.getElementById("txt_eankraft").value;
            document.getElementById("hid_comandoPost").value = "ChecarEanDigitado";
            document.getElementById("hid_valorPost").value = sEan;
            // não necessário com o submit: document.getElementById("panel_infoEditProduto").style.display = "";
            // Alert("Alterado pelo método");
            form1.submit();
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hid_comandoPost" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hid_valorPost" runat="server" ClientIDMode="Static" />

    <h3 class="colorAzulKs">Cadastro de EANS Secundários</h3>

    <!-- PAINEL SELEÇÃO -->
    <asp:UpdatePanel ID="updSelecao" runat="server">
        <ContentTemplate>
            <fieldset class="pad-10">
                <h4 class="colorAzulKs">Selecionar Produtos</h4>
                <div class="row">
                    <div class="col-md-2">
                        EAN EDI:<br />
                        <asp:TextBox ID="txt_SelEanEdi" runat="server" Style="width: 95%; max-width: 120px"></asp:TextBox>
                    </div>
                    <div class="col-md-2 borderLeft">
                        EAN Kraft:<br />
                        <asp:TextBox ID="txt_SelEanKraft" runat="server" Style="width: 95%; max-width: 120px"></asp:TextBox>
                    </div>
                    <div class="col-md-2 borderLeft">
                        Produto:<br />
                        <asp:TextBox ID="txt_SelProduto" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                    </div>
                    <div class="col-md-2 borderLeft">
                        Fabricante:<br />
                        <asp:TextBox ID="txt_SelFabricante" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>

                    </div>
                    <div class="col-md-4 borderLeft text-right">
                        <asp:Button ID="btn_SelEan" runat="server" Text="Selecionar" SkinID="BtnInfo" OnClick="btn_SelEan_Click" />&nbsp;
                        <asp:Button ID="btn_SelLimpar" runat="server" Text="Limpar" SkinID="BtnDefault" OnClick="btn_SelLimpar_Click" />&nbsp;
                        <asp:Button ID="btn_NovoEan1" runat="server" Text="Novo EAN" SkinID="BtnInfo" OnClick="btn_NovoEan1_Click" />
                    </div>
                </div>

                <div style="clear: both"></div>

                <div class="mt-2">
                    <asp:Localize ID="lbl_avisoFiltro" runat="server"></asp:Localize>
                    <h3>
                        <asp:Localize ID="lbl_infoFiltro" runat="server" /></h3>
                    <!-- // retorna campos: es.eanEDI, es.eankraft, i.itemDescricao, i.itemId, f.fabricanteNome -->
                    <asp:GridView ID="grv_SelEan" runat="server" DataKeyNames="eanEDI,eankraft"
                        AutoGenerateColumns="false" AllowPaging="true"
                        OnPageIndexChanging="grv_SelEan_PageIndexChanging"
                        OnRowCommand="grv_SelEan_RowCommand"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="eanEDI" HeaderText="EAN EDI" ItemStyle-Width="12%" />
                            <asp:BoundField DataField="eankraft" HeaderText="EAN Kraft" ItemStyle-Width="12%" />
                            <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" ItemStyle-Width="25%" />
                            <asp:BoundField DataField="itemId" HeaderText="Item ID" ItemStyle-Width="10%" />
                            <asp:BoundField DataField="fabricanteNome" HeaderText="Fabricante" ItemStyle-Width="25%" />

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbEditar" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/find.png"
                                        CommandName="EditarEan" ToolTip="Editar" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/Fechar.png"
                                        CommandName="ExcluirEan" ToolTip="Excluir" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                    </asp:GridView>
                    <div class="text-center">
                        <asp:Localize ID="lbl_grv_SelEan_PageInfo" runat="server" />
                    </div>
                </div>


                <div style="height: 30px">&nbsp;</div>

            </fieldset>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- PAINEL EDITOR -->
    <asp:UpdatePanel ID="updEditEan" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="txt_eankraft" />
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="panel_EditEan" runat="server" Visible="false" SkinID="PnlPopUp">
                <div class="OpacityBackGround"></div>
                <div class="painel">
                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Localize ID="lbl_infoEditEan" runat="server"></asp:Localize>
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imb_FechaEditEan" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" OnClick="btn_FechaEditEan_Click" ImageUrl="~/Imagens/Fechar.png" />
                        </div>
                    </div>

                    <div class="painel_body">
                        <div style="width: 95%; padding: 10px 20px 0 20px">
                            <div class="row">

                                <div class="col-md-4" style="min-height: 86px">
                                    EAN Kraft:
                                    <br />
                                    <asp:TextBox ID="txt_eankraft" runat="server" Style="width: 90%; max-width: 140px" ClientIDMode="Static" onkeyup="ChecarEanDigitado()"></asp:TextBox>
                                    <div id="panel_infoEditProduto" runat="server" clientidmode="Static" style="width: 98%; height: auto; ">
                                        <asp:Localize ID="lbl_infoEditProduto" runat="server"></asp:Localize>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    EAN EDI:
                                    <br />
                                    <asp:TextBox ID="txt_eanEDI" runat="server" Style="width: 90%; max-width: 140px"></asp:TextBox>
                                </div>

                                <div class="col-md-6 text-center">
                                    <asp:Button ID="btn_Gravar" runat="server" Text="Gravar" SkinID="BtnSuccess" OnClick="btn_Gravar_Click" />&nbsp;
                                    <asp:Button ID="btn_Excluir" runat="server" Text="Excluir" SkinID="BtnDanger" OnClick="btn_Excluir_Click" />&nbsp;
                                    <asp:Button ID="btn_FechaEditEan" runat="server" Text="Fechar" SkinID="BtnDefault" OnClick="btn_FechaEditEan_Click" />&nbsp;
                                    <asp:Button ID="btn_NovoEan2" runat="server" Text="Novo EAN" SkinID="BtnInfo" OnClick="btn_NovoEan2_Click" />
                                </div>
                            </div>

                        </div>
                        <div style="clear: both; height: 2px"></div>

                        <hr />
                        <div style="width: 95%; padding: 0 20px 0 20px">
                            <h2>Localizar Produtos</h2>
                            <div class="row">
                                <div class="col-md-3">
                                    Item ID:<br />
                                    <asp:TextBox ID="txt_SelItens_Id" runat="server" Style="width: 95%; max-width: 120px"></asp:TextBox>
                                </div>
                                <div class="col-md-3 borderLeft">
                                    Nome do Produto:<br />
                                    <asp:TextBox ID="txt_SelItens_Nome" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                                </div>
                                <div class="col-md-3 borderLeft">
                                    Fabricante:<br />
                                    <asp:TextBox ID="txt_SelItens_Fabric" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                                </div>
                                <div class="col-md-3 borderLeft borderLeft">
                                    <asp:Button ID="btn_SelItens" runat="server" Text="Selecionar" SkinID="BtnInfo-sm" OnClick="btn_SelItens_Click" />&nbsp;
                                        <asp:Button ID="btn_LimparSelItens" runat="server" Text="Limpar" SkinID="BtnDefault-sm" OnClick="btn_LimparSelItens_Click" />&nbsp;
                                </div>
                            </div>
                            <div style="clear: both; height: 8px"></div>
                            <div>
                                <h3>
                                    <asp:Localize ID="lbl_infogrv_SelItens" runat="server" /></h3>
                                <!-- // retorna campos: i.ean, i.itemDescricao, i.itemId, f.fabricanteNome -->
                                <asp:GridView ID="grv_SelItens" runat="server" DataKeyNames="ean, itemId"
                                    AutoGenerateColumns="false" AllowPaging="true"
                                    OnPageIndexChanging="grv_SelItens_PageIndexChanging"
                                    OnRowCommand="grv_SelItens_RowCommand"
                                    EmptyDataText="Não foi encontrado nenhum resultado!">
                                    <Columns>
                                        <asp:BoundField DataField="ean" HeaderText="EAN" ItemStyle-Width="15%" />
                                        <asp:BoundField DataField="itemDescricao" HeaderText="Descrição" ItemStyle-Width="35%" />
                                        <asp:BoundField DataField="itemId" HeaderText="Item ID" ItemStyle-Width="10%" />
                                        <asp:BoundField DataField="fabricanteNome" HeaderText="Fabricante" ItemStyle-Width="30%" />

                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imbSelecionar" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/check.png"
                                                    CommandName="SelecionarItem" ToolTip="Selecionar" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                                </asp:GridView>
                                <div class="text-center">
                                    <asp:Localize ID="lbl_grv_SelItens_PageInfo" runat="server" />
                                </div>

                            </div>

                            <!-- Fim do Body -->

                        </div>

                    </div>

                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>


