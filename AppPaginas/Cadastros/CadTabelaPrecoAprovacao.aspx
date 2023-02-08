<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadTabelaPrecoAprovacao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadTabelaPrecoAprovacao" %>

<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlTabelaPrecoAprovacao" runat="server">
        <asp:UpdatePanel ID="uppCadastroTabelaAprovacao" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="imgExporCSV" />
                <asp:PostBackTrigger ControlID="imgExporXLS" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroTabelaAprovacao">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false" DefaultButton="btnFiltrarItemTabela">
                    <div style="width: 100%; display: table;">
                        <fieldset style="margin-bottom: 100px;">
                            <legend>
                                <asp:Literal ID="ltrDadosHeader" runat="server" />
                            </legend>

                            <%-- BOTOES --%>
                            <div style="text-align: right; width: 100%; vertical-align: middle;">
                                <asp:Button ID="btnAprovar" runat="server" TabIndex="30" SkinID="ButtonLeft" OnClick="btnAprovar_Click" UseSubmitBehavior="false"  />
                                <asp:Button ID="btnReprovar" runat="server" TabIndex="31" SkinID="ButtonCenter" OnClick="btnReprovar_Click" UseSubmitBehavior="false"  />
                                <asp:Button ID="btnVoltar" runat="server" TabIndex="32" SkinID="ButtonRight" OnClick="btnVoltar_Click" UseSubmitBehavior="false"  />
                            </div>

                            <%-- FORMULÁRIO --%>
                            <div style="width: 100%; display: table;">

                                <%--Esquerda--%>
                                <div style="width: 30%; display: table-cell; vertical-align: top;">
                                    <asp:Panel ID="pnlDadosEsquerda" runat="server">
                                        <ol>
                                            <li>
                                                <asp:Label ID="lblDadosTabelaPrecoId" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtDadosTabelaPrecoId" runat="server" MaxLength="30" TabIndex="1" Enabled="false" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblDadosUsuarioId" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtDadosUsuarioId" runat="server" MaxLength="50" TabIndex="2" Enabled="false" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblDadosTabelaPrecoData" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtDadosTabelaPrecoData" runat="server" MaxLength="50" TabIndex="3" Enabled="false" />
                                            </li>
                                            <li>
                                                <asp:Label ID="lblDadosTabelaPrecoStatus" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtDadosTabelaPrecoStatus" runat="server" MaxLength="50" TabIndex="4" Enabled="false" />
                                            </li>

                                        </ol>
                                    </asp:Panel>
                                </div>

                                <%--Direita--%>
                                <div style="width: 40%; display: table-cell; vertical-align: top;">
                                    <asp:Panel ID="pnlDadosDireita" runat="server" >
                                        <ol>
                                            <li>
                                                <asp:Label ID="lblDadosTabelaPrecoUsuarioIdAprovador" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtDadosTabelaPrecoUsuarioIdAprovador" runat="server" MaxLength="50" TabIndex="4" Enabled="false" />
                                            </li>

                                            <li>
                                                <asp:Label ID="lblDadosTabelaPrecoDataAprovacao" runat="server" SkinID="LabelForm" />
                                                <asp:TextBox ID="txtDadosTabelaPrecoDataAprovacao" runat="server" MaxLength="50" TabIndex="4" Enabled="false" />
                                            </li>

                                            <li>
                                                <div class="line">
                                                    <div class="line_itens_left">
                                                        <asp:Label ID="lblDadosTabelaPrecoMotivo" runat="server" SkinID="LabelForm" />
                                                    </div>
                                                    <div class="line_itens">
                                                        <asp:TextBox ID="txtDadosTabelaPrecoMotivo" runat="server" MaxLength="60" TabIndex="13" TextMode="MultiLine" Enabled="false" />
                                                    </div>
                                                </div>
                                            </li>
                                        </ol>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div style="width: 100%;">
                                <div style="width: 100%; text-align: right;">

                                    <asp:ImageButton ID="imgExporCSV" runat="server" alt="Exportar CSV" title="Exportar CSV" OnClick="exporCSV_Click" ImageUrl="~/Imagens/down-csv.png" />
                                    <asp:ImageButton ID="imgExporXLS" runat="server" alt="Exportar XLS" title="Exportar XLS" OnClick="imgExporXLS_Click" ImageUrl="~/Imagens/down-xls.png"  />

                                    <asp:CheckBox ID="cbApenasAlterados" runat="server" OnCheckedChanged="cbApenasAlterados_CheckedChanged" AutoPostBack="true"  />
                                </div>

                                     <div class="navegacao">
                                        <div class="boxPesquisa">
                                            <asp:Label ID="lblItemIdTabela" runat="server">Código do item:</asp:Label>
                                            <asp:TextBox ID="txtItemIdTabela" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="8" />
                                        </div>
                                        <div class="boxPesquisa">
                                            <asp:Label ID="lblItemDescTabela" runat="server">Nome do item:</asp:Label>
                                            <asp:TextBox ID="txtItemDescTabela" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="8" />
                                        </div>                      
                                        <div class="boxPesquisa">
                                            <div class="line">
                                                <asp:Button ID="btnFiltrarItemTabela" runat="server" SkinID="ButtonLeftFind" TabIndex="13" OnClick="btnFiltrarItemTabela_Click" />
                                                <asp:Button ID="btnFiltrarItemLimpar" runat="server" SkinID="ButtonRightClean" TabIndex="14" OnClick="btnFiltrarItemLimpar_Click" />
                                            </div>
                                        </div>
                                    </div>

                                <%--GRID ITENS--%>
                                <asp:Panel ID="pnlGvItens" runat="server">
                                    <div style="display: table; width: 99.6%; height: 40%;">
                                        <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                                            <%--<div style="height: 100; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">--%>
                                            <%--<center />--%>
                                            <asp:GridView ID="gvItens" runat="server" TabIndex="51"
                                                DataKeyNames="tabelaPrecoImportacaoItemId,tabelaPrecoImportacaoId,unidadeNegocioId,estabelecimentoId
                                                                ,estabelecimentoIdPara,clienteIdERP,itemId,tabelaPrecoVlrMinimo,tabelaPrecoVlrTabela
                                                                ,tabelaPrecoVlrMaximo,vlrMinimoOficial,vlrTabelaOficial,vlrMaximoOficial
                                                                ,tabelaPrecoImportacaoInicioVal,tabelaPrecoImportacaoFimVal,tabelaprecoFabrica"
                                                OnPageIndexChanging="gvItens_PageIndexChanging"
                                                OnRowCommand="gvItens_RowCommand"
                                                OnRowDataBound="gvItens_RowDataBound"
                                                OnRowUpdating="gvItens_RowUpdating">
                                                <Columns>
                                                    <asp:BoundField DataField="tabelaPrecoImportacaoItemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="false" />
                                                    <asp:BoundField DataField="tabelaPrecoImportacaoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" Visible="false" />
                                                    <asp:BoundField DataField="unidadeNegocioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                    <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                    <asp:BoundField DataField="estabelecimentoIdPara" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                    <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                   <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="center"          ItemStyle-Width="90px" />
                                                   <asp:BoundField DataField="itemDescricao" ItemStyle-HorizontalAlign="center"   ItemStyle-Width="90px" />

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbltabelaPrecoVlrMinimo" runat="server" Text='<%# Eval("tabelaPrecoVlrMinimo", "{0:n2}") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("vlrMinimoOficial", "{0:n2}") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("tabelaPrecoVlrTabela", "{0:n2}") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("vlrTabelaOficial", "{0:n2}") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>



                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("tabelaPrecoVlrMaximo", "{0:n2}") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("vlrMaximoOficial", "{0:n2}") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("tabelaprecoFabrica", "{0:n2}") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="tabelaPrecoImportacaoFimVal" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                                    <asp:BoundField DataField="UFdestino" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                </Columns>
                                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <%--</div>--%>
                                        </fieldset>
                                    </div>
                                </asp:Panel>

                            </div>

                        </fieldset>
                    </div>
                </asp:Panel>


                <%-- CONFIRMAR DADOS --%>
                <div style="position: absolute;">
                    <asp:UpdatePanel ID="upDadosConfirmar" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAprovar" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlDadosConfirmar" runat="server" DefaultButton="btnConfirmarYes" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel" style="width: 40%; height: 50%; left: 30%; top: 25%;">

                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblDadosConfirmarHeader" runat="server" ForeColor="White" />
                                        </div>
                                    </div>
                                    <div class="painel_body">
                                        <fieldset>
                                            <legend>
                                                <asp:Literal ID="ltrDadosConfirmarHeader" runat="server" />
                                            </legend>
                                            <ol>
                                                <li>
                                                    <div class="line">
                                                        <div class="line_itens_left">
                                                            <asp:Label ID="lblConfirmarDadosMotivo" runat="server" SkinID="LabelForm" />
                                                        </div>
                                                        <div class="line_itens">
                                                            <asp:TextBox ID="txtConfirmarDadosMotivo" runat="server" MaxLength="60" TabIndex="13" TextMode="MultiLine" Rows="7" />
                                                        </div>
                                                    </div>
                                                </li>
                                            </ol>
                                        </fieldset>
                                    </div>
                                    <div class="painel_bottom">
                                        <div class="painel_bottom_button">
                                            <div class="painel_bottom_button_left">
                                                <asp:Button ID="btnConfirmarYes" runat="server" SkinID="ButtonLeft" TabIndex="6" OnClick="btnConfirmarYes_Click" />
                                            </div>
                                            <div class="painel_bottom_button_right">
                                                <asp:Button ID="btnConfirmarNo" runat="server" SkinID="ButtonRight" TabIndex="7" OnClick="btnConfirmarNo_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>

                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label runat="server">Código do item:</asp:Label>
                                <asp:TextBox ID="txtCodigoItem" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="8" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label runat="server">Nome do item:</asp:Label>
                                <asp:TextBox ID="txtNomeItem" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="8" />
                            </div>



                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroCodigo" runat="server" />
                                <asp:TextBox ID="txtFiltroCodigo" runat="server" SkinID="Size70" MaxLength="30" TabIndex="7" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroUsuario" runat="server" />
                                <asp:TextBox ID="txtFiltroUsuario" runat="server" SkinID="Filtro" MaxLength="30" TabIndex="8" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroStatus" runat="server" />
                                <asp:DropDownList ID="ddFiltroStatus" runat="server" TabIndex="10" AutoPostBack="True" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroUnidadeNegocio" runat="server" />
                                <asp:DropDownList ID="ddFiltroUnidadeNegocio" runat="server" TabIndex="11" AutoPostBack="True" SkinID="DropFiltro" />
                            </div>
                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind" TabIndex="13" OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRightClean" TabIndex="14" OnClick="btnFiltrosLimpar_Click" />
                                </div>
                            </div>
                        </div>

                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="15"
                                DataKeyNames="tabelaPrecoImportacaoId,usuarioId,tabelaPrecoImportacaoData,tabelaPrecoImportacaoStatus
                                             ,usuarioIdAprovador,tabelaPrecoImportacaoDataAprov,tabelaPrecoImportacaoMotivo,unidadeNegocioId"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                OnRowCommand="gvRegistros_RowCommand" OnRowUpdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrTabelaPrecoImportacaoId" runat="server" Text='<%# FormataStringSaida(Eval("tabelaPrecoImportacaoId"), txtFiltroCodigo.Text) %>' />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:BoundField DataField="unidadeNegocioId" ItemStyle-HorizontalAlign="center" ItemStyle-Width="150px" />

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrUsuarioId" runat="server" Text='<%# FormataStringSaida(Eval("usuarioId"), txtFiltroUsuario.Text) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="tabelaPrecoImportacaoData" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="tabelaPrecoImportacaoStatus" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="usuarioIdAprovador" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />
                                    <asp:BoundField DataField="tabelaPrecoImportacaoDataAprov" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAlterar" runat="server"
                                                SkinID="ImgGrid"
                                                CommandName="Update"
                                                ToolTip="<%$ Resources:Resource, lblVisualizar %>"
                                                ImageUrl="~/Imagens/find.png"
                                                CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </fieldset>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>


</asp:Content>
