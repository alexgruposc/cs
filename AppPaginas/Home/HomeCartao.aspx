<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="HomeCartao.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Home.HomeCartao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <script>
        window.onload = function () {

            //Better to construct options first and then pass it as a parameter
            var options = {
                title: {
                    text: "Pedidos com implantação agendada"
                },
                data: [
                {
                    // Change type to "doughnut", "line", "splineArea", etc.
                    type: "column",
                    dataPoints: [
                        { label: "apple", y: 10 },
                        { label: "orange", y: 15 },
                        { label: "banana", y: 25 },
                        { label: "mango", y: 30 },
                        { label: "grape", y: 28 }
                    ]
                }
                ]
            };

            $("#chartContainer").CanvasJSChart(options);
        }
</script>--%>

    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/bootstrap.js"></script>
    <link href="../../Styles/custom.css" rel="stylesheet" />
    <script src="../../Scripts/Chart.bundle.min.js"></script>
    <script src="../../Scripts/Chart.js"></script>
    <link href="../../Styles/font-awesome.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="x_panel">
        <div class="x_title">
            <h2>Dashboard<small>
            </small></h2>
            <ul class="nav navbar-right panel_toolbox">
                <li>
                    <asp:LinkButton ID="lnkAtualizar" OnClick="lnkAtualizar_Click" ToolTip="Atualizar" CssClass="close-link" runat="server"><i class="fa fa-refresh"></i></asp:LinkButton>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <div class="container body">
                <div class="right_col">
                    <br />
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Situação pedidos mensal <small>
                                            <asp:Label ID="lblDataPedidoGrafico" runat="server" Text=""></asp:Label></small></h2>

                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <asp:UpdatePanel ID="updBotao" runat="server" UpdateMode="Conditional">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnClick" EventName="Click" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <asp:Button ID="btnClick" Width="1px" Height="1px" Style="opacity: 0; margin-left: -1200px;" runat="server" Text="" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <canvas id="pieChart" style="display: block; height: 240px; width: 530px;"></canvas>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Pedidos Aguardando Fidelize</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">

                                        <asp:GridView ID="gvdPedidosFidelize" runat="server" OnRowDataBound="gvdPedidosFidelize_RowDataBound" OnPageIndexChanging="gvdPedidosFidelize_PageIndexChanging">
                                            <Columns>

                                                <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                                <asp:BoundField DataField="pedidoSituacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                <asp:BoundField DataField="pedidoData" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                            </Columns>
                                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Pedidos Fidelize Cancelado <small>
                                            <asp:Label ID="lblPedidosFidelize" runat="server" Text=""></asp:Label></small></h2>

                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <asp:UpdatePanel ID="updPedidoCancelados" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="gvPedidosFidelizeCancelados" runat="server" OnRowDataBound="gvPedidosFidelizeCancelados_RowDataBound" OnPageIndexChanging="gvPedidosFidelizeCancelados_PageIndexChanging">
                                                    <Columns>

                                                        <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                                        <asp:BoundField DataField="pedidoSituacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                        <asp:BoundField DataField="pedidoData" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                        <asp:BoundField DataField="pedidoMotivoDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Pedidos Cancelados (CD Virtual) <small>
                                            <asp:Label ID="lblPedidosExpirados" runat="server" Text=""></asp:Label></small></h2>

                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="gvPedidosExpirado" runat="server" OnRowDataBound="gvPedidosExpirado_RowDataBound" OnPageIndexChanging="gvPedidosExpirado_PageIndexChanging">
                                                    <Columns>

                                                        <asp:BoundField DataField="pedidoId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="320px" />
                                                        <asp:BoundField DataField="pedidoSituacao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
                                                        <asp:BoundField DataField="pedidoData" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />

                                                        <asp:TemplateField HeaderText="Posto">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDescricao" runat="server" Text='<%#Eval("pedidoMotivoDescricao") %>' CssClass="tooltips" data-placement="right" data-html="true" title='<%# string.Format("Descrição:{0}", "Pedido expirado/cancelado CD virtual, os pedidos que utilizam cd virtual devem ser faturados no mesmo dia de sua emissão.") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--<asp:BoundField DataField="pedidoMotivoDescricao" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />--%>
                                                    </Columns>
                                                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                                                </asp:GridView>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />


                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
