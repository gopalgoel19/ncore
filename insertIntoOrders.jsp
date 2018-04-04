<%@include file="connect.jsp"%>
<%!
    // order table me entry and orderId retrieval 
    public String orderTableEntry(String context){
        // we access things via public variables
        // a lot of bogus fields , so i will just 
        // insert ProductID into OrderShipName to store context and stuff
        // customerUserId = 1
        String insertQuery = "INSERT INTO orders (`OrderUserID`, `OrderAmount`, `OrderShipName`, `OrderShipAddress`, `OrderShipAddress2`, `OrderCity`, `OrderState`, `OrderZip`, `OrderCountry`, `OrderPhone`, `OrderEmail`, `OrderShipping`, `OrderTax`, `OrderShipDate`, `OrderTrackingID`, `RequiredDate`, `OrderActive`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstatement = con.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
        pstatement.setString(1, "1");
        pstatement.setString(3, "haha");
        pstatement.setString(14, "CURRENT_TIMESTAMP");
        pstatement.setString(16, "NULL");
        pstatement.executeUpdate();

        // now get the ID:
        ResultSet rs = pstatement.getGeneratedKeys();
        String ORDERID = "";
        if (rs.next()) {
            ORDERID = rs.getString(1);
        }
        return ORDERID;
    }
%>

<%
    String context = request.getParameter("context");
    String insertedOrderId = "cool hai";
    // insertedOrderId = orderTableEntry(context);
    out.println(insertedOrderId);
%>
