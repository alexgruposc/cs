<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KRAFTSALES.Login" %>
<%-- CONTROLE --%>
<%@ Register Src="~/AppControles/CtlAlert.ascx" TagPrefix="CtlAlert" TagName="ControlAlert" %>
<%-- ******** --%>

<!DOCTYPE html>
<html>

<head id="Head1" runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
     <link rel="apple-touch-icon" sizes="57x57" href="Imagens/Icon/apple-icon-57x57.png"/>
<link rel="apple-touch-icon" sizes="60x60" href="Imagens/Icon/apple-icon-60x60.png"/>
<link rel="apple-touch-icon" sizes="72x72" href="Imagens/Icon/apple-icon-72x72.png"/>
<link rel="apple-touch-icon" sizes="76x76" href="Imagens/Icon/apple-icon-76x76.png"/>
<link rel="apple-touch-icon" sizes="114x114" href="Imagens/Icon/apple-icon-114x114.png"/>
<link rel="apple-touch-icon" sizes="120x120" href="Imagens/Icon/apple-icon-120x120.png"/>
<link rel="apple-touch-icon" sizes="144x144" href="Imagens/Icon/apple-icon-144x144.png"/>
<link rel="apple-touch-icon" sizes="152x152" href="Imagens/Icon/apple-icon-152x152.png"/>
<link rel="apple-touch-icon" sizes="180x180" href="Imagens/Icon/apple-icon-180x180.png"/>
<link rel="icon" type="image/png" sizes="192x192"  href="Imagens/Icon/android-icon-192x192.png"/>
<link rel="icon" type="image/png" sizes="32x32" href="Imagens/Icon/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="96x96" href="Imagens/Icon/favicon-96x96.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="Imagens/Icon/favicon-16x16.png"/>

<meta name="msapplication-TileColor" content="#ffffff"/>
<meta name="msapplication-TileImage" content="Imagens/Icon/ms-icon-144x144.png"/>
<meta name="theme-color" content="#ffffff"/>


    <!-- CSS -->
    <%--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">--%>
    <link rel="stylesheet" href="Styles/font-awesome.min.css">
    <link rel="stylesheet" href="Styles/form-elements.css">
    <link href="Styles/style_login.css" rel="Stylesheet" type="text/css" />
    <%--<link href="Styles/Style.css" rel="Stylesheet" type="text/css" />--%>
    <script language="javascript" type="text/javascript">

        function capLock(e) {
            kc = e.keyCode ? e.keyCode : e.which;
            sk = e.shiftKey ? e.shiftKey : ((kc == 16) ? true : false);
            if (((kc >= 65 && kc <= 90) && !sk) || ((kc >= 97 && kc <= 122) && sk))
                document.getElementById('divMayus').style.visibility = 'visible';
            else
                document.getElementById('divMayus').style.visibility = 'hidden';
        }

    </script>
</head>

<body>
    <form id="Form2" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server" AllowCustomErrorsRedirect="true" AsyncPostBackTimeout="600"
            ScriptMode="Debug" EnableScriptGlobalization="true" EnableScriptLocalization="true">
        </asp:ScriptManager>
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
            </ContentTemplate>
        </asp:UpdatePanel>
        <ctlalert:controlalert ID="CtlAlert" runat="server" />
        <asp:UpdatePanel ID="upLoadLogin" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnLogin" EventName="Click" />
                <%--  <asp:AsyncPostBackTrigger ControlID="btnAlteraSenha" EventName="Click" />--%>
            </Triggers>
            <ContentTemplate>
                <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="upLoadLogin">
                    <ProgressTemplate>
                        <div class="ProgressBackGround">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <!-- Top content -->
                <div class="top-content">
                    <div class="inner-bg">
                        <div class="container">
                            <div class="login_In form-box">
                                <asp:ValidationSummary runat="server" ID="ValidationSummary3"
                                        DisplayMode="BulletList"
                                        ShowMessageBox="False" ShowSummary="True" ValidationGroup="Validacao" />
                                <div class="row">
                                    <div class="col-sm-6 col-lg-6">
                                        <div class="form-top-center">
                                            <asp:Image ID="imgBody" runat="server" Width="199px" Height="181px" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-lg-6">
                                        <div class="input-group">
                                            <asp:Label ID="lblLogin" runat="server" AssociatedControlID="txtLogin" CssClass="control-label" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-lg-6">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <asp:TextBox ID="txtLogin" runat="server" SkinID ="txtUserName"  />
                                            <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator6" Display="None" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="txtLogin" ErrorMessage="Informe o login!" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-lg-6">
                                        <div class="input-group">
                                            <asp:Label ID="lblPassword"  runat="server" AssociatedControlID="txtPassword" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-lg-6">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <asp:TextBox ID="txtPassword" runat="server" SkinID ="txtUserName" TextMode="Password" />
                                            <asp:RequiredFieldValidator ValidationGroup="Validacao" ID="RequiredFieldValidator1" Display="None" runat="server" SetFocusOnError="true" CssClass="alert-text" ControlToValidate="txtPassword" ErrorMessage="Informe sua senha!" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <p></p>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <asp:Button ID="btnLogin" runat="server" ValidationGroup="Validacao" SkinID="BtnSuccessLogin" OnClick="btnLogin_Click" />
                                    </div>
                                </div>
                                <p class="omb_forgotPwd">
                                                <asp:LinkButton ID="lbEsqueciSenha" Text="Esqueci a senha" SkinID ="LinkButton" OnClick="lbEsqueciSenha_Click" runat="server" />
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
                 <%--PRIMEIRO ACESSO MUDA SENHA --%>
            <div style="position: absolute;" >
                <asp:UpdatePanel ID="uppAlteraSenha" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAlteraSenha" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <asp:Panel ID="pnlAlteraSenha" runat="server" Visible="false" SkinID="PnlPopUp" DefaultButton="btnAlteraSenha">
                        <div class="OpacityBackGround"></div>
                        <div class="painel" style="width:40%; height:40%; margin-left:26%; margin-top:10%">
                            <div class="painel_header">
                                <div class="painel_header_message">
                                    <asp:Label ID="lblAlteraSenhaHeader" runat="server" ForeColor="White" />
                                </div>
                                <div class="alert_header_icon">
                                </div>
                            </div>
                            <div class="painel_body" style="height:70%">
                                <fieldset>
                                    <legend>
                                        <asp:Literal ID="ltrAlteraSenhaHeader" runat="server" />
                                    </legend>
                                    <ol>
                                        <li>
                                            <asp:Label ID="lblSenha" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtSenha" runat="server"  TextMode="Password" />
                                        </li>
                                        <li>
                                            <asp:Label ID="lblConfirmaSenha" runat="server" SkinID="LabelForm" />
                                            <asp:TextBox ID="txtConfirmaSenha" runat="server"  TextMode="Password" />
                                        </li>
                                        <li>
                                            <div class="login_line">
                                                <asp:Button ID="btnAlteraSenha" runat="server" OnClick="btnAlteraSenha_Click" />
                                            </div>
                                        </li>
                                    </ol>
                                </fieldset>
                            </div>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%-- HEADER --%>
    <div class="header">
        <div class="Inner_header">
            <div class="Inner_Left">
                <asp:Image ID="imgHeader" runat="server" ImageAlign="AbsMiddle" Width="180px" Height="50px" />
            </div>
            <div class="Inner_Center">
                <asp:Label ID="lblHeader" runat="server" ForeColor="White" />
            </div>
            <div class="Inner_Right">
            </div>
        </div>
    </div>

    <%-- FOOTER --%>
    <div class="footer">
        <div class="Inner_footer">
            <div class="Inner_Left">
                <asp:Label ID="lblFooterVersion" runat="server" Font-Bold="true" ForeColor="White" Visible="true" />
            </div>
            <div class="Inner_Right">
                <asp:Label ID="lblFooterCopiryght" runat="server" ForeColor="White" />
            </div>
        </div>
    </div>

    </form>

    

    <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

</body>

</html>
