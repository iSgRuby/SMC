<%@ Page Title="" Language="C#" MasterPageFile="~/MPInicial.Master" AutoEventWireup="true" CodeBehind="iuUsuario.aspx.cs" Inherits="SistemaMenuCafeteria.InterfacesDeUsuario.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Scripts" runat="server">
    <style>
        body {
            background-color: #add8a3;
            overflow-y: scroll;
        }

        .category-bar {
            background-color: #fff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 2px solid #000; /* Borde negro menos grueso */
        }

        .menu-dia {
            padding: 10px;
            border: 2px solid #000; /* Borde negro menos grueso */
            border-radius: 5px;
            margin-bottom: 10px;
            position: relative;
        }

        .category-container {
            display: flex;
            flex-grow: 1;
            justify-content: space-between;
        }

        .category-container a {
            margin: 0 5px;
            white-space: nowrap;
        }

        .menu-info h3 {
            font-weight: bold;
        }

        .precio-container {
            display: flex;
            align-items: center;
            margin-top: 5px;
            position: absolute;
            bottom: 10px; /* Ajustar para posicionar en la esquina inferior derecha */
            right: 10px; /* Ajustar para posicionar en la esquina inferior derecha */
        }

        .precio-signo {
            font-weight: bold;
            /*text-decoration: underline white;*/
            display: inline-block;
            /*border-bottom: 3px solid #fff;*/ /* Línea continua debajo del símbolo $ */
        }

        .precio-input {
            margin-left: 5px;
            border: 2px solid #000; /* Borde negro */
            padding: 2px 5px;
            background-color: #fff;
            width: 100%; /* Ancho fijo */
            /*height: 27px;*/ /* Alto fijo */
            pointer-events: none; /* Desactivar la capacidad de edición */
        }

        #menuDia1 {
            background-color: #fff48f;
        }

        #menuDia2 {
            background-color: #99c4c9;
        }

        .comidas {
            font-weight: bold;
        }

        .producto {
            padding: 10px;
            border: 2px solid #000; /* Borde negro menos grueso */
            border-radius: 5px;
            margin-bottom: 10px;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .producto-info {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            width: 100%;
        }

        .producto-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-direction: column;
            text-align: center;
        }

        .producto-info h4 {
            font-weight: bold;
            margin: 0;
        }

        .btnDisponibilidad {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .btnDisponibilidad-true {
            background-color: green;
        }

        .btnDisponibilidad-false {
            background-color: red;
        }

        .bg-1 {
            background-color: #b0a6d9;
        }

        .bg-2 {
            background-color: #dea4b6;
        }

        .bg-3 {
            background-color: #f597a0;
        }



        .menu-header {
            background-color: rgba(210, 141, 50, 0.8); /* Color con transparencia */
            color: #000;
            font-weight: bold;
            text-align: center;
            padding: 10px;
            margin-bottom: 10px;
            width: 343px; /* Ancho fijo */
            height: 72px; /* Alto fijo */
            line-height: 52px; /* Alinear verticalmente el texto */
            text-transform: uppercase; /* Texto en mayúsculas */
            margin: 0 auto; /* Centrar horizontalmente */
            border: 2px solid #000; /* Borde negro menos grueso */
            font-size: 40px; /* Tamaño de fuente */
            font-style: italic; /* Texto en cursiva */
            margin-top: 18rem;
        }

        .menu-image {
            width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .btn-scroll {
            display: block;
            border: 2px solid #000; /* Borde negro menos grueso */
            background-color: #fff;
            color: #000;
        }

        .btn-outline-primary {
            border: 2px solid #000; /* Borde negro para el botón */
        }

            .btn-outline-primary i {
                color: #000; /* Color negro para el icono de la lupa */
            }

        @media (min-width: 768px) {
            .btn-scroll {
                display: block;
            }
        }

        .search-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 10px; /* Espacio entre el botón de búsqueda y la caja de búsqueda */
        }

        .search-input {
            display: none;
            width: 200px; /* Ajustar el ancho del cuadro de búsqueda */
        }

        .esime-image-container {
            height: 30rem; /* Ajusta esta altura según tus necesidades */
            width: 100%;
        }
    </style>

    <!-- Script para manejar la funcionalidad de búsqueda y despliegue del campo de búsqueda -->
    <script type="text/javascript">
        function mostrarBusqueda() {
            var busqueda = document.getElementById("<%= txtBusqueda.ClientID %>");
            if (busqueda.style.display === "none") {
                busqueda.style.display = "block";
                busqueda.focus();
            } else {
                busqueda.style.display = "none";
            }
        }

    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="NombrePag" runat="server"></asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <%-- Empieza la imagen --%>
    <div class="esime-image-container" style="background-image: url('../images/menu-image.jpg');">
        <%-- Agrupación de barra de categorías con botones de desplazamiento --%>
        <div class="col-12 d-flex justify-content-between align-items-center category-bar">
            <%-- Botón de desplazamiento izquierdo --%>
            <asp:Button ID="flechaIzqBarra" runat="server" Text="&lt;" CssClass="btn btn-primary btn-sm btn-scroll" OnClick="FlechaIzqBarra_Click" />

            <%-- Barra de categorías --%>
            <div class="category-container">
                <asp:Repeater ID="CategoryRepeater" runat="server">
                    <ItemTemplate>
                        <asp:HyperLink CssClass="btn btn-toolbar btn-outline-dark" ID="CategoryLink" runat="server" NavigateUrl='<%# Eval("NavigateUrl") %>'><%# Eval("Text")%> </asp:HyperLink>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <%-- Botón de desplazamiento derecho --%>
            <asp:Button ID="flechaDerBarra" runat="server" Text="&gt;" CssClass="btn btn-primary btn-sm btn-scroll" OnClick="FlechaDerBarra_Click" />
        </div>
        <%-- Termina barra de categorías --%>


        <%-- Bóton búsqueda --%>
        <div class="offset-10 col-2">
            <div class="float-md-right search-container">
                <button type="button" class="btn btn-outline-primary fas fa-search" onclick="mostrarBusqueda()" />

                <%-- Script botón búsqueda --%>
                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtBusqueda" runat="server" CssClass="form-control search-input" OnTextChanged="txtBusqueda_OnTextChanged" AutoPostBack="true" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="txtBusqueda" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>

        <%-- Título menús del día --%>
        <div class="menu-header">MENÚS DEL DÍA</div>
    </div>
    <%-- Termina la imagen --%>


    <!-- Contenido de MENÚS DEL DÍA -->
    <div class="row justify-content-center mt-3" id="menuDelDiaContainer">

        <%-- Menú del día 1 --%>
        <div class="col-md-5 col-12 mb-3">
            <div id="menuDia1" class="menu-dia">
                <div class="menu-info">
                    <h3>Menú del día #1</h3>
                    <itemtemplate>
                        <asp:Label ID="MenuDelDia1" runat="server" NavigateUrl='<%# Eval("MenuDelDia") %>'></asp:Label>
                    </itemtemplate>
                </div>
                <div class="precio-container">
                    <span class="precio-signo">$</span>
                    <itemtemplate>
                        <asp:Label ID="precioMenuDelDia1" BackColor="White" BorderColor="Black" BorderWidth="2" CssClass="container-fluid border-black" runat="server" />
                    </itemtemplate>
                </div>
            </div>
        </div>

        <%-- Menú del día 2 --%>
        <div class="col-md-5 col-12 mb-3">
            <div id="menuDia2" class="menu-dia">
                <div class="menu-info">
                    <h3>Menú del día #2</h3>
                    <itemtemplate>
                        <asp:Label ID="MenuDelDia2" runat="server" NavigateUrl='<%# Eval("MenuDelDia") %>'></asp:Label>
                    </itemtemplate>
                </div>
                <div class="precio-container">
                    <span class="precio-signo">$</span>
                    <itemtemplate>
                        <asp:Label BackColor="White" BorderColor="Black" BorderWidth="2" CssClass="container-fluid border-black" ID="precioMenuDelDia2" runat="server" />
                    </itemtemplate>
                </div>
            </div>
        </div>


    </div>



    <!-- Listado de productos -->
    <div class=" offset-lg-2 col-lg-8 offset-md-1 col-md-10 offset-sm-1 col-sm-10">
        <!-- Listado de productos -->
        <asp:Repeater ID="rptCategories" runat="server" OnItemDataBound="rptCategories_ItemDataBound">
            <ItemTemplate>
                <div class="col-md-12" id="<%# Eval("Categoria_ID") %>">
                    <h2 class="comidas"><%# Eval("Nombre_Categoria") %></h2>
                    <asp:Repeater ID="rptSubcategories" runat="server" OnItemDataBound="rptSubcategories_ItemDataBound">
                        <ItemTemplate>
                            <h3><%# Eval("Nombre_Subcategoria") %></h3>
                            <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound">
                                <ItemTemplate>
                                    <div id="divProducto" runat="server" class="producto">
                                        <div class="producto-info">
                                            <div class="producto-header">
                                                <h4><%# Eval("Nombre") %></h4>
                                                <p>Descripción del producto.</p>
                                            </div>
                                            <div class="precio-container col-lg-1 col-md-1 col-sm-1">
                                                <span class="precio-signo">$</span>
                                                <input type="text" class="precio-input" value="<%# Eval("Precio") %>" />
                                            </div>
                                        </div>
                                        <asp:Button runat="server" ID="btnDisponibilidad" Enabled="false" CssClass="rounded-circle btnDisponibilidad" />
                                    </div>
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
