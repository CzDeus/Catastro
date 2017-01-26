<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NotFound.aspx.cs" Inherits="NotFound" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Not Found | 500 Error</title>

    <link href="/content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/content/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="/content/css/animate.css" rel="stylesheet" />
    <link href="/content/css/style.css" rel="stylesheet" />
</head>
<body class="gray-bg">

    <form id="form" runat="server">
        <div class="middle-box text-center animated fadeInDown">
            <h1>500</h1>
            <h3 class="font-bold">Internal Server Error</h3>

            <div class="error-desc">
                El servidor encontró algo inesperado que no permite que se complete la solicitud. Pedimos disculpas. 
                Puede volver a la página principal:
                <br />
                <a href="Login.aspx" class="btn btn-primary m-t">Regresar</a>
            </div>
        </div>
    </form>


    <!-- Mainly scripts -->
    <script src="/content/js/jquery-2.1.1.js"></script>
    <script src="/content/js/bootstrap.min.js"></script>

</body>
</html>
