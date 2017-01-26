<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Catalogo_Usuarios.aspx.cs" Inherits="Forms_Catalogo_Usuarios" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <h3 class="ibox-title">Listado de Usuarios</h3>
                            <div class="ibox-content">
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label1" runat="server" Text="Teclee una Parte del Nombre:"></asp:Label>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:TextBox ID="txt_Nombre_Buscar" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Button ID="Button_Buscar" runat="server" Text="Buscar" class="btn btn-success"
                                            OnClientClick="bloquea_pagina();" OnClick="Button_Buscar_Click" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnNuevoUsuario" runat="server" Text="Nuevo Usuario" CssClass="btn btn-w-m btn-info" OnClick="btnNuevoUsuario_Click" />
                                </div>
                                <div class="form-group">
                                    <asp:GridView ID="Usuarios_GridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None"
                                        CssClass="table table-bordered table-striped" DataKeyNames="id_General_Usuario" DataSourceID="Usuarios_EntityDataSource"
                                        EmptyDataText="No ha registrado Usuarios..." OnSelectedIndexChanged="Usuarios_GridView_SelectedIndexChanged" PageSize="5" Width="90%">
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-info" SelectText="Consultar" ShowSelectButton="True">
                                                <ControlStyle CssClass="btn btn-info" />
                                                <ItemStyle Width="20%" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_detalles" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Aviso</h4>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="Usuarios_DetailsView" runat="server" CssClass="table table-bordered table-hover"
                                AutoGenerateRows="False" DataSourceID="Registro_Usuarios_EntityDataSource"
                                DataKeyNames="id_General_Usuario" EmptyDataText="No ha seleccionado Usuario..."
                                OnDataBound="Usuarios_DetailsView_DataBound" OnItemInserting="Usuarios_DetailsView_ItemInserting"
                                OnItemUpdating="Usuarios_DetailsView_ItemUpdating" OnItemCommand="Usuarios_DetailsView_ItemCommand">

                                <Fields>

                                    <asp:TemplateField HeaderText="Nombre">
                                        <ItemTemplate>
                                            <asp:TextBox ID="Nombre_TextBox" runat="server" class="form-control" ReadOnly="true"
                                                Text='<%# Bind("nombre")%>' MaxLength="30" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Nombre_TextBox" runat="server" class="form-control"
                                                Text='<%# Bind("nombre")%>' MaxLength="30" Width="200px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Nombre_TextBox" runat="server" class="form-control"
                                                Text='<%# Bind("nombre")%>' MaxLength="30" Width="200px"></asp:TextBox>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Correo">
                                        <ItemTemplate>
                                            <asp:TextBox ID="Correo_TextBox" runat="server" class="form-control" ReadOnly="true"
                                                Text='<%# Bind("correo")%>' MaxLength="50" Width="350px"></asp:TextBox>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Correo_TextBox" runat="server" class="form-control"
                                                Text='<%# Bind("correo")%>' MaxLength="50" Width="350px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Correo_TextBox" runat="server" class="form-control"
                                                Text='<%# Bind("correo")%>' MaxLength="50" Width="350px"></asp:TextBox>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Estatus">
                                        <EditItemTemplate>
                                            <asp:RadioButtonList ID="Estatus_RadioButtonList" runat="server"
                                                RepeatDirection="Horizontal" SelectedValue='<%# Bind("estatus") %>' Width="60%">
                                                <asp:ListItem Value="1"> Activo</asp:ListItem>
                                                <asp:ListItem Value="2"> Baja</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:RadioButtonList ID="Estatus_RadioButtonList" runat="server"
                                                RepeatDirection="Horizontal" SelectedValue='<%# Bind("estatus") %>' Width="60%">
                                                <asp:ListItem Value="1" Selected="True"> Activo</asp:ListItem>
                                                <asp:ListItem Value="2"> Baja</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="Estatus_RadioButtonList" runat="server" Enabled="False"
                                                RepeatDirection="Horizontal" SelectedValue='<%# Bind("estatus") %>' Width="60%">
                                                <asp:ListItem Value="1"> Activo</asp:ListItem>
                                                <asp:ListItem Value="2"> Baja</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <br />
                                            <asp:Button ID="Update_Button" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" class="btn btn-warning" />
                                            &nbsp;<asp:Button ID="Cancel_Button" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" class="btn btn-default" OnClientClick="hideModal()" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <br />
                                            <asp:Button ID="Insert_Button" runat="server" CausesValidation="True" CommandName="Insert" Text="Agregar" class="btn btn-primary" OnClientClick="hideModal()" />
                                            &nbsp;<asp:Button ID="Cancel_Button" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" class="btn btn-default" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <br />
                                            <asp:Button ID="Edit_Button" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" class="btn btn-warning" OnClientClick="hideModal()" />
                                            &nbsp;<asp:Button ID="New_Button" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" class="btn btn-primary" OnClientClick="hideModal()" />
                                            &nbsp;<asp:Button ID="Delete_Button" runat="server" CausesValidation="False" Text="Eliminar" class="btn btn-danger" OnClientClick="return confirm('Seguro de Eliminar el Registro ?');" OnClick="Delete_Button_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>

                            </asp:DetailsView>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="hideModal()">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_alertas">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Aviso</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Mensaje_Label" Text="" runat="server" class="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="hideModal()">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->

            <asp:EntityDataSource ID="Registro_Usuarios_EntityDataSource" runat="server" Where="it.id_General_Usuario = @id_registro" ConnectionString="name=db_CatastrosEntities" DefaultContainerName="db_CatastrosEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="tb_Generales_Usuarios" EntityTypeFilter="tb_Generales_Usuarios">
                <WhereParameters>
                    <asp:ControlParameter ControlID="Usuarios_GridView" Name="id_registro" PropertyName="SelectedValue" Type="Int32" ConvertEmptyStringToNull="False" DefaultValue="0" />
                </WhereParameters>
            </asp:EntityDataSource>

            <asp:EntityDataSource ID="Usuarios_EntityDataSource" runat="server" OrderBy="it.nombre" Where="it.nombre Like '%' + @nombre_buscar + '%'" ConnectionString="name=db_CatastrosEntities" DefaultContainerName="db_CatastrosEntities" EnableFlattening="False" EntitySetName="tb_Generales_Usuarios" EntityTypeFilter="tb_Generales_Usuarios">
                <WhereParameters>
                    <asp:ControlParameter ControlID="txt_Nombre_Buscar" ConvertEmptyStringToNull="False" Name="nombre_buscar" PropertyName="Text" Type="String" />
                </WhereParameters>
            </asp:EntityDataSource>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="cphScript">

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

        function despliega_detalles() {
            $('#div_detalles').modal('show');
        }

        function hideModal() {
            $('.modal-backdrop.fade.in').remove();
        }

    </script>

</asp:Content>
