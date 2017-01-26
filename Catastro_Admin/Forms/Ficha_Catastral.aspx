<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Ficha_Catastral.aspx.cs" Inherits="Forms_Ficha_Catastral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Sweet Alert -->
    <link href="<%= ResolveUrl("~/Content/css/plugins/sweetalert/sweetalert.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Content/css/animate.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Content/css/style.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="ID_Panel" UpdateMode="Always">
        <ContentTemplate>
            <h1 style="background: #CCCCCC; text-align: center"><b>FICHA CATASTRAL</b></h1>

            <asp:HiddenField ID="Id_Ficha_HiddenField" runat="server" />

            <%-- BUSCADOR --%>
            <div id="Buscador" class="row col-lg-12" runat="server">
                <br />
                <div class="col-lg-offset-4 col-lg-3" style="text-align: center">
                    <asp:Label ID="Label61" runat="server" Text="Ficha Catastral:"></asp:Label>
                    <asp:TextBox ID="Ficha_Catastral_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-1" style="text-align: center">
                    <br />
                    <asp:Button ID="Buscar_Ficha_Button" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="Buscar_Ficha_Button_Click" />
                </div>
            </div>
            <div id="Nueva_Ficha" runat="server" class="col-lg-offset-5 col-lg-1" style="text-align: center">
                <br />
                <asp:Button ID="Nueva_Ficha_Button" runat="server" Text="Nueva Ficha" CssClass="btn btn-info" OnClick="Buscar_Ficha_Button_Click" />
            </div>

            <%-- ULTIMOS MOVIMIENTOS --%>
            <asp:SqlDataSource ID="Ultimos_Tramites_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="sp_Leer_Tramites_Recientes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <div id="Ultimos_Movimientos" runat="server">
                <div class="col-lg-12">
                    <br />
                    <fieldset>
                        <legend>Tramites Recientes</legend>
                        <div style="text-align: center">
                            <asp:GridView ID="Ultimos_Movimientos_GridView" runat="server" CssClass="table table-bordered table-hover" Style="background: #FFFFFF" DataKeyNames="id_Ficha"
                                EmptyDataText="No hay tramites actuales..." AutoGenerateColumns="False" DataSourceID="Ultimos_Tramites_SqlDataSource" OnRowCommand="Ultimos_Movimientos_GridView_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="tipo_tramite" HeaderText="Tramite " SortExpression="tipo_tramite" />
                                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="fecha" />
                                    <asp:BoundField DataField="numero_notaria" HeaderText="Notaria" SortExpression="num_notaria" />
                                    <asp:BoundField DataField="clave_Catastral" HeaderText="Clave Catastral" SortExpression="clave_catastral" />
                                    <asp:CommandField ButtonType="Button" SelectText="Revisar" ShowSelectButton="True">
                                        <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </fieldset>
                </div>
            </div>



            <%-- FICHA CATASTRAL --%>
            <div id="Ficha_Catastral_div" runat="server" visible="false">

                <%-- FICHA CATASTRAL --%>
                <div id="ficha_catastral" class="row" runat="server">
                    <div class="col-lg-12">
                        <br />
                        <div class="tabs-container">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a data-toggle="tab" href="#tab-1" aria-expanded="true">
                                        <asp:Label ID="Label52" runat="server" Text="Propietarios"></asp:Label></a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-2" aria-expanded="true">
                                        <asp:Label ID="Label54" runat="server" Text="Domicilio Notificacion"></asp:Label></a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-3" aria-expanded="true">
                                        <asp:Label ID="Label55" runat="server" Text="Ubicacion Predio"></asp:Label></a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-4" aria-expanded="true">
                                        <asp:Label ID="Label56" runat="server" Text="Generales"></asp:Label></a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-5" aria-expanded="true">
                                        <asp:Label ID="Label57" runat="server" Text="Terreno"></asp:Label></a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-6" aria-expanded="true">
                                        <asp:Label ID="Label58" runat="server" Text="Construcciones"></asp:Label></a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-7" aria-expanded="true">
                                        <asp:Label ID="Label59" runat="server" Text="Totales"></asp:Label></a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <%-- PROPIETARIOS --%>
                                <div id="tab-1" class="tab-pane active">
                                    <div class="panel-body" style="background: #f7f7f7">
                                        <fieldset>
                                            <legend>Propietarios</legend>
                                            <div style="text-align: center">
                                                <asp:GridView ID="Propietarios_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="Propietarios_SqlDataSource"
                                                    CssClass="table table-hover table-bordered" Style="background: #ffffff" DataKeyNames="id_Catalogo_Propietario">
                                                    <Columns>
                                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                                                        <asp:BoundField DataField="rfc" HeaderText="R.F.C" SortExpression="rfc" />
                                                        <asp:BoundField DataField="curp" HeaderText="Curp" SortExpression="curp" />
                                                        <asp:BoundField DataField="nombre_Tipo_Propietario" HeaderText="Tipo Propietario" SortExpression="tipo_propietario" />
                                                        <asp:BoundField DataField="porcentaje" HeaderText="Porcentaje" SortExpression="porcentaje" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </fieldset>
                                        <asp:SqlDataSource ID="Propietarios_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="sp_Leer_Propietarios" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Ficha_HiddenField" DefaultValue="0" Name="id_ficha" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>

                                <%-- DOMICILIO NOTIFICACION --%>
                                <div id="tab-2" class="tab-pane">
                                    <div class="panel-body" style="background: #f7f7f7">
                                        <fieldset>
                                            <legend>Domicilio de notificacion</legend>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label1" runat="server" Text="Calle"></asp:Label>
                                                <asp:TextBox ID="Calle_Dominicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label2" runat="server" Text="Colonia"></asp:Label>
                                                <asp:TextBox ID="Colonia_Domicilio_Notificacio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label3" runat="server" Text="Poblacion"></asp:Label>
                                                <asp:TextBox ID="Poblacion_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="row col-lg-12">
                                                <br />
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label4" runat="server" Text="Estado"></asp:Label>
                                                <asp:TextBox ID="Estado_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label5" runat="server" Text="C.P."></asp:Label>
                                                <asp:TextBox ID="Cp_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label6" runat="server" Text="Telefono"></asp:Label>
                                                <asp:TextBox ID="Telefono_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>

                                <%-- UBICACION PREDO --%>
                                <div id="tab-3" class="tab-pane">
                                    <div class="panel-body" style="background: #f7f7f7">
                                        <fieldset>
                                            <legend>Ubicacion del predio</legend>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label7" runat="server" Text="Calle"></asp:Label>
                                                <asp:TextBox ID="Calle_Ubicacion_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label8" runat="server" Text="Colonia"></asp:Label>
                                                <asp:TextBox ID="Colonia_Ubicacion_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label9" runat="server" Text="Poblacion"></asp:Label>
                                                <asp:TextBox ID="Poblacion_Ubicacion_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="row col-lg-12">
                                                <br />
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label10" runat="server" Text="Estado"></asp:Label>
                                                <asp:TextBox ID="Estado_Ubicacion_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label11" runat="server" Text="C.P."></asp:Label>
                                                <asp:TextBox ID="Cp_Ubicacion_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label12" runat="server" Text="Telefono"></asp:Label>
                                                <asp:TextBox ID="Telefono_Ubicacion_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="row col-lg-12">
                                                <br />
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:Label ID="Label13" runat="server" Text="Domicilio fiscal"></asp:Label>
                                                <asp:TextBox ID="Domicilio_Fiscal_Ubicacion_Predio_TextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>

                                <%-- GENERALES --%>
                                <div id="tab-4" class="tab-pane">
                                    <div class="panel-body" style="background: #f7f7f7">
                                        <fieldset>
                                            <legend>Generales</legend>
                                            <div class="col-lg-6">
                                                <asp:Label ID="Label14" runat="server" Text="Clave Catastral"></asp:Label>
                                                <asp:TextBox ID="Clave_Catastral_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-6">
                                                <asp:Label ID="Label15" runat="server" Text="Predio origen"></asp:Label>
                                                <asp:TextBox ID="Predio_Origen_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="row col-lg-12">
                                                <br />
                                            </div>

                                            <div class="col-lg-3">
                                                <asp:Label ID="Label16" runat="server" Text="Tipo de adjudicacion"></asp:Label>
                                                <asp:TextBox ID="Tipo_Adjudicacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="Label17" runat="server" Text="Regimen legal"></asp:Label>
                                                <asp:TextBox ID="Regimen_Legal_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-2">
                                                <asp:Label ID="Label18" runat="server" Text="Oficina Catastral"></asp:Label>
                                                <asp:TextBox ID="Oficina_Catastral_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-2">
                                                <asp:Label ID="Label19" runat="server" Text="T.I.P."></asp:Label>
                                                <asp:TextBox ID="Tip_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-2">
                                                <asp:Label ID="Label20" runat="server" Text="Cuota fija"></asp:Label>
                                                <asp:TextBox ID="Cuota_Fija_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="row col-lg-12">
                                                <br />
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="Label21" runat="server" Text="Fecha Vigencia"></asp:Label>
                                                <asp:TextBox ID="Fecha_Vigencia_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="Label22" runat="server" Text="Fecha baldio"></asp:Label>
                                                <asp:TextBox ID="Fecha_Baldio_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="Label23" runat="server" Text="Fecha U.M."></asp:Label>
                                                <asp:TextBox ID="Fecha_Um_Generales_extBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="Label24" runat="server" Text="R.P.P."></asp:Label>
                                                <asp:TextBox ID="Rpp_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="row col-lg-12">
                                                <br />
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="Label25" runat="server" Text="Fecha R.P.P."></asp:Label>
                                                <asp:TextBox ID="Fecha_Rpp_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="Label26" runat="server" Text="Escritura"></asp:Label>
                                                <asp:TextBox ID="Escritura_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="Label27" runat="server" Text="Volumen"></asp:Label>
                                                <asp:TextBox ID="Volumen_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="Label28" runat="server" Text="Fecha escritura"></asp:Label>
                                                <asp:TextBox ID="Fecha_Escritura_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="row col-lg-12">
                                                <br />
                                            </div>
                                            <div class="col-lg-6">
                                                <asp:Label ID="Label29" runat="server" Text="Federatario"></asp:Label>
                                                <asp:TextBox ID="Federatario_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-6">
                                                <asp:Label ID="Label30" runat="server" Text="Numero de medidor"></asp:Label>
                                                <asp:TextBox ID="Numero_Medido_Generales_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>

                                <%-- TERRENO --%>
                                <div id="tab-5" class="tab-pane">
                                    <div class="panel-body" style="background: #f7f7f7">
                                        <fieldset>
                                            <legend>Terreno</legend>
                                            <div class="col-lg-12">
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <div class="panel panel-default" id="medidas_terreno" runat="server">
                                                            <div class="panel-heading">
                                                                <asp:Label ID="Label60" runat="server" Text="Medidas" Font-Bold="True"></asp:Label>
                                                            </div>
                                                            <div class="panel-body" style="background: #e2e2e2">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label31" runat="server" Text="Superficie legal"></asp:Label>
                                                                    <asp:TextBox ID="Superficie_Legal_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label32" runat="server" Text="Superficie cartografica"></asp:Label>
                                                                    <asp:TextBox ID="Superficie_Cartografica_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label33" runat="server" Text="Frente Principal"></asp:Label>
                                                                    <asp:TextBox ID="Frente_Principal_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label34" runat="server" Text="Fondo Predio"></asp:Label>
                                                                    <asp:TextBox ID="Fondo_Predio_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label35" runat="server" Text="Posicion"></asp:Label>
                                                                    <asp:TextBox ID="Posicion_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label36" runat="server" Text="Irregularidades"></asp:Label>
                                                                    <asp:TextBox ID="Irregularidades_Terrreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--</div>--%>

                                                    <%--<div class="row">--%>
                                                    <div class="col-lg-4">
                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                <asp:Label ID="Label37" runat="server" Text="Factores" Font-Bold="True"></asp:Label>
                                                            </div>
                                                            <div class="panel-body" style="background: #e2e2e2">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label38" runat="server" Text="Frente"></asp:Label>
                                                                    <asp:TextBox ID="Frente_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label39" runat="server" Text="Fondo"></asp:Label>
                                                                    <asp:TextBox ID="Fondo_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label40" runat="server" Text="Posicion"></asp:Label>
                                                                    <asp:TextBox ID="Posicion_Factores_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label41" runat="server" Text="Area"></asp:Label>
                                                                    <asp:TextBox ID="Area_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label42" runat="server" Text="Irregularidad"></asp:Label>
                                                                    <asp:TextBox ID="Irregularidades_Factores_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--</div>--%>

                                                    <%--<div class="row">--%>
                                                    <div class="col-lg-4">
                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                <asp:Label ID="Label53" runat="server" Text="Descripcion" Font-Bold="True"></asp:Label>
                                                            </div>
                                                            <div class="panel-body" style="background: #e2e2e2">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label43" runat="server" Text="Uso"></asp:Label>
                                                                    <asp:TextBox ID="Uso_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label44" runat="server" Text="Giro"></asp:Label>
                                                                    <asp:TextBox ID="Giro_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label45" runat="server" Text="Zona homogenea"></asp:Label>
                                                                    <asp:TextBox ID="Zona_Homogenea_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label46" runat="server" Text="Bande de valor"></asp:Label>
                                                                    <asp:TextBox ID="Banda_Valor_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label47" runat="server" Text="Valor unitario"></asp:Label>
                                                                    <asp:TextBox ID="Valor_Unitario_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label48" runat="server" Text="Valor terreno"></asp:Label>
                                                                    <asp:TextBox ID="Valor_Terreno_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>

                                <%-- CONSTRUCCIONES --%>
                                <div id="tab-6" class="tab-pane">
                                    <div class="panel-body" style="background: #f7f7f7">
                                        <fieldset>
                                            <legend>Construcciones</legend>
                                            <div style="text-align: center">
                                                <asp:GridView ID="Construcciones_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="Construcciones_SqlDataSource"
                                                    CssClass="table table-hover table-bordered" Style="background: #ffffff">
                                                    <Columns>
                                                        <asp:BoundField DataField="superficie_Construccion" HeaderText="Superficie Construccion" SortExpression="sup_contruccion" />
                                                        <asp:BoundField DataField="fecha_Construccion" HeaderText="Fecha Construccion" SortExpression="fecha_construccion" />
                                                        <asp:BoundField DataField="edad" HeaderText="Edad" SortExpression="edad" />
                                                        <asp:BoundField DataField="factor_Edad" HeaderText="Fac. Edad" SortExpression="fac_edad" />
                                                        <asp:BoundField DataField="niveles" HeaderText="Niveles" SortExpression="niveles" />
                                                        <asp:BoundField DataField="factor_Niveles" HeaderText="Fac. Niveles" SortExpression="fac_niveles" />
                                                        <asp:BoundField DataField="nombre_Tipologia_Constructiva" HeaderText="Tipologia" SortExpression="tipologia" />
                                                        <asp:BoundField DataField="valor_Unitario" HeaderText="Valor Unitario" SortExpression="valor_unitario" />
                                                        <asp:BoundField DataField="valor_Construccion" HeaderText="Valor Construccion" SortExpression="valor_construccion" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </fieldset>
                                        <asp:SqlDataSource ID="Construcciones_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="sp_Leer_Construcciones" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Ficha_HiddenField" DefaultValue="0" Name="id_ficha" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>

                                <%-- TOTALES --%>
                                <div id="tab-7" class="tab-pane">
                                    <div class="panel-body" style="background: #f7f7f7">
                                        <fieldset>
                                            <legend>Totales</legend>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label49" runat="server" Text="Total construcciones"></asp:Label>
                                                <asp:TextBox ID="Total_Construcciones_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label50" runat="server" Text="Total impuestos predial"></asp:Label>
                                                <asp:TextBox ID="Total_Impuesto_Predial_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Label ID="Label51" runat="server" Text="Valor catastral"></asp:Label>
                                                <asp:TextBox ID="Valor_Catastral_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- BOTONES FINAL --%>
                <div id="botones_final" class="col-lg-12" runat="server" style="text-align: center">
                    <br />
                    <div class="col-lg-4">
                        <asp:Button ID="Correcion_Informacion_Button" CssClass="btn btn-primary" runat="server" Text="Correcion datos" OnClick="Correcion_Informacion_Button_Click" />
                    </div>
                    <div class="col-lg-4">
                        <asp:Button ID="Volver_Inicio_Button" CssClass="btn btn-success" runat="server" Text="Volver" OnClick="Volver_Inicio_Button_Click" />
                    </div>
                    <div class="col-lg-4">
                        <asp:Button ID="Baja_Predio_Button" CssClass="btn btn-danger" runat="server" Text="Baja ficha" OnClick="Baja_Predio_Button_Click" />
                    </div>
                </div>


            </div>

            <%-- BAJA PREDIO --%>
            <div runat="server" id="baja_predio" style="text-align: center" visible="false">
                <div class="row col-lg-12">
                    <br />
                    <div class="col-lg-offset-2 col-lg-4">
                        <asp:Label ID="Label62" runat="server" Text="Ficha catastral:"></asp:Label>
                        <asp:TextBox ID="Ficha_Eliminar_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="Label63" runat="server" Text="Ultimo movimiento:"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row col-lg-12">
                    <div class="col-lg-offset-2 col-lg-4">
                        <asp:Label ID="Label64" runat="server" Text="Motivo baja:"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="Label65" runat="server" Text="Persona que realiza baja:"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row col-lg-12">
                    <div class="col-lg-offset-3 col-lg-6">
                        <asp:Label ID="Label66" runat="server" Text="Justificacion"></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                </div>

                <%-- OnClick="Cancelar_Baja_Button_Click" --%>
                <div class="row col-lg-12">
                    <br />
                    <div class="col-lg-offset-3 col-lg-2">
                        <asp:Button ID="Cancelar_Baja_Button" CssClass="btn btn-success" runat="server" Text="Cancelar" OnClick="Cancelar_Baja_Button_Click1" />
                    </div>
                    <div class="col-lg-2">
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="Eliminar_Ficha_Button" CssClass="btn btn-danger demo3" runat="server" Text="Eliminar" />
                    </div>
                </div>
            </div>

            <%-- MODAL SELECCION DATOS A EDITAR --%>
            <div id="Seleccionar_Datos_Editar" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>
                                <asp:Label ID="Label67" runat="server" Text="Seleccione campos a editar"></asp:Label></h3>
                        </div>
                        <div class="modal-body" style="text-align: center">
                            <div class="row">
                                <div class="col-lg-offset-3 col-lg-6">
                                    <asp:Button ID="Propietarios_Editar_Button" runat="server" Text="Propietarios" Width="100%" CssClass="btn btn-primary" CommandName="Propietarios" OnCommand="Elegir_Tabs" />
                                </div>
                                <div class="col-lg-offset-3 col-lg-6">
                                    <br />
                                    <asp:Button ID="Domicilio_Editar_Button" runat="server" Text="Domicilio Notificacion" Width="100%" CssClass="btn btn-primary" CommandName="Domicilio" OnCommand="Elegir_Tabs" />
                                </div>
                                <div class="col-lg-offset-3 col-lg-6">
                                    <br />
                                    <asp:Button ID="Ubicacion_Editar_Button" runat="server" Text="Ubicacion Predio" Width="100%" CssClass="btn btn-primary" CommandName="Ubicacion" OnCommand="Elegir_Tabs" />
                                </div>
                                <div class="col-lg-offset-3 col-lg-6">
                                    <br />
                                    <asp:Button ID="Generales_Editar_Button" runat="server" Text="Generales" Width="100%" CssClass="btn btn-primary" CommandName="Generales" OnCommand="Elegir_Tabs" />
                                </div>
                                <div class="col-lg-offset-3 col-lg-6">
                                    <br />
                                    <asp:Button ID="Terreno_Editar_Button" runat="server" Text="Terreno" Width="100%" CssClass="btn btn-primary" CommandName="Terreno" OnCommand="Elegir_Tabs" />
                                </div>
                                <div class="col-lg-offset-3 col-lg-6">
                                    <br />
                                    <asp:Button ID="Construcciones_Editar_Button" runat="server" Text="Construcciones" Width="100%" CssClass="btn btn-primary" CommandName="Construcciones" OnCommand="Elegir_Tabs" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer" style="text-align: center">
                            <div class="col-lg-offset-4 col-lg-4">
                                <asp:Button ID="Volver_Ficha_Button" runat="server" Text="Volver" Width="100%" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- MODAL CONFIRMACION --%>
            <div id="confirmar_baja" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            sasasas
                        </div>
                        <div class="modal-body">
                            sasasasa
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="cphScript">

    <%--    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>--%>

    <%--<script src="<%=  ResolveClientUrl("~/Scripts/jquery.blockUI.js") %>"></script>--%>

    <script src="<%=  ResolveClientUrl("~/Content/js/plugins/sweetalert/sweetalert.min.js") %>"></script>

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

            $('.demo3').click(function () {
                swal({
                    title: "¿Estas Seguro?",
                    text: "Al eliminar no se podra deshacer el cambio!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Si, Eliminar!",
                    closeOnConfirm: false
                }, function () {
                    swal("Eliminado!", "La ficha se ha eliminado con exito.", "success");
                });
            });
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
