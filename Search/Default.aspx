<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Search._1s" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Content/bootstrap.css"/>
    <link rel="stylesheet" href="Content/themes/base/jquery-ui.css"/>
   
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div>
          
            <div class="ui-widget ">
              <label for="Search" class="form-label">Search : </label>
              <input id="Search" class=""/>
              <input id="Search-id" type="hidden" class=""/>

            </div>
        </div>
    </form>
 
    <script src="Scripts/jquery-3.6.0.js"></script>
       <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script>
        $(document).ready( function () {
          
            $( "#Search" ).autocomplete({
              source: function(request, response ) {
                $.ajax( {
                  url: "/api/Bank/",
                  method: "POST",
                  contentType: "application/json",
                  dataType: "Json",
                  data: JSON.stringify({id:"",name: request.term }),
                    success: function (data) {
                        response(data);
                    }
                });
                },

                focus: function( event, ui ) {
                        $( "#Search" ).val( ui.item.name );
                        return false;
                },
                select: function( event, ui ) {
                    $( "#Search" ).val( ui.item.name );
                    $( "#Search-id" ).val( ui.item.id );
                    return false;
                },
                minLength: 1,
                select: function( event, ui ) {
                    console.log( "Selected: " + ui.item.name + " aka " + ui.item.id );
                }
            })
            .autocomplete( "instance" )._renderItem = function( ul, item ) {
                 return $( "<li>")
                .append( "<div>" + item.name + "</div>" )
                .appendTo( ul );
                };


        });
    </script>
</body>
</html>
