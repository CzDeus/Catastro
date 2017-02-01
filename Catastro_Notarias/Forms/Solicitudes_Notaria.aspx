<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Solicitudes_Notaria.aspx.cs" Inherits="Forms_Solicitudes_Notaria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <%--    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="ID_Pagina" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <%--<div class="col-lg-12" style="text-align: center; background: #CCCCCC">--%>
            <h2 style="text-align: center; background: #CCCCCC">
                <asp:HiddenField ID="Estatus_HiddenField" runat="server" />
                <b>TRÁMITES ACTUALES<asp:HiddenField ID="Id_Notaria_HiddenField" runat="server" />
                </b></h2>
            <%--</div>--%>

            <%--<div class="container">--%>
            <div class="row">
                <div class="col-lg-12" style="text-align: center">
                    <div class="ibox">
                        <%--<h2 class="ibox-title"><b>Registros pendientes a revisión</b></h2>--%>
                        <div class="ibox-content">
                            <div class="col-lg-12" style="text-align: center">
                                <div class="col-lg-4">
                                    <asp:Label ID="Label1" runat="server" Text="Teclee una Parte de la clave castral:"></asp:Label>
                                    <asp:TextBox ID="Buscar_TextBox" runat="server" CssClass="form-control"> </asp:TextBox>
                                </div>
                                <div class="col-lg-1">
                                    <br />
                                    <asp:Button ID="Buscar_Button" runat="server" Text="Buscar" CssClass="btn btn-success" />
                                </div>
                                <div class="col-lg-5">
                                    <asp:Label ID="Label3" runat="server" Text="Mostrar:"></asp:Label>

                                    <asp:RadioButtonList ID="Estado_Registro_Verificador" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="Estado_Registro_Verificador_SelectedIndexChanged">
                                        <asp:ListItem Text="Capturando" Value="Capturando" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Enviados" Value="Enviados"></asp:ListItem>
                                        <asp:ListItem Text="Validados" Value="Validados"></asp:ListItem>
                                        <asp:ListItem Text="Todos" Value="Todos"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="col-lg-1">
                                    <br />
                                    <asp:Button ID="Nuevo_Tramite_Button" runat="server" Text="Nuevo tramite" CssClass="btn btn-primary" OnClick="Nuevo_Tramite_Button_Click" />
                                </div>
                            </div>

                            <div class="col-lg-12" style="text-align: center">
                                <br />
                            </div>
                            <asp:SqlDataSource ID="Tramites_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="sp_Leer_Tramites_Notarias" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Estatus_HiddenField" DefaultValue="1" Name="id_Estatus_Solicitud" PropertyName="Value" Type="Int32" />
                                    <asp:ControlParameter ControlID="Id_Notaria_HiddenField" DefaultValue="0" Name="id_Catalogo_Notaria" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="Tramites_GridView" runat="server" CssClass="table table-hover table-bordered" Style="background: #f7f7f7"
                                AutoGenerateColumns="False" DataKeyNames="id_Solicitud_Notaria, id_Catalogo_Tipo_Manifiesto" DataSourceID="Tramites_SqlDataSource" EmptyDataText="Actualmente no cuenta con solicitudes registradas"
                                OnRowCommand="Tramites_GridView_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="id_Solicitud_Notaria" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_Solicitud_Notaria" />
                                    <asp:BoundField DataField="nombre_Manifiesto" HeaderText="Tipo Tramite" SortExpression="nombre_Manifiesto" />
                                    <asp:BoundField DataField="fecha_solicitud" HeaderText="Fecha Solicitud" SortExpression="Fecha Solicitud" />
                                    <asp:BoundField DataField="clave_Catastral_Vendedor" HeaderText="Clave Catastral" SortExpression="clave_Catastral_Vendedor" />
                                    <asp:ButtonField ButtonType="Button" Text="Verificar" CommandName="Verificar">
                                        <ControlStyle CssClass="btn btn-info" />
                                    </asp:ButtonField>
                                    <asp:ButtonField Text="Eliminar" CommandName="Eliminar">
                                        <ControlStyle CssClass="btn btn-danger" />
                                    </asp:ButtonField>
                                    <asp:ButtonField Text="Imprimir" CommandName="Imprimir">
                                        <ControlStyle CssClass="btn btn-primary"/>
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
    <script type="text/javascript">

        //function myFunction() {
        //    var myWindow = window.open("", "", "width=200,height=100");
        //}

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
            hideModal();
            //$(".chosen-select").chosen();
        }

        function despliega_aviso(mensaje) {
            $('#div_alertas').find('.mensaje').text(mensaje);
            $('#div_alertas').modal('show');
        }

        function bloquea_pagina() {
            $.blockUI({ message: 'Espere por Favor...' });
        }

        function desbloquea_pagina() {
            $.unblockUI();
        }

        function hideModal() {
            $('.modal-backdrop.fade.in').remove();
        }

    </script>

</asp:Content>

