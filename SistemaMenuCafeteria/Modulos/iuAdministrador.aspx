<%@ Page Title="WebForm1" Language="C#" MasterPageFile="~/MPInicial.Master" AutoEventWireup="true" CodeBehind="iuAdministrador.aspx.cs" Inherits="SistemaMenuCafeteria.Modulos.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NombrePag" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="Server">
    <script>
        function validatePrice(input) {
            let inputValue = input.value.trim();

            // Patrón para validar el formato del precio
            let pattern = /^\d{0,3}(\.\d{0,2})?$/;

            // Validar la entrada con la expresión regular
            if (!pattern.test(inputValue)) {
                // La entrada no coincide con el patrón, restablecer el valor del input
                input.value = inputValue.slice(0, -1);
            }
        }
    </script>

    <br />
    <br />

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Menú del día 1</h4>
                        <p>Nombre</p>
                        <asp:TextBox CssClass="form-control mb-3" placeholder="Ej: Tacos dorados de papa" Width="100%" runat="server" ID="txtNombreMenuDelDia1" />
                        <p>Precio</p>
                        <div class="input-group mb-3">
                            <div class="d-flex align-items-center">
                                <asp:Label runat="server" ID="lblPrecio1" Text="$" CssClass="input-group-text"></asp:Label>
                                <asp:TextBox CssClass="form-control" placeholder="Ej: 45.60" Width="100%" runat="server" ID="txtPrecioMenuDelDia1" oninput="validatePrice(this)" />
                                <asp:Button runat="server" ID="btnActualizarMenu1" Text="Actualizar menú" OnClick="btnActualizarMenu1_Click" CssClass="btn btn-primary btn-block offset-3 col-5" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Menú del día 2</h4>
                        <p>Nombre</p>
                        <asp:TextBox CssClass="form-control mb-3" placeholder="Ej: Tacos dorados de papa" Width="100%" runat="server" ID="txtNombreMenuDelDia2" />
                        <p>Precio</p>
                        <div class="input-group mb-3">
                            <div class="d-flex align-items-center">
                                <asp:Label runat="server" ID="lblPrecio2" Text="$" CssClass="input-group-text"></asp:Label>
                                <asp:TextBox CssClass="form-control" placeholder="Ej: 45.60" Width="100%" runat="server" ID="txtPrecioMenuDelDia2" oninput="validatePrice(this)" />
                                <asp:Button runat="server" ID="btnActualizarMenu2" Text="Actualizar menú" OnClick="btnActualizarMenu2_Click" CssClass="btn btn-primary btn-block offset-3 col-5" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Agregar Producto</h5>
                        <asp:TextBox runat="server" ID="txtNombreProducto" CssClass="form-control mb-3" placeholder="Nombre" />
                        <asp:TextBox runat="server" ID="txtDescripcionProducto" CssClass="form-control mb-3" placeholder="Descripcion" />
                        <%--<asp:DropDownList runat="server" ID="ddlCategoriaProducto" CssClass="dropdown btn btn-lg btn-light dropdown-toggle w-100" placeholder="Categoría" />--%>
                        <asp:DropDownList runat="server" ID="ddlSubcategoriaProducto" CssClass="dropdown btn btn-lg btn-light dropdown-toggle w-100" placeholder="Subcategoria" />
                        <asp:TextBox runat="server" ID="txtPrecioProducto" CssClass="form-control mb-3" placeholder="Precio" />
                        <asp:Button runat="server" ID="btnAgregarProducto" Text="Agregar producto" OnClick="btnAgregarProducto_Click" CssClass="btn btn-primary btn-block offset-4 col-4" />
                    </div>
                </div>
            </div>
        </div>


        <br />

        <div class=" offset-1 col-10">
            <div class="col-3">
                <div class="row">
                    <div class="form-group col-6">
                        <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control mr-2" placeholder="Buscar..."></asp:TextBox>
                    </div>
                    <div class="form-group col-6">
                        <asp:Button runat="server" ID="btnSearch" Text="Buscar" OnClick="btnSearch_Click" CssClass="btn btn-primary w-100" />
                    </div>
                </div>
            </div>
            <asp:GridView runat="server" ID="gvProductos" Visible="true"
                OnRowDeleting="gvProductos_RowDeleting" OnRowDataBound="gvProductos_RowDataBound"
                AutoGenerateColumns="false" CssClass="table">
                <Columns>

                    <asp:TemplateField HeaderText="Descripción" Visible="false">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblIdProducto" Text='<%# Bind("Id_Producto") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Descripción">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblNombre" Text='<%# Bind("Nombre") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Precio">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblPrecio" Text='<%# Bind("Precio") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Descripcion">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblDescripcion" Text='<%# Bind("Descripcion") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <asp:Button runat="server" ID="btnEstado"
                                Text='<%# bool.Parse(Eval("Disponibilidad").ToString()) ? "Activo" : "Inactivo" %>'
                                CssClass='<%# bool.Parse(Eval("Disponibilidad").ToString()) ? "btn btn-success m-1" : "btn btn-warning m-1" %>'
                                CommandName="ToggleEstado" CommandArgument='<%# Eval("Id_Producto") %>'
                                OnClick="btnEstado_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button CssClass=" btn btn-danger" runat="server" ID="btnEliminar" Text="Eliminar" CommandName="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
