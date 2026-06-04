<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background-color:#f4f6f9;
}

.success-card{
    max-width:600px;
    margin:auto;
    margin-top:100px;
    border-radius:15px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.15);
}
</style>

</head>
<body>

<div class="container">

    <div class="card success-card">

        <div class="card-header bg-success text-white text-center">
            <h3>Success</h3>
        </div>

        <div class="card-body text-center">

            <div class="alert alert-success">
                <h4>${message}</h4>
            </div>

            <a href="/bank/login" class="btn btn-primary">
                Go To Login
            </a>

        </div>

    </div>

</div>

</body>
</html>