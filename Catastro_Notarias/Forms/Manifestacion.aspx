<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Manifestacion.aspx.cs" Inherits="Forms_Manifestacion" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%=  ResolveClientUrl("~/content/css/plugins/datapicker/datepicker3.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="ID_Pagina" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <h2 style="text-align: center; background: #CCCCCC"><b>
                <asp:Label ID="Titulo_Manifiesto" runat="server" Text="NOMBRE TIPO DE MANIFIESTO"></asp:Label></b>
                <asp:HiddenField ID="id_Solicitud_Notaria_HiddenField" runat="server" />
                <asp:HiddenField ID="Tipo_Predio_HiddenField" runat="server" />
            </h2>

            <%-- MANIFIESTO --%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title" style="background: #f7f7f7">
                            <div class="col-lg-6">
                                <asp:Label ID="Label8" runat="server" Text="Oficina de ubicacion:" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Oficina_Ubicacion_TextBox" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <asp:Label ID="Label9" runat="server" Text="Folio:" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Folio_TextBox" runat="server" class="form-control"></asp:TextBox>
                            </div>

                            <div id="Encabezado_Sub" runat="server" visible="false">
                                <div class="col-lg-4">
                                    <asp:Label ID="Label59" runat="server" Text="Clave catastral:" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="Clave_Catastral_Subdivision_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="Label60" runat="server" Text="Codigo postal:" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="Codigo_Postal_Subdivision_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="Label61" runat="server" Text="C.U.R.P:" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="Curp_Subdivision_TextBox" runat="server" class="form-control" Style="text-transform: uppercase"></asp:TextBox>
                                </div>
                            </div>

                            <div id="Claves_Curps" runat="server">
                                <div class="col-lg-6">
                                    <asp:Label ID="Label10" runat="server" Text="Clave catastral vendedor:" BorderStyle="NotSet" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="Clave_Catastral_Vendedor_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label ID="Label11" runat="server" Text="Clave catastral comprador:" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="Clave_Catastral_Comprador_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label ID="Label49" runat="server" Text="C.U.R.P:" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="Curp_Vendedor_TextBox" runat="server" class="form-control" Style="text-transform: uppercase"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label ID="Label50" runat="server" Text="C.U.R.P:" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="Curp_Comprador_TextBox" runat="server" class="form-control" Style="text-transform: uppercase"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-offset-8 col-lg-4" runat="server" style="text-align: right">
                                <br />
                                <asp:Button ID="Archivos_Adjuntos_Button" runat="server" Text="Adjuntar archivos" CssClass="btn btn-info" OnClick="Archivos_Adjuntos_Button_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                    </div>

                    <div class="ibox-content" style="display: block">
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">

                                <%-- Encabezado subdivision/fusion --%>
                                <div id="encabezado_sub_fus" class="row">
                                    <div class="col-lg-12" style="text-align: center">
                                        <asp:Label ID="encabezado_sub_fus_Label" runat="server" Text="Datos del predio a subdividir" Font-Size="Large" Font-Bold="True" Visible="false"></asp:Label>
                                    </div>
                                </div>

                                <%-- 1. Ubicacion del predio --%>
                                <div id="bloque_1" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" class="collapsed">Ubicación del predio</a>
                                        </h5>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label1" runat="server" Text="Municipio:"></asp:Label>
                                                    <asp:TextBox ID="Municipio_Predio_Origen_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label2" runat="server" Text="Poblacion:"></asp:Label>
                                                    <asp:TextBox ID="Poblacion_Predio_Origen_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label3" runat="server" Text="Calle:"></asp:Label>
                                                    <asp:TextBox ID="Calle_Predio_Origen_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label4" runat="server" Text="Num. Oficial:"></asp:Label>
                                                    <asp:TextBox ID="Num_Oficional_Predio_Origen_TextBox" runat="server" class="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label5" runat="server" Text="Colonia:"></asp:Label>
                                                    <asp:TextBox ID="Colonia_Predio_Origen_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label6" runat="server" Text="Num. Lote:"></asp:Label>
                                                    <asp:TextBox ID="Num_Lote_Predio_Origen_TextBox" runat="server" class="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label7" runat="server" Text="Num. Mza:"></asp:Label>
                                                    <asp:TextBox ID="Num_Manzana_Predio_Origen_TextBox" runat="server" class="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <%-- 11. Ubicacion del predio (rural) --%>
                                <div id="bloque_11" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTen" aria-expanded="false" class="collapsed">Ubicacion del predio (rural)</a>
                                        </h5>
                                    </div>
                                    <div id="collapseTen" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label39" runat="server" Text="Nombre del predio:"></asp:Label>
                                                    <asp:TextBox ID="Nombre_Predio_Rural_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label40" runat="server" Text="Poblacion mas cercana:"></asp:Label>
                                                    <asp:TextBox ID="Poblacion_Mas_Cercana_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label41" runat="server" Text="Municipio:"></asp:Label>
                                                    <asp:TextBox ID="Municipio_Predio_Rural_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <%--                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label52" runat="server" Text="Valor catastral:"></asp:Label>
                                                    <asp:TextBox ID="Valor_Catastral_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 2. Informacion predio --%>
                                <div id="bloque_2" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" class="collapsed">Informacion predio</a>
                                        </h5>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label12" runat="server" Text="Sup. de terreno M2:"></asp:Label>
                                                    <asp:TextBox ID="Superficie_Terreno_Predio_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" onkeyup="this.value=cpf(this.value);"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label13" runat="server" Text="Tipo:"></asp:Label>
                                                    <%--<asp:TextBox ID="Tipo_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                    <asp:DropDownList ID="Tipo_Predio_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label14" runat="server" Text="Uso:"></asp:Label>
                                                    <%--<asp:TextBox ID="Uso_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                    <asp:DropDownList ID="Uso_Predio_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label51" runat="server" Text="Operacion:"></asp:Label>
                                                    <%--<asp:TextBox ID="Operacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                    <asp:DropDownList ID="Operaciones_DropDownList" runat="server" CssClass="form-control">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 3. Datos de quien transmite --%>
                                <div id="bloque_3" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" class="collapsed">
                                                <asp:Label ID="Titulo_Quien_Transmite_Label" runat="server" Text="Datos de quien transmite"></asp:Label></a>
                                        </h5>
                                    </div>
                                    <div id="collapseFour" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div id="Datos_Quien_Trasnmite" runat="server">
                                                    <div class="col-lg-8">
                                                        <asp:Label ID="Label18" runat="server" Text="Nombre completo o razon social:"></asp:Label>
                                                        <asp:TextBox ID="Nombre_Razon_Social_Transmite_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label19" runat="server" Text="Porcentaje:"></asp:Label>
                                                        <asp:TextBox ID="Porcentaje_Transmite_TextBox" runat="server" CssClass="form-control"
                                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <br />
                                                        <asp:Button ID="Agregar_Propietario_Trasnmite_Button" runat="server" Text="Agregar propietario" CssClass="btn btn-primary" CommandArgument="Transmite" OnCommand="Agregar_Propietario_Button_Command" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <br />
                                                    <asp:SqlDataSource ID="Propietarios_Transmiten_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT id_Solicitud_Propietario, nombre_Razon_Social, porcentaje FROM Catastro_Solicitudes_Propietarios WHERE (id_Solicitud_Notaria = @id_Solicitud_Notaria) AND (tipo_Propietario_Transmite_Adquiere = 1)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="id_Solicitud_Notaria_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:GridView ID="Datos_Quien_Transmite_GridView" runat="server"
                                                        AllowPaging="True"
                                                        AutoGenerateColumns="False"
                                                        BorderStyle="None"
                                                        HorizontalAlign="Center"
                                                        BackColor="White"
                                                        CssClass="table table-bordered table-striped"
                                                        EmptyDataText="No hay propietarios registradas..."
                                                        Width="90%"
                                                        DataKeyNames="id_Solicitud_Propietario"
                                                        DataSourceID="Propietarios_Transmiten_SqlDataSource"
                                                        OnRowCommand="Eliminar_Propietario_GridView_RowCommand">
                                                        <Columns>
                                                            <asp:BoundField DataField="nombre_Razon_Social" HeaderText="Nombre completo o razon social" SortExpression="nombre_Razon_Social" />
                                                            <asp:BoundField DataField="porcentaje" HeaderText="Porcentaje" SortExpression="porcentaje" />
                                                            <asp:ButtonField ButtonType="Button" Text="Eliminar" ControlStyle-CssClass="btn btn-danger" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 4. Datos de quien adquiere --%>
                                <div id="bloque_4" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" class="collapsed">
                                                <asp:Label ID="Titulo_Quien_Adquiere_Label" runat="server" Text="Datos de quien adquiere"></asp:Label>
                                            </a>
                                        </h5>
                                    </div>
                                    <div id="collapseFive" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div id="Datos_Quien_Adquiere" runat="server">
                                                    <div class="col-lg-8">
                                                        <asp:Label ID="Label21" runat="server" Text="Nombre completo o razon social:"></asp:Label>
                                                        <asp:TextBox ID="Nombre_Razon_Social_Adquiere_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label22" runat="server" Text="Porcentaje:"></asp:Label>
                                                        <asp:TextBox ID="Porcentaje_Adquiere_TextBox" runat="server" CssClass="form-control"
                                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <br />
                                                        <asp:Button ID="Agregar_Propietario_Adquiere_Button" runat="server" Text="Agregar propietario" CssClass="btn btn-primary" CommandArgument="Adquiere" OnCommand="Agregar_Propietario_Button_Command" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <br />
                                                    <asp:SqlDataSource ID="Propietarios_Adquiere_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Solicitud_Propietario], [nombre_Razon_Social], [tipo_Propietario_Transmite_Adquiere], [porcentaje] FROM [Catastro_Solicitudes_Propietarios] WHERE (([id_Solicitud_Notaria] = @id_Solicitud_Notaria) AND ([tipo_Propietario_Transmite_Adquiere] = @tipo_Propietario_Transmite_Adquiere))">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="id_Solicitud_Notaria_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                            <asp:Parameter DefaultValue="2" Name="tipo_Propietario_Transmite_Adquiere" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:GridView ID="Datos_Quien_Adquiere_GridView" runat="server"
                                                        AllowPaging="True"
                                                        AutoGenerateColumns="False"
                                                        BorderStyle="None"
                                                        HorizontalAlign="Center"
                                                        CssClass="table table-bordered table-striped"
                                                        BackColor="White"
                                                        DataKeyNames="id_Solicitud_Propietario"
                                                        EmptyDataText="No hay propietarios registrados..."
                                                        Width="90%" DataSourceID="Propietarios_Adquiere_SqlDataSource"
                                                        OnRowCommand="Eliminar_Propietario_GridView_RowCommand">
                                                        <Columns>
                                                            <asp:BoundField DataField="nombre_Razon_Social" HeaderText="Nombre completo o razon social" SortExpression="nombre_Razon_Social" />
                                                            <asp:BoundField DataField="porcentaje" HeaderText="Porcentaje" SortExpression="porcentaje" />
                                                            <asp:ButtonField ButtonType="Button" Text="Eliminar" ControlStyle-CssClass="btn btn-danger" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 5. Domicilio notificacion --%>
                                <div id="bloque_5" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" class="collapsed">Domicilio de notificacion</a>
                                        </h5>
                                    </div>
                                    <div id="collapseSix" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div class="col-lg-6">
                                                    <asp:Label ID="Label23" runat="server" Text="Calle:"></asp:Label>
                                                    <asp:TextBox ID="Calle_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-1">
                                                    <asp:Label ID="Label24" runat="server" Text="Numero:"></asp:Label>
                                                    <asp:TextBox ID="Numero_Docimicilio_Notificacion_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label25" runat="server" Text="Colonia:"></asp:Label>
                                                    <asp:TextBox ID="Colonia_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Label ID="Label26" runat="server" Text="Poblacion:"></asp:Label>
                                                    <asp:TextBox ID="Poblacion_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label27" runat="server" Text="Estado:"></asp:Label>
                                                    <asp:TextBox ID="Estado_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label28" runat="server" Text="Codigo postal:"></asp:Label>
                                                    <asp:TextBox ID="Codigo_Postal_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label29" runat="server" Text="R.F.C."></asp:Label>
                                                    <asp:TextBox ID="Rfc_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 12. Uso suelo --%>
                                <div id="bloque_12" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="accordion" href="#collapseEleven" aria-expanded="false" class="collapsed">Uso suelo</a>
                                        </h5>
                                    </div>
                                    <div id="collapseEleven" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <%--                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label42" runat="server" Text="Uso:"></asp:Label>
                                                        <asp:DropDownList ID="Uso_Suelo_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>--%>
                                                <div class="col-lg-6">
                                                    <asp:Label ID="Label43" runat="server" Text="Clase de terreno:"></asp:Label>
                                                    <asp:DropDownList ID="Clase_Terreno_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:Label ID="Label44" runat="server" Text="Superficie en hectareas:"></asp:Label>
                                                    <asp:TextBox ID="Superficie_Hectareas_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 6. Colindancias --%>
                                <div id="bloque_6" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" class="collapsed">Colindancias</a>
                                        </h5>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div id="Datos_Colindancias" runat="server">
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label15" runat="server" Text="Pto. Cardinal:"></asp:Label>
                                                        <asp:TextBox ID="Punto_Cardinal_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label16" runat="server" Text="Distancia en Mts:"></asp:Label>
                                                        <asp:TextBox ID="Distancia_Metros_TextBox" runat="server" CssClass="form-control"
                                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label17" runat="server" Text="Colindancias:"></asp:Label>
                                                        <asp:TextBox ID="Colindancias_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <br />
                                                        <asp:Button ID="Agregar_Colindancia_Button" runat="server" Text="Agregar colindancia" CssClass="btn btn-primary" OnClick="Agregar_Colindancia_Button_Click" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <br />
                                                    <asp:SqlDataSource ID="Colindancias_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Colindancia], [punto_Cardinal], [distancia_Metros], [colindancias] FROM [Catastro_Colindancias] WHERE id_Solicitud_Notaria = @id_Solicitud_Notaria">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="id_Solicitud_Notaria_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:GridView ID="Colindancias_GridView"
                                                        runat="server"
                                                        AutoGenerateColumns="False"
                                                        DataKeyNames="id_Colindancia"
                                                        CssClass="table table-bordered table-striped"
                                                        DataSourceID="Colindancias_SqlDataSource" OnRowCommand="Colindancias_GridView_RowCommand">
                                                        <Columns>
                                                            <asp:BoundField DataField="punto_Cardinal" HeaderText="Punto Cardinal" SortExpression="punto_Cardinal" />
                                                            <asp:BoundField DataField="distancia_Metros" HeaderText="Distancia en metros" SortExpression="distancia_Metros" />
                                                            <asp:BoundField DataField="colindancias" HeaderText="Colindancias" SortExpression="colindancias" />
                                                            <asp:ButtonField ButtonType="Button" Text="Eliminar">
                                                                <ControlStyle CssClass="btn btn-danger" />
                                                            </asp:ButtonField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 7. Propietarios --%>
                                <%--                                    <div id="bloque_7" runat="server" class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThirdteen" aria-expanded="false" class="collapsed">
                                                    <asp:Label ID="Label56" runat="server" Text="Propietarios1:"></asp:Label></a>
                                            </h5>
                                        </div>
                                        <div id="collapseThirdteen" class="panel-collapse collapse" aria-expanded="false">
                                            <div class="panel-body" style="background: #f7f7f7">
                                                <div class="row" style="text-align: center">
                                                    <div class="col-lg-8">
                                                        <asp:Label ID="Label57" runat="server" Text="Nombre completo o razon social:"></asp:Label>
                                                        <asp:TextBox ID="Nombre_Propietario_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label58" runat="server" Text="Porcentaje:"></asp:Label>
                                                        <asp:TextBox ID="Porcentaje_Propietario_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <br />
                                                        <asp:Button ID="Agregar_Propietario_Button" runat="server" Text="Agregar propietario" CssClass="btn btn-primary" CommandArgument="Propietario" />
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <asp:SqlDataSource ID="Propietarios_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT id_Solicitud_Propietario, id_Tipo_Propietario, nombre_Razon_Social, porcentaje FROM Catastro_Solicitudes_Propietarios WHERE (id_Solicitud_Notaria = @id_Solicitud_Notaria)">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="id_Solicitud_Notaria_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <asp:GridView ID="Propietarios_GridView" runat="server"
                                                            AllowPaging="True"
                                                            AutoGenerateColumns="False"
                                                            BorderStyle="None"
                                                            HorizontalAlign="Center"
                                                            BackColor="White"
                                                            CssClass="table table-bordered table-striped"
                                                            EmptyDataText="No hay propietarios registradas..."
                                                            Width="90%"
                                                            DataKeyNames="id_Solicitud_Propietario"
                                                            DataSourceID="Propietarios_SqlDataSource"
                                                            OnRowCommand="Eliminar_Propietario_GridView_RowCommand">
                                                            <Columns>
                                                                <asp:BoundField DataField="nombre_Razon_Social" HeaderText="Nombre completo o razon social" SortExpression="nombre_Razon_Social" />
                                                                <asp:BoundField DataField="porcentaje" HeaderText="Porcentaje" SortExpression="porcentaje" />
                                                                <asp:ButtonField ButtonType="Button" Text="Eliminar" ControlStyle-CssClass="btn btn-danger" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>

                                <%-- Label tipo subdivisio/fusion --%>
                                <div id="tipo_sub_fus" runat="server" class="row">
                                    <div class="col-lg-12" style="text-align: center">
                                        <asp:Label ID="tipo_sub_fus_Label" runat="server" Text="Subdividir" Font-Size="Large" Font-Bold="True" Visible="false"></asp:Label>
                                    </div>
                                </div>

                                <%-- 8. Tipo de operacion --%>
                                <div id="bloque_8" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" class="collapsed">Tipo de operacion</a>
                                        </h5>
                                    </div>
                                    <div id="collapseSeven" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div id="Tipos_Operacion" runat="server">
                                                    <div class="col-lg-6">
                                                        <asp:Label ID="Label53" runat="server" Text="Seleccione tipo de operacion:"></asp:Label>
                                                        <asp:DropDownList ID="Tipos_Operacion_DropDownList" runat="server" CssClass="form-control"
                                                            AutoPostBack="true" OnSelectedIndexChanged="Tipos_Operacion_DropDownList_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <asp:Label ID="Label54" runat="server" Text="Explique:"></asp:Label>
                                                        <asp:TextBox ID="Otro_Tipo_Operacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div id="Operacion_Sub_Fus" runat="server" class="col-lg-offset-4 col-lg-4">
                                                    <asp:Label ID="Label55" runat="server" Text="Especifique el tipo de operacion:"></asp:Label>
                                                    <asp:TextBox ID="Tipo_Operacion_Especifico_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 13. Datos predios --%>
                                <div id="bloque_13" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="accordion" href="#collapseTwelve" aria-expanded="false" class="collapsed">Datos Predios</a>
                                        </h5>
                                    </div>
                                    <div id="collapseTwelve" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div id="clave_catastral_lotes_fusionar" runat="server" class="col-lg-12">
                                                    <div class="col-lg-offset-4 col-lg-4">
                                                        <asp:Label ID="Label20" runat="server" Text="Clave catastral:"></asp:Label>
                                                        <asp:TextBox ID="clave_catastral_lote_fusionar_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label45" runat="server" Text="Calle:"></asp:Label>
                                                    <asp:TextBox ID="Calle_Predios_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Label ID="Label46" runat="server" Text="Lote:"></asp:Label>
                                                    <asp:TextBox ID="Lote_Predios_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Label ID="Label47" runat="server" Text="Manzana:"></asp:Label>
                                                    <asp:TextBox ID="Manzana_Predios_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="Label48" runat="server" Text="Superficie de terreno:"></asp:Label>
                                                    <asp:TextBox ID="Superficie_Terreno_Predios_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-12">
                                                    <br />
                                                    <asp:Button ID="Agregar_Predio_Button" runat="server" Text="Agregar Predio " CssClass="btn btn-primary" OnClick="Agregar_Predio_Button_Click" />
                                                </div>

                                                <div class="col-lg-12">
                                                    <br />
                                                    <asp:SqlDataSource ID="Datos_Predios_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT id_Solicitud_Predio, calle, numero_Lote, numero_Manzana, superficie_Terreno, clave_Catastral_Predio FROM Catastro_Solicitudes_Predios WHERE (id_Solicitud_Notaria = @id_Solicitud_Notaria) AND (tipo_Origen_Destino &lt;&gt; @tipo_Origen_Destino)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="id_Solicitud_Notaria_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                            <asp:ControlParameter ControlID="Tipo_Predio_HiddenField" DefaultValue="0" Name="tipo_Origen_Destino" PropertyName="Value" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:GridView ID="Datos_Predios_GridView" runat="server" AutoGenerateColumns="False"
                                                        DataKeyNames="id_Solicitud_Predio" DataSourceID="Datos_Predios_SqlDataSource"
                                                        CssClass="table table-bordered table-striped" OnRowCommand="Datos_Predios_GridView_RowCommand">
                                                        <Columns>
                                                            <asp:BoundField DataField="id_Solicitud_Predio" HeaderText="Num. Solicitud" InsertVisible="False" ReadOnly="True" SortExpression="id_Solicitud_Predio" />
                                                            <asp:BoundField DataField="clave_Catastral_Predio" HeaderText="Clave Catastral" SortExpression="calle" />
                                                            <asp:BoundField DataField="calle" HeaderText="Calle" SortExpression="calle" />
                                                            <asp:BoundField DataField="numero_Lote" HeaderText="Numero Lote" SortExpression="numero_Lote" />
                                                            <asp:BoundField DataField="numero_Manzana" HeaderText="Numero Manzana" SortExpression="numero_Manzana" />
                                                            <asp:BoundField DataField="superficie_Terreno" HeaderText="Superficie Terreneno" SortExpression="superficie_Terreno" />
                                                            <asp:ButtonField ButtonType="Button" Text="Colindacias" CommandName="Colindancias">
                                                                <ControlStyle CssClass="btn btn-info" />
                                                            </asp:ButtonField>
                                                            <asp:ButtonField ButtonType="Button" Text="Eliminar" CommandName="Eliminar">
                                                                <ControlStyle CssClass="btn btn-danger" />
                                                            </asp:ButtonField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>

                                                <div id="Info_Predios_Colindancias" runat="server" class="col-lg-12" visible="False">
                                                    <br />
                                                    <div class="col-lg-12">
                                                        <asp:Label ID="Label58" runat="server" Text="Colindancias" Font-Size="X-Large"></asp:Label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label42" runat="server" Text="Punto Cardinal:"></asp:Label>
                                                        <asp:TextBox ID="Punto_Cardial_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label56" runat="server" Text="Distancia en Mts:"></asp:Label>
                                                        <asp:TextBox ID="Distancia_Metros_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label57" runat="server" Text="Colindancias:"></asp:Label>
                                                        <asp:TextBox ID="Colindancias__Predios_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <br />
                                                        <asp:Button ID="Agregar_Colindancia_Predio_Button" runat="server" Text="Agregar Colindancia" CssClass="btn btn-success" OnClick="Agregar_Colindancia_Predio_Button_Click" />
                                                    </div>

                                                    <div class="col-lg-12">
                                                        <br />
                                                        <asp:HiddenField ID="Id_Predio_HiddenField" runat="server" />
                                                        <asp:SqlDataSource ID="Colindancias_Predios_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Colindancia], [punto_Cardinal], [distancia_Metros], [colindancias] FROM [Catastro_Colindancias] WHERE (([id_Solicitud_Notaria] = @id_Solicitud_Notaria) AND ([id_Solicitud_Predio] = @id_Solicitud_Predio))">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="id_Solicitud_Notaria_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                                <asp:ControlParameter ControlID="Id_Predio_HiddenField" DefaultValue="0" Name="id_Solicitud_Predio" PropertyName="Value" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <asp:GridView ID="Colindancias_Predios_GridView" runat="server" AutoGenerateColumns="False"
                                                            DataKeyNames="id_Colindancia" DataSourceID="Colindancias_Predios_SqlDataSource"
                                                            CssClass="table table-bordered table-striped" OnRowCommand="Colindancias_Predios_GridView_RowCommand">
                                                            <Columns>
                                                                <asp:BoundField DataField="punto_Cardinal" HeaderText="Punto cardinal" SortExpression="punto_Cardinal" />
                                                                <asp:BoundField DataField="distancia_Metros" HeaderText="Distancia en metros" SortExpression="distancia_Metros" />
                                                                <asp:BoundField DataField="colindancias" HeaderText="Colindancias" SortExpression="colindancias" />
                                                                <asp:ButtonField ButtonType="Button" Text="Eliminar" CommandName="Eliminar">
                                                                    <ControlStyle CssClass="btn btn-danger" />
                                                                </asp:ButtonField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 9. Documento --%>
                                <div id="bloque_9" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" class="collapsed">Documento</a>
                                        </h5>
                                    </div>
                                    <div id="collapseEight" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label30" runat="server" Text="Documento:"></asp:Label>
                                                    <asp:DropDownList ID="Tipo_Documento_DropDownList" runat="server" CssClass="form-control">
                                                        <asp:ListItem>ESCRITURA PUBLICA</asp:ListItem>
                                                        <asp:ListItem>TITULO DE PROPIEDAD</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label31" runat="server" Text="Numero:"></asp:Label>
                                                    <asp:TextBox ID="Numero_Documento_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label32" runat="server" Text="Volumen:"></asp:Label>
                                                    <asp:TextBox ID="Volumen_Documento_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label33" runat="server" Text="Fecha:"></asp:Label>
                                                    <div class="input-group date">
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                        <asp:TextBox ID="Fecha_Documento_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 10. Impuesto sobre traslacion de dominio --%>
                                <div id="bloque_10" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseNine" aria-expanded="false" class="collapsed">Impuesto sobre traslacion de dominio</a>
                                        </h5>
                                    </div>
                                    <div id="collapseNine" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body" style="background: #f7f7f7">
                                            <div class="row" style="text-align: center">
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label34" runat="server" Text="Precio pactado:"></asp:Label>
                                                    <asp:TextBox ID="Precio_Pactado_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" onkeyup="this.value=cpf(this.value);"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Label ID="Label35" runat="server" Text="Avaluo comercial:"></asp:Label>
                                                    <asp:TextBox ID="Avaluo_Comercial_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" onkeyup="this.value=cpf(this.value);"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Label ID="Label36" runat="server" Text="Valor para base de impuesto:"></asp:Label>
                                                    <asp:TextBox ID="Valor_Base_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" onkeyup="this.value=cpf(this.value);"></asp:TextBox>
                                                </div>
                                                <div id="deduccion" class="col-lg-2">
                                                    <asp:Label ID="Label37" runat="server" Text="Deduccion:"></asp:Label>
                                                    <asp:TextBox ID="Deduccion_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" onkeyup="this.value=cpf(this.value);"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Label ID="Label38" runat="server" Text="Base gravable:"></asp:Label>
                                                    <asp:TextBox ID="Base_Gravable_TextBox" runat="server" CssClass="form-control"
                                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" onkeyup="this.value=cpf(this.value);"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- BUTTONS FOOTER --%>
            <div class="row">
                <div class="col-lg-12">
                    <br />
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <asp:Button ID="Guardar_Sin_Enviar_Button" runat="server" CssClass="btn btn-success" Text="Guardar Sin Enviar" CommandArgument="GSE" OnCommand="Informacion_Manifiestos_Command" OnClick="Guardar_Sin_Enviar_Button_Click" />
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <asp:Button ID="Volver_Button" runat="server" CssClass="btn btn-danger" Text="Volver" OnClick="Volver_Button_Click" />
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <asp:Button ID="Guardar_Enviar_Button" runat="server" CssClass="btn btn-primary" Text="Guardar y Enviar" CommandArgument="GYE" OnCommand="Informacion_Manifiestos_Command" OnClick="Guardar_Enviar_Button_Click" />
                </div>
            </div>

            <!-- MODAL MENSAJES -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_alertas" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Aviso</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Mensaje_Label" Text="" runat="server" CssClass="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="hideModal()">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>

<%--            <button id="btnSave" class="btn btn-primary btn-lg btn-block btn-sm btn-setmargin" type="button" data-toggle="modal" data-target="#confirm-delete">Save</button>

            <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Confirm</h4>
                        </div>
                        <div class="modal-body">
                            <p>You are about to save one record.</p>
                            <p>Do you want to proceed?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-danger btn-ok" data-dismiss="modal" onclick="lista_Campos">Yes</button>
                            <asp:Button ID="Button1" runat="server" Text="Button" data-dismiss="modal" OnClick="Archivos_Adjuntos_Button_Click"/>
                        </div>
                    </div>
                </div>--%>


                <%-- MODAL CANCELAR --%>
                <div class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3>
                                    <asp:Label ID="Label67" runat="server" Text="La "></asp:Label></h3>
                            </div>
                            <div class="modal-body">
                            </div>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">

    <%--    <script src="<%= ResolveClientUrl("~/Content/js/inspinia.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Content/js/plugins/pace/pace.min.js") %> "></script>--%><%--    <script src="<%= ResolveClientUrl("~/Content/js/inspinia.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Content/js/plugins/pace/pace.min.js") %> "></script>--%>    <%--    <script src="<%= ResolveClientUrl("~/Content/js/inspinia.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Content/js/plugins/pace/pace.min.js") %> "></script>--%>

    <script src="<%=  ResolveClientUrl("~/content/js/plugins/datapicker/bootstrap-datepicker.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/jquery.blockUI.js") %>"></script>

    <!-- Custom and plugin javascript -->
    <%--    <script src="<%= ResolveClientUrl("~/Content/js/inspinia.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Content/js/plugins/pace/pace.min.js") %> "></script>--%>

    <script type="text/javascript">

        //window.moveTo(0, 0);

        $(document).ready(function () {
            ejecuta_javascript();
        });


        function ejecuta_javascript() {
            hideModal();
            //$(".chosen-select").chosen();

            $('.input-group.date').datepicker({
                startView: 1,
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true,
                format: "dd/mm/yyyy",
                language: "ES",
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            });

            //Array para dar formato en español
            $.datepicker.regional['es'] =
            {
                closeText: 'Cerrar',
                prevText: 'Previo',
                nextText: 'Próximo',

                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
                'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                monthStatus: 'Ver otro mes', yearStatus: 'Ver otro año',
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                dateFormat: 'dd/mm/yy', firstDay: 0,
                initStatus: 'Selecciona la fecha', isRTL: false
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

            //miDate: fecha de comienzo D=días | M=mes | Y=año
            //maxDate: fecha tope D=días | M=mes | Y=año
            $("#datepicker").datepicker({ minDate: "-1D", maxDate: "+1M +10D" });
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

        function cpf(v) {
            v = v.replace(',', '')
            v = v.replace(/([^0-9\.]+)/g, '');
            v = v.replace(/^[\.]/, '');
            v = v.replace(/[\.][\.]/g, '');
            v = v.replace(/\.(\d)(\d)(\d)/g, '.$1$2');
            v = v.replace(/\.(\d{1,2})\./g, '.$1');
            v = v.toString().split('').reverse().join('').replace(/(\d{3})/g, '$1,');
            v = v.split('').reverse().join('').replace(/^[\,]/, '');
            //if (v.length == 0) { v = "0" };
            return v;
        }

    </script>
</asp:Content>

