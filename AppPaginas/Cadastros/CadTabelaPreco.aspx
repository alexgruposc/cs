<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadTabelaPreco.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadTabelaPreco" %>


<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        function formatar(mascara, documento) {
            var i = documento.value.length;
            var saida = mascara.substring(0, 1);
            var texto = mascara.substring(i)

            if (texto.substring(0, 1) != saida) {
                documento.value += texto.substring(0, 1);
            }
        }

        function validaData(data) {
            if (data.value.length > 0 && data.value.length < 10)
                alert("Informe o formato de data correto! dd/mm/yyyy");
        }

        function validaHora(data) {
            if (data.value.length > 0 && data.value.length < 5)
                alert("Informe o formato de hora correto! hh:mm");
        }

    </script>


    <asp:Panel ID="pnlTabelaPreco" runat="server">
        <asp:UpdatePanel ID="uppCadastroTabela" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="imgHistoricoExporCSV" />
                <asp:PostBackTrigger ControlID="imgHistoricoExporXLS" />
                <asp:PostBackTrigger ControlID="imgExporCSV" />
                <asp:PostBackTrigger ControlID="imgExporXLS" />
            </Triggers>
            <ContentTemplate>
                <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCadastroTabela">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>


                <%-- FILTROS PESQUISA --%>
                <asp:Panel ID="pnlGrid" runat="server" DefaultButton="btnFiltrosPesquisa">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="ltrGridHeader" runat="server" />
                        </legend>

                        <div class="navegacao">
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroUnidadeNegocio" runat="server" />
                                <asp:DropDownList ID="ddFiltroUnidadeNegocio" runat="server" TabIndex="1" AutoPostBack="True" SkinID="DropFiltro" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroEstabelecimento" runat="server" />
                                <asp:DropDownList ID="ddFiltroestabelecimento" runat="server" TabIndex="2" AutoPostBack="True" SkinID="DropFiltro" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroTabelaId" runat="server" />
                                <asp:TextBox ID="txtFiltroTabelaId" runat="server" SkinID="Size70" MaxLength="30" TabIndex="3" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroItemId" runat="server" />
                                <asp:TextBox ID="txtFiltroItemId" runat="server" SkinID="Size70" MaxLength="30" TabIndex="4" />
                            </div>

                            <%--<div class="boxPesquisa">
                                <asp:Label ID="lblFiltroItemDescricao" runat="server" />
                                <asp:TextBox ID="txtFiltroItemDescricao" runat="server" SkinID="Size70" MaxLength="30" TabIndex="7" />
                            </div>--%>


                            <%-- Tabela Antiga --%>
                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroDataDe" runat="server" Visible="false" />
                                <CtlData:ControlData ID="CtlDataInicioValidade" runat="server" Visible="false" TabIndex="5" />
                            </div>

                            <div class="boxPesquisa">
                                <asp:Label ID="lblFiltroDataAte" runat="server" />
                                <%--<CtlData:ControlData ID="CtlDataTerminoValidade" runat="server" TabIndex="6" TabIndexBtn="7" />--%>

                                <asp:TextBox ID="CtlDataTerminoValidade" runat="server" onblur="validaData(this)" OnKeyPress="formatar('##/##/####', this)" 
                                                MaxLength="10" TabIndex="7" Width="80px" />

                                <asp:TextBox ID="CtlDataTerminoValidadeHora" runat="server" onblur="validaHora(this)" OnKeyPress="formatar('##:##', this)" 
                                                MaxLength="5"  TabIndex="7" Width="45px" />

                            </div>

                            <div class="boxPesquisa">
                                <div class="line">
                                    <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="ButtonLeftFind" TabIndex="8"  OnClick="btnFiltrosPesquisa_Click" />
                                    <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="ButtonRightClean" TabIndex="9"  OnClick="btnFiltrosLimpar_Click" />
                                </div>
                            </div>
                        </div>


                        <div style="width: 100%; text-align: right; float: left;">
                            <asp:ImageButton ID="imgExporCSV" runat="server" alt="Exportar CSV" title="Exportar CSV" OnClick="exporCSV_Click" ImageUrl="~/Imagens/down-csv.png" />
                            <asp:ImageButton ID="imgExporXLS" runat="server" alt="Exportar XLS" title="Exportar XLS" OnClick="imgExporXLS_Click" ImageUrl="~/Imagens/down-xls.png" />
                        </div>

                        <%-- GRID REGISTROS --%>
                        <div class="gridRegistros">
                            <asp:GridView ID="gvRegistros" runat="server" TabIndex="15"
                                DataKeyNames="tabelaPrecoImportacaoIdOficial,vlrMinimoOficial,vlrTabelaOficial,vlrMaximoOficial
                                            ,tabelaPrecoImportacaoInicioValOficial,tabelaPrecoImportacaoFimValOficial
                                            ,tabelaPrecoImportacaoId,unidadeNegocioId,estabelecimentoId
                                            ,estabelecimentoIdPara,clienteIdErp,itemId,tabelaPrecoVlrMinimo,tabelaPrecoVlrTabela
                                            ,tabelaPrecoVlrMaximo,tabelaPrecoImportacaoInicioVal,tabelaPrecoImportacaoFimVal"
                                OnPageIndexChanging="gvRegistros_PageIndexChanging"
                                OnRowDataBound="gvRegistros_RowDataBound"
                                OnRowCommand="gvRegistros_RowCommand" OnRowUpdating="gvRegistros_RowUpdating">
                                <Columns>
                                    <asp:BoundField DataField="unidadeNegocioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                    <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                    <asp:BoundField DataField="estabelecimentoIdPara" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                    <asp:BoundField DataField="clienteIdErp" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                    <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />

                                    <asp:BoundField DataField="tabelaPrecoImportacaoIdOficial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("vlrMinimoOficial", "{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("vlrTabelaOficial", "{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("vlrMaximoOficial", "{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="tabelaPrecoImportacaoFimValOficial" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />

                                    <asp:BoundField DataField="tabelaPrecoImportacaoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltabelaPrecoVlrMinimo" runat="server" Text='<%# Eval("tabelaPrecoVlrMinimo", "{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("tabelaPrecoVlrTabela", "{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("tabelaPrecoVlrMaximo", "{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="tabelaPrecoImportacaoFimVal" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />

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

                <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" Visible="false">
                    <div style="width: 100%; display: table;">
                        <fieldset style="margin-bottom: 100px;">
                            <legend>
                                <asp:Literal ID="ltrDadosHeader" runat="server" />
                            </legend>

                            <%-- BOTOES --%>
                            <div style="text-align: right; width: 100%; vertical-align: middle;">
                                <asp:Button ID="btnVoltar" runat="server" TabIndex="32" SkinID="ButtonCenter" OnClick="btnVoltar_Click" />
                            </div>
                            <div style="width: 100%; display: table;">

                                <div style="width: 100%;">
                                    <div style="width: 100%; text-align: right;">
                                        <asp:ImageButton ID="imgHistoricoExporCSV" runat="server" alt="Exportar CSV" title="Exportar CSV" OnClick="historicoExporCSV_Click" ImageUrl="~/Imagens/down-csv.png" />
                                        <asp:ImageButton ID="imgHistoricoExporXLS" runat="server" alt="Exportar XLS" title="Exportar XLS" OnClick="historicoExporXLS_Click" ImageUrl="~/Imagens/down-xls.png" />
                                    </div>

                                    <%--GRID ITENS--%>
                                    <asp:Panel ID="pnlGvItens" runat="server">
                                        <div style="display: table; width: 99.6%; height: 40%;">
                                            <fieldset style="height: 100%; width: 99%; position: relative; _position: fixed;">
                                                <%--<div style="height: 100; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">--%>
                                                <%--<center />--%>
                                                <asp:GridView ID="gvItens" runat="server" TabIndex="51"
                                                    DataKeyNames="tabelaPrecoImportacaoId,unidadeNegocioId,estabelecimentoId
                                                                ,estabelecimentoIdPara,clienteIdErp,itemId,tabelaPrecoVlrMinimo,tabelaPrecoVlrTabela
                                                                ,tabelaPrecoVlrMaximo,tabelaPrecoImportacaoInicioVal,tabelaPrecoImportacaoFimVal,usuarioId,usuarioIdAprovador"
                                                    OnPageIndexChanging="gvItens_PageIndexChanging"
                                                    OnRowCommand="gvItens_RowCommand"
                                                    OnRowDataBound="gvItens_RowDataBound"
                                                    OnRowUpdating="gvItens_RowUpdating">
                                                    <Columns>
                                                        <asp:BoundField DataField="tabelaPrecoImportacaoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="unidadeNegocioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="estabelecimentoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="estabelecimentoIdPara" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="clienteIdERP" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="itemId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />

                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbltabelaPrecoVlrMinimo" runat="server" Text='<%# Eval("tabelaPrecoVlrMinimo", "{0:n2}") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("tabelaPrecoVlrTabela", "{0:n2}") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("tabelaPrecoVlrMaximo", "{0:n2}") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="tabelaPrecoImportacaoInicioVal" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                                        <asp:BoundField DataField="tabelaPrecoImportacaoFimVal" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" />
                                                        <asp:BoundField DataField="usuarioId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                        <asp:BoundField DataField="usuarioIdAprovador" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" />
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>
                                                <%--</div>--%>
                                            </fieldset>
                                        </div>
                                    </asp:Panel>

                                </div>

                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>
