<%@ Page Title="WebForm1" Language="C#" MasterPageFile="~/MPInicial.Master" AutoEventWireup="true" CodeBehind="iuAdministrador.aspx.cs" Inherits="SistemaMenuCafeteria.Modulos.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NombrePag" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="Server">
    <br />
    <br />

    <div class="container">
        <div>
            <div class=" offset-lg-1 offset-md-1 offset-sm-1 col-lg-3 col-md-10 col-sm-10 offset-lg-1 offset-md-1 offset-sm-1 d-lg-inline-block">
                <div class="border-black border d-lg-inline-block w-100">
                    <h1>Menú del día 1</h1>
                    <div class="offset-1 col-10">
                        <asp:TextBox CssClass="form-text" placeholder="Descripción del menú del día" Width="100%" runat="server" ID="txtMenuDelDia1" />
                    </div>
                    <div class="row offset-1 col-10">
                        <asp:Label CssClass=" form-text" Width="100%" runat="server" ID="signoPesos" Text="$" />
                        <asp:TextBox CssClass="form-text col-11 d-inline-block" placeholder="Precio" Width="100%" runat="server" ID="txtMenuDelDia2" />
                    </div>
                    <br />
                </div>
            </div>

            <div class=" offset-lg-1 offset-md-1 offset-sm-1 col-lg-3 col-md-10 col-sm-10 offset-lg-1 offset-md-1 offset-sm-1 d-lg-inline-block">
                <div class="border-black border d-lg-inline-block w-100">
                    <h1>Menú del día 1</h1>
                    <div class="offset-1 col-10">
                        <asp:TextBox CssClass="form-text" placeholder="Descripción del menú del día" Width="100%" runat="server" ID="TextBox1" />
                    </div>
                    <div class="row offset-1 col-10">
                        <asp:Label CssClass=" form-text" Width="100%" runat="server" ID="Label1" Text="$" />
                        <asp:TextBox CssClass="form-text col-11 d-inline-block" placeholder="Precio" Width="100%" runat="server" ID="TextBox2" />
                    </div>
                    <br />
                </div>
            </div>

            <div class="form-container offset-1 col-2 d-inline-block">
                <asp:TextBox runat="server" ID="nameInput" placeholder="Nombre" />
                <asp:TextBox runat="server" ID="categoryInput" placeholder="Categoría" />
                <asp:TextBox runat="server" placeholder="Subcategoria" />
                <asp:TextBox runat="server" placeholder="Precio" />
                <asp:Button runat="server" ID="btnAgregarProducto" Text="Agregar producto" OnClick="btnAgregarProducto_Click" />
            </div>
        </div>

        <asp:GridView runat="server" ID="gvProductos" Visible="true"
            OnRowDeleting="gvProductos_RowDeleting" OnRowDataBound="gvProductos_RowDataBound" CellSpacing="100">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button CssClass=" btn btn-danger" runat="server" ID="lblPrecio" Text="Eliminar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>



</asp:Content>
