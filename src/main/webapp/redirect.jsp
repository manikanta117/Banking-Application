<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <html>
        <head>
            <title>Login Failed</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    background-color: #f8f8f8;
                    margin: 0;
                }
                .message-box {
                    text-align: center;
                    padding: 30px;
                    background-color: white;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0,0,0,0.2);
                    width: 350px;
                }
                .error {
                    color: red;
                    font-size: 18px;
                    margin-bottom: 15px;
                }
                a {
                    color: #007BFF;
                    text-decoration: none;
                    font-weight: bold;
                }
                a:hover {
                    text-decoration: underline;
                }
            </style>
        </head>
        <body>
            <div class="message-box">
                <div class="error">Invalid username or password</div>
                <p>Don't have an account? <a href="Index.jsp">Create here</a></p>
            </div>
        </body>
        </html>



