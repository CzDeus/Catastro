<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Movimientos_Usuarios.aspx.cs" Inherits="Forms_Movimientos_Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="IDPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="row">
                <div class="col-lg-12">
                    <fieldset>
                        <legend>Movimientos recientes</legend>
                        <div style="text-align:center">
                            <asp:GridView ID="Movimientos_Recientes_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="Movimientos_Recientes_SqlDataSource"
                                CssClass="table table-bordered table-hover">
                                <Columns>
                                    <asp:BoundField DataField="clave_catastral" HeaderText="Clave Catastral" SortExpression="clave_catastral" />
                                    <asp:BoundField DataField="movimiento" HeaderText="Movimiento" SortExpression="movimiento" />
                                    <asp:BoundField DataField="nom_presidente" HeaderText="Usuario" SortExpression="nom_presidente" />
                                    <asp:BoundField DataField="fecha" HeaderText="Fecha Modificacion" SortExpression="fecha" />
                                    <asp:CommandField ButtonType="Button" SelectText="Justificacion" ShowSelectButton="True">
                                        <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="Movimientos_Recientes_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [clave_catastral], [movimiento], [nom_presidente], [fecha] FROM [Tabla_Prueba]"></asp:SqlDataSource>
                    </fieldset>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <fieldset>
                        <legend>Cambios afectan cartografica</legend>
                        <asp:GridView ID="Cambios_Cartografia_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="Cambios_Cartografia_SqlDataSource"
                            CssClass="table table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="clave_catastral" HeaderText="Clave Catastral" SortExpression="clave_catastral" />
                                <asp:BoundField DataField="tipo_tramite" HeaderText="Movimiento" SortExpression="tipo_tramite" />
                                <asp:BoundField DataField="nombre" HeaderText="Usuario" SortExpression="nombre" />
                                <asp:BoundField DataField="fecha_construccion" HeaderText="Fecha Movimiento" SortExpression="fecha_construccion" />
                                <asp:CommandField ButtonType="Button" SelectText="Revisar" ShowSelectButton="True">
                                    <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="Cambios_Cartografia_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [clave_catastral], [tipo_tramite], [nombre], [fecha_construccion] FROM [Tabla_Prueba]"></asp:SqlDataSource>
                    </fieldset>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>

