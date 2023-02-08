<%@ Page Title="Consulta de Mapa de Embarque" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="SimuladorDataEntregaV2.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.SimuladorDataEntregaV2" %>

<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .colorAzulKs {
            color: #14293E;
        }

        .borda {
            border: solid 1px #c0c0c0;
        }

        .CtrCalend {
            /* border: solid 2px #0000dd; */
            position: relative;
        }

            .CtrCalend td {
                background-color: #e0e0e0;
                text-align: center;
            }

        div.BoxHeader {
            margin: 0px 0px 5px 0px;
            background-color: #14293E;
            color: #ffffff;
            padding: 5px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="colorAzulKs">Consulta de Mapa de Embarque</h3>

    <asp:UpdatePanel ID="updSelecao" runat="server">
        <ContentTemplate>
            <fieldset class="pad-5">
                <h4 class="colorAzulKs">Dados para Simulação</h4>

                <div class="row">
                    <div class="col-md-2">
                        UF de Origem:<br />
                        <asp:DropDownList ID="ddw_UfOrigem" runat="server" Style="width: 95%; max-width: 200px"></asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        UF de Destino:<br />
                        <asp:DropDownList ID="ddw_UfDestino" runat="server" Style="width: 95%; max-width: 200px" AutoPostBack="true" OnSelectedIndexChanged="ddw_UfDestino_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        Cidade de Destino:<br />
                        <asp:DropDownList ID="ddw_CidadeDestino" runat="server" Style="width: 95%; max-width: 200px"></asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        Tipo de Carga:<br />
                        <asp:DropDownList ID="ddw_TipoCarga" runat="server" Style="width: 95%; max-width: 200px"></asp:DropDownList>
                    </div>

                    <div class="col-md-2">
                        Unidade:<br />
                        <asp:DropDownList ID="ddw_Unidade" runat="server" Style="width: 95%; max-width: 200px"></asp:DropDownList>
                    </div>

                    <div class="col-md-2">
                        Consignado:<br />
                        <asp:DropDownList ID="ddw_Consignado" runat="server" Style="width: 95%; max-width: 200px"></asp:DropDownList>
                    </div>

                </div>

                <div style="clear: both; height: 10px;"></div>

                <div class="pad-5">

                    <div class="row">

                        <div class="col-md-5">
                            <div class="pad-5 borda" style="min-height: 50px">
                                <div class="row">
                                    <div class="col-md-6">
                                        Data do Pedido:<br />
                                        <div style="float: left; margin: 0">
                                            <CtlData:ControlData ID="dat_DataPedido" runat="server" />
                                        </div>
                                        <div style="float: left; margin: 2px">Hora</div>
                                        <div style="float: left; margin: 0">
                                            <asp:TextBox ID="txt_HoraPedido" runat="server" MaxLength="5" Style="max-width: 80px"></asp:TextBox>
                                            <ack:MaskedEditExtender
                                                ID="maskHoraPedido"
                                                runat="server"
                                                TargetControlID="txt_HoraPedido"
                                                Mask="99:99"
                                                MaskType="Time"
                                                MessageValidatorTip="true"></ack:MaskedEditExtender>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Button ID="btn_CalcDataEntrega" runat="server" Text="Calcular Data de Entrega" SkinID="BtnInfo" OnClick="btn_CalcDataEntrega_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="pad-5 borda" style="min-height: 50px">
                                <div class="row">
                                    <div class="col-md-5">
                                        Data da Entrega:<br />
                                        <div style="float: left; margin: 0">
                                            <CtlData:ControlData ID="dat_DataExpedicao" runat="server" />
                                        </div>
                                        <%--                                        <div style="float: left; margin: 2px">Hora</div>
                                        <div style="float: left; margin: 0">
                                            <asp:TextBox ID="txt_HoraExpedicao" runat="server" MaxLength="5" Style="max-width: 80px"></asp:TextBox>
                                        <ack:MaskedEditExtender
                                                ID="maskHoraExpedicao"
                                                runat="server"
                                                TargetControlID="txt_HoraExpedicao"
                                                Mask="99:99"
                                                MaskType="Time"
                                                MessageValidatorTip="true"></ack:MaskedEditExtender>
                                        </div>--%>
                                    </div>
                                    <div class="col-md-7">
                                        <asp:Button ID="btn_CalcDataExpedicao" runat="server" Text="Calcular Data de Expedição" SkinID="BtnInfo" OnClick="btn_CalcDataExpedicao_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="row">
                                <div class="col-md-6">
                                    Cliente ID:
                                    <br />
                                    <asp:TextBox ID="txt_clienteId" runat="server" MaxLength="10" Style="width: 95%; max-width: 120px"></asp:TextBox>
                                </div>
                                <div class="col-md-6 text-center">
                                    <asp:Button ID="btn_LimparSelecao" runat="server" Text="Limpar Seleção" SkinID="BtnDefault" OnClick="btn_LimparSelecao_Click" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </fieldset>

            <!-- ##########   RESULTADOS   ########## -->

            <div style="clear: both; height: 5px"></div>

            <fieldset class="mt-2 pad-10">
                <asp:Panel ID="panel_resultado" runat="server">
                    <h3 class="colorAzulKs">Resultado:
                        <asp:Localize ID="lbl_resultTitulo" runat="server"></asp:Localize></h3>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="CtrCalend">
                                <asp:Calendar ID="Calend_result" runat="server" Style="position: relative"></asp:Calendar>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="pad-10 borda">
                                <div class="BoxHeader">
                                    <b>Parâmetros</b>
                                </div>
                                <asp:Localize ID="lbl_resultDados" runat="server"></asp:Localize>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="pad-10 borda">
                                <div class="BoxHeader">
                                    <b>Resultado</b>
                                </div>
                                <asp:Localize ID="lbl_resultData" runat="server"></asp:Localize>

                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </fieldset>


        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
