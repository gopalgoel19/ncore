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
</head>
<%@include file="connect.jsp"%>
<body>

<div class="super_container">

	<%@include file="header.jsp"%>
	<div class="container single_product_container">
		<%
			String quantity = request.getParameter("quantity");
			String productId = request.getParameter("productId");
			Statement stmt = con.createStatement();
			String query = "SELECT ProductName FROM products_static WHERE ProductId = " + productId ; //Query string
			ResultSet rs = stmt.executeQuery(query);
			String pName = "";
			while(rs.next()){
				pName = rs.getString("ProductName");
			}
			rs.close();
		%>
		<form action="placeorder.jsp" method="post">
			<div class="form-group">
				<label for="quantity">Quantity</label>
				<input class="form-control" type="text" name="quantity" id="quantity" value="<%= quantity%>" readonly>
			</div>
			<input type="hidden" name="productId" value="<%= productId%>">
			<div class="form-group">
				<label for="productId">Selected product</label>
				<input class="form-control" type="text" name="pName" id="pName" placeholder="<%= pName%>" value="<%= pName%>" readonly>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="allocation" id="allocation" value="0" checked>
				<label class="form-check-label" for="allocation">
					Let us choose Artisan Automatically for your product OR
				</label>
			</div>
			<%
				// we have productID
				Statement stmt2 = con.createStatement();
				String s = "SELECT A.ArtisanID,A.ArtisanFirstName,A.ArtisanLastName FROM artisan as A,artisanskill as ASS WHERE ASS.ProductID = " + productId + " AND A.ArtisanID = ASS.ArtisanID"; //Query string
				ResultSet rss = stmt2.executeQuery(s);
				String FirstName = "";String LastName = "";String ArtisanID = "";
				while(rss.next()){
					FirstName = rss.getString("ArtisanFirstName");
					LastName = rss.getString("ArtisanLastName");
					ArtisanID = rss.getString("ArtisanID");
					String html = "<div class='form-check'><input class='form-check-input' type='radio' name='allocation' id='allocation' value='"+ArtisanID+"'><label class='form-check-label' for='allocation'>"+FirstName+LastName+"</label></div>";
					//String html = "<div class='row'><input type='radio' name='allocation' value='"+ArtisanID+"'>"+FirstName+LastName+"</input></div>";
					out.println(html);
				}
			%>
			<button type="submit" class="btn btn-primary">Place order</button>
		</form>
	</div>
	<%@include file="benefit.jsp"%>
	<%@include file="footer.jsp"%>

</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
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