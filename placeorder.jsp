<!DOCTYPE html>
<html lang="en">
<head>
<title>Single Product</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="NCore Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="styles/single_styles.css">
<link rel="stylesheet" type="text/css" href="styles/single_responsive.css">
<link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
</head>
<%@include file="connect.jsp"%>
<body>

<div class="super_container">

	<%@include file="header.jsp"%>
    <%@ page import = "java.util.Map" %>
    <%@ page import="java.util.Calendar" %>
	<div class="container single_product_container">
		<%
			String quantity = request.getParameter("quantity");
            String pname = request.getParameter("pname");
            String price = request.getParameter("price");
			String productId = request.getParameter("productId");
            String color = request.getParameter("color");
            String allocation = request.getParameter("allocation");
		%>
        <%
            String insertQuery = "INSERT INTO orders (`OrderUserID`, `OrderAmount`, `OrderShipName`, `OrderShipAddress`, `OrderShipAddress2`, `OrderCity`, `OrderState`, `OrderZip`, `OrderCountry`, `OrderPhone`, `OrderEmail`, `OrderShipping`, `OrderTax`, `OrderShipDate`, `OrderTrackingID`, `RequiredDate`, `OrderActive`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstatement = con.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS);
            pstatement.setString(1, "1");pstatement.setString(2, price);
            pstatement.setString(3, pname);
            
            pstatement.setString(4, "");
            pstatement.setString(5, "");pstatement.setString(6, "");
            pstatement.setString(7, "");pstatement.setString(8, "");
            pstatement.setString(9, "");pstatement.setString(10, "");
            pstatement.setString(11, "");pstatement.setInt(12, 0);
            pstatement.setString(13, "0");

            Calendar calendar = Calendar.getInstance();
            Timestamp currTime = new Timestamp(calendar.getTime().getTime());

            pstatement.setTimestamp(14, currTime);
            pstatement.setInt(15, 0);pstatement.setTimestamp(16, currTime);
            pstatement.setInt(17, 0);

            String ORDERID = "0";

            pstatement.executeUpdate();

            // now get the ID:
            ResultSet rs = pstatement.getGeneratedKeys();
            if (rs.next()) {
                ORDERID = rs.getString(1);
            }
        %>
        <div class="container">
        <br><br>
		    <button id="payment" type="submit" class="red_button message_submit_btn trans_300" >Proceed to Payment</button>
            <br><br>
            <h3 id="orderID">Order placed with order id : <%= ORDERID %></h3>
        <div>
	</div>
	<%@include file="benefit.jsp"%>
	<%@include file="footer.jsp"%>

</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#orderID').hide();
        $('#payment').click(function(){
            $('#payment').hide();
            $('#orderID').show();
            $('payment').prop('disabled', true);
        })
    });
</script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="js/single_custom.js"></script>
</body>

</html>