<%@ Page Title="Configuração de Restrições dos Produtos" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CfgRestricProduto.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CfgRestricProduto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>

    <script type="text/javascript">

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 13 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        function checkTamTexto(controlNome, controlTitulo, controlInfo, tamanhoMax) {
            texto = document.getElementById("ContentPlaceHolder1_" + controlNome).value;
            tamAtual = texto.length;
            msgAlert = (tamanhoMax - tamAtual) + " caracteres restantes.";
            document.getElementById(controlInfo).value = msgAlert;
            if (tamAtual >= tamanhoMax) {
                msgAlert = "O campo " + controlTitulo + " suporta no máximo " + tamanhoMax + " caracteres.";
                alert(msgAlert);
                document.getElementById("ContentPlaceHolder1_" + controlNome).value = texto.substring(0, tamanhoMax);
                return false;
            }
            else {
                return true;
            }
        }

        function abreDocumentoPdf(pIdDoc) {
            // abre doc PDF para visualização
            // alert("Abrir Arquivo: " + pIdDoc);
            window.open("CfgRestricProduto_Report.aspx?id=" + pIdDoc);
            return true;
        }

    </script>

    <style type="text/css">
        .LabelInfo {
            border-style: none;
            background-color: transparent;
            width: 100%;
            text-align: center;
        }

        .GridView td {
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

        .colorAzulKs {
            color: #14293E;
        }

        .borderLeft {
            border-left: solid 1px #aaaaaa;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="colorAzulKs">Configuração de Restrições dos Produtos - Pessoa Jurídica</h3>


    <!--  ************************************  SELEÇÃO  ************************************  -->

    <asp:UpdatePanel ID="updSelRestricao" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlSelRestricao" runat="server">
                <fieldset class="pad-10">
                    <legend>Seleção de uma Restrição</legend>
                    <div class="row">
                        <div class="col-lg-2">
                            Código da Restrição<br />
                            <asp:TextBox ID="txtFiltroIdRestricao" runat="server" MaxLength="30" Style="width: 90%; max-width: 150px"></asp:TextBox>
                        </div>
                        <div class="col-lg-2">
                            Nome da Restrição<br />
                            <asp:TextBox ID="txtFiltroNomeRestricao" runat="server" MaxLength="30" Style="width: 90%; max-width: 200px"></asp:TextBox>
                        </div>

                        <div class="col-lg-3 bordaLeft">
                            <div style="float: left; margin: 0">
                                Data Criação de:<br />
                                <CtlData:ControlData ID="dtFiltroCriacaoDe" runat="server" />
                            </div>
                            <div style="float: left; margin: 0">
                                até:<br />
                                <CtlData:ControlData ID="dtFiltroCriacaoAte" runat="server" />
                            </div>
                        </div>

                        <div class="col-lg-2">
                            Status<br />
                            <asp:DropDownList ID="ddlFiltroStatus" runat="server" Width="95%"></asp:DropDownList>
                        </div>

                        <div class="col-lg-3 text-righ borderLeft">
                            <asp:Button ID="btnSelRestricao" runat="server" Text="Pesquisar" SkinID="BtnDefault-sm" OnClick="btnSelRestricao_Click" />&nbsp;
                            <asp:Button ID="btnLimpaSelRestricao" runat="server" Text="Limpar" SkinID="BtnDefault-sm" OnClick="btnLimpaSelRestricao_Click" />&nbsp;
                            <asp:Button ID="btnNovaRestricao" runat="server" Text="Nova Restrição" SkinID="BtnDefault-sm" OnClick="btnNovaRestricao_Click" />
                        </div>
                    </div>

                    <div style="clear: both">
                        <span style="margin: 3px;">
                            <hr />
                        </span>
                    </div>

                    <asp:GridView DataKeyNames="restricaoId"
                        runat="server"
                        ID="gvSelRestricao"
                        AutoGenerateColumns="False"
                        AllowPaging="True"
                        OnRowDataBound="gvSelRestricao_RowDataBound"
                        OnPageIndexChanging="gvSelRestricao_PageIndexChanging"
                        OnRowCommand="gvSelRestricao_RowCommand"
                        EmptyDataText="Não foi encontrado nenhum resultado!">
                        <Columns>
                            <asp:BoundField DataField="restricaoId" HeaderText="Código" />
                            <asp:BoundField DataField="restricaoNome" HeaderText="Nome da Restrição" />
                            <asp:BoundField DataField="chaveOrigem" HeaderText="Informação 1" />
                            <asp:BoundField DataField="chaveDestino" HeaderText="Informação 2" />
                            <asp:BoundField DataField="tipoRestricao" HeaderText="Tipo" />
                            <asp:BoundField DataField="status" HeaderText="Status" />
                            <asp:BoundField DataField="dataCriacao" HeaderText="Criação" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="userId" HeaderText="Usuário" />

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbEditar" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle"
                                        ImageUrl="~/Imagens/find.png"
                                        CommandName="Selecionar"
                                        ToolTip="Selecionar"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" ImageAlign="AbsMiddle"
                                        ImageUrl="~/Imagens/Fechar.png"
                                        CommandName="Excluir"
                                        ToolTip="Excluir"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                    </asp:GridView>
                    <div class="center">
                        <asp:Localize ID="lblgvSelRestricaoPageInfo" runat="server"></asp:Localize>
                    </div>
                </fieldset>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  ***********************************  NOVA REGRA  ***********************************  -->
    <asp:UpdatePanel ID="updNovaRestricao" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlDadosRestricao" runat="server">
                <div style="float: right; margin: -30px 20px">
                    <asp:Button ID="btnVoltarSelecao" runat="server" Text="Voltar" SkinID="BtnDefault-sm" OnClick="btnCancelNovaRestricao_Click" />
                </div>
                <div style="clear:both"></div>
                <fieldset class="pad-10">
                    <legend>Dados da Restrição
                        <asp:Localize ID="lblrestricaoId" runat="server" /></legend>
                    <div class="row">
                        <div class="col-lg-4">
                            Nome:<br />
                            <asp:TextBox ID="txtrestricaoNome" runat="server" MaxLength="64" Style="width: 95%; max-width: 200px"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 borderLeft">
                            Descrição (opcional):<br />
                            <asp:TextBox ID="txtrestricaoDescr" runat="server" TextMode="MultiLine" Style="width: 95%; max-width: 320px; height: 90px; resize: none;"
                                onkeyup="return checkTamTexto('txtrestricaoDescr', 'Descrição', 'lblInfoTamDescr', 255)" /><br />
                            <input type="text" class="LabelInfo" id="lblInfoTamDescr" />
                        </div>
                        <div class="col-lg-4 borderLeft">
                            <p>
                                Tipo de Restrição:<br />
                                <asp:DropDownList ID="ddltipoRestricao" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddltipoRestricao_SelectedIndexChanged"></asp:DropDownList>
                            </p>
                            <asp:Localize ID="lblInfoTipoRestricao" runat="server" /></legend>
                            <hr />
                            <p>
                                Status:<br />
                                <asp:DropDownList ID="ddlstatus" runat="server"></asp:DropDownList>
                            </p>
                        </div>
                    </div>

                    <div style="clear: both">
                        <span style="margin: 3px;">
                            <hr />
                        </span>
                    </div>

                    <div class="row">
                        <div class="col-lg-5">
                            <fieldset class="pad-5">
                                <legend>Informação 1 (Origem)</legend>
                                Quando definir:
                                <br />
                                <asp:DropDownList ID="ddlchaveOrigem" runat="server"></asp:DropDownList>
                            </fieldset>
                        </div>
                        <div class="col-lg-5 borderLeft">
                            <fieldset class="pad-5">
                                <legend>Informação 2 (destino)</legend>
                                <asp:Localize ID="lbltipoRestricaoInfo1" runat="server">Verificar</asp:Localize>:<br />
                                <asp:DropDownList ID="ddlchaveDestino" runat="server"></asp:DropDownList>
                            </fieldset>
                        </div>
                        <div class="col-lg-2 borderLeft text-center">
                            <p>
                                <asp:Button ID="btnIniciarConfig" runat="server" Text="Iniciar Configuração" SkinID="BtnWarning" OnClick="btnIniciarConfig_Click" />
                            </p>
                            <p>
                                <asp:Button ID="btnCancelNovaRestricao" runat="server" Text="Cancelar" SkinID="BtnDanger" OnClick="btnCancelNovaRestricao_Click" />
                            </p>
                        </div>
                    </div>


                </fieldset>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  **********************************  DEFINE REGRA  **********************************  -->

    <asp:UpdatePanel ID="updConfirmRestricao" runat="server">
        <ContentTemplate>

            <asp:Panel ID="pnlDefineRestricao" runat="server">
                <div style="float: right; margin: -30px 20px">
                    <asp:Button ID="btnVoltarDadosRestricao" runat="server" Text="Voltar" SkinID="BtnDefault-sm" OnClick="btnDadosRestricao_Click" />
                </div>
                <div style="clear:both"></div>
                <fieldset class="pad-10">
                    <legend>Definição de Restrição</legend>

                    <h3>
                        <asp:Localize ID="lblDefineRestricao" runat="server" /></h3>

                    <!-- Informações da restrição -->
                    <div class="row">
                        <div class="col-lg-2">
                            Tipo:
                    <asp:Label ID="lbltipoRestricao" runat="server" Text="Label"
                        CssClass="btn-default" Style="font-size: 120%; padding: 6px" />
                        </div>
                        <div class="col-lg-2 borderLeft">
                            Nome:<br />
                            <b>
                                <asp:Localize ID="lblrestricaoNome" runat="server" /></b>
                        </div>
                        <div class="col-lg-2 borderLeft">
                            Descrição:<br />
                            <b>
                                <asp:Localize ID="lblrestricaoDescr" runat="server" /></b>
                        </div>
                        <div class="col-lg-2 borderLeft">
                            Relacionar (Origem):<br />
                            <b>
                                <asp:Localize ID="lblchaveOrigem" runat="server" /></b>
                        </div>
                        <div class="col-lg-2 borderLeft">
                            Com (Destino):<br />
                            <b>
                                <asp:Localize ID="lblchaveDestino" runat="server" /></b>
                        </div>
                        <div class="col-lg-1 borderLeft">
                            Usuario: <b>
                                <asp:Localize ID="lbluserId" runat="server" /></b><br />
                            Criação: <b>
                                <asp:Localize ID="lbldataCriacao" runat="server" /></b>
                        </div>

                        <div class="col-lg-1 borderLeft text-right">
                            <asp:Button ID="btnReport" runat="server" Text="Relatório" SkinID="BtnDefault-sm" OnClientClick="return abreDocumentoPdf('')" />
                        </div>

                    </div>



                    <div style="clear: both;">
                        <span style="margin: 10px;"></span>
                    </div>

                    <!-- Definição da restrição -->
                    <div class="row">

                        <!-- Coluna Esquerda -->
                        <div class="col-lg-6">

                            <asp:UpdatePanel ID="updDefineRestricOrigem" runat="server">
                                <ContentTemplate>
                                    <fieldset class="pad-5">
                                        <legend>
                                            <asp:Localize ID="lblDefinTituloOrigem" runat="server" /></legend>
                                        <!-- filtros da origem -->
                                        <!-- possivel origem: fabricanteId, familiaComercialId, familiaMaterialId, grupoEstoqueId, tipoProdutoId, itemId -->

                                        <!-- Filtro Fabricante -->
                                        <asp:Panel ID="pnlOrigFiltroFabric" runat="server" CssClass="pad-5">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    Codigo:<br />
                                                    <asp:TextBox ID="txtFiltroIdFabric" runat="server" MaxLength="10" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 borderLeft">
                                                    Nome:<br />
                                                    <asp:TextBox ID="txtFiltroNomeFabric" runat="server" MaxLength="30" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 borderLeft">
                                                    CNPJ:<br />
                                                    <asp:TextBox ID="txtFiltroCnpjFabric" runat="server" MaxLength="30" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-2 borderLeft text-right">
                                                    <asp:Button ID="btnSelecFabric" runat="server" Text="Selecionar" SkinID="BtnDefault-sm" OnClick="btnSelecFabric_Click" />
                                                </div>
                                            </div>
                                            <div style="clear: both">
                                                <span style="margin: 3px;">
                                                    <hr />
                                                </span>
                                            </div>
                                        </asp:Panel>

                                        <!-- Filtro Familia Comercial -->
                                        <asp:Panel ID="pnlOrigFiltroFamiliaCom" runat="server" CssClass="pad-5">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    Nome:
                                        <asp:TextBox ID="txtFiltroNomeFamiliaCom" runat="server" MaxLength="30" Style="width: 60%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 borderLeft text-right">
                                                    <asp:Button ID="btnSelecFamiliaCom" runat="server" Text="Selecionar" SkinID="BtnDefault-sm" OnClick="btnSelecFamiliaCom_Click" />
                                                </div>
                                            </div>
                                            <div style="clear: both">
                                                <span style="margin: 3px;">
                                                    <hr />
                                                </span>
                                            </div>
                                        </asp:Panel>

                                        <!-- Filtro Familia Material -->
                                        <asp:Panel ID="pnlOrigFiltroFamiliaMat" runat="server" CssClass="pad-5">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    Nome:
                                        <asp:TextBox ID="txtFiltroNomeFamiliaMat" runat="server" MaxLength="30" Style="width: 60%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 borderLeft text-right">
                                                    <asp:Button ID="btnSelecFamiliaMat" runat="server" Text="Selecionar" SkinID="BtnDefault-sm" OnClick="btnSelecFamiliaMat_Click" />
                                                </div>
                                            </div>
                                            <div style="clear: both">
                                                <span style="margin: 3px;">
                                                    <hr />
                                                </span>
                                            </div>
                                        </asp:Panel>

                                        <!-- Filtro Item -->
                                        <asp:Panel ID="pnlOrigFiltroItem" runat="server" CssClass="pad-5">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    Código:<br />
                                                    <asp:TextBox ID="txtFiltroIdItem" runat="server" MaxLength="10" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 borderLeft">
                                                    Nome:<br />
                                                    <asp:TextBox ID="txtFiltroNomeItem" runat="server" MaxLength="30" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 borderLeft">
                                                    Fabricante:<br />
                                                    <asp:TextBox ID="txtFiltroFabrItem" runat="server" MaxLength="30" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-2 borderLeft text-right">
                                                    <asp:Button ID="btnSelecItem" runat="server" Text="Selecionar" SkinID="BtnDefault-sm" OnClick="btnSelecItem_Click" />
                                                </div>
                                            </div>
                                            <div style="clear: both">
                                                <span style="margin: 3px;">
                                                    <hr />
                                                </span>
                                            </div>
                                        </asp:Panel>

                                        <div class="text-right">
                                            Mostrar:&nbsp;
                                    <asp:Button ID="btnFiltroSimOrigem" runat="server" Text="Mostrar Marcados" SkinID="BtnDefault-xs" OnClick="btnFiltroSimOrigem_Click" />&nbsp;
                                    <asp:Button ID="btnFiltroNaoOrigem" runat="server" Text="Mostrar Desmarcados" SkinID="BtnDefault-xs" OnClick="btnFiltroNaoOrigem_Click" />&nbsp;
                                    <asp:Button ID="btnFiltroTodosOrigem" runat="server" Text="Todos" SkinID="BtnDefault-xs" OnClick="btnFiltroTodosOrigem_Click" />&nbsp;
                                        </div>
                                        <asp:Localize ID="lblDefinMsgOrigem" runat="server" />
                                        <div>
                                            <!-- grid da origem -->
                                            <asp:GridView DataKeyNames="coluna1, coluna2"
                                                runat="server"
                                                ID="gvValOrigem"
                                                AutoGenerateColumns="false"
                                                AllowPaging="True"
                                                SkinID="GridViewTable"
                                                OnPageIndexChanging="gvValOrigem_PageIndexChanging"
                                                OnRowDataBound="gvValOrigem_RowDataBound"
                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkTodosValOrigem" CssClass="flat" AutoPostBack="true" runat="server"
                                                                Text="Marcar" OnCheckedChanged="chkTodosValOrigem_CheckedChanged" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkValOrigem" runat="server" CssClass="flat"
                                                                AutoPostBack="true" OnCheckedChanged="chkValOrigem_CheckedChanged" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="coluna1" HeaderText="Código" />
                                                    <asp:BoundField DataField="coluna2" HeaderText="Nome" />
                                                    <asp:BoundField DataField="coluna3" HeaderText="" />
                                                    <asp:BoundField DataField="coluna4" HeaderText="" />
                                                </Columns>
                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="11pt" CssClass="GridPager" />
                                            </asp:GridView>
                                            <div class="center">
                                                <asp:Localize ID="lblgvValOrigemPageInfo" runat="server"></asp:Localize>
                                            </div>
                                        </div>
                                    </fieldset>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <!-- Coluna Direita -->
                        <div class="col-lg-6">
                            <asp:UpdatePanel ID="updDefineRestricDestino" runat="server">
                                <ContentTemplate>
                                    <fieldset class="pad-5">
                                        <legend>
                                            <asp:Localize ID="lblDefinTituloDestino" runat="server" /></legend>
                                        <!-- filtros do destino -->
                                        <!-- possivel destino: pais, estado, cidade, estabelecimentoId, clienteGrupoComercialId, canalVendaId, clienteId  -->

                                        <!-- Filtro Pais -->
                                        <asp:Panel ID="pnlDestFiltroPais" runat="server" CssClass="pad-5">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    Nome:
                                        <asp:TextBox ID="txtFiltroNomePais" runat="server" MaxLength="30" Style="width: 60%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 borderLeft text-right">
                                                    <asp:Button ID="btnSelecPais" runat="server" Text="Selecionar" SkinID="BtnDefault-sm" OnClick="btnSelecPais_Click" />
                                                </div>
                                            </div>
                                            <div style="clear: both">
                                                <span style="margin: 3px;">
                                                    <hr />
                                                </span>
                                            </div>
                                        </asp:Panel>

                                        <!-- Filtro Cidade -->
                                        <asp:Panel ID="pnlDestFiltroCidade" runat="server" CssClass="pad-5">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    Nome:<br />
                                                    <asp:TextBox ID="txtFiltroNomeCidade" runat="server" MaxLength="30" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3 borderLeft">
                                                    Estado (BR):<br />
                                                    <asp:DropDownList ID="ddlFiltroUfCidade" runat="server" Style="width: 90%; max-width: 200px"></asp:DropDownList>
                                                </div>
                                                <div class="col-md-3 borderLeft text-right">
                                                    <asp:Button ID="btnSelecCidade" runat="server" Text="Selecionar" SkinID="BtnDefault-sm" OnClick="btnSelecCidade_Click" />
                                                </div>
                                            </div>
                                            <div style="clear: both">
                                                <span style="margin: 3px;">
                                                    <hr />
                                                </span>
                                            </div>
                                        </asp:Panel>

                                        <!-- Filtro Cliente -->
                                        <asp:Panel ID="pnlDestFiltroCliente" runat="server" CssClass="pad-5">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    Codigo ERP:<br />
                                                    <asp:TextBox ID="txtFiltroIdErpCliente" runat="server" MaxLength="10" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 borderLeft">
                                                    Nome:<br />
                                                    <asp:TextBox ID="txtFiltroNomeCliente" runat="server" MaxLength="30" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 borderLeft">
                                                    CNPJ:<br />
                                                    <asp:TextBox ID="txtFiltroCnpjCliente" runat="server" MaxLength="30" Style="width: 90%; max-width: 200px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-2 borderLeft text-right">
                                                    <asp:Button ID="btnSelecCliente" runat="server" Text="Selecionar" SkinID="BtnDefault-sm" OnClick="btnSelecCliente_Click" />
                                                </div>
                                            </div>
                                            <div style="clear: both">
                                                <span style="margin: 3px;">
                                                    <hr />
                                                </span>
                                            </div>
                                        </asp:Panel>

                                        <div class="text-right">
                                            Mostrar:&nbsp;
                                    <asp:Button ID="btnFiltroSimDestino" runat="server" Text="Mostrar Marcados" SkinID="BtnDefault-xs" OnClick="btnFiltroSimDestino_Click" />&nbsp;
                                    <asp:Button ID="btnFiltroNaoDestino" runat="server" Text="Mostrar Desmarcados" SkinID="BtnDefault-xs" OnClick="btnFiltroNaoDestino_Click" />&nbsp;
                                    <asp:Button ID="btnFiltroTodosDestino" runat="server" Text="Todos" SkinID="BtnDefault-xs" OnClick="btnFiltroTodosDestino_Click" />&nbsp;
                                        </div>
                                        <asp:Localize ID="lblDefinMsgDestino" runat="server" />

                                        <div>
                                            <!-- grid do destino -->
                                            <asp:GridView DataKeyNames="coluna1, coluna2"
                                                runat="server"
                                                ID="gvValDestino"
                                                AutoGenerateColumns="false"
                                                AllowPaging="True"
                                                SkinID="GridViewTable"
                                                OnPageIndexChanging="gvValDestino_PageIndexChanging"
                                                OnRowDataBound="gvValDestino_RowDataBound"
                                                EmptyDataText="Não foi encontrado nenhum resultado!">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkTodosValDestino" CssClass="flat" AutoPostBack="true" runat="server"
                                                                Text="Marcar" OnCheckedChanged="chkTodosValDestino_CheckedChanged" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkValDestino" runat="server" CssClass="flat"
                                                                AutoPostBack="true" OnCheckedChanged="chkValDestino_CheckedChanged" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="coluna1" HeaderText="Código" />
                                                    <asp:BoundField DataField="coluna2" HeaderText="Nome" />
                                                    <asp:BoundField DataField="coluna3" HeaderText="" />
                                                    <asp:BoundField DataField="coluna4" HeaderText="" />
                                                </Columns>
                                                <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="11pt" CssClass="GridPager" />
                                            </asp:GridView>
                                            <div class="center">
                                                <asp:Localize ID="lblgvValDestinoPageInfo" runat="server"></asp:Localize>
                                            </div>
                                        </div>
                                    </fieldset>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>


                    </div>

                    <div style="clear: both">
                        <span style="margin: 3px;">
                            <hr />
                        </span>
                    </div>

                    <!-- Confirmação da restrição -->

                    <div class="row">

                        <!-- Coluna Esquerda -->
                        <div class="col-lg-4">
                            <h5 class="colorAzulKs">
                                <asp:Localize ID="lblDefinInfoOrigem" runat="server"></asp:Localize></h5>
                            <asp:BulletedList ID="blInfoOrigem" runat="server" />
                        </div>

                        <!-- Coluna Direita -->
                        <div class="col-lg-4 borderLeft">
                            <h5 class="colorAzulKs">
                                <asp:Localize ID="lblDefinInfoDestino" runat="server"></asp:Localize></h5>
                            <asp:BulletedList ID="blInfoDestino" runat="server" />
                        </div>

                        <!-- botões -->
                        <div class="col-lg-4 borderLeft text-center">
                            <p>
                                <asp:Button ID="btnConfirmConfig" runat="server" Text="Gravar Configuração" SkinID="BtnSuccess" OnClick="btnConfirmConfig_Click" />
                            </p>
                            <p>
                                <asp:Button ID="btnDadosRestricao" runat="server" Text="Dados da Restrição" SkinID="BtnInfo" OnClick="btnDadosRestricao_Click" />
                            </p>
                            <p>
                                <asp:Button ID="btnCancelConfig" runat="server" Text="Cancelar Configuração" SkinID="BtnDanger" OnClick="btnCancelConfig_Click" />
                            </p>
                        </div>

                    </div>

                </fieldset>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!--  ************************************************************************************  -->


    <asp:UpdateProgress ID="upLoading" runat="server">
        <ProgressTemplate>
            <div class="ProgressBackGround">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
