<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Money</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background-color:#f4f6f9;
}

.transfer-card{
    max-width:500px;
    margin:auto;
    margin-top:80px;
    border-radius:15px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.15);
}
</style>

</head>
<body>

<div class="container">

    <div class="card transfer-card">

        <div class="card-header bg-warning text-dark text-center">
            <h3>Transfer Money</h3>
        </div>

        <div class="card-body">

            <form action="/bank/transfer" method="post">

                <div class="mb-3">
                    <label class="form-label">Receiver Account Number</label>
                    <input type="number"
                           class="form-control"
                           name="reciverAccountNumber"
                           placeholder="Enter Receiver Account Number"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Amount</label>
                    <input type="number"
                           step="0.01"
                           min="1"
                           class="form-control"
                           name="amount"
                           placeholder="Enter Amount"
                           required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-warning">
                        Transfer Money
                    </button>
                </div>

            </form>

            <hr>

            <div class="text-center">
                <a href="/bank/dashboard" class="btn btn-secondary">
                    Back to Dashboard
                </a>
            </div>

        </div>

    </div>

</div>

</body>
</html>