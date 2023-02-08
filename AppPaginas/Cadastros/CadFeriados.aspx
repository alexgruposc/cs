<%@ Page Title="Cadastro de Feriados" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadFeriados.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadFeriados" %>

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

    <asp:UpdatePanel ID="updGeral" runat="server">
        <ContentTemplate>
            <fieldset class="pad-10 text-right">
                <a href="CargaFeriados.aspx" class="btn btn-info">Enviar Arquivo</a>
            </fieldset>
            <div style="min-height: 10px;"></div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <h3 class="colorAzulKs">Cadastro de Feriados</h3>

    <asp:UpdatePanel ID="updSelecao" runat="server">
        <ContentTemplate>

            <fieldset class="pad-10">
                <h4 class="colorAzulKs">Selecionar Feriado</h4>

                <div class="row">

                    <div class="col-md-2">
                        Mês:<br />
                        <asp:DropDownList ID="ddw_SelFeriadoMes" runat="server" Style="width: 95%; max-width: 200px"></asp:DropDownList>
                    </div>

                    <div class="col-md-2">
                        Tipo:<br />
                        <asp:DropDownList ID="ddw_SelTipo" runat="server" Style="width: 95%; max-width: 200px"></asp:DropDownList>
                    </div>

                    <div class="col-md-2">
                        UF:<br />
                        <asp:DropDownList ID="ddw_SelUF" runat="server" Style="width: auto; max-width: 200px" AutoPostBack="true" OnSelectedIndexChanged="ddw_SelUF_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        Cidade:<br />
                        <asp:DropDownList ID="ddw_SelCidade" runat="server" Style="width: 95%; max-width: 400px">
                        </asp:DropDownList>
                    </div>

                </div>

                <div style="clear: both; min-height: 10px"></div>

                <div class="pad-10 text-right">
                    <asp:Button ID="btn_SelFeriado" runat="server" Text="Selecionar" SkinID="BtnInfo" OnClick="btn_SelFeriado_Click" />&nbsp;
                        <asp:Button ID="btn_SelLimpar" runat="server" Text="Limpar" SkinID="BtnDefault" OnClick="btn_SelLimpar_Click" />&nbsp;
                        <asp:Button ID="btn_NovoFeriado1" runat="server" Text="Novo Feriado" SkinID="BtnInfo" OnClick="btn_NovoFeriado_Click" />
                </div>

                <div class="mt-2">
                    <!-- Outros BoundField: Cidade, UF  -->
                    <asp:GridView ID="grv_SelFeriado" runat="server" DataKeyNames="FeriadoId"
                        AutoGenerateColumns="false" AllowPaging="true" PageSize="20"
                        OnPageIndexChanging="grv_SelFeriado_PageIndexChanging"
                        OnRowCommand="grv_SelFeriado_RowCommand"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="FeriadoDia" HeaderText="Dia" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="NomeFeriadoMes" HeaderText="Mes" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="Descricao" HeaderText="Descrição" ItemStyle-Width="25%" />
                            <asp:BoundField DataField="NomeTipo" HeaderText="Tipo" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="UF" HeaderText="UF" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="Cidade" HeaderText="Cidade" ItemStyle-Width="25%" />
                            <asp:BoundField DataField="ImpactoOrigem" HeaderText="Impacto Origem" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="ImpactoDestino" HeaderText="Impacto Destino" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="Usuario" HeaderText="Usuario" ItemStyle-Width="10%" />
                            <asp:BoundField DataField="DataRegistro" HeaderText="Data Registro" DataFormatString="{0: dd/MM/yyyy hh:mm}" ItemStyle-Width="10%" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbEditar" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle" ImageUrl="~/Imagens/find.png"
                                        CommandName="EditarFeriado" ToolTip="Selecionar" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293e" Font-Size="10pt" CssClass="GridPager" />
                    </asp:GridView>
                    <div class="text-center">
                        <asp:Localize ID="lbl_grv_SelFeriado_PageInfo" runat="server" />
                    </div>
                </div>

            </fieldset>

            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="updSelecao">
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- PAINEL EDITOR -->
    <asp:UpdatePanel ID="updEditFeriado" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel_EditFeriado" runat="server" Visible="false" SkinID="PnlPopUp">

                <div class="OpacityBackGround"></div>
                <div class="painel">

                    <div class="painel_header">
                        <div class="painel_header_message">
                            <asp:Localize ID="lbl_infoEditFeriado" runat="server"></asp:Localize>
                        </div>
                        <div class="alert_header_icon">
                            <asp:ImageButton ID="imb_FechaEditFeriado" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" OnClick="btn_FechaEditFeriado_Click" ImageUrl="~/Imagens/Fechar.png" />
                        </div>
                    </div>

                    <div class="painel_body">

                        <div style="width: 95%; padding: 20px">

                            <div class="row">

                                <div class="col-md-3">
                                    Dia:<br />
                                    <asp:DropDownList ID="ddw_FeriadoDia" runat="server" Style="width: auto; max-width: 200px"></asp:DropDownList>
                                </div>

                                <div class="col-md-3 borderLeft">
                                    Mês:<br />
                                    <asp:DropDownList ID="ddw_FeriadoMes" runat="server" Style="width: auto; max-width: 200px"></asp:DropDownList>
                                </div>

                                <div class="col-md-6 borderLeft">
                                    Descrição: (nome do feriado)<br />
                                    <asp:TextBox ID="txt_Descricao" runat="server" Style="width: 95%; max-width: 400px"></asp:TextBox>
                                </div>
                            </div>

                            <div style="clear: both; height: 10px"></div>

                            <div class="row">
                                <div class="col-md-3">
                                    Tipo:<br />
                                    <asp:DropDownList ID="ddw_Tipo" runat="server" Style="width: auto; max-width: 200px"></asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    UF:<br />
                                    <asp:DropDownList ID="ddw_UF" runat="server" Style="width: auto; max-width: 200px" AutoPostBack="true" OnSelectedIndexChanged="ddw_UF_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    Cidade:<br />
                                    <asp:DropDownList ID="ddw_Cidade" runat="server" Style="width: 95%; max-width: 400px">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div style="clear: both; height: 10px"></div>

                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox ID="chk_ImpactoOrigem" runat="server" />&nbsp;impacto na expedição (origem)
                                </div>
                                <div class="col-md-3">
                                    <asp:CheckBox ID="chk_ImpactoDestino" runat="server" />&nbsp;impacto na entrega (destino)
                                </div>
                                <div class="col-md-6">
                                </div>
                            </div>

                            <div style="clear: both; height: 20px"></div>

                            <div class="pad-10 text-center">
                                <asp:Button ID="btn_Gravar" runat="server" Text="Gravar" SkinID="BtnSuccess" OnClick="btn_Gravar_Click" />&nbsp;
                                <asp:Button ID="btn_Excluir" runat="server" Text="Excluir" SkinID="BtnDanger" OnClick="btn_Excluir_Click" />&nbsp;
                                <asp:Button ID="btn_FechaEditFeriado" runat="server" Text="Fechar" SkinID="BtnDefault" OnClick="btn_FechaEditFeriado_Click" />&nbsp;
                                <asp:Button ID="btn_NovoFeriado2" runat="server" Text="Novo Feriado" SkinID="BtnInfo" OnClick="btn_NovoFeriado_Click" />
                            </div>

                        </div>

                    </div>

                </div>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
