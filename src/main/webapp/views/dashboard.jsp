<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background-color:#f4f6f9;
}

.dashboard-card{
    max-width:800px;
    margin:auto;
    margin-top:50px;
    border-radius:15px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.15);
}
</style>

</head>
<body>

<div class="container">

    <div class="card dashboard-card">

        <div class="card-header bg-dark text-white text-center">
            <h2>Banking Dashboard</h2>
        </div>

        <div class="card-body">

            <h3>Welcome, ${user.username}</h3>

            <p class="fs-5">
                <strong>Account Number:</strong>
                ${user.accountNumber}
            </p>

            <hr>

            <div class="row g-3">

                <div class="col-md-6">
                    <form action="/bank/showBalance" method="post">
                        <button class="btn btn-primary w-100">
                            Show Balance
                        </button>
                    </form>
                </div>

                <div class="col-md-6">
                    <form action="/bank/deposit" method="get">
                        <button class="btn btn-success w-100">
                            Deposit Money
                        </button>
                    </form>
                </div>

                <div class="col-md-6">
                    <form action="/bank/transfer" method="get">
                        <button class="btn btn-warning w-100">
                            Transfer Money
                        </button>
                    </form>
                </div>

                <div class="col-md-6">
                    <form action="/bank/deleteAccount" method="post">
                        <button class="btn btn-danger w-100">
                            Delete Account
                        </button>
                    </form>
                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>