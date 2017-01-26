<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Registro_Notarias.aspx.cs" Inherits="Forms_Registro_Notarias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="ID_Pagina" UpdateMode="Always">
        <ContentTemplate>
            <h1 style="background: #CCCCCC; text-align: center">
                <asp:Label ID="Label1" runat="server" Text="Registro Notarías" Font-Bold="True"></asp:Label></h1>

            <div class="row">
                <div class="col-lg-12">
                    <fieldset>
                        <legend>Datos Notaría</legend>
                        <div class="col-lg-3">
                            <asp:Label ID="Label7" runat="server" Text="No. Notaría"></asp:Label>
                            <asp:TextBox ID="Numero_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-9">
                            <asp:Label ID="Label2" runat="server" Text="Nombre presidente"></asp:Label>
                            <asp:TextBox ID="Nombre_Presidente_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-8">
                            <asp:Label ID="Label3" runat="server" Text="Direccion"></asp:Label>
                            <asp:TextBox ID="Direccion_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="Label4" runat="server" Text="Ubicacion"></asp:Label>
                            <asp:TextBox ID="Ubicacion_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </fieldset>
                </div>

                <div class="col-lg-12">
                    <br />
                    <fieldset>
                        <legend>Información de contacto</legend>
                        <div class="col-lg-4">
                            <asp:Label ID="Label5" runat="server" Text="Telefono notaria"></asp:Label>
                            <asp:TextBox ID="Telefono_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="Label6" runat="server" Text="Celular notaria"></asp:Label>
                            <asp:TextBox ID="Celular_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="Label8" runat="server" Text="Correo notaria"></asp:Label>
                            <asp:TextBox ID="Correo_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </fieldset>
                </div>

                <div class="col-lg-12" style="text-align: center">
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Agregar Notaria" CssClass="btn btn-success" />
                </div>

                <div class="col-lg-12">
                    <br />
                    <fieldset>
                        <legend>Informacion Usuarios Notarías</legend>
                        <div class=" col-lg-offset-1 col-lg-4">
                            <asp:Label ID="Label9" runat="server" Text="Nombre de usuario"></asp:Label>
                            <asp:TextBox ID="Nombre_Usuario_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="Label11" runat="server" Text="Num. Celular"></asp:Label>
                            <asp:TextBox ID="Num_Celular_Usuario_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="Label10" runat="server" Text="Notaria"></asp:Label>
                            <asp:DropDownList ID="Notarias_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-lg-12">
                            <br />
                        </div>
                        <div class="col-lg-3">
                            <asp:Label ID="Label12" runat="server" Text="Correo"></asp:Label>
                            <asp:TextBox ID="Correo_Usuario_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <asp:Label ID="Label13" runat="server" Text="Confirmar correo"></asp:Label>
                            <asp:TextBox ID="Confirmar_Correo_Usuario_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <asp:Label ID="Label14" runat="server" Text="Password"></asp:Label>
                            <asp:TextBox ID="Password_Usuario_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <asp:Label ID="Label15" runat="server" Text="Confirmar password"></asp:Label>
                            <asp:TextBox ID="Confirmar_Password_Usuario_Notaria_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </fieldset>
                </div>

                <div class="col-lg-12">
                    <br />
                    <fieldset>
                        <legend>Usuarios por notarías</legend>
                        <div style="text-align: center">
                            <asp:GridView ID="Usuarios_Notarias_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="Usuarios_Notarias_SqlDataSource"
                                CssClass="table table-hover table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="num_notaria" HeaderText="num_notaria" SortExpression="num_notaria" />
                                    <asp:BoundField DataField="nom_presidente" HeaderText="nom_presidente" SortExpression="nom_presidente" />
                                    <asp:BoundField DataField="correo_usuario" HeaderText="correo_usuario" SortExpression="correo_usuario" />
                                    <asp:BoundField DataField="nom_usuario_notaria" HeaderText="nom_usuario_notaria" SortExpression="nom_usuario_notaria" />
                                    <asp:TemplateField HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Button ID="Eliminar_Oficina_Operativa_Button" runat="server" Text="Eliminar" CssClass="btn btn-danger" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </fieldset>
                    <asp:SqlDataSource ID="Usuarios_Notarias_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [num_notaria], [nom_presidente], [correo_usuario], [nom_usuario_notaria] FROM [Tabla_Prueba]"></asp:SqlDataSource>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>

