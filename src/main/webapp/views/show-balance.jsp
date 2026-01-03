<h2>Account Balance</h2>

<p>Account Number:${user.accountNumber}</p>
<p>Username:${user.username}</p>
<p>Balance:${user.balance}</p>
	<form action="/bank/dashboard" method="get">
	    <input type="hidden" name="accountNumber" value="${user.accountNumber}" />
	    <button type="submit">Back to Dashboard</button>
	</form>
