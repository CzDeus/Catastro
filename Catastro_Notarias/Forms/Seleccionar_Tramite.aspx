<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Seleccionar_Tramite.aspx.cs" Inherits="Forms_Seleccionar_Tramite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
    <asp:UpdatePanel ID="ID_Pagina" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="row">
                <div class="col-lg-12" style="text-align: center">
                    <h1 style="background: #CCCCCC">
                        <asp:Label ID="Label1" runat="server" Text="Seleccione el tipo de manifestacion a realizar" Font-Bold="True"></asp:Label></h1>
                </div>

                <div class="col-lg-12">
                    <br />
                    <div class="row">
                        <div class=" col-lg-offset-2 col-lg-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3>
                                        <asp:Label ID="Label2" runat="server" Text="Tramites Urbanos"></asp:Label></h3>
                                </div>
                                <div class="panel-body">
                                    <div class="col-lg-offset-2 col-lg-8">
                                        <asp:Button ID="Rectificacion_Urbano_Button" runat="server" Text="Rectificacion Urbano" CssClass="btn btn-success" Width="100%" CommandName="Rectificacion_Urbano" CommandArgument="1" OnCommand="Botones_Tramites" />
                                    </div>
                                    <div class="col-lg-offset-2 col-lg-8">
                                        <br />
                                        <asp:Button ID="Traslacion_Urbano_Button" runat="server" Text="Traslacion Urbano" CssClass="btn btn-success" Width="100%" CommandName="Traslacion_Urbano" CommandArgument="2" OnCommand="Botones_Tramites"/>
                                    </div>
                                    <div class="col-lg-offset-2 col-lg-8">
                                        <br />
                                        <asp:Button ID="Subdivision_Urbano_Button" runat="server" Text="Subdivision Urbano" CssClass="btn btn-success" Width="100%" CommandName="Subdivision_Urbano" CommandArgument="3" OnCommand="Botones_Tramites"/>
                                    </div>
                                    <div class="col-lg-offset-2 col-lg-8">
                                        <br />
                                        <asp:Button ID="Fusion_Urbano_Button" runat="server" Text="Fusion Urbano" CssClass="btn btn-success" Width="100%" CommandName="Fusion_Urbano" CommandArgument="4" OnCommand="Botones_Tramites"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3>
                                        <asp:Label ID="Label3" runat="server" Text="Tramites Rurales"></asp:Label></h3>
                                </div>
                                <div class="panel-body">
                                    <div class="col-lg-offset-2 col-lg-8">
                                        <asp:Button ID="Rectificacion_Rural_Button" runat="server" Text="Rectificacion Rural" CssClass="btn btn-primary" Width="100%" CommandName="Rectificacion_Rural" CommandArgument="5" OnCommand="Botones_Tramites"/>
                                    </div>
                                    <div class="col-lg-offset-2 col-lg-8">
                                        <br />
                                        <asp:Button ID="Traslacion_Rural_Button" runat="server" Text="Traslacion Rural" CssClass="btn btn-primary" Width="100%" CommandName="Traslacion_Rural" CommandArgument="6" OnCommand="Botones_Tramites"/>
                                    </div>
                                    <div class="col-lg-offset-2 col-lg-8">
                                        <br />
                                        <asp:Button ID="Subdivision_Rural_Button" runat="server" Text="Subdivision Rural" CssClass="btn btn-primary" Width="100%" CommandName="Subdivision_Rural" CommandArgument="7" OnCommand="Botones_Tramites"/>
                                    </div>
                                    <div class="col-lg-offset-2 col-lg-8">
                                        <br />
                                        <asp:Button ID="Fusion_Rural_Button" runat="server" Text="Fusion Rural" CssClass="btn btn-primary" Width="100%" CommandName="Fusion_Rural" CommandArgument="8" OnCommand="Botones_Tramites"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row col-lg-12">
                    <br />
                    <div class="col-lg-offset-2 col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>
                                    <asp:Label ID="Label4" runat="server" Text="Tramite Lotificacion"></asp:Label></h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-lg-offset-3 col-lg-6">
                                    <asp:Button ID="Lotificacion_Button" runat="server" Text="Lotificacion" CssClass="btn btn-info" Width="100%" CommandName="Lotificacion" CommandArgument="9" OnCommand="Botones_Tramites"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>

