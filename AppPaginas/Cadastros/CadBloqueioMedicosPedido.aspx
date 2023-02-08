<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="CadBloqueioMedicosPedido.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Cadastros.CadBloqueioMedicosPedido" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ucc" %>
<%@ Register Src="~/AppControles/CtlPeriodo.ascx" TagPrefix="CtlPeriodo" TagName="ControlPeriodo" %>
<%@ Register Src="~/AppControles/CtlData.ascx" TagPrefix="CtlData" TagName="ControlData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
    <br />
    <asp:UpdatePanel ID="updCadastro" runat="server">
        <ContentTemplate>
            <%-- PROGRESS BACKGROUND --%>
            <asp:UpdateProgress ID="upLoading" runat="server" AssociatedUpdatePanelID="updCadastro">
                <ProgressTemplate>
                    <div class="ProgressBackGround"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <fieldset>
                <legend>
                    <asp:Literal ID="Literal3" runat="server" Text="Bloquear Médicos" />
                </legend>
                <asp:Panel ID="pnlDados" runat="server">
                    <asp:UpdatePanel ID="uppDados" runat="server">
                        <ContentTemplate>
                            <div class="form-row">
                                <div class="col-lg-10"></div>
                                <div class="col-lg-2">
                                </div>
                            </div>
                            <asp:UpdatePanel ID="updGridsDados" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlGridsDados" runat="server">
                                        <div class="form-row">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div class="x_panel">
                                                            <div class="x_title">
                                                                <h2>Médicos não selecionados </h2>
                                                                <div class="nav navbar-right panel_toolbox">

                                                                    <asp:LinkButton ID="btnAdcionarMedicos" data-toggle="tooltip" data-placement="top" OnClick="btnAdcionarMedicos_Click" title="Adicionar Médicos" runat="server" SkinID="LinkButtonSuccess"> <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>

                                                                </div>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                            <div class="x_content">
                                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="demo-container">
                                                                        <asp:Panel ID="pnlMedicosNaoSelecionado" runat="server" DefaultButton="btnPesquisarNaoSelMedicos">
                                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                                                                <ContentTemplate>
                                                                                    <div class="row">

                                                                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                            <asp:Label ID="lblCodigoCRMNaoSelec" runat="server" Text="Código CRM" />
                                                                                            <asp:TextBox ID="txtCodigoCRMNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                                        </div>

                                                                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                            <asp:Label ID="lblNomeSelecionado" runat="server" Text="Nome Médico" />
                                                                                            <asp:TextBox ID="txtNomeMedicoNaoSelec" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                        </div>

                                                                                        <div class="col-md-3" style="margin-top: 10px;">
                                                                                            <asp:LinkButton ID="btnPesquisarNaoSelMedicos" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btnPesquisarNaoSelMedicos_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                            <asp:LinkButton ID="btnLimparNaoSelMedicos" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btnLimparNaoSelMedicos_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                            
                                                                                        </div>

                                                                                    </div>
                                                                                    <br />
                                                                                    <div class="pad-10 mt-2">
                                                                                        <br />
                                                                                        <asp:GridView DataKeyNames="medId,medicoId,medicoCRM,medicoUFidCRM,medicoNome"
                                                                                            runat="server"
                                                                                            SkinID="GridViewTable"
                                                                                            ID="gvNaoSelMedicos"
                                                                                            AutoGenerateColumns="False"
                                                                                            AllowPaging="false"
                                                                                            OnPageIndexChanging="gvNaoSelMedicos_PageIndexChanging"
                                                                                            EmptyDataText="Não foi encontrado nenhum resultado!"
                                                                                            OnRowDataBound="gvNaoSelMedicos_RowDataBound">
                                                                                            <Columns>
                                                                                                <asp:TemplateField>
                                                                                                    <HeaderTemplate>
                                                                                                        <asp:CheckBox ID="chkTodosNaoSelMedicos" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosNaoSelMedicos_CheckedChanged" />
                                                                                                    </HeaderTemplate>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:CheckBox ID="chkNaoSelMedicos" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkNaoSelMedicos_CheckedChanged" />
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:BoundField DataField="medicoCRM" HeaderText="Código CRM" />
                                                                                                <asp:BoundField DataField="medicoNome" HeaderText="Nome Médico" />
                                                                                                <asp:BoundField DataField="medicoUFidCRM" HeaderText="UF" />   
                                                                                            </Columns>
                                                                                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                        </asp:GridView>
                                                                                       
                                                                                    </div>

                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </asp:Panel>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div class="x_panel">
                                                            <div class="x_title">
                                                                <h2>Médicos selecionados</h2>
                                                                <div class="nav navbar-right panel_toolbox">
                                                                    <asp:LinkButton ID="btnRemoverMedicos" runat="server" data-toggle="tooltip" OnClick="btnRemoverMedicos_Click" data-placement="top" title="Remover Médicos" SkinID="LinkButtonDanger"> <span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                            <div class="x_content">
                                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="demo-container">
                                                                        <asp:Panel ID="pnlMedicosSelecionado" runat="server" DefaultButton="btn_SelMedicos">
                                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                                                                <ContentTemplate>
                                                                                    <div class="row">

                                                                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                            <asp:Label ID="lblCodigoCRMSelecionado" runat="server" Text="Código CRM" />
                                                                                            <asp:TextBox ID="txtCodigoCRMSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="17" />
                                                                                        </div>

                                                                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                            <asp:Label ID="lblNomeMedicoSelecionado" runat="server" Text="Nome Médico" />
                                                                                            <asp:TextBox ID="txtNomeMedicoSelecionado" runat="server" SkinID="txtBootstrap" MaxLength="50" TabIndex="18" />
                                                                                        </div>

                                                                                        <div class="col-md-3" style="margin-top: 10px;">
                                                                                            <asp:LinkButton ID="btn_SelMedicos" data-toggle="tooltip" data-placement="top" title="Filtrar" runat="server" SkinID="LinkButtonSuccessMd" OnClick="btn_SelMedicos_Click"><span aria-hidden="true" class="glyphicon glyphicon-filter"></span></asp:LinkButton>
                                                                                            <asp:LinkButton ID="btn_LimpaSelMedicos" runat="server" data-toggle="tooltip" data-placement="top" title="Limpar" SkinID="LinkButtonDangerMd" OnClick="btn_LimpaSelMedicos_Click"> <span aria-hidden="true" class="glyphicon glyphicon-erase"></span></asp:LinkButton>
                                                                                            
                                                                                        </div>

                                                                                    </div>
                                                                                    <br />
                                                                                    <div class="pad-10 mt-2">
                                                                                        <br />
                                                                                        <asp:GridView DataKeyNames="medId,medicoId,medicoCRM,medicoUFidCRM,medicoNome"
                                                                                            runat="server"
                                                                                            ID="gvSelMedicos"
                                                                                            AutoGenerateColumns="False"
                                                                                            AllowPaging="True"
                                                                                            SkinID="GridViewTable"
                                                                                            OnPageIndexChanging="gvSelMedicos_PageIndexChanging"
                                                                                            OnRowDataBound="gvSelMedicos_RowDataBound"
                                                                                            EmptyDataText="Não foi encontrado nenhum resultado!">
                                                                                            <Columns>
                                                                                                <asp:TemplateField>
                                                                                                    <HeaderTemplate>
                                                                                                        <asp:CheckBox ID="chkTodosSelMedicos" CssClass="flat" AutoPostBack="true" runat="server" OnCheckedChanged="chkTodosSelMedicos_CheckedChanged" />
                                                                                                    </HeaderTemplate>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:CheckBox ID="chkSelMedicos" runat="server" CssClass="flat" AutoPostBack="true" OnCheckedChanged="chkSelMedicos_CheckedChanged" />
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:BoundField DataField="medicoCRM" HeaderText="Código CRM" />
                                                                                                <asp:BoundField DataField="medicoNome" HeaderText="Nome Médico" />
                                                                                                <asp:BoundField DataField="medicoUFidCRM" HeaderText="UF" />                                                                                              

                                                                                            </Columns>
                                                                                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#14293E" Font-Size="12pt" CssClass="GridPager" />
                                                                                        </asp:GridView>
                                                                                        <div class="center">
                                                                                            <asp:Localize ID="lblgvSelMedicosPageInfo" runat="server"></asp:Localize>
                                                                                        </div>

                                                                                    </div>

                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </asp:Panel>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <br />

                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

