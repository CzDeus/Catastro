<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <div class="row">
        <div class="col-xs-12 col-md-2">
            &nbsp;
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-2"></div>
        <div class="col-xs-12 col-md-7">
            <div class="col-xs-12 col-md-12">
                <div class="col-xs-12 col-md-3"></div>
                <div class="col-xs-12 col-md-7">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <strong>Acceso al Sistema</strong>
                        </div>
                        <div>
                            <div class="panel-body" style="overflow: auto">
                                <div class="form-group text-center">
                                    <i class="fa fa-user fa-4x" style="color: #a9a9a9"></i>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="Usuario_TextBox" placeholder="nombre del usuario" required="true" CssClass="form-control text-center"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="Password_TextBox" placeholder="contraseña" required="true" type="password" CssClass="form-control text-center"></asp:TextBox>
                                </div>
                                <div class="text-center">
                                    <asp:Button runat="server" ID="btnAcceso" Text="Entrar"
                                        CssClass="btn btn-outline btn-success col-lg-12" OnClick="btnAcceso_Click" />
                                </div>
                            </div>
                            <div class="panel-footer text-center">
                                <a href="ResetPassword.aspx">Olvidé mi contraseña</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-3">
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
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!-- Fin Modal -->

</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
</asp:Content>