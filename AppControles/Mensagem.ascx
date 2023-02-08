<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Mensagem.ascx.cs" Inherits="KRAFTSALES.AppControles.Mensagem" %>
<%--<link href="../../Styles/Style.css" rel="stylesheet" />
<script src="../Scripts/jQuery-2.1.4.min.js"></script>
<script src="../../Scripts/bootstrap.min.js"></script>--%>
 <link rel="Stylesheet" type="text/css" href='<%# ResolveUrl("../Styles/Style.css")%>' />
    <script src='<%# ResolveUrl("../Scripts/jQuery-2.1.4.min.js") %>'></script>
    <script src='<%# ResolveUrl("../Scripts/bootstrap.min.js") %>'></script>

<style>
    .modal-header-success {
        color: #fff;
        padding: 9px 15px;
        border-bottom: 1px solid #eee;
        background-color: #5cb85c;
        -webkit-border-top-left-radius: 5px;
        -webkit-border-top-right-radius: 5px;
        -moz-border-radius-topleft: 5px;
        -moz-border-radius-topright: 5px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }

    .modal-header-warning {
        color: #fff;
        padding: 9px 15px;
        border-bottom: 1px solid #eee;
        background-color: #f0ad4e;
        -webkit-border-top-left-radius: 5px;
        -webkit-border-top-right-radius: 5px;
        -moz-border-radius-topleft: 5px;
        -moz-border-radius-topright: 5px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }

    .modal-header-danger {
        color: #fff;
        padding: 9px 15px;
        border-bottom: 1px solid #eee;
        background-color: #d9534f;
        -webkit-border-top-left-radius: 5px;
        -webkit-border-top-right-radius: 5px;
        -moz-border-radius-topleft: 5px;
        -moz-border-radius-topright: 5px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }

    .modal-header-info {
        color: #fff;
        padding: 9px 15px;
        border-bottom: 1px solid #eee;
        background-color: #5bc0de;
        -webkit-border-top-left-radius: 5px;
        -webkit-border-top-right-radius: 5px;
        -moz-border-radius-topleft: 5px;
        -moz-border-radius-topright: 5px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }

    .modal-header-primary {
        color: #fff;
        padding: 9px 15px;
        border-bottom: 1px solid #eee;
        background-color: #428bca;
        -webkit-border-top-left-radius: 5px;
        -webkit-border-top-right-radius: 5px;
        -moz-border-radius-topleft: 5px;
        -moz-border-radius-topright: 5px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
</style>


<asp:UpdatePanel ID="upAlert" runat="server">
    <ContentTemplate>
        <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="ModalMensagem"  >
          
            <%--<div class="modal" id="ModalMensagem" role="dialog"  data-backdrop="static" data-keyboard="false" aria-labelledby="lblTituloModal" aria-hidden="true">--%>
            <div class="modal-dialog">
                <div class="modal-content esquerda">
                    <div id="TipoMensagem">
                        <%-- <asp:LinkButton ID="btnclose" runat="server"  Style="text-align:right;" CssClass="close" OnClick="btnclose_Click">&times;</asp:LinkButton>
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
                        <h4 class="modal-title">
                            <asp:Label ID="lblTituloModal" runat="server" Text=""></asp:Label></h4>
                    </div>
                    <div class="modal-body">
                          <asp:Panel ID="Panel1" runat="server"    CssClass="pnlMensagem" >
                        <div class="form-group">
                            <asp:Image ID="imgIconeSucesso" runat="server" Visible="false" ImageUrl="~/Imagens/successoM.png" />
                            <asp:Image ID="imgIconeErro" runat="server" Visible="false" ImageUrl="~/Imagens/erroM.png" />
                            <asp:Image ID="imgIconeAviso" runat="server" Visible="false" ImageUrl="~/Imagens/avisoM.png" />
                            <asp:Image ID="imgIconeinfo" runat="server" Visible="false" ImageUrl="~/Imagens/infoM.png" />
                            <asp:Label ID="lblConteudo" runat="server" CssClass="control-label" Text=""></asp:Label>
                        </div>
                              </asp:Panel>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group" style="text-align: center;">
                            <asp:Button SkinID="BtnSuccess-sm" data-dismiss="modal" UseSubmitBehavior="false" aria-hidden="true" ID="btnCustomiza" runat="server" Text="Salvar" OnClick="btnCustomiza_Click" />
                            <asp:Button ID="btnFecharM" OnClick="btnFecharM_Click" aria-hidden="true" SkinID="BtnDanger-sm" runat="server" Text="Fechar" />

                        </div>
                    </div>
                </div>
            </div>
            <%--</div>--%>
        </asp:Panel>
         
    </ContentTemplate>
</asp:UpdatePanel>
