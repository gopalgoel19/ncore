<%@ page import="java.util.Calendar" %>
<%@include file="connect.jsp"%>
<%
    String context = request.getParameter("context");
    String insertQuery = "INSERT INTO orders (`OrderUserID`, `OrderAmount`, `OrderShipName`, `OrderShipAddress`, `OrderShipAddress2`, `OrderCity`, `OrderState`, `OrderZip`, `OrderCountry`, `OrderPhone`, `OrderEmail`, `OrderShipping`, `OrderTax`, `OrderShipDate`, `OrderTrackingID`, `RequiredDate`, `OrderActive`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement pstatement = con.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS);
    pstatement.setString(1, "1");pstatement.setString(2, "0");
    pstatement.setString(3, context);
    
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

    String ORDERID = "54";

    /*pstatement.executeUpdate();

    // now get the ID:
    ResultSet rs = pstatement.getGeneratedKeys();
    if (rs.next()) {
        ORDERID = rs.getString(1);
    }*/
    out.println(ORDERID);
%>
