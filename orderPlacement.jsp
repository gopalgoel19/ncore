<!DOCTYPE html>
<html lang="en">
<head>
<title>Products</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="styles/categories_styles.css">
<link rel="stylesheet" type="text/css" href="styles/categories_responsive.css">
</head>
<%@include file="connect.jsp"%>
<body>

<div class="super_container">

	<%@include file="header.jsp"%>

	<div class="container product_section_container">
		<div class="row">
			<div class="col product_section clearfix">

                ORDER
                

                <%
                    String artFName = request.getParameter("artisanFirstName");
					String artLName = request.getParameter("artisanLastName"); 
                    String productId = request.getParameter("productId");
                    boolean allocationNeeded = false;
                    if(artFName.equals("null") && artLName.equals("null")){
                        allocationNeeded = true;
                    }
                    String context = artFName+artLName+productId;
                    if(allocationNeeded){
                        context = productId;
                        out.println("<div>We will allocated a good person for your product</div>");
                    }
                %>
                <button id='insertOrders' value='<%= context %>'>Click to place order</button>
			</div>
		</div>
	</div>
	<%@include file="benefit.jsp"%>
	<%@include file="footer.jsp"%>

</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    function insertIntoOrders(context) {
        console.log('yolo');
        
    }
    $(document).ready(function() {
            $('#insertOrders').click(function ()
            {
                var context = $('#insertOrders').val();
                console.log(context);
                $.get("insertIntoOrders.jsp?context="+context, function( data ) {
                    alert(data);
                });
            });
        });
</script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="js/categories_custom.js"></script>
</body>

</html>
