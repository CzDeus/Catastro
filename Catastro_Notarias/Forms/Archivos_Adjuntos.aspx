<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Archivos_Adjuntos.aspx.cs" Inherits="Forms_Archivos_Adjuntos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <%-- MODAL ADJUNTAR ARCHIVOS --%>
    <div id="div_adjuntar">


        <div class="row">
            <div class="col-lg-12">
                <fieldset>
                    <legend>
                        <h2><b>ADJUNTAR ARCHIVOS</b></h2>
                    </legend>
                </fieldset>
            </div>

            <div class="col-lg-12">
                <div class="col-lg-offset-4 col-lg-4">
                    <asp:Label ID="Label2" runat="server" Text="Nombre Documento:"></asp:Label>
                    <asp:TextBox ID="Nombre_Documento_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="col-lg-offset-1 col-lg-11">
                <div class="col-lg-offset-4 col-lg-4">
                    <br />
                    <asp:FileUpload ID="Archivos_FileUpload" runat="server" />
                </div>
            </div>

            <div class="col-lg-12">
                <div class="col-lg-offset-4 col-lg-4" style="text-align: center">
                    <br />
                    <asp:Button ID="Agregar_Archivo_Button" runat="server" Text="Agregar" class="btn btn-success" OnClick="Agregar_Archivo_Button_Click" />
                </div>
            </div>
        </div>

        <div class="col-lg-12" style="text-align: center">
            <br />
            <asp:SqlDataSource ID="Archivos_Adjuntos_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT id_documento_notaria, nombre_archivo, fecha_subida FROM Catastro_Archivos WHERE (id_notaria = @id_notaria) AND (id_solicitud_notaria = @id_solicitud_notaria)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="id_notaria" SessionField="sist_Id_Notaria" Type="Int32" />
                    <asp:SessionParameter DefaultValue="0" Name="id_solicitud_notaria" SessionField="id_solicitud_notaria" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="Archivos_Adjuntos_GridView" runat="server" CssClass="table table-bordered table-hover"
                AutoGenerateColumns="False" DataSourceID="Archivos_Adjuntos_SqlDataSource" DataKeyNames="id_documento_notaria"
                EmptyDataText="Actualmente no cuenta con archivos" OnRowCommand="Archivos_Adjuntos_GridView_RowCommand">
                <Columns>
                    <asp:BoundField DataField="nombre_archivo" HeaderText="Nombre documento" SortExpression="nombre_documento" />
                    <asp:BoundField DataField="fecha_subida" HeaderText="Fecha subio" SortExpression="fecha_subida" />
                    <asp:ButtonField ButtonType="Button" Text="Visualizar" CommandName="Visualizar">
                        <ControlStyle CssClass="btn btn-info" />
                    </asp:ButtonField>
                    <asp:ButtonField Text="Eliminar" CommandName="Eliminar">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="col-lg-12" style="text-align: center">
            <br />
            <div class="col-lg-12">
                <asp:Button ID="Salir_Button" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" OnClick="Salir_Button_Click" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">

    <script src="<%=  ResolveClientUrl("~/content/js/plugins/datapicker/bootstrap-datepicker.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/jquery.blockUI.js") %>"></script>

    <script type="text/javascript">

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

