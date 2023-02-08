<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Home.Home" %>

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

<%--    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/bootstrap.js"></script>
    <link href="../../Styles/custom.css" rel="stylesheet" />
    <script src="../../Scripts/Chart.bundle.min.js"></script>
    <script src="../../Scripts/Chart.js"></script>
    <link href="../../Styles/font-awesome.css" rel="stylesheet" />



    <script src="../../Scripts/loader.js"></script>

    <script src="../../Scripts/amcharts4/core.js"></script>
    <script src="../../Scripts/amcharts4/charts.js"></script>
    <script src="../../Scripts/amcharts4/plugins/wordCloud.js"></script>
    <script src="../../Scripts/amcharts4/themes/animated.js"></script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--    <script language="javascript">

        function charts(data) {

            var jsonData = data;
            google.charts.load('current', {
                'packages': ['geochart']               
            });
            google.charts.setOnLoadCallback(drawVisualization);
        

            function drawVisualization() {
                var data = new google.visualization.DataTable();

                data.addColumn('string', 'Estado');
                data.addColumn('number', 'Vendas');
                data.addColumn('number', 'Valor');


                var val = jsonData;

                for (var i = 0; i < val.length; i++) {
                    var Estado = val[i].Estado;
                    var Vendas = val[i].Vendas;
                    var Valor = val[i].Valor;
                    data.addRows([[Estado, Vendas, Valor]]);
                }


                var options = {
                    region: 'BR',
                    displayMode: 'regions',
                    resolution: 'provinces',
                    height: '30%',
                    width: '100%',
                    'legend': { textStyle: { color: 'navy', fontSize: 10 } }
                };


                chart = new google.visualization.GeoChart(document.getElementById('VendasPorRegiao'));

                chart.draw(data, options);
            }
        }


        function WordCloud(data) {

            am4core.ready(function () {

                am4core.useTheme(am4themes_animated);
                var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
                var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());

                series.randomness = 0.2;
                series.accuracy = 5;
                series.step = 25;
                series.maxcount = 250;
                series.minwordlength = 3;
                series.maxfontsize = am4core.percent(25);

                //cores
                series.colors = new am4core.ColorSet();
                series.colors.passOptions = {};
                series.labels.template.propertyFields.fill = "color";

                //Lista fat banco de dados
                series.data = data;

                //tooltip celular & totalliquido
                series.labels.template.tooltiptext = "{celula} : {totalliquido}";
                series.fontfamily = "arial";

                series.dataFields.word = "celula";
                series.dataFields.value = "totalliquido";

                //series.labels.template.url = "http://ferramentas.oncoprod.com.br/";
                //series.labels.template.urlTarget = "_blank";

                series.labels.template.tooltipText = "{word}:\n[bold]{value}[/]";

                var subtitle = chart.titles.create();
                //subtitle.text = "(Clique para ser direcionado)";

                //
                var title = chart.titles.create();
                title.text = "OncoSales";
                title.fontSize = 20;
                title.fontWeight = "900";
            
            }); 

        }

    </script>
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
                                        <h2>Vendas por região  <small>
                                            <asp:Label ID="lblDataVendaRegiao" runat="server" Text=""></asp:Label>
                                        </small></h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="demo-container">
                                                <asp:Panel ID="pnlGraficoPedido" runat="server">
                                                    <asp:Button ID="Button1" runat="server" Style="display: none" Text="" />
                                                    <div id="VendasPorRegiao" style="margin: 1em"></div>
                                                    <asp:Literal ID="ltrPedidos" runat="server"></asp:Literal>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Word Cloud<small>
                                            <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
                                        </small></h2>
                                        <div class="nav navbar-right panel_toolbox">

                                            <asp:DropDownList ID="ddlTipoRegistro" runat="server" SkinID="ddlBootstrap" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoRegistro_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="1" Text="Unidade Negócio" />
                                                <asp:ListItem Value="2" Text="Atendente" />
                                                <asp:ListItem Value="3" Text="Estabelecimento" />
                                                <asp:ListItem Value="4" Text="Grupo" />
                                                <asp:ListItem Value="5" Text="Estado" />
                                                <asp:ListItem Value="6" Text="Produto" />
                                            </asp:DropDownList>

                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="demo-container">
                                                <asp:Panel ID="Panel1" runat="server">
                                                  
                                                    <div id="chartdiv" style="margin: 1em"></div>
                                                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                                </asp:Panel>
                                            </div>
                                        </div>
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
    --%>
    <div class="container-fluid">
        <table id="Tabela_01" style="width: 100%" height="768" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td>
                    <img src="../../Imagens/Tela-Kraft-Oncoprodsar.jpg" style="width: 100%" height="768" alt="">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
