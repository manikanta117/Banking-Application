<form action="SaveCard.jsp" method="post">
    <div class="container">
        <h2>Add Card Details</h2>

        <div class="input-group">
            <label>User ID:</label>
            <input type="text" name="UserID" required>
        </div>

        <div class="input-group">
            <label>Card Name:</label>
            <input type="text" name="CardName" required>
        </div>

        <div class="input-group">
            <label>Card Number:</label>
            <input type="text" name="CardNumber" required>
        </div>

        <div class="input-group">
            <label>Card Holder Name:</label>
            <input type="text" name="CardHolderName" required>
        </div>

        <div class="input-group">
            <label>CVV:</label>
            <input type="text" name="CVV" maxlength="4" required>
        </div>

        <div class="input-group">
            <label>Expiry Date:</label>
            <input type="month" name="ExpiryDate" required>
        </div>

        <div class="input-group">
            <label>Balance:</label>
            <input type="number" name="Balance" step="0.01" min="0" placeholder="Enter account balance" required>
        </div>

        <button type="submit">Save</button>
    </div>
</form>
