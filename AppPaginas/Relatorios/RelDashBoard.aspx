<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelDashBoard.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelDashBoard" %>

<%@ Register Src="~/AppControles/Mensagem.ascx" TagPrefix="uc1" TagName="Mensagem" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Mensagem runat="server" ID="MensagemBox" />
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.js" type="text/javascript"></script>
    <link href="../../Styles/custom.css" rel="stylesheet" />

    <link href="../../Styles/font-awesome.css" rel="stylesheet" />
    <link href="../../Styles/CustomDash.css" rel="stylesheet" />
    <link href="../../Styles/Style.css" rel="stylesheet" />
    <asp:UpdatePanel ID="uppDash" runat="server">
          <Triggers>
                <asp:PostBackTrigger ControlID="btnExportarExcel" />
            </Triggers>
        <ContentTemplate>

            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Dashboard</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                            <li class="breadcrumb-item active">ONCOSALES</li>
                        </ol>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Filtros</h3>
                </div>
                <div class="card-body">
                    <div class="col-8"></div>
                    <div class="alignright">
                        <div class="boxPesquisaCurta">
                            <asp:Label ID="lblTipoDash" runat="server" Text="Tipo DashBoard" />
                            <asp:DropDownList ID="ddlTipoDash" runat="server" SkinID="ddlBootstrap2" />
                        </div>
                        <div class="boxPesquisa">
                            <div class="line">
                                <asp:Button ID="btnFiltrosPesquisa" runat="server" SkinID="BtnSuccess"
                                    OnClick="btnFiltrosPesquisa_Click" />
                                <asp:Button ID="btnFiltrosLimpar" runat="server" SkinID="BtnWarning"
                                    OnClick="btnFiltrosLimpar_Click" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->


                <div class="row">
                    <asp:DataList ID="dlDetalheDash"
                        OnItemDataBound="dlDetalheDash_ItemDataBound"
                        OnItemCommand="dlDetalheDash_ItemCommand"
                        HorizontalAlign="Left" RepeatDirection="Horizontal"
                        RepeatLayout="Table" RepeatColumns="4" ItemStyle-CssClass="widthBox"
                        runat="server">

                        <ItemTemplate>
                            <%--      <div class="row">--%>
                            <div class="col-lg-12 col-12">
                                <!-- small box -->
                                <div class='small-box  <%# Eval("corCard") %>'>
                                    <div class='inner'>
                                        <h3><%# Eval("QTD") %> </h3>
                                        <p><%# Eval("STATUS") %>  </p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-pie-chart"></i>
                                    </div>
                                    <asp:LinkButton ID="lnkDetalhe" runat="server" SkinID="SmallBoxFooter" CommandName="NewItem" CommandArgument='<%# Eval("DashId")  %>'>
                                                                               Detalhe <i class='fa fa-arrow-circle-right'></i>
                                    </asp:LinkButton>

                                </div>
                            </div>
                            <%-- </div>--%>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <asp:Panel ID="pnlDetalheDash" runat="server">

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">
                            <asp:Label ID="lblgridDetalheDash" runat="server" /></h3>
                        <div class="nav navbar-right panel_toolbox">
                            <asp:LinkButton ID="btnExportarExcel" data-toggle="tooltip" data-placement="top" OnClick="btnExportarExcel_Click" title="Exportar para Excel" runat="server" SkinID="LinkButtonSuccess"> <span class="fa fa-file-excel-o"></span></asp:LinkButton>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>


                                <asp:GridView ID="gvDetalhe" runat="server" SkinID="gvConsolidadoEstoque" AutoGenerateColumns="true" OnPageIndexChanging="gvDetalhe_PageIndexChanging">
                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <!-- /.card-body -->
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
