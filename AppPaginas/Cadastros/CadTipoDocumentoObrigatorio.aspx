<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadTipoDocumentoObrigatorio.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadTipoDocumentoObrigatorio" %>

<%-- CONTROLES --%>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Import Namespace="Comom=KRAFTSALES.DATAENTITIES.Utility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upDocumentos" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAnexar" />
        </Triggers>

        <ContentTemplate>
            <asp:Panel ID="pnlDocumentos" runat="server" CssClass="tabStripPanel" Width="100%" Height="500px">
                <fieldset style="margin-top: 41px; height: 100%; z-index: 1;">
                    <div style="width: 100%; display: table;">
                        <div style="width: 50%; display: table-cell;">
                            <ol>
                                <li>
                                    <asp:Label ID="lblClienteWfDocumentoTipo" runat="server" SkinID="LabelForm" />
                                    <asp:DropDownList ID="ddlClienteWfDocumentoTipo" runat="server" TabIndex="1" />
                                </li>
                                <li>
                                    <asp:Label ID="lblClienteWfDocumentoNome" runat="server" SkinID="LabelForm" />
                                    <asp:TextBox ID="txtClienteWfDocumentoNome" runat="server" MaxLength="30" TabIndex="3" />
                                </li>
                                <li>
                                    <asp:Label ID="lblClienteWfDocumento" runat="server" SkinID="LabelForm" />
                                    <asp:FileUpload ID="fulClienteWfDocumento" runat="server" TabIndex="4" />
                                    <%--ucc:AsyncFileUpload ID="fulClienteWfDocumento" runat="server" TabIndex="4" />--%>
                                    <%--<ucc:AsyncFileUpload ID="fulClienteWfDocumento" runat="server" Width="400px" UploaderStyle="Traditional"
                                                                         UploadingBackColor="#CCFFFF" ThrobberID="myThrobber" />--%>
                                </li>
                                <li>
                                    <div class="line">
                                        <div class="line_itens_left">
                                            <asp:Label ID="lblClienteDocumentoValidade" runat="server" SkinID="LabelForm" />
                                        </div>
                                        <div class="line_itens">
                                            <CtlData:ControlData ID="CtlClienteDocumentoValidade" runat="server" TabIndex="5" TabIndexBtn="6" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="line">
                                        <div class="line_itens_left">
                                            <asp:Label ID="lblClienteWfDocumentoObs" runat="server" SkinID="LabelForm" />
                                        </div>
                                        <div class="line_itens">
                                            <asp:TextBox ID="txtClienteWfDocumentoObs" runat="server" MaxLength="500" TextMode="MultiLine" Columns="100" Rows="5" TabIndex="7" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div style="margin-left: 150px;">
                                        <asp:CheckBox ID="chkClienteWfDocumentoValido" runat="server" Font-Bold="true" TabIndex="8" Enabled="false"
                                            Text="<%$ Resources:Resource, lblDocumentoValido %>" />
                                    </div>
                                </li>
                                <li>
                                    <div style="width: 100%; text-align: center;">
                                        <%--<asp:Button ID="btnAnexar" runat="server" ValidationGroup="Validacao" OnClick="btnAnexar_Click" />--%>
                                        <asp:Button ID="btnAnexar" runat="server" OnClick="btnAnexar_Click" />
                                    </div>
                                </li>
                            </ol>
                        </div>
                        <div style="width: 50%; display: table-cell;">
                            <asp:Panel ID="pnlLinks" runat="server">
                                <ol>
                                    <li>
                                        <div class="div_a">
                                            <a id="lnkFazenda" runat="server" href="http://www.receita.fazenda.gov.br" target="_blank">http://www.receita.fazenda.gov.br</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_a">
                                            <a id="lnkSintegra" runat="server" href="http://www.sintegra.gov.br" target="_blank">http://www.sintegra.gov.br</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_a">
                                            <a id="lnkSimples" runat="server" href="http://www8.receita.fazenda.gov.br/SimplesNacional"
                                                target="_blank">http://www8.receita.fazenda.gov.br/SimplesNacional</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_a">
                                            <a id="lnkSuframa" runat="server" href="http://www.suframa.gov.br" target="_blank">http://www.suframa.gov.br</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_a">
                                            <a id="lnkEquifax" runat="server" href="https://consulta.equifax.com.br/Default.asp"
                                                target="_blank">https://consulta.equifax.com.br/Default.aspx</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_a">
                                            <a id="lnkCisp" runat="server" href="http://www.cisp.com.br" target="_blank">http://www.cisp.com.br</a>
                                        </div>
                                    </li>
                                </ol>
                            </asp:Panel>
                        </div>
                    </div>
                    <div style="width: 100%; vertical-align: middle; margin-bottom: 100px;">
                        <asp:GridView ID="gvDocumentos" runat="server" TabIndex="15" PageSize="2" DataKeyNames="tipoDocumentoId,clienteDocumentoDataCadastro,clienteDocumentoNomeArquivo,clienteId,
                                        clienteDocumentoObservacoes,clienteDocumentoSeq,clienteDocumentoValidade,
                                        clienteDocumentoValido,clienteDocumentoArquivoExtensao,usuarioCadastrador"
                            OnPageIndexChanging="gvDocumentos_PageIndexChanging" OnRowCommand="gvDocumentos_RowCommand"
                            OnRowDataBound="gvDocumentos_RowDataBound" OnRowDeleting="gvDocumentos_RowDeleting"
                            OnRowUpdating="gvDocumentos_RowUpdating">
                            <Columns>
                                <asp:BoundField DataField="tipoDocumentoId" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="clienteDocumentoSeq" DataFormatString="{0:d3}" ItemStyle-Width="80px"
                                    ItemStyle-HorizontalAlign="Center" />
                                <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Literal ID="ltrDataCadastro" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="clienteDocumentoNomeArquivo" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center" />
                                <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Literal ID="ltrDocValido" runat="server" Text='<%# bool.Parse(Eval("clienteDocumentoValido").ToString()) ? GetResourceValue("lblSim") : GetResourceValue("lblNao") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="clienteDocumentoObservacoes" />
                                <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Literal ID="ltrValidade" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbDownload" runat="server" SkinID="ImgGrid" CommandName="Download"
                                            CommandArgument='<%# ((GridViewRow)Container).RowIndex + "|" + Eval("clienteId") %>'
                                            ToolTip="<%$ Resources:Resource, lblDownload %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imbExcluir" runat="server" SkinID="ImgGrid" ImageUrl="~/Imagens/_trash.png"
                                            CommandName="Delete" CommandArgument='<%# Container.DataItemIndex + "|" + Eval("clienteId") %>'
                                            ToolTip="<%$ Resources:Resource, lblExcluir %>" />
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
</asp:Content>
