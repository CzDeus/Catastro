<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Solicitudes_Notarias.aspx.cs" Inherits="Forms_Solicitudes_Notarias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="ID_Panel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <%--<div class="col-lg-12" style="text-align: center; background: #CCCCCC">--%>
            <h2 style="text-align: center; background: #CCCCCC"><b>TRÁMITES ACTUALES</b></h2>
            <%--</div>--%>

            <asp:SqlDataSource ID="Prueba_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT * FROM [Tabla_Prueba]"></asp:SqlDataSource>

            <%--<div class="container">--%>
            <div class="row">
                <div class="col-lg-12" style="text-align: center">
                    <div class="ibox">
                        <h2 class="ibox-title"><b>Solicitudes notarias</b></h2>
                        <asp:HiddenField ID="Estatus_HiddenField" runat="server" />
                        <div class="ibox-content" style="background: #f7f7f7">
                            <div class="col-lg-12" style="text-align: center">
                                <div class="col-lg-5">
                                    <asp:Label ID="Label1" runat="server" Text="Teclee una Parte de la clave castral:"></asp:Label>
                                    <asp:TextBox ID="Buscar_TextBox" runat="server" CssClass="form-control"> </asp:TextBox>
                                </div>
                                <div class="col-lg-1">
                                    <br />
                                    <asp:Button ID="Buscar_Button" runat="server" Text="Buscar" CssClass="btn btn-success" />
                                </div>
                                <div class="col-lg-offset-1 col-lg-5">
                                    <asp:Label ID="Label3" runat="server" Text="Mostrar:"></asp:Label>

                                    <asp:RadioButtonList ID="Estado_Registro_Verificador" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="Estado_Registro_Verificador_SelectedIndexChanged">
                                        <asp:ListItem Text="Por revisar" Value="Por_revisar" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Validados" Value="Validados"></asp:ListItem>
                                        <asp:ListItem Text="Autorizados" Value="Autorizados"></asp:ListItem>
                                        <asp:ListItem Text="Todos" Value="Todos"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>

                            <div class="col-lg-12" style="text-align: center">
                                <br />
                            </div>
                            <asp:SqlDataSource ID="Tramites_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Solicitud_Notaria], [fecha_solicitud], [id_Catalogo_Tipo_Manifiesto], [clave_Catastral_Vendedor] FROM [Catastro_Solicitudes_Notarias] WHERE (([id_Estatus_Solicitud] = @id_Estatus_Solicitud) AND ([cancelado] = @cancelado))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Estatus_HiddenField" DefaultValue="2" Name="id_Estatus_Solicitud" PropertyName="Value" Type="Int32" />
                                    <asp:Parameter DefaultValue="False" Name="cancelado" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="Tramites_GridView" runat="server" AutoGenerateColumns="False"
                                CssClass="table table-hover table-bordered" EmptyDataText="No se han asignados/verificado tramtes..."
                                DataKeyNames="id_Solicitud_Notaria" DataSourceID="Tramites_SqlDataSource" Style="background: #FFFFFF" 
                                OnRowCommand="Tramites_GridView_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="id_Solicitud_Notaria" HeaderText="ID" SortExpression="id_tabla" />
                                    <asp:BoundField DataField="id_Catalogo_Tipo_Manifiesto" HeaderText="Tipo Tramite" SortExpression="tipo_tramite" />
                                    <asp:BoundField DataField="fecha_solicitud" HeaderText="Fecha" SortExpression="fecha" />
                                    <asp:BoundField DataField="clave_Catastral_Vendedor" HeaderText="Clave Catastral" SortExpression="clave_catastral" />
                                    <asp:ButtonField ButtonType="Button" Text="Comparar" CommandName="Comparar">
                                    <ControlStyle CssClass="btn btn-info" />
                                    </asp:ButtonField>
                                    <asp:ButtonField ButtonType="Button" Text="Cancelar" CommandName="Cancelar">
                                    <ControlStyle CssClass="btn btn-danger"/>
                                    </asp:ButtonField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <%--</div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>

