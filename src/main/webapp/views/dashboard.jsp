<h2>Welcome, ${user.username}</h2>
<p>Your Account Number: ${user.accountNumber}</p>

<h3>Choose an Action</h3>

<form action="/bank/showBalance" method="post">
    <button type="submit">Show Balance</button>
</form>

<form action="/bank/transfer" method="get">
    <button type="submit">Transfer Money</button>
</form>

<form action="/bank/deleteAccount" method="post">
    <button type="submit">Delete Account</button>
</form>

<form action="/bank/deposit" method="get">
    <button type="submit">Deposit Money</button>
</form>
