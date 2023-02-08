<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true"
    CodeBehind="ConExecSimuladorCarga.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Consultas.ConExecSimuladorCarga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="left: 0.5%; height: 70%; width: 99%; position: fixed;">
        <fieldset style="left: 0.5%; width: 99%;">
            <legend>
                <asp:Literal ID="lblJoTabelaPrecoHeader" runat="server" Text="<%$ Resources:Resource, lblJobSimuladorHeader %>" />
            </legend>
            <asp:Timer ID="tmrCustos" runat="server" Interval="1000" Enabled="false" ontick="tmrCustos_Tick" />
            <asp:UpdatePanel ID="uppCustos" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnExecutarCustos" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="tmrCustos" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
                    <%-- PROGRESS BACKGROUND --%>
                    <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppCustos">
                        <ProgressTemplate>
                            <div class="ProgressBackGround"></div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>

                    <div style="display: table; width: 100%; height: 200px;">
                        <div style="display: table; width: 100%; height: 20%;">
                            <div style="display: table-cell; width: 10%; height: 100%; text-align: center; vertical-align: middle;">
                                <asp:Button ID="btnExecutarCustos" runat="server" Width="160px" Text="<%$ Resources:Resource, lblExecSimuladorCargaCustos %>" OnClick="btnExecutarCustos_Click" />
                            </div>
                            <div style="display: table-cell; width: 90%; height: 100%; text-align: left; vertical-align: middle;"></div>
                        </div>
                        <div style="display: table; width: 100%; height: 80%; border: solid 1px Gray; border-radius: 5px 5px 5px 5px;">
                            <div style="display: table-cell; width: 10%; vertical-align: middle; text-align: center;">
                                <asp:Image ID="imgIconeOperacao" runat="server" ImageAlign="AbsMiddle" Height="60px" Width="60px" ImageUrl="~/Imagens/LabelOrange.png" />
                            </div>
                            <div style="display: table-cell; width: 90%; vertical-align: middle;">
                                <asp:Label ID="lblMensagem" runat="server" />
                                <asp:ImageButton ID="imbViewLogCustos" runat="server" 
                                                 Width="25px" Height="25px" 
                                                 Visible="false" 
                                                 ToolTip="<%$ Resources:Resource, lblVisualizar %>" 
                                                 ImageAlign="AbsMiddle"
                                                 ImageUrl="~/Imagens/find.png"
                                                 onclick="imbViewLogCustos_Click" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Timer ID="tmrRegras" runat="server" Interval="1000" Enabled="false" ontick="tmrRegras_Tick" />
            <asp:UpdatePanel ID="uppRegras" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="tmrRegras" EventName="Tick" />
                    <asp:AsyncPostBackTrigger ControlID="btnExecutarRerasGerais" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <%-- PROGRESS BACKGROUND --%>
                    <asp:UpdateProgress ID="upgRegras" runat="server" AssociatedUpdatePanelID="uppRegras">
                        <ProgressTemplate>
                            <div class="ProgressBackGround"></div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>

                    <div style="display: table; width: 100%; height: 200px; ">
                        <div style="display: table; width: 100%; height: 20%;">
                            <div style="display: table-cell; width: 10%; height: 100%; text-align: center; vertical-align: middle;">
                                <asp:Button ID="btnExecutarRerasGerais" runat="server" Width="160px" Text="<%$ Resources:Resource, lblExecSimuladorCargaRegras %>" OnClick="btnExecutarRerasGerais_Click" />
                            </div>
                            <div style="display: table-cell; width: 90%; height: 100%; text-align: left; vertical-align: middle;"></div>
                        </div>
                        <div style="display: table; width: 100%; height: 80%; border: solid 1px Gray; border-radius: 5px 5px 5px 5px;">
                            <div style="display: table-cell; width: 10%; vertical-align: middle; text-align: center;">
                                <asp:Image ID="imgIconeOperacaoRegras" runat="server" ImageAlign="AbsMiddle" Height="60px" Width="60px" ImageUrl="~/Imagens/LabelOrange.png" />
                            </div>
                            <div style="display: table-cell; width: 90%; vertical-align: middle;">
                                <asp:Label ID="lblMensagemRegras" runat="server" />
                                <asp:ImageButton ID="imbViewLogRegras" runat="server" 
                                                 Width="25px" Height="25px" 
                                                 Visible="false" 
                                                 ToolTip="<%$ Resources:Resource, lblVisualizar %>" 
                                                 ImageAlign="AbsMiddle"
                                                 ImageUrl="~/Imagens/find.png"
                                                 onclick="imbViewLogRegras_Click" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </fieldset>

        <%-- PAINEL QUE APRESENTA DESCRIÇÕES DO LABEL --%>
        <asp:UpdatePanel ID="uppDescricao" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="imbViewLogCustos" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="imbViewLogRegras" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlDescricao" runat="server" Visible="false" SkinID="PnlPopUp">
                    <div class="OpacityBackGround"></div>
                    <div class="painel" style="width: 50%; height: 60%; left: 25%; top: 20%;">
                        <div class="painel_header">
                            <div class="painel_header_message">
                                <asp:Label ID="lblDescricoesHeader" runat="server" ForeColor="White" />
                            </div>
                            <div class="alert_header_icon">
                                <asp:ImageButton ID="imbDescricaoClose" runat="server" ImageAlign="AbsMiddle" Width="25px" Height="25px" 
                                                    ToolTip="<%$ Resources:Resource, lblFechar %>" 
                                                    ImageUrl="~/Imagens/Fechar.png"
                                                    OnClick="imbDescricaoClose_Click" />
                            </div>
                        </div>
                        <div class="painel_body">
                            <fieldset>
                                <asp:TextBox ID="txtDescricoesBody" runat="server" TextMode="MultiLine" Width="98%" Height="90%" Font-Bold="true" ForeColor="Blue" Enabled="false" />
                                <asp:HiddenField ID="hdfDscCustos" runat="server" Value="" />
                                <asp:HiddenField ID="hdfDscRegras" runat="server" Value="" />
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>
