<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Compar_Manifiestos.aspx.cs" Inherits="Forms_Compar_Manifiestos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="ID_Panel" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField ID="Id_Solicitud_HiddenField" runat="server" />
            <h1 style="background: #CCCCCC; text-align: center">
                <asp:Label ID="Encabezado_Label" runat="server" Text="Revision de manifestacion"></asp:Label></h1>

            <%-- BOTON OBSERVACIONES --%>
            <div class="row">
                <div class="col-lg-6">
                    <asp:Label ID="Label1" runat="server" Text="Oficina de ubicacion:" Font-Bold="True"></asp:Label>
                    <asp:TextBox ID="Oficina_Ubicacion_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <asp:Label ID="Label83" runat="server" Text="Folio:" Font-Bold="True"></asp:Label>
                    <asp:TextBox ID="Folio_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                </div>

                <div id="Encabezado_Sub" runat="server" visible="false">
                    <div class="col-lg-4">
                        <asp:Label ID="Label84" runat="server" Text="Clave catastral:" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="Clave_Catastral_Subdivision_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="Label85" runat="server" Text="Codigo postal:" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="Codigo_Postal_Subdivision_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="Label86" runat="server" Text="C.U.R.P:" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="Curp_Subdivision_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <div id="Claves_Curps" runat="server">
                    <div class="col-lg-6">
                        <asp:Label ID="Label87" runat="server" Text="Clave catastral vendedor:" BorderStyle="NotSet" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="Clave_Catastral_Vendedor_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="Label88" runat="server" Text="Clave catastral comprador:" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="Clave_Catastral_Comprador_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="Label89" runat="server" Text="C.U.R.P:" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="Curp_Vendedor_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="Label94" runat="server" Text="C.U.R.P:" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="Curp_Comprador_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-12" style="text-align: right">
                    <br />
                    <asp:Button ID="Observaciones_Button" runat="server" Text="Observaciones" CssClass="btn btn-warning" OnClick="Observaciones_Button_Click" />
                </div>
            </div>


            <div class="row">
                <br />
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Comparacion de fichas</h5>
                        </div>
                    </div>

                    <div class="ibox-content" style="display: block">
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                                <%--1. Ubicacion del predio --%>
                                <div id="bloque_1" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" class="collapsed">Ubicacion del predio</a>
                                        </h5>
                                    </div>
                                    <div id="collapse1" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label95" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label2" runat="server" Text="Municipio:"></asp:Label>
                                                                <asp:TextBox ID="Municipio_Predio_Origen_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label3" runat="server" Text="Poblacion:"></asp:Label>
                                                                <asp:TextBox ID="Poblacion_Predio_Origen_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-5">
                                                                <asp:Label ID="Label4" runat="server" Text="Calle:"></asp:Label>
                                                                <asp:TextBox ID="Calle_Predio_Origen_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Label ID="Label5" runat="server" Text="Num. Oficial:"></asp:Label>
                                                                <asp:TextBox ID="Num_Oficional_Predio_Origen_TextBox" runat="server" class="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label6" runat="server" Text="Colonia:"></asp:Label>
                                                                <asp:TextBox ID="Colonia_Predio_Origen_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label7" runat="server" Text="Num. Lote:"></asp:Label>
                                                                <asp:TextBox ID="Num_Lote_Predio_Origen_TextBox" runat="server" class="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label8" runat="server" Text="Num. Mza:"></asp:Label>
                                                                <asp:TextBox ID="Num_Manzana_Predio_Origen_TextBox" runat="server" class="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label96" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label9" runat="server" Text="Municipio:"></asp:Label>
                                                                <asp:TextBox ID="Municipio_Info_Catastro_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label10" runat="server" Text="Poblacion:"></asp:Label>
                                                                <asp:TextBox ID="Poblacion_Info_Catastro_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-5">
                                                                <asp:Label ID="Label11" runat="server" Text="Calle:"></asp:Label>
                                                                <asp:TextBox ID="Calle_Info_Catastro_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Label ID="Label17" runat="server" Text="Num. Oficial:"></asp:Label>
                                                                <asp:TextBox ID="Num_Ofi_Info_Catastro_TextBox" runat="server" class="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label18" runat="server" Text="Colonia:"></asp:Label>
                                                                <asp:TextBox ID="Colonia_Info_Catastro_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label19" runat="server" Text="Num. Lote:"></asp:Label>
                                                                <asp:TextBox ID="Num_Lote_Info_Catastro_TextBox" runat="server" class="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label20" runat="server" Text="Num. Mza:"></asp:Label>
                                                                <asp:TextBox ID="Num_Mza_Info_Catastro_TextBox" runat="server" class="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--11. Ubicacion del predio (rural) --%>
                                <div id="bloque_11" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" class="collapsed">Ubicacion del predio (rural)</a>
                                        </h5>
                                    </div>
                                    <div id="collapse2" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label97" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label39" runat="server" Text="Nombre del predio:"></asp:Label>
                                                                <asp:TextBox ID="Nombre_Predio_Rural_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label40" runat="server" Text="Poblacion mas cercana:"></asp:Label>
                                                                <asp:TextBox ID="Poblacion_Mas_Cercana_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label41" runat="server" Text="Municipio:"></asp:Label>
                                                                <asp:TextBox ID="Municipio_Predio_Rural_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label12" runat="server" Text="Valor catastral:"></asp:Label>
                                                                <asp:TextBox ID="Valor_Catastral_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="Div11" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label105" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label21" runat="server" Text="Nombre del predio:"></asp:Label>
                                                                <asp:TextBox ID="Nom_Predio_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label22" runat="server" Text="Poblacion mas cercana:"></asp:Label>
                                                                <asp:TextBox ID="Poblacion_Mas_Cercana_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label30" runat="server" Text="Municipio:"></asp:Label>
                                                                <asp:TextBox ID="Municipio_Predio_Rural" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label49" runat="server" Text="Valor catastral:"></asp:Label>
                                                                <asp:TextBox ID="Valor_Catastral_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 2. Informacion predio --%>
                                <div id="bloque_2" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false" class="collapsed">Informacion predio</a>
                                        </h5>
                                    </div>
                                    <div id="collapse3" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label98" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label13" runat="server" Text="Sup. de terreno M2:"></asp:Label>
                                                                <asp:TextBox ID="Superficie_Terreno_Predio_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label14" runat="server" Text="Tipo:"></asp:Label>
                                                                <%--<asp:TextBox ID="Tipo_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                                <asp:DropDownList ID="Tipo_Predio_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label15" runat="server" Text="Uso:"></asp:Label>
                                                                <%--<asp:TextBox ID="Uso_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                                <asp:DropDownList ID="Uso_Predio_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label16" runat="server" Text="Operacion:"></asp:Label>
                                                                <%--<asp:TextBox ID="Operacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                                <asp:DropDownList ID="Operaciones_DropDownList" runat="server" CssClass="form-control">
                                                                    <asp:ListItem>TOTAL</asp:ListItem>
                                                                    <asp:ListItem>PARCIAL</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="Div7" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label103" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label50" runat="server" Text="Sup. de terreno M2:"></asp:Label>
                                                                <asp:TextBox ID="Sup_Terreno_Info_Catastro_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label51" runat="server" Text="Tipo:"></asp:Label>
                                                                <%--<asp:TextBox ID="Tipo_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                                <asp:DropDownList ID="Tipo_Info_Catastro_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label52" runat="server" Text="Uso:"></asp:Label>
                                                                <%--<asp:TextBox ID="Uso_Predio_TextBox" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                                <asp:DropDownList ID="Uso_Info_Catastro_TextBox_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label53" runat="server" Text="Operacion:"></asp:Label>
                                                                <%--<asp:TextBox ID="Operacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                                <asp:DropDownList ID="Operacion_Info_Catastro_DropDownList" runat="server" CssClass="form-control">
                                                                    <asp:ListItem>TOTAL</asp:ListItem>
                                                                    <asp:ListItem>PARCIAL</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 3. Datos de quien transmite --%>
                                <div id="bloque_3" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="false" class="collapsed">
                                                <asp:Label ID="Titulo_Quien_Transmite_Label" runat="server" Text="Datos de quien transmite"></asp:Label></a>
                                        </h5>
                                    </div>
                                    <div id="collapse4" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <asp:SqlDataSource ID="Datos_Transmite_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Solicitud_Propietario], [nombre_Razon_Social], [porcentaje] FROM [Catastro_Solicitudes_Propietarios] WHERE ([id_Solicitud_Notaria] = @id_Solicitud_Notaria) AND ([tipo_Propietario_Transmite_Adquiere] = 1)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Id_Solicitud_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label99" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-12">
                                                                <br />
                                                                <asp:GridView ID="Datos_Quien_Transmite_GridView" runat="server"
                                                                    AllowPaging="True"
                                                                    AutoGenerateColumns="False"
                                                                    BorderStyle="None"
                                                                    HorizontalAlign="Center"
                                                                    BackColor="White"
                                                                    CssClass="table table-bordered table-striped"
                                                                    EmptyDataText="No hay propietarios registradas..."
                                                                    Width="90%"
                                                                    DataKeyNames="id_Solicitud_Propietario" DataSourceID="Datos_Transmite_SqlDataSource">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="nombre_Razon_Social" HeaderText="Nombre completo o razon social" SortExpression="nombre_Razon_Social" />
                                                                        <asp:BoundField DataField="porcentaje" HeaderText="Porcentaje" SortExpression="porcentaje" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Solicitud_Propietario], [nombre_Razon_Social], [porcentaje] FROM [Catastro_Solicitudes_Propietarios] WHERE ([id_Solicitud_Notaria] = @id_Solicitud_Notaria) AND ([tipo_Propietario_Transmite_Adquiere] = 1)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Id_Solicitud_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <div class="col-lg-6" id="Div2" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label106" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-12">
                                                                <br />
                                                                <asp:GridView ID="GridView1" runat="server"
                                                                    AllowPaging="True"
                                                                    AutoGenerateColumns="False"
                                                                    BorderStyle="None"
                                                                    HorizontalAlign="Center"
                                                                    BackColor="White"
                                                                    CssClass="table table-bordered table-striped"
                                                                    EmptyDataText="No hay propietarios registradas..."
                                                                    Width="90%"
                                                                    DataKeyNames="id_Solicitud_Propietario" DataSourceID="Datos_Transmite_SqlDataSource">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="nombre_Razon_Social" HeaderText="Nombre completo o razon social" SortExpression="nombre_Razon_Social" />
                                                                        <asp:BoundField DataField="porcentaje" HeaderText="Porcentaje" SortExpression="porcentaje" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 4. Datos de quien adquiere --%>
                                <div id="bloque_4" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="false" class="collapsed">
                                                <asp:Label ID="Titulo_Quien_Adquiere_Label" runat="server" Text="Datos de quien adquiere"></asp:Label>
                                            </a>
                                        </h5>
                                    </div>
                                    <div id="collapse5" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <asp:SqlDataSource ID="Dato_Adquiere_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Solicitud_Propietario], [nombre_Razon_Social], [porcentaje] FROM [Catastro_Solicitudes_Propietarios] WHERE (([id_Solicitud_Notaria] = @id_Solicitud_Notaria) AND ([tipo_Propietario_Transmite_Adquiere] = @tipo_Propietario_Transmite_Adquiere))">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Id_Solicitud_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                    <asp:Parameter DefaultValue="2" Name="tipo_Propietario_Transmite_Adquiere" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label100" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-12">
                                                                <br />
                                                                <asp:GridView ID="Datos_Quien_Adquiere_GridView" runat="server"
                                                                    AllowPaging="True"
                                                                    AutoGenerateColumns="False"
                                                                    BorderStyle="None"
                                                                    HorizontalAlign="Center"
                                                                    CssClass="table table-bordered table-striped"
                                                                    BackColor="White"
                                                                    DataKeyNames="id_Solicitud_Propietario"
                                                                    EmptyDataText="No hay propietarios registrados..."
                                                                    DataSourceID="Dato_Adquiere_SqlDataSource"
                                                                    Width="90%">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="nombre_Razon_Social" HeaderText="Nombre completo o razon social" SortExpression="nombre_Razon_Social" />
                                                                        <asp:BoundField DataField="porcentaje" HeaderText="Porcentaje" SortExpression="porcentaje" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Solicitud_Propietario], [nombre_Razon_Social], [porcentaje] FROM [Catastro_Solicitudes_Propietarios] WHERE (([id_Solicitud_Notaria] = @id_Solicitud_Notaria) AND ([tipo_Propietario_Transmite_Adquiere] = @tipo_Propietario_Transmite_Adquiere))">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Id_Solicitud_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                    <asp:Parameter DefaultValue="2" Name="tipo_Propietario_Transmite_Adquiere" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <div class="col-lg-6" id="Div15" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label101" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-12">
                                                                <br />
                                                                <asp:GridView ID="GridView2" runat="server"
                                                                    AllowPaging="True"
                                                                    AutoGenerateColumns="False"
                                                                    BorderStyle="None"
                                                                    HorizontalAlign="Center"
                                                                    CssClass="table table-bordered table-striped"
                                                                    BackColor="White"
                                                                    DataKeyNames="id_Solicitud_Propietario"
                                                                    EmptyDataText="No hay propietarios registrados..."
                                                                    DataSourceID="Dato_Adquiere_SqlDataSource"
                                                                    Width="90%">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="nombre_Razon_Social" HeaderText="Nombre completo o razon social" SortExpression="nombre_Razon_Social" />
                                                                        <asp:BoundField DataField="porcentaje" HeaderText="Porcentaje" SortExpression="porcentaje" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 5. Domicilio notificacion --%>
                                <div id="bloque_5" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="false" class="collapsed">
                                                <asp:Label ID="Label54" runat="server" Text="Domicilio notificacion"></asp:Label>
                                            </a>
                                        </h5>
                                    </div>
                                    <div id="collapse6" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label102" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-9">
                                                                <asp:Label ID="Label23" runat="server" Text="Calle:"></asp:Label>
                                                                <asp:TextBox ID="Calle_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Label ID="Label24" runat="server" Text="Numero:"></asp:Label>
                                                                <asp:TextBox ID="Numero_Docimicilio_Notificacion_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label25" runat="server" Text="Colonia:"></asp:Label>
                                                                <asp:TextBox ID="Colonia_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label26" runat="server" Text="Poblacion:"></asp:Label>
                                                                <asp:TextBox ID="Poblacion_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label27" runat="server" Text="Estado:"></asp:Label>
                                                                <asp:TextBox ID="Estado_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Label ID="Label28" runat="server" Text="C.P:"></asp:Label>
                                                                <asp:TextBox ID="Codigo_Postal_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-5">
                                                                <asp:Label ID="Label29" runat="server" Text="R.F.C."></asp:Label>
                                                                <asp:TextBox ID="Rfc_Domicilio_Notificacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="Div17" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label104" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-9">
                                                                <asp:Label ID="Label56" runat="server" Text="Calle:"></asp:Label>
                                                                <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Label ID="Label57" runat="server" Text="Numero:"></asp:Label>
                                                                <asp:TextBox ID="Numero_Info_Catastro_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label58" runat="server" Text="Colonia:"></asp:Label>
                                                                <asp:TextBox ID="Colonia_Dom_Not_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label59" runat="server" Text="Poblacion:"></asp:Label>
                                                                <asp:TextBox ID="Poblacion_Dom_Not_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label60" runat="server" Text="Estado:"></asp:Label>
                                                                <asp:TextBox ID="Estado_Dom_Not_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Label ID="Label61" runat="server" Text="C.P:"></asp:Label>
                                                                <asp:TextBox ID="Cp_Dom_Not_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-5">
                                                                <asp:Label ID="Label62" runat="server" Text="R.F.C."></asp:Label>
                                                                <asp:TextBox ID="Rfc_Dom_Not_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 12. Uso suelo --%>
                                <div id="bloque_12" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="accordion" href="#collapse7" aria-expanded="false" class="collapsed">Uso suelo</a>
                                        </h5>
                                    </div>
                                    <div id="collapse7" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label107" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
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

                                            <div class="col-lg-6" id="Div19" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label108" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <%--                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label42" runat="server" Text="Uso:"></asp:Label>
                                                        <asp:DropDownList ID="Uso_Suelo_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>--%>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label63" runat="server" Text="Clase de terreno:"></asp:Label>
                                                                <asp:DropDownList ID="Clase_Terreno_Info_Catastro_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label64" runat="server" Text="Superficie en hectareas:"></asp:Label>
                                                                <asp:TextBox ID="Sup_Hectareas_Info_Catastro_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 6. Colindancias --%>
                                <div id="Div20" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse8" aria-expanded="false" class="collapsed">Colindancias</a>
                                        </h5>
                                    </div>
                                    <div id="collapse8" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <asp:SqlDataSource ID="Colindancias_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Colindancia], [punto_Cardinal], [distancia_Metros], [colindancias] FROM [Catastro_Colindancias] WHERE ([id_Solicitud_Notaria] = @id_Solicitud_Notaria)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Id_Solicitud_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label109" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-12">
                                                                <asp:GridView ID="Colindancias_GridView"
                                                                    runat="server"
                                                                    AutoGenerateColumns="False"
                                                                    DataKeyNames="id_Colindancia"
                                                                    CssClass="table table-bordered table-striped"
                                                                    DataSourceID="Colindancias_SqlDataSource">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="punto_Cardinal" HeaderText="Punto Cardinal" SortExpression="punto_Cardinal" />
                                                                        <asp:BoundField DataField="distancia_Metros" HeaderText="Distancia en metros" SortExpression="distancia_Metros" />
                                                                        <asp:BoundField DataField="colindancias" HeaderText="Colindancias" SortExpression="colindancias" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db_Catastros_ConnectionString %>" SelectCommand="SELECT [id_Colindancia], [punto_Cardinal], [distancia_Metros], [colindancias] FROM [Catastro_Colindancias] WHERE ([id_Solicitud_Notaria] = @id_Solicitud_Notaria)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Id_Solicitud_HiddenField" DefaultValue="0" Name="id_Solicitud_Notaria" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <div class="col-lg-6" id="Div21" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label110" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-12">
                                                                <asp:GridView ID="GridView3"
                                                                    runat="server"
                                                                    AutoGenerateColumns="False"
                                                                    DataKeyNames="id_Colindancia"
                                                                    CssClass="table table-bordered table-striped"
                                                                    DataSourceID="Colindancias_SqlDataSource">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="punto_Cardinal" HeaderText="Punto Cardinal" SortExpression="punto_Cardinal" />
                                                                        <asp:BoundField DataField="distancia_Metros" HeaderText="Distancia en metros" SortExpression="distancia_Metros" />
                                                                        <asp:BoundField DataField="colindancias" HeaderText="Colindancias" SortExpression="colindancias" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- Label tipo subdivisio/fusion --%>
                                <div id="tipo_sub_fus_" runat="server" class="panel panel-default" style="text-align: center">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <asp:Label ID="tipo_sub_fus_Label" runat="server" Text="Subdividir" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </h5>
                                    </div>
                                </div>

                                <%-- 8. Tipo de operacion --%>
                                <div id="bloque_8" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse9" aria-expanded="false" class="collapsed">Tipo de operacion</a>
                                        </h5>
                                    </div>
                                    <div id="collapse9" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label111" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div id="Tipos_Operacion" runat="server">
                                                                <div class="col-lg-6">
                                                                    <asp:Label ID="Label31" runat="server" Text="Seleccione tipo de operacion:"></asp:Label>
                                                                    <asp:DropDownList ID="Tipos_Operacion_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <asp:Label ID="Label32" runat="server" Text="Explique:"></asp:Label>
                                                                    <asp:TextBox ID="Otro_Tipo_Operacion_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div id="Operacion_Sub_Fus" runat="server" class="col-lg-offset-4 col-lg-4">
                                                                <asp:Label ID="Label33" runat="server" Text="Especifique el tipo de operacion:"></asp:Label>
                                                                <asp:TextBox ID="TextBox41" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="Div23" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label112" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div id="Div_ope" runat="server">
                                                                <div class="col-lg-6">
                                                                    <asp:Label ID="Label66" runat="server" Text="Seleccione tipo de operacion:"></asp:Label>
                                                                    <asp:DropDownList ID="Tipo_Operacion_Info_Catastro_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <asp:Label ID="Label67" runat="server" Text="Explique:"></asp:Label>
                                                                    <asp:TextBox ID="Explique_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div id="Div_es" runat="server" class="col-lg-offset-4 col-lg-4">
                                                                <asp:Label ID="Label68" runat="server" Text="Especifique el tipo de operacion:"></asp:Label>
                                                                <asp:TextBox ID="Espeficifique_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 13. Datos predios --%>
                                <div id="bloque_13" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="accordion" href="#collapse10" aria-expanded="false" class="collapsed">Datos Predios</a>
                                        </h5>
                                    </div>
                                    <div id="collapse10" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label113" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div id="clave_catastral_lotes_fusionar" runat="server" class="col-lg-12">
                                                                <div class="col-lg-offset-4 col-lg-4">
                                                                    <asp:Label ID="Label34" runat="server" Text="Clave catastral:"></asp:Label>
                                                                    <asp:TextBox ID="clave_catastral_lote_fusionar_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <asp:Label ID="Label45" runat="server" Text="Calle:"></asp:Label>
                                                                <asp:TextBox ID="Calle_Predios_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label46" runat="server" Text="Lote:"></asp:Label>
                                                                <asp:TextBox ID="Lote_Predios_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label47" runat="server" Text="Manzana:"></asp:Label>
                                                                <asp:TextBox ID="Manzana_Predios_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <asp:Label ID="Label48" runat="server" Text="Superficie de terreno:"></asp:Label>
                                                                <asp:TextBox ID="Superficie_Terreno_Predios_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <br />
                                                                <asp:Button ID="Agregar_Predio_Button" runat="server" Text="Agregar" CssClass="btn btn-primary" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label114" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div id="Div_clave" runat="server" class="col-lg-12">
                                                                <div class="col-lg-offset-4 col-lg-4">
                                                                    <asp:Label ID="Label69" runat="server" Text="Clave catastral:"></asp:Label>
                                                                    <asp:TextBox ID="TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <asp:Label ID="Label70" runat="server" Text="Calle:"></asp:Label>
                                                                <asp:TextBox ID="TextBox24" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label71" runat="server" Text="Lote:"></asp:Label>
                                                                <asp:TextBox ID="TextBox25" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label72" runat="server" Text="Manzana:"></asp:Label>
                                                                <asp:TextBox ID="TextBox26" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <asp:Label ID="Label73" runat="server" Text="Superficie de terreno:"></asp:Label>
                                                                <asp:TextBox ID="TextBox27" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <br />
                                                                <asp:Button ID="Button1" runat="server" Text="Agregar" CssClass="btn btn-primary" />
                                                            </div>
                                                        </div>
                                                    </div>
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

                                <%-- 9. Documento --%>
                                <div id="Div26" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse11" aria-expanded="false" class="collapsed">Documento</a>
                                        </h5>
                                    </div>
                                    <div id="collapse11" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label115" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label35" runat="server" Text="Documento:"></asp:Label>
                                                                <asp:DropDownList ID="Tipo_Documento_DropDownList" runat="server" CssClass="form-control">
                                                                    <asp:ListItem>ESCRITURA PUBLICA</asp:ListItem>
                                                                    <asp:ListItem>TITULO DE PROPIEDAD</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label36" runat="server" Text="Numero:"></asp:Label>
                                                                <asp:TextBox ID="Numero_Documento_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label37" runat="server" Text="Volumen:"></asp:Label>
                                                                <asp:TextBox ID="Volumen_Documento_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label38" runat="server" Text="Fecha:"></asp:Label>
                                                                <div class="input-group date">
                                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                    <asp:TextBox ID="Fecha_Documento_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="Div27" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label116" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label74" runat="server" Text="Documento:"></asp:Label>
                                                                <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-control">
                                                                    <asp:ListItem>ESCRITURA PUBLICA</asp:ListItem>
                                                                    <asp:ListItem>TITULO DE PROPIEDAD</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label75" runat="server" Text="Numero:"></asp:Label>
                                                                <asp:TextBox ID="Numero_Doc_Info_Catastro_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label76" runat="server" Text="Volumen:"></asp:Label>
                                                                <asp:TextBox ID="Volumen_Info_Catastro_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <asp:Label ID="Label77" runat="server" Text="Fecha:"></asp:Label>
                                                                <div class="input-group date">
                                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                    <asp:TextBox ID="Fecha_Doc_Info_Catastro_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 10. Impuesto sobre traslacion de dominio --%>
                                <div id="bloque_10" runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-tittle">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse12" aria-expanded="false" class="collapsed">Impuesto sobre traslacion de dominio</a>
                                        </h5>
                                    </div>
                                    <div id="collapse12" class="panel-collapse collapse in" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
                                                <div class="panel panel-success">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label117" runat="server" Text="NOTARIA"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label42" runat="server" Text="Precio pactado:"></asp:Label>
                                                                <asp:TextBox ID="Precio_Pactado_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label90" runat="server" Text="Avaluo comercial:"></asp:Label>
                                                                <asp:TextBox ID="Avaluo_Comercial_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label91" runat="server" Text="Valor para base de impuesto:"></asp:Label>
                                                                <asp:TextBox ID="Valor_Base_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div id="deduccion" class="col-lg-4">
                                                                <asp:Label ID="Label92" runat="server" Text="Deduccion:"></asp:Label>
                                                                <asp:TextBox ID="Deduccion_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label93" runat="server" Text="Base gravable:"></asp:Label>
                                                                <asp:TextBox ID="Base_Gravable_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="Div29" runat="server">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <asp:Label ID="Label118" runat="server" Text="CATASTRO"></asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row" style="text-align: center">
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label78" runat="server" Text="Precio pactado:"></asp:Label>
                                                                <asp:TextBox ID="Precio_Pactado_Info_Catastro_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label79" runat="server" Text="Avaluo comercial:"></asp:Label>
                                                                <asp:TextBox ID="Avaluo_Comercial_Info_Catastro_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label80" runat="server" Text="Valor para base de impuesto:"></asp:Label>
                                                                <asp:TextBox ID="Valor_Base_Info_Catastro_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div id="deduccion_4" class="col-lg-4">
                                                                <asp:Label ID="Label81" runat="server" Text="Deduccion:"></asp:Label>
                                                                <asp:TextBox ID="Deduccion_Info_Catastro_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="Label82" runat="server" Text="Base gravable:"></asp:Label>
                                                                <asp:TextBox ID="Base_Gravable_Info_Catastro_TextBox" runat="server" CssClass="form-control"
                                                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
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
                    </div>
                </div>
            </div>

            <%-- BOTONES GENERALES --%>
            <div class="row" style="text-align: center">
                <div class="col-lg-4">
                    <asp:Button ID="Button6" runat="server" Text="Regresar Notaria" CssClass="btn btn-warning" />
                </div>
                <div class="col-lg-4">
                    <asp:Button ID="Button7" runat="server" Text="Cancelar" CssClass="btn btn-danger" />
                </div>
                <div class="col-lg-4">
                    <asp:Button ID="Verificado_Button" runat="server" Text="Verificado" CssClass="btn btn-primary" OnClick="Verificado_Button_Click" />
                </div>
            </div>

            <%-- MODAL OBSERVACIONES --%>
            <div class="modal fade" tabindex="-1" role="dialog" id="div_observaciones" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="text-align: center">
                            <h2><b>Observaciones</b></h2>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="Observaciones_TextBox" runat="server" TextMode="MultiLine" Rows="25" Width="100%"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <div class="col-lg-12">
                                <asp:Button ID="Guardar_Observaciones_Button" CssClass="btn btn-success" runat="server" Text="Guardar Observaciones" OnClick="Guardar_Observaciones_Button_Click" />
                                <asp:Label ID="nom_modal_abrir" runat="server" Text="Volver" Visible="False" data-dismiss="modal"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
    <%--    <script src="<%= ResolveClientUrl("~/Content/js/jquery-2.1.1.js") %>"></script>--%>
    <script src="<%= ResolveClientUrl("~/Content/js/plugins/metisMenu/jquery.metisMenu.js") %>"></script>
    <%--    <script src="<%= ResolveClientUrl("~/Content/js/plugins/slimscroll/jquery.slimscroll.min.js") %>"></script>--%>

    <script src="<%= ResolveClientUrl("~/Content/js/inspinia.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Content/js/plugins/pace/pace.min.js") %> "></script>



    <script type="text/javascript">

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
        }

        function despliega_aviso(mensaje) {
            $('#div_alertas').find('.mensaje').text(mensaje);
            $('#div_alertas').modal('show');
        }

        function hideModal() {
            $('.modal-backdrop.fade.in').remove();
        }

        function bloquea_pagina() {
            $.blockUI({ message: 'Espere por Favor...' });
        }

        function desbloquea_pagina() {
            $.unblockUI();
        }

        function collapse(id) {
            $('#' + id).accordion({ collapsible: true });
        }

    </script>
</asp:Content>

