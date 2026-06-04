<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body{
        background-color:#f4f6f9;
    }

    .register-card{
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
    <div class="card register-card">
        <div class="card-header text-center bg-primary text-white">
            <h3>Create Account</h3>
        </div>

        <div class="card-body">

            <form action="/bank/register" method="post">

                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text"
                           class="form-control"
                           name="username"
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
                    <button type="submit" class="btn btn-primary">
                        Register
                    </button>
                </div>

            </form>

        </div>
    </div>
</div>

</body>
</html>