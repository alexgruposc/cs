<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadUsuarioReceitaPadrao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadUsuarioReceitaPadrao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset class="pad-5 mt-2">
        <legend>
            <asp:Literal ID="Literal1" runat="server" Text="Cadastro Usuários padrão receita" />
        </legend>

        <div class="form-row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Usuário não selecionados </h2>
                                <div class="nav navbar-right panel_toolbox">

                                    <asp:LinkButton ID="btnAdcionarUsuarios" data-toggle="tooltip" data-placement="top" OnClick="btnAdcionarUsuarios_Click" title="Adicionar Usuários" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>

                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="demo-container">
                                        <asp:Panel ID="pnlUsuarioNaoSelecionado" runat="server" DefaultButton="btnPesquisarNaoSelUsuario">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                                <ContentTemplate>
                                                    <div class="row">

                                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                                            <asp:Label ID="lblCodigoUsuarioNaoSelec" runat="server" Text="Código" />
                                                            <asp:TextBox ID="txtCodigoUsuarioNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                                            <asp:Label ID="lblUsuarioSelecionado" runat="server" Text="Nome Usuário" />
                                                            <asp:TextBox ID="txtUsuarioNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                        </div>

                                                        <div class="col-md-3" style="margin-top: 10px;">
                                                            <asp:LinkButton ID="btnPesquisarNaoSelUsuario" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesquisarNaoSelUsuario_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                            <asp:LinkButton ID="btnLimparNaoSelUsuario" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparNaoSelUsuario_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>

                                                        </div>

                                                    </div>
                                                    <br />
                                                    <div class="pad-10 mt-2">
                                                        <br />
                                                        <asp:GridView DataKeyNames="usuarioId, usuarioNome,perfilAcessoDescricao"
                                                            runat="server"
                                                            SkinID="GridViewTable"
                                                            ID="gvUsuarioNaoSel"
                                                            AutoGenerateColumns="False"
                                                            AllowPaging="false"
                                                            OnPageIndexChanging="gvUsuarioNaoSel_PageIndexChanging"
                                                            EmptyDataText="Não foi encontrado nenhum resultado!"
                                                            OnRowDataBound="gvUsuarioNaoSel_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkNaoSelUsuario" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelUsuario_CheckedChanged" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="usuarioId" HeaderText="Código" />
                                                                <asp:BoundField DataField="usuarioNome" HeaderText="Nome Usuário" />
                                                                <asp:BoundField DataField="perfilAcessoDescricao" HeaderText="Perfil Acesso" />

                                                            </Columns>
                                                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                        </asp:GridView>
                                                    </div>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Usuário selecionados</h2>
                                <div class="nav navbar-right panel_toolbox">
                                    <asp:LinkButton ID="btnRemoverUsuario" runat="server" data-toggle="tooltip" OnClick="btnRemoverUsuario_Click" data-placement="top" title="Remover Usuário" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="demo-container">
                                        <asp:Panel ID="pnlUsuarioSelecionado" runat="server" DefaultButton="btnUsuarioSelec">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                                <ContentTemplate>
                                                    <div class="row">

                                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                                            <asp:Label ID="lblCodigoUsuarioSelecionado" runat="server" Text="Código" />
                                                            <asp:TextBox ID="txtCodigoUsuarioSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                                            <asp:Label ID="lblUsuarioNomeSelecionado" runat="server" Text="Razão Social" />
                                                            <asp:TextBox ID="txtUsuarioNomeSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                        </div>

                                                        <div class="col-md-3" style="margin-top: 10px;">
                                                            <asp:LinkButton ID="btnUsuarioSelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnUsuarioSelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                            <asp:LinkButton ID="btnLimpaUsuarioSelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimpaUsuarioSelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>

                                                        </div>

                                                    </div>
                                                    <br />
                                                    <div class="pad-10 mt-2">
                                                        <br />
                                                        <asp:GridView DataKeyNames="usuarioId, usuarioNome,perfilAcessoDescricao"
                                                            runat="server"
                                                            ID="gvSelUsuario"
                                                            AutoGenerateColumns="False"
                                                            AllowPaging="True"
                                                            SkinID="GridViewTable"
                                                            OnPageIndexChanging="gvSelUsuario_PageIndexChanging"
                                                            OnRowDataBound="gvSelUsuario_RowDataBound"
                                                            OnRowCommand="gvSelUsuario_RowCommand"
                                                            EmptyDataText="Não foi encontrado nenhum resultado!">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imgShow" runat="server" OnClick="Show_Hide_ChildGrid" ImageUrl="~/Imagens/plus.png"
                                                                            CommandArgument="Show" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelUsuario" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelUsuario_CheckedChanged" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="usuarioId" HeaderText="Código" />
                                                                <asp:BoundField DataField="usuarioNome" HeaderText="Nome Usuário" />
                                                                <asp:BoundField DataField="perfilAcessoDescricao" HeaderText="Perfil Acesso" />
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="btnAlterar" runat="server" CommandName="AlterarItens" Width="21px" Height="21px"
                                                                            ToolTip="Cadastro de estabelecimentos" CommandArgument='<%# Eval("usuarioId") + "|" +Eval("usuarioNome")   %>'
                                                                            ImageUrl="~/Imagens/btnEdit.png" />

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        </tr>
                                                                        <td colspan="100%">

                                                                            <asp:Panel ID="pnlEstabelecimentoGrid" runat="server" Visible="false" Style="position: relative">
                                                                                <asp:GridView ID="gvRelacEstabelec"
                                                                                    DataKeyNames="estabelecimentoId"
                                                                                    runat="server"
                                                                                    AutoGenerateColumns="false"
                                                                                    AllowPaging="false"
                                                                                    CssClass="ChildGrid">
                                                                                    <Columns>
                                                                                        <asp:BoundField DataField="estabelecimentoId" HeaderText="Codigo" />
                                                                                        <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" />                                                                                       
                                                                                        <asp:BoundField DataField="ufId" HeaderText="Estado" />
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </asp:Panel>
                                                                        </td>

                                                                        <tr>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                        </asp:GridView>
                                                        <div class="center">
                                                            <asp:Localize ID="lblgvSelEstabelePageInfo" runat="server"></asp:Localize>
                                                        </div>

                                                    </div>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <br />

    </fieldset>

    <div style="position: absolute;">
        <asp:UpdatePanel ID="updModalUsuarioEstab" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlModalUsuarioEstab" runat="server" CssClass="Modal" Visible="false">

                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 80%; left: 5%; height: 80%">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="Label11" runat="server" ForeColor="White" Text="Cadastro de Estabelecimento por Usuário " />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="btnFechaUsuarioEstab" runat="server" SkinID="ImgClose" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                    ToolTip="<%$ Resources:Resource, lblFechar %>"
                                    ImageUrl="~/Imagens/Fechar.png"
                                    OnClick="btnFechaUsuarioEstab_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <asp:HiddenField ID="hdClienteId" runat="server" />
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblNomeEstab" runat="server" Text="Usuário" />
                                        <asp:TextBox ID="txtUsuarioNomeModal" runat="server" Enabled="false" SkinID="txtBootstrap3"></asp:TextBox>
                                    </div>
                                </div>
                                </br>
                                 </br>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">

                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>Estabelecimentos não selecionados  </h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnAddUsuarioEstab" data-toggle="tooltip" data-placement="top" OnClick="btnAddUsuarioEstab_Click" title="Adicionar Itens" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container">
                                                            <asp:Panel ID="pnlEstabelecimentosNaoSelecionado" runat="server" DefaultButton="btnPesquisarNaoSelEstabele">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                                                                    <ContentTemplate>
                                                                        <div class="row">

                                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblCodigoEstabNaoSelec" runat="server" Text="Código" />
                                                                                <asp:TextBox ID="txtCodigoEstabNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                            </div>

                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <asp:Label ID="lblNomeSelecionado" runat="server" Text="Razão Social" />
                                                                                <asp:TextBox ID="txtRazaoEstabNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                            </div>

                                                                            <div class="col-md-4" style="margin-top: 10px;">
                                                                                <asp:LinkButton ID="btnPesquisarNaoSelEstabele" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesquisarNaoSelEstabele_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                <asp:LinkButton ID="btnLimparNaoSelEstabele" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparNaoSelEstabele_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                <%--<asp:Button ID="btnPesquisarEstabNaoSelec" runat="server" SkinID="BtnDefault-sm" TabIndex="20" OnClick="btnPesquisarEstabNaoSelec_Click"   />
                                                                                                    <asp:Button ID="btnLimparEstabNaoSelec" runat="server" SkinID="BtnDefault-sm" TabIndex="21" OnClick="btnLimparEstabNaoSelec_Click"  />--%>
                                                                            </div>

                                                                        </div>
                                                                        <br />


                                                                        <div class="pad-10 mt-2">
                                                                            <br />
                                                                            <asp:GridView DataKeyNames="estabelecimentoId, estabelecimentoRazaoSocial,ufId"
                                                                                runat="server"
                                                                                SkinID="GridViewTable"
                                                                                ID="gvNaoSelEstabelec"
                                                                                AutoGenerateColumns="False"
                                                                                AllowPaging="false"
                                                                                OnPageIndexChanging="gvNaoSelEstabelec_PageIndexChanging"
                                                                                EmptyDataText="Não foi encontrado nenhum resultado!"
                                                                                OnRowDataBound="gvNaoSelEstabelec_RowDataBound">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkTodosNaoSelEstabelec" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosNaoSelEstabelec_CheckedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkNaoSelEstabelec" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelEstabelec_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" ItemStyle-HorizontalAlign="Center"  />
                                                                                    <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social"  ItemStyle-HorizontalAlign="Center" />
                                                                                    <asp:BoundField DataField="ufId" HeaderText="UF" ItemStyle-HorizontalAlign="Center"  />

                                                                                </Columns>
                                                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                            </asp:GridView>
                                                                        </div>

                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>Estabelecimentos selecionados</h2>
                                                    <div class="nav navbar-right panel_toolbox">
                                                        <asp:LinkButton ID="btnRemoverEstabUsuarios" runat="server" data-toggle="tooltip" OnClick="btnRemoverEstabUsuarios_Click" data-placement="top" title="Remover Estabelecimentos" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="demo-container">
                                                        <asp:Panel ID="pnlEstabelecimentosSelecionado" runat="server" DefaultButton="btn_SelEstabelec">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                                                <ContentTemplate>
                                                                    <div class="row">

                                                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                                                            <asp:Label ID="lblCodigoEstabSelecionado" runat="server" Text="Código" />
                                                                            <asp:TextBox ID="txtCodigoEstabSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                        </div>

                                                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                                                            <asp:Label ID="lblEstabRazaoSelecionado" runat="server" Text="Razão Social" />
                                                                            <asp:TextBox ID="txtEstabRazaoSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                        </div>

                                                                        <div class="col-md-4" style="margin-top: 10px;">
                                                                            <asp:LinkButton ID="btn_SelEstabelec" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btn_SelEstabelec_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                            <asp:LinkButton ID="btn_LimpaSelEstabelec" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btn_LimpaSelEstabelec_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                            <%--<asp:Button ID="btnPesquisarEstabNaoSelec" runat="server" SkinID="BtnDefault-sm" TabIndex="20" OnClick="btnPesquisarEstabNaoSelec_Click"   />
                                                                                                    <asp:Button ID="btnLimparEstabNaoSelec" runat="server" SkinID="BtnDefault-sm" TabIndex="21" OnClick="btnLimparEstabNaoSelec_Click"  />--%>
                                                                        </div>

                                                                    </div>
                                                                    <br />
                                                                    <div class="pad-10 mt-2">
                                                                        <br />
                                                                        <asp:GridView DataKeyNames="estabelecimentoId,estabelecimentoRazaoSocial,ufId"
                                                                            runat="server"
                                                                            ID="gvSelEstabelec"
                                                                            AutoGenerateColumns="False"
                                                                            AllowPaging="True"
                                                                            SkinID="GridViewTable"
                                                                            OnPageIndexChanging="gvSelEstabelec_PageIndexChanging"
                                                                            OnRowDataBound="gvSelEstabelec_RowDataBound"
                                                                            EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                            <Columns>
                                                                                <asp:TemplateField>
                                                                                    <HeaderTemplate>
                                                                                        <asp:CheckBox ID="chkTodosSelEstabele" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelEstabele_CheckedChanged" />
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkSelEstabelec" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelEstabelec_CheckedChanged" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="estabelecimentoId" HeaderText="Código" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                                                                <asp:BoundField DataField="estabelecimentoRazaoSocial" HeaderText="Razão Social" HeaderStyle-HorizontalAlign="Center"  ItemStyle-HorizontalAlign="Center"  />
                                                                                <asp:BoundField DataField="ufId" HeaderText="UF" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"   />


                                                                            </Columns>
                                                                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                        </asp:GridView>
                                                                        <div class="center">
                                                                            <asp:Localize ID="Localize1" runat="server"></asp:Localize>
                                                                        </div>

                                                                    </div>

                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </fieldset>
                    </div>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
