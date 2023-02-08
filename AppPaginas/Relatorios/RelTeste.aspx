<%@ Page Title="" Language="C#" MasterPageFile="~/AppMaster/KraftMaster.Master" AutoEventWireup="true" CodeBehind="RelTeste.aspx.cs" Inherits="KRAFTSALES.AppPaginas.Relatorios.RelTeste" %>
<%@ Register Src="~/AppControles/CtlOption.ascx" TagPrefix="CtlOption" TagName="ControleOption" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:UpdatePanel runat="server">
<ContentTemplate>

<CtlOption:ControleOption ID="CtlOption" runat="server" />
<asp:Button ID="btnPS" runat="server" Text="PharmaSystem" OnClick="btnPS_Click" />
<asp:DropDownList ID="ddl" runat="server" />
<asp:DropDownList ID="DropDownList1" runat="server" />
<asp:DropDownList ID="DropDownList2" runat="server" />
<asp:DropDownList ID="DropDownList3" runat="server" />
<asp:DropDownList ID="DropDownList4" runat="server" />
<asp:DropDownList ID="DropDownList5" runat="server" />

<asp:RadioButtonList ID="rd" runat="server" RepeatDirection="Horizontal" />
<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" />

<asp:CheckBoxList ID="chk" runat="server" RepeatDirection="Horizontal" />
<asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" />

<asp:ListBox ID="lst" runat="server" />
<asp:ListBox ID="ListBox1" runat="server" />

<asp:Button ID="btnOption" runat="server" Text="Default" OnClick="btnOption_Click" />
<asp:Button ID="btnOp1" runat="server" Text="Teste" OnClick="btnOp1_Click" />
<asp:Button ID="btnOp2" runat="server" Text="Outro" OnClick="btnOp2_Click" />
<asp:Button ID="btnEfetuado" runat="server" Text="Efetuado" OnClick="btnEfetuado_Click" />
<asp:Button ID="btnCheckDll" runat="server" Text="DLL's" OnClick="btnCheckDll_Click" />
<asp:Button ID="btn7PDV" runat="server" Text="7PDV" OnClick="btn7PDV_Click" />
<asp:Button ID="btnAlrtRsr" runat="server" Text="AlertResource" OnClick="btnAlrtRsr_Click" />

<asp:Label ID="lblBody" runat="server" />

<asp:Button ID="btnCtlOptionMaster1" runat="server" Text="Option Master 01" Width="120px" onclick="btnCtlOptionMaster1_Click" />
<asp:Button ID="btnCtlOptionMaster2" runat="server" Text="Option Master 02" Width="120px" onclick="btnCtlOptionMaster2_Click" />

<asp:GridView ID="gv" runat="server" 
    AllowPaging="false"
    OnRowDataBound="gv_RowDataBound">
    <Columns>
        <asp:TemplateField ItemStyle-Width="50px">
            <ItemTemplate>
                <asp:LinkButton ID="lb" runat="server" 
                                Text='<%# Eval("Id") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Nome" />
    </Columns>
</asp:GridView>

<asp:Button ID="btnLimpar" runat="server" Text="<%$ Resources:Resource, lblLimpar %>" OnClick="btnLimpar_Click" />
<asp:Button ID="btnCarga" runat="server" Text="Carga" OnClick="btnCarga_Click" />
<asp:TextBox ID="txtEquality" runat="server" />
<asp:Button ID="btnEquals" runat="server" Text="Equals" OnClick="btnEquals_Click" />
<asp:Button ID="btnEquality" runat="server" Text="Equality" OnClick="btnEquality_Click" />

<asp:GridView ID="gv2" runat="server" OnRowDataBound="gv2_RowDataBound">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Label ID="lblCodigo" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="lblItem" />
        <asp:BoundField DataField="lblDescricao" />
        <asp:BoundField DataField="lblNome" />
    </Columns>
</asp:GridView>
<br />
<asp:GridView ID="gv3" runat="server" 
              OnRowDataBound="gv3_RowDataBound" 
              OnRowCommand="gv3_RowCommand">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:ImageButton ID="ibNrm" runat="server" CommandName="Normal" AlternateText="" ImageUrl="~/Imagens/find.png" Width="25px" Height="25px" ImageAlign="AbsMiddle" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="lblItem" />
        <asp:BoundField DataField="lblDescricao" />
        <asp:BoundField DataField="Consolidado" />
        <asp:BoundField DataField="Cancelado" />
        <asp:TemplateField SortExpression="Cancel">
            <ItemTemplate>
                <asp:ImageButton ID="ibTds" runat="server" CommandName="Todos" AlternateText="Cancel" Width="25px" Height="25px" ImageAlign="AbsMiddle" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<br />
<asp:GridView ID="gv4" runat="server" 
              OnRowDataBound="gv4_RowDataBound" 
              OnRowCommand="gv4_RowCommand">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:ImageButton ID="ibNrm" runat="server" CommandName="Normal" ImageUrl="~/Imagens/find.png" Width="25px" Height="25px" ImageAlign="AbsMiddle" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="lblItem" />
        <asp:BoundField DataField="lblDescricao" />
        <asp:BoundField DataField="EmAndamento" />        
        <asp:BoundField DataField="Consolidado" />
        <asp:BoundField DataField="Cancelado" />
        <asp:TemplateField SortExpression="ItemAndDescricao">
            <ItemTemplate>
                <asp:ImageButton ID="ibItd" runat="server" CommandName="Item_Descricao" AlternateText="ItemAndDescricao" Width="25px" Height="25px" ImageAlign="AbsMiddle" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField SortExpression="Consolidar">
            <ItemTemplate>
                <asp:ImageButton ID="ibCns" runat="server" CommandName="Consolidar" AlternateText="Consolidar" Width="25px" Height="25px" ImageAlign="AbsMiddle" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField SortExpression="Cancel">
            <ItemTemplate>
                <asp:ImageButton ID="ibCnc" runat="server" CommandName="Cancela" AlternateText="Cancel" Width="25px" Height="25px" ImageAlign="AbsMiddle" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

</ContentTemplate>
</asp:UpdatePanel>

</asp:Content>

