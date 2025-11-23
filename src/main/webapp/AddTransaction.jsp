<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Transaction</title>
<style>
body {
  font-family: 'Poppins', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f7f7f7;
  margin: 0;
}

.container {
  width: 400px;
  background-color: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

h2 {
  text-align: center;
  margin-bottom: 20px;
}

.input-group {
  margin-bottom: 15px;
}

label {
  display: block;
  font-weight: 500;
  margin-bottom: 5px;
}

input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}

button {
  width: 100%;
  padding: 10px;
  background-color: #5A47F0;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  cursor: pointer;
}

button:hover {
  background-color: #4532d1;
}
</style>
</head>
<body>

<form action="SaveTransaction.jsp" method="post">
  <div class="container">
    <h2>Add Transaction</h2>

    <div class="input-group">
      <label>User ID:</label>
      <input type="text" name="UserID" required>
    </div>

    <div class="input-group">
      <label>Item:</label>
      <input type="text" name="Item" required>
    </div>

    <div class="input-group">
      <label>Goal:</label>
      <input type="text" name="Goal">
    </div>

    <div class="input-group">
      <label>Account Name:</label>
      <input type="text" name="AccountName" required>
    </div>

    <div class="input-group">
      <label>Date of Payment:</label>
      <input type="date" name="DateOfPayment" required>
    </div>

    <div class="input-group">
      <label>Payment Type:</label>
      <input type="text" name="PaymentType" required>
    </div>

    <div class="input-group">
      <label>Amount:</label>
      <input type="number" name="Amount" step="0.01" required>
    </div>

    <button type="submit">Save Transaction</button>
  </div>
</form>

</body>
</html>
