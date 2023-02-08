<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadBloqueioEstabelecimentoUsuario.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadBloqueioEstabelecimentoUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlItensBLoqueados" runat="server">
<script src="../../Scripts/jQuery-2.1.4.min.js" type="text/javascript"></script>
            <%--<script src="../../Scripts/jQuery-2.1.4.min.js"></script>--%>
    <script src="../../Scripts/bootstrap.js"></script>
        <asp:UpdatePanel ID="updDeletar" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnDeletarOK" />
                <asp:PostBackTrigger ControlID="btnDeletarNOK" />

            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlDelete" runat="server" Visible="false" SkinID="PnlPopUp">
                    <div class="OpacityBackGround">
                    </div>
                                          <div class="painel" style="width: 45%; height: 20%; left: 25%; top: 25%;">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:label id="label3" runat="server" text="salvar bloqueio" forecolor="white" />
                                        </div>
                                        <div class="alert_header_icon">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                                                ToolTip="<%$ Resources:Resource, lblFechar %>"
                                                ImageUrl="~/Imagens/Fechar.png"
                                                OnClick="ImageButton1_Click" />
                                        </div>
                                    </div>
                                    <div class="painel_body" style="height: 40%;">
                                        <fieldset>
                                            <div style="left: 0%; position: relative;">
                                                <div style="display: table; width: 100%; height: 10%; margin: 5px 0 0 0">
                                                    <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: left; margin: auto">
                                                        <asp:Label ID="Label4" Font-Size="Medium" Text="Tem certeza que deseja Deletar esse Bloqueio?" runat="server" />
                                                    </div>
                                                    <div style="display: table; width: 75%; height: auto; text-align: center;">

                                                        <asp:Button ID="btnDeletarOK" runat="server" SkinID="ButtonLeft" Text="Deletar" OnClick="btnDeletarOK_Click" />
                                                        <asp:Button ID="btnDeletarNOK" runat="server" SkinID="ButtonRight" Text="Cancelar" OnClick="btnDeletarNOK_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                </asp:Panel>

            </ContentTemplate>

        </asp:UpdatePanel>


        <asp:Panel ID="pnlAprovaPedido" runat="server" Visible="false" SkinID="PnlPopUp">
            <div class="OpacityBackGround">
            </div>
            <div class="painel" style="width: 45%; height: 20%; left: 25%; top: 25%;">
                <div class="painel_header">
                    <div class="painel_header_message">
                        <asp:Label ID="Label1" runat="server" Text="Salvar Bloqueio" ForeColor="White" />
                    </div>
                    <div class="alert_header_icon">
                        <asp:ImageButton ID="imbAprovacaoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px"
                            ToolTip="<%$ Resources:Resource, lblFechar %>"
                            ImageUrl="~/Imagens/Fechar.png"
                            OnClick="imbAprovacaoClose_Click" />
                    </div>
                </div>
                <div class="painel_body" style="height: 40%;">
                    <fieldset>
                        <div style="left: 0%; position: relative;">
                            <div style="display: table; width: 100%; height: 10%; margin: 5px 0 0 0">
                                <div style="display: table-cell; width: 50%; vertical-align: middle; text-align: left; margin: auto">
                                    <asp:Label ID="Label2" Font-Size="Medium" Text="Tem certeza que deseja Salvar esse Bloqueio?" runat="server" />
                                </div>
                                <div style="display: table; width: 75%; height: auto; text-align: center;">

                                    <asp:Button ID="btnAprovaPedidoOk" runat="server" SkinID="ButtonLeft" Text="Salvar" OnClick="btnAprovaPedidoOk_Click" />
                                    <asp:Button ID="btnAprovaPedidoNOk" runat="server" SkinID="ButtonRight" Text="Cancelar" OnClick="btnAprovaPedidoNOk_Click" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </asp:Panel>

        <asp:UpdatePanel ID="updCadBloqueioEstabelecimento" runat="server">

            <ContentTemplate>
                <%-- PROGRESS --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updCadBloqueioEstabelecimento">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <fieldset>
                    <legend>
                        <asp:Literal ID="Literal3" runat="server" Text="Bloquear Estabelecimento" />
                    </legend>
                    <asp:UpdatePanel ID="updPnls" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnSalvar" />
                            <asp:PostBackTrigger ControlID="btnLimpar" />
                            <asp:AsyncPostBackTrigger ControlID="gvCliEstab" EventName="RowCommand" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="dvInclusao" runat="server" Visible="true">
                                <fieldset>
                                    <div style="display: table; float: right">
                                        <div style="text-align: right; display: table-cell; width: 100%; vertical-align: middle;">
                                            <asp:Button ID="btnLimpar" runat="server" Text="Limpar" SkinID="ButtonLeftSave" TabIndex="6" OnClick="btnLimpar_Click" />
                                            <%--       <asp:Button ID="btnVoltar" runat="server" Text="Voltar" SkinID="ButtonRightVoltar" TabIndex="8" OnClick="btnVoltar_Click" />--%>
                                            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" SkinID="ButtonCenterClean" TabIndex="1" OnClick="btnSalvar_Click" />
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <asp:Label Text="Estabelecimento:" runat="server" />

                                    <asp:DropDownList ID="ddFiltroEstabelecimento" runat="server" TabIndex="12" SkinID="DropFilterCustom" />

                                </fieldset>
                                <fieldset>

                                    <asp:GridView ID="gvCliEstab" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                        PageSize="10"
                                        HeaderStyle-BackColor="Green" OnPageIndexChanging="gvCliEstab_PageIndexChanging"
                                        OnRowCommand="gvCliEstab_RowCommand">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                <HeaderTemplate>
                                                    Estabelecimento:
                                                    <asp:DropDownList ID="ddlGridEstabelecimento" runat="server" OnSelectedIndexChanged="ddlGridEstabelecimento_SelectedIndexChanged"
                                                        AutoPostBack="true" AppendDataBoundItems="true">
                                                        <asp:ListItem Text="Todos.." Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%# Eval("Descricao") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="usuarioId" HeaderText="Usuario" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="dataInclusao" HeaderText="Data Inclusao" ItemStyle-HorizontalAlign="Center" />
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="estabelecimentoId" runat="server" CommandName="deleteItem" SkinID="ImgGrid"
                                                        ImageUrl="~/Imagens/Fechar.png" CommandArgument='<%# Eval("estabelecimentoId") + "|" + ((GridViewRow)Container).RowIndex %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>

                                </fieldset>

                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
