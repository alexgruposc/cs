<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadEstabelecimentoCNPJ.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadEstabelecimentoCNPJ" %>

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

        .borderLeft {
            border-left: solid 1px #aaaaaa;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ==============================     SELEÇÃO     ============================== -->
    <asp:UpdatePanel ID="updSelecao" runat="server">
        <ContentTemplate>

            <fieldset class="pad-10">
                <h4 class="colorAzulKs">Estabelecimentos CNPJ</h4>

                <div class="row">

                    <div class="col-md-2">
                        Estabelecimento ID:&nbsp;
                         <asp:DropDownList ID="ddw_SelestabelecimentoId" runat="server" Style="width: auto; max-width: 95%"></asp:DropDownList>
                    </div>

                    <div class="col-md-2 borderLeft">
                        UF:&nbsp;
                         <asp:DropDownList ID="ddw_SelUF" runat="server" Style="width: auto; max-width: 95%"></asp:DropDownList>
                    </div>

                    <div class="col-md-2 borderLeft">
                        CNPJ:&nbsp; 
                        <asp:TextBox ID="txt_SelCnpj" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                    </div>

                    <div class="col-md-6 borderLeft">
                        <div class="pad-10 text-right">
                            <asp:Button ID="btn_Sel" runat="server" Text="Selecionar" SkinID="BtnInfo" OnClick="btn_Sel_Click" />&nbsp;
                    <asp:Button ID="btn_SelLimpar" runat="server" Text="Limpar" SkinID="BtnDefault" OnClick="btn_SelLimpar_Click" />&nbsp;
                    <asp:Button ID="btn_Novo1" runat="server" Text="Novo" SkinID="BtnInfo" OnClick="btn_Novo_Click" />
                        </div>
                    </div>

                </div>

                <div style="clear: both; min-height: 10px"></div>

                <div class="pad-5">

                    <hr />
                    <h3 style="color: orange">
                        <asp:Localize ID="lbl_grvSelInfo" runat="server"></asp:Localize></h3>

                    <asp:GridView ID="grv" runat="server" DataKeyNames="estabelecimentoId"
                        AutoGenerateColumns="false" AllowPaging="true" PageSize="20"
                        OnRowCommand="grv_RowCommand" OnPageIndexChanging="grv_PageIndexChanging"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="ufId" HeaderText="UF" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="PharmalinkAutentica" HeaderText="Pharma Link Autentica" ItemStyle-Width="25%" />
                            <asp:BoundField DataField="FidelizeAutentica" HeaderText="Fideliza Aut" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="BloqueiaItemControlado" HeaderText="Bloqueia Item Controlado" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="AutenticaPayGo" HeaderText="Autentica PayGo" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="UsuarioPayGo" HeaderText="Usuario PayGo" ItemStyle-Width="25%" />

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbEditar" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/find.png"
                                        CommandName="Editar" ToolTip="Selecionar" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                    </asp:GridView>

                    <div class="text-center">
                        <asp:Localize ID="lbl_grvPageInfo" runat="server" />
                    </div>
                </div>

            </fieldset>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- ==============================     EDIÇÃO     ============================== -->
    <asp:UpdatePanel ID="updEdit" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel_Edit" runat="server" Visible="false" SkinID="PnlPopUp">

                <div class="OpacityBackGround"></div>
                <div class="painel">

                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Localize ID="lbl_infoEdit" runat="server"></asp:Localize>
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imb_FechaEdit" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" ImageUrl="~/Imagens/Fechar.png" OnClick="btn_FechaEdit_Click" />
                        </div>
                    </div>

                    <div class="painel_body">

                        <div style="width: 95%; padding: 20px">

                            <div class="row">

                                <div class="col-md-3">
                                    <p>
                                        Estabelecimento ID:&nbsp;<asp:TextBox ID="txt_estabelecimentoId" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                                        <h2>
                                            <asp:Localize ID="lbl_estabelecimentoId" runat="server"></asp:Localize></h2>

                                    </p>
                                    <p>
                                        CNPJ: &nbsp;<asp:TextBox ID="txt_CNPJ" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                                        <b>
                                            <asp:Localize ID="lbl_Cnpj" runat="server"></asp:Localize></b>

                                    </p>
                                    <p>
                                        Pharma Link:<br />
                                        <asp:TextBox ID="txt_PharmaLinkAut" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:CheckBox ID="chk_FidelizeAutentica" runat="server" Text="Autentica Fidelize" />
                                    </p>

                                </div>

                                <div class="col-md-3 borderLeft">
                                    <p>
                                        <asp:CheckBox ID="chk_AutenticaPayGo" runat="server" Text="Autentica PayGo" />
                                    </p>
                                    <p>
                                        <asp:CheckBox ID="chk_AutenticaPayGoBalcao" runat="server" Text="Autentica PayGo Balcao" />
                                    </p>
                                    <p>
                                        Usuário PayGo:<br />
                                        <asp:TextBox ID="txt_UsuarioPayGo" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                                    </p>
                                    <p>
                                        Senha PayGo<br />
                                        <asp:TextBox ID="txt_SenhaPayGo" runat="server" Style="width: 95%; max-width: 80px"></asp:TextBox>
                                    </p>
                                </div>

                                <div class="col-md-3 borderLeft">
                                    <p>
                                        Centro Id<br />
                                        <asp:TextBox ID="txt_CentroId" runat="server" Style="width: 95%; max-width: 200px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:CheckBox ID="chk_Distribuidora" runat="server" Text="Distribuidora" />
                                    </p>
                                    <p>
                                        Unidade<br />
                                        <asp:DropDownList ID="ddw_Unidade" runat="server" Style="width: auto; max-width: 95%"></asp:DropDownList>
                                    </p>
                                </div>

                                <div class="col-md-3 borderLeft">
                                    <p>
                                        <asp:CheckBox ID="chk_WMSHabilitado" runat="server" Text="WMS Habilitado" />
                                    </p>
                                    <p>
                                        <asp:CheckBox ID="chk_ValidaCNAE" runat="server" Text="Valida CNAE" />
                                    </p>
                                    <p>
                                        <asp:CheckBox ID="chk_BloqueiaItemControlado" runat="server" Text="Bloqueia Item Controlado" />
                                    </p>
                                    <p>
                                        Estab. Id Estoque<br />
                                        <asp:TextBox ID="txt_EstabelecimentoIdEstoque" runat="server" Style="width: 95%; max-width: 150px"></asp:TextBox>
                                    </p>
                                </div>

                            </div>

                            <div style="clear: both; height: 6px"></div>

                            <div class="pad-10 text-center">

                                <asp:Button ID="btn_Gravar" runat="server" Text="Gravar" SkinID="BtnSuccess" OnClick="btn_Gravar_Click" />&nbsp;
                                <asp:Button ID="btn_Excluir" runat="server" Text="Excluir" SkinID="BtnDanger" />&nbsp;
                                <asp:Button ID="btn_FechaEdit" runat="server" Text="Fechar" SkinID="BtnDefault" OnClick="btn_FechaEdit_Click" />&nbsp;
                                <asp:Button ID="btn_Novo2" runat="server" Text="Novo" SkinID="BtnInfo" OnClick="btn_Novo_Click" />
                            </div>

                        </div>

                    </div>

                </div>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="progress_updSelecao" runat="server" AssociatedUpdatePanelID="updSelecao">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdateProgress ID="progress_updEdit" runat="server" AssociatedUpdatePanelID="updEdit">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
