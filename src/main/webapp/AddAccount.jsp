<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Accountc/ Update Account</title>
<style type="text/css">
body{
font-family:"Poppins", sans-serif;
display:flex;

background-color:#f7f7f7;
justify-content:center;
align-item: center;
height: 100vh;
}
.form-container {
    background-color: white;
    padding: 30px 40px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    width: 400px;
    text-align: center;
}
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 15px;
}
button {
    width: 100%;
    background-color: #5A47F0;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 25px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}
</style>
</head>
<body>
<div>
<h2>Add Account</h2>
<form action="SaveAccount.jsp" method="post">
<input type="text" name="CardName" placeholder="Card Name" required>
<input type="text" name="CardNumber" placeholder="Card Number" required>
<input type="text" name="CardHolderName" placeholder="Card Holder Name" required>
<input type="text" name="CVV" placeholder="CVV" maxlength="4" required>
<input type="date" name="ExpiryDate"  required>
<input type="number" step="0.01" name="Balance" placeholder="Initial Balance" required>
<button type="submit">Save Button</button>

</form>
 <a href="AccountManagement.jsp">← Back to Dashboard</a>

</div>

</body>
</html>