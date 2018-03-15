<!DOCTYPE html>
<html lang="en">
<head>
<title>Artisans</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Ncore categories_styles">
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

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li class="active"><a href="index.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i>Products</a></li>
					</ul>
				</div>

				<!-- Sidebar -->

				<div class="sidebar">
					<div class="sidebar_section">
						<div class="sidebar_title">
							<h5>Product Category</h5>
						</div>
						<ul class="sidebar_categories">
							<%
								Statement stmt = con.createStatement();
								String cat = request.getParameter("category"); //the category of artisans requested
								String s = "Select * from productcategories";
								ResultSet rs = stmt.executeQuery(s);
								String pp = "";

								while(rs.next()){
									pp = rs.getString("CategoryName");
									if(pp.equals(cat)){
										out.println("<li class='active'><a href='artisans.jsp?category="+ pp + "'><span><i class='fa fa-angle-double-right' aria-hidden='true'></i></span>"+pp+"</a></li>");
									}
									else out.println("<li><a href='artisans.jsp?category="+ pp + "'>"+ pp + "</a></li>");
								}
								
							%>
						</ul>
					</div>

				</div>

				<!-- Main Content -->

				<div class="main_content">

					<!-- Products -->

					<div class="products_iso">
						<div class="row">
							<div class="col">

								<!-- Casousel -->
								<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
								  <ol class="carousel-indicators">
								    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
								    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								  </ol>
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img class="d-block w-100" src="images/<%out.println(cat);%>_slider_1.jpg" alt="First slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="images/<%out.println(cat);%>_slider_2.jpg" alt="Second slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="images/<%out.println(cat);%>_slider_3.jpg" alt="Third slide">
								    </div>
								  </div>
								  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </a>
								</div>
								<br><br>


								<!-- Product Sorting -->
								<div class="sidebar_title">
									<h5><%if(cat!=null)out.println(cat);%> Artisans</h5>
								</div>

								<div class="product-grid">

									<%
										//prints the list of artisans
										int count = 0;
										String s2 = "SELECT DISTINCT a.ArtisanFirstName, a.ArtisanLastName, pc.CategoryName FROM products_static AS p, artisanskill AS ask, productcategories as pc, artisan AS a WHERE p.ProductCategoryID = pc.CategoryID AND p.ProductID = ask.ProductID AND ask.ArtisanID = a.ArtisanID";
										if(cat!=null){
											s2 += " AND pc.CategoryName = '" + cat + "'";
										}
										ResultSet rs2 = stmt.executeQuery(s2);
										ResultSetMetaData rsmd=rs2.getMetaData();  
										String fname = "";
										String lname = "";
										String category = "";
										while(rs2.next()){
											count += 1;
											fname = rs2.getString("ArtisanFirstName");
											lname = rs2.getString("ArtisanLastName");
											category = rs2.getString("CategoryName");
											out.println("<div class='product-item men'><div class='product discount product_filter'><div class='favorite favorite_left'></div><div class='product_info'><h4 class='product_name'><a href=#>" + fname + " " + lname + "</a><h6>"+ category +"</h6></h4><div class='product_price' style='color:#fe4c50'>"+((int)(Math.random()*5)+1)+"&#x2605;</div></div></div><div class='red_button add_to_cart_button'><a href='#'>View Profile</a></div></div>");
										}

									%>

								</div>

								<!-- Product Sorting -->

								<div class="product_sorting_container product_sorting_container_bottom clearfix">
									<%
										out.println("<span class='showing_results'>"+ count + " artisans found.</span>");
									%>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="benefit.jsp"%>
	<%@include file="footer.jsp"%>

</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="js/categories_custom.js"></script>
</body>

</html>
