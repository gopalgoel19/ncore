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
<link rel="stylesheet" type="text/css" href="styles/single_artisans_style.css">
<link rel="stylesheet" type="text/css" href="styles/single_responsive.css">
</head>
<%@include file="connect.jsp"%>
<body>

<div class="super_container">

	<%@include file="header.jsp"%>

	<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="products.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i>Products</a></li>
						<li class="active"><a href="single.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i>Single Product</a></li>
					</ul>
				</div>

			</div>
		</div>

		<%
			Statement stmt = con.createStatement();
			String pid = request.getParameter("productId"); //product id
			String type = request.getParameter("type");
			String s = "SELECT * FROM products_static WHERE ProductId = " + pid ; //Query string
			ResultSet rs = stmt.executeQuery(s);
			String pName = "";
			String pPrice = "";
			String pDesc = "";
			while(rs.next()){
				pName = rs.getString("ProductName");
				pPrice = rs.getString("ProductPrice");
				pDesc = rs.getString("ProductLongDescription");
			}
			rs.close();
		%>

		<div class="row">
			<div class="col-lg-7">
				<div class="single_product_pics">
					<div class="row">
						<!-- <div class="col-lg-3 thumbnails_col order-lg-1 order-2">
							<div class="single_product_thumbnails">
								<ul>
									<li><img src='<% out.println("images/product_" + pid + ".jpg"); %>' alt="" data-image='<% out.println("images/product_" + pid + ".jpg"); %>'></li>
									<li class="active"><img src='<% out.println("images/product_" + pid + ".jpg"); %>' alt="" data-image='<% out.println("images/product_" + pid + ".jpg"); %>'></li>
									<li>
										<img src='<% out.println("images/product_" + pid + ".jpg"); %>' alt="" 
											data-image='<% out.println("images/product_" + pid + ".jpg"); %>'>
									</li>
								</ul>
							</div>
						</div> -->
						<div class="col-lg-9 image_col order-lg-2 order-1">
							<div class="single_product_image">
								<!-- <div class="single_product_image_background" style="background-image:url(images/single_2.jpg)"></div> -->
								<div class="single_product_image_background" style='background-image:url(<% out.println("images/product_" + pid + ".jpg"); %>)'></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="product_details">
					<div class="product_details_title">
						<h2><% out.println(pName); %></h2>
						<p><% out.println(pDesc); %></p>
					</div>
					<div class="free_delivery d-flex flex-row align-items-center justify-content-center">
						<span class="ti-truck"></span><span>On time delivery</span>
					</div>
					<div class="original_price"></div>
					<div class="product_price">Rs. <% out.println(pPrice); %></div>
					<ul class="star_rating">
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
					</ul>
					<% // shows the color option only if the 'type' key has a value 'customized'
						if(type!=null && type.equals("customized")){
							out.println("<div class='product_color'><span>Select Color:</span><ul><li style='background: #e54e5d' id='option1'></li><li style='background: #252525' id='option2'></li><li style='background: #60b3f3' id='option3'></li></ul></div>");
						}
					%>
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						<span>Quantity:</span>
						<div class="quantity_selector">
							<span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>
							<span id="quantity_value">1</span>
							<span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
						</div>
						<div id="placeOrderButton" class="red_button add_to_cart_button"><a id="link" href="orderDescription.jsp?quantity=1&productId=<%= pid %>">Proceed to Cart</a></div>
					</div>
					<br>
				</div>
			</div>
		</div>
		<br><br><hr><br>
		<h3>Artisans</h3>

		<!-- Product Grid -->
		<div class="product-grid" style="margin-top: 0px;">

			<%
				//prints the list of artisans
				Statement stmt2 = con.createStatement();
				s = "SELECT A.ArtisanFirstName,A.ArtisanLastName FROM artisan as A,artisanskill as ASS WHERE ASS.ProductID = " + pid + " AND A.ArtisanID = ASS.ArtisanID"; //Query string
				ResultSet rss = stmt2.executeQuery(s);
				String fname = "";
				String lname = "";
				while(rss.next()){
					fname = rss.getString("ArtisanFirstName");
					lname = rss.getString("ArtisanLastName");
					out.println("<div class='product-item men'><div class='product discount product_filter'><div class='product_info'><div class='artisan-list'><h5 class='product_name'><a href=''>" + fname + " " + lname + "</a></h5></div><div class='artisan-list'><div class='product_price' style='margin-top: 25px;color:#fe4c50'>"+ ((int)(Math.random()*5)+1) +" &#x2605;</div></div></div></div></div>");
				}
			%>

		</div>

	</div>
	<%@include file="benefit.jsp"%>
	<%@include file="footer.jsp"%>

</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
			var quatity = 1;
			var url_string = window.location.href;
			var url = new URL(url_string);
			var productId = url.searchParams.get("productId");
			console.log(productId);
			// we will have other stuff
			var plus = $('.plus');
			var minus = $('.minus');
			var value = $('#quantity_value');
			var image = $('.single_product_image_background');
			var color = "null";
			function newLink(){
				console.log('call kiya bro');
				quantity = parseInt(value.text());
				var link = "orderDescription.jsp?quantity=" + quantity + "&productId=" + productId + "&color=" + color;
				$("#link").attr("href", link);
			}

			plus.on('click', function(){
				var x = parseInt(value.text());
				value.text(x + 1);
				newLink();
			});

			minus.on('click', function(){
				var x = parseInt(value.text());
				if(x > 1)
				{
					value.text(x - 1);
					newLink();
				}
			});
			// mogrify -resize 320x240! *.jpg
			// mogrify -format jpg *.png
			$('#option1').on('click', function(){
				image.css("background-image", "url('images/customized/"+productId+"_red.jpg')");
				color = "red";
				newLink();
			});

			$('#option2').on('click', function(){
				image.css("background-image", "url('images/customized/"+productId+"_black.jpg')");
				color = "black";
				newLink();
			});
			
			$('#option3').on('click', function(){
				image.css("background-image", "url('images/customized/"+productId+"_blue.jpg')");
				color = "blue";
				newLink();
			});
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