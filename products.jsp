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

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li class="active"><a href="products.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i>Products</a></li>
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
								String artFName = request.getParameter("artisanFirstName"); //the artisan first name whose products are requested
								String artLName = request.getParameter("artisanLastName"); //the artisans last name whose producst are requested
								String type = request.getParameter("type"); // customized or finished
								String s = "Select * from productcategories";

								ResultSet rs = stmt.executeQuery(s);
								String pp = "";
								while(rs.next()){
									pp = rs.getString("CategoryName");
									String reqURL = request.getRequestURL() + "?" + request.getQueryString();
									if(reqURL.indexOf("category") == -1){
										reqURL += "&category="+pp;
									}
									else{
										int index = reqURL.indexOf("category");
										reqURL = reqURL.substring(0,index-1);
										reqURL += "&category="+pp;
									}
									if(pp.equals(cat)){
										out.println("<li class='active'><a href='"+ reqURL +"'><span><i class='fa fa-angle-double-right' aria-hidden='true'></i></span>"+pp+"</a></li>");
									}
									else out.println("<li><a href='"+ reqURL + "'>"+ pp + "</a></li>");
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

								<%
									if(request.getQueryString()!=null && request.getQueryString().indexOf("artisanFirstName")!=-1){
										out.println("<br><div class='sidebar_title'><h5>"+ artFName + " " + artLName + " Products" + "</h5></div>");
									}
								%>

								<!-- Product Grid -->

								<div class="product-grid">

								<%
									//prints the list of products
										int count = 0;
										String s2 = "SELECT DISTINCT p.ProductID, p.ProductName, p.ProductPrice, pc.CategoryName FROM products_static AS p, artisanskill AS ask, productcategories as pc, artisan AS a WHERE p.ProductCategoryID = pc.CategoryID AND p.ProductID = ask.ProductID AND ask.ArtisanID = a.ArtisanID";
										if(cat!=null){
											s2 += " AND pc.CategoryName = '" + cat + "'";
										}
										if(artFName!=null){
											s2 += " AND a.ArtisanFirstName = '" + artFName + "'";
										}
										if(artLName!=null){
											s2 += " AND a.ArtisanLastName = '" + artLName + "'";
										}
										ResultSet rs2 = stmt.executeQuery(s2);
										ResultSetMetaData rsmd=rs2.getMetaData();
										String fname = "";
										String lname = "";  
										String productName = "";
										String productPrice = "";
										String category = "";
										String productID = "";
										while(rs2.next()){
											count += 1;
											//fname = rs2.getString("ArtisanFirstName");
											//lname = rs2.getString("ArtisanLastName");
											productName = rs2.getString("ProductName");
											productPrice = rs2.getString("ProductPrice");
											category = rs2.getString("CategoryName");
											productID = rs2.getString("ProductID");
											String orderLink = "single.jsp?type="+ type +"&productId="+productID+"&artisanFirstName="+artFName+"&artisanLastName="+artLName;
											out.println("<div class='product-item men'><div class='product discount product_filter'><div class='product_image'><a href='"+orderLink+"'><img src='images/product_"+ productID +".jpg' alt=''></a></div><div class='favorite favorite_left'></div><div class='product_info'><h6 class='product_name'><a href='"+orderLink+"'>" + productName + "</a></h6><div class='product_price' style='color:#fe4c50'>Rs. " + productPrice +"</div></div></div><div class='red_button add_to_cart_button'><a href='"+orderLink+"'>View Product</a></div></div>");
										}
								%>
								</div>

								<!-- Products count -->

								<div class="product_sorting_container product_sorting_container_bottom clearfix">
									<%
										out.println("<span class='showing_results'>"+ count + " products found.</span>");
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
