<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadImportacaoDadosClientesRepresentantes.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadImportacaoDadosClientesRepresentantes" %>

<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--       <script type="text/javascript">

           function abrirPopUp() {
               document.getElementById('ContentPlaceHolder1_uppdosClientes').style.display = 'block';
           }
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="uppdosClientes" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="imbItensExportar"  />
        </Triggers>
        <ContentTemplate>

            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppdosClientes">
                <ProgressTemplate>
                    <div class="ProgressBackGround">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <fieldset style="left: 0.5%; width: 99%; height: auto;">
                <legend>
                    <asp:Literal ID="Literal1" runat="server" Text="Importar Dados Clientes" />
                </legend>

                <div style="border: solid 0px; width: 5%; height: 100%; float: right; vertical-align: middle; text-align: center" >
                    <asp:ImageButton ID="imbItensExportar" runat="server" Width="30px" Height="30px" ImageAlign="AbsMiddle"
                        ToolTip="<%$ Resources:Resource, lblExportarExcel %>"
                        ImageUrl="~/Imagens/xlsx.png" OnClientClick="return abrirPopUp()" OnClick="imbItensExportar_Click" />
                </div>
                <div class="boxPesquisa">
                    <asp:Label runat="server" Text="CNPJ:" />
                    <asp:TextBox ID="txtCnpj" SkinID="Filtro" runat="server" MaxLength="14" TabIndex="36"  />
                </div>
                <div class="boxPesquisa">
                    <asp:Label runat="server" Text="Razao:" />
                    <asp:TextBox ID="txtRazao" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="36" />
                </div>
                    <div class="boxPesquisa">
                    <asp:Label  runat="server" Text="Grupo:" />
                    <asp:TextBox ID="txtGrupo" SkinID="Filtro" runat="server" MaxLength="50" TabIndex="36" />
                </div>
                <div class="boxPesquisa">
                    <asp:Button Text="Pesquisar" ID="pesquisar" OnClick="pesquisar_Click" runat="server" />
                </div>
                <div class="boxPesquisa">
                    <asp:Button Text="Limpar" ID="btnLimpar" OnClick="btnLimpar_Click" runat="server" />
                </div>

                <fieldset style="height: auto; width: 99%; position: relative; _position: fixed;">
                    <asp:GridView ID="gridClienteRepresentante" runat="server" DataKeyNames=" CNPJ	,
                                    clienteRazaoSocial,
                                    clienteEmailComercial,
                                    clienteEmailNFE,
                                    clienteIE,
                                    clienteGrupoComercialNome,
                                    representanteNome,
                                    clienteEndereco,
                                    bairro,
                                    cidade,
                                    clienteTelefoneContato,
                                    clienteContatoCelular"
                        onpageindexchanging="gridClienteRepresentante_PageIndexChanging" >
                        <Columns>




                            <asp:BoundField HeaderText="CNPJ" DataField="CNPJ" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="Razão" DataField="clienteRazaoSocial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="E-Mail Comercial" DataField="clienteEmailComercial" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="E-Mail NFE" DataField="clienteEmailNFE" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                             <asp:BoundField HeaderText="I.E." DataField="clienteIE" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="Grupo" DataField="clienteGrupoComercialNome" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="Representante" DataField="representanteNome" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="Endereço" DataField="clienteEndereco" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="Bairro" DataField="bairro" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="Cidade" DataField="cidade" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="Contato" DataField="clienteTelefoneContato" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                            <asp:BoundField HeaderText="Celular" DataField="clienteContatoCelular" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px" ItemStyle-Wrap="true" />
                        </Columns>
                    </asp:GridView>
                    <div style="height: auto; overflow-x: none; overflow-y: scroll; margin-top: 5px; margin-bottom: 5px;">
                    </div>

                </fieldset>
            </fieldset>

        </ContentTemplate>
    </asp:UpdatePanel>


   
</asp:Content>
