<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadUsuarioNovaSenha.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadUsuarioNovaSenha" %>
<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlData.ascx" TagName="ControlData" TagPrefix="CtlData" %>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagName="Alert" TagPrefix="CtlAlert" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript">
        function consisteCampos() {

            var msg = "";

            if (document.getElementById('ContentPlaceHolder1_txtSenhaAtual').value == '')
                msg += "- Informe a senha atual\r";

            if (document.getElementById('ContentPlaceHolder1_txtNovaSenha').value == '')
                msg += "- Informe a nova senha\r";

            if (document.getElementById('ContentPlaceHolder1_txtNovaSenhaConfirma').value == '')
                msg += "- Confirme a nova senha\r";

            if (msg == '') {
                if (document.getElementById('ContentPlaceHolder1_txtNovaSenha').value != document.getElementById('ContentPlaceHolder1_txtNovaSenhaConfirma').value)
                    msg += "Nova senha e senha de confirmação informadas são diferentes.";
            }

            if (msg != '') {
                alert(msg);
                return false;
            } else {
                return true;
            }

        }
    </script>
    <asp:Panel ID="pnlSenhaUsuario" runat="server">
        <CtlAlert:Alert ID="CtlAlert" runat="server" />
    <asp:UpdatePanel ID="uppSenhaUsuario" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
            </Triggers>
            <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="uppSenhaUsuario">
                    <ProgressTemplate>
                        <div class="ProgressBackGround"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                 <asp:Panel ID="pnlAltera" runat="server" Visible="True" SkinID="PnlPopUp">
                            <div class="OpacityBackGround">
                            </div>
                            <div class="painel" style="width:70%; height: 60%; left: 15%; top: 20%;">
                                <div class="painel_header">
                                    <div class="painel_header_message">
                                        <asp:Label ID="lblHeaderAprovar" runat="server" ForeColor="White" />
                                    </div>
                                </div>
                                <%--CONTEÚDO PRINCIPAL--%>
                                <div class="painel_body" style="height: 75%;">
                                        <div style="position: relative; width: 99.5%; height: 100%;">
                                              <%-- INFORME DADOS --%>
                <asp:Panel ID="pnlDados" runat="server" DefaultButton="btnSalvar" Visible="True">
                        <div style="border-right: solid 1px #ccc; float:left; padding-top:10px; padding-left:10px; width: 50%; height:250px;margin-left: 10px; margin-top: 30px; margin-bottom:10px"><asp:Label ID="lblRegrasSenha" runat="server"/> </div>
                        <div style="border: solid 0px; width: 40%; float:left; margin-top: 60px; padding-left:20px; margin-bottom:100px;">
                            <div style="border: solid 0px; float: left; width: 30%; padding-top: 4px; padding-bottom: 4px; text-align: right; height:20px; line-height:20px;"><asp:Label ID="lblSenha" runat="server"/></div>
                            <div style="border: solid 0px; float: left; width: 69%; padding-top: 4px; padding-bottom: 4px; height:20px;">
                                <asp:TextBox ID="txtSenhaAtual" Width="190px" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <div style="border: solid 0px; float: left; width: 30%; padding-top: 4px; padding-bottom: 4px; text-align: right; height:20px; line-height:20px;""><asp:Label ID="lblNovaSenha" runat="server"/></div>
                            <div style="border: solid 0px; float: left; width: 69%; padding-top: 4px; padding-bottom: 4px; height:20px;">
                                <asp:TextBox ID="txtNovaSenha" Width="190px" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <div style="border: solid 0px; float: left; width: 30%; padding-top: 4px; padding-bottom: 4px; text-align: right; height:20px; line-height:20px;""><asp:Label ID="lblNovaSenhaConfirma" runat="server"/></div>
                            <div style="border: solid 0px; float: left; width: 69%; padding-top: 4px; padding-bottom: 4px;  height:20px;">
                                <asp:TextBox ID="txtNovaSenhaConfirma" Width="190px" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
<div style="border: solid 0px; float:right; width: 49%; padding-top: 4px; padding-bottom: 4px; padding-right:1px; text-align: right; height:20px; line-height:20px; margin-right:82px">
                                <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" /></div>
                        </div>
                </asp:Panel>

                 <%-- CLIENTE CONTATOS --%>
 <%--               <div style="position: absolute;">
                    <asp:UpdatePanel ID="upContatos" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlContatos" runat="server" Visible="false">
                                <div class="OpacityBackGround"></div>
                                <div class="painel">
                                    <div class="painel_header">
                                        <div class="painel_header_message">
                                            <asp:Label ID="lblContatosHeader" value="Ops" runat="server" ForeColor="White" />
                                        </div>
                                        <div class="alert_header_icon">
                                          
                                        </div>
                                    </div>
                                    <div class="painel_body">

                                        <iframe ID="frmContatos" runat="server" style="width: 99%; height: 100%;" />
                                    </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>--%>
                                        </div>
                                </div>
                                <%--FIM CONTEÚDO PRINCIPAL--%>
                         </div>
                       </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
