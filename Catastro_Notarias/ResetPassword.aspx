<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>

            <div id="divEnviarCorreo" class="container" runat="server">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <h2 class="ibox-title">Ingrese su Correo Electronico</h2>
                            <div class="ibox-content">
                                <div class="form-group">
                                    <label>Correo Electronico</label>
                                    <asp:TextBox ID="txtCorreoElectronico" runat="server" required="required" type="email" placeholder="example@correo.es" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnEnviarCorreoElectronico" runat="server" Text="Enviar Correo" CssClass="btn btn-w-m btn-info" OnClick="btnEnviarCorreoElectronico_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="divCambiarContraseña" class="container" runat="server">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <h2 class="ibox-title">Cambio de Contraseña</h2>
                            <div class="ibox-content">
                                <div class="form-group">
                                    <label>Nueva Contraseña</label>
                                    <asp:TextBox ID="txtContraseña_1" runat="server" required="required" type="password" placeholder="contraseña" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Confirma Contraseña</label>
                                    <asp:TextBox ID="txtContraseña_2" runat="server" required="required" type="password" placeholder="contraseña" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnConfirmarContraseña" runat="server" Text="Cambiar Contraseña" CssClass="btn btn-w-m btn-info" OnClick="btnConfirmarContraseña_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

             <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_alertas">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Aviso</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Mensaje_Label" Text="" runat="server" class="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>--%>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Aviso</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label1" Text="" runat="server" class="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnCerrar" runat="server" Text="Cerrar"  CssClass="btn btn-default" OnClick="btnCerrar_Click"/>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
    <script type="text/javascript">

        //window.moveTo(0, 0);

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
        }

        function despliega_aviso(mensaje) {
            $('#div_alertas').find('.mensaje').text(mensaje);
            $('#div_alertas').modal('show');
        }

        function despliega_modal(mensaje) {
            $('#div_modal').find('.mensaje').text(mensaje);
            $('#div_modal').modal('show');
        }

    </script>
</asp:Content>
