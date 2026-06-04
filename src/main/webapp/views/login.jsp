<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body{
        background-color:#f4f6f9;
    }

    .login-card{
        max-width:450px;
        margin:auto;
        margin-top:100px;
        border-radius:15px;
        box-shadow:0px 4px 15px rgba(0,0,0,0.15);
    }
</style>
</head>

<body>

<div class="container">
    <div class="card login-card">

        <div class="card-header bg-success text-white text-center">
            <h3>Bank Login</h3>
        </div>

        <div class="card-body">

            <form action="/bank/login" method="post">

                <div class="mb-3">
                    <label class="form-label">Account Number</label>
                    <input type="text"
                           class="form-control"
                           name="accountNumber"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password"
                           class="form-control"
                           name="password"
                           required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-success">
                        Login
                    </button>
                </div>

            </form>

            <hr>

            <div class="text-center">
                <a href="/bank/register">
                    Create New Account
                </a>
            </div>

        </div>
    </div>
</div>

</body>
</html>