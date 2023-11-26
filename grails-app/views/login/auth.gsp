<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>

    #username,#password{
        width:100%;
    }
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 550px;
    }
    #login_checkbox{

    }
    #login {
        width: 340px;
        background-color:azure;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    #login .header {
        padding: 20px;
        background-color: #3498db;
        color: #fff;
        text-align: center;
        font-size: 24px;
    }

    #login form {
        padding: 20px;
    }

    #login label {
        display: block;
        margin-bottom: 8px;
        color: #333;
    }

    #login input {
        padding: 10px;
        margin-bottom: 15px;
        box-sizing: border-box;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    #login input[type="submit"] {
        background-color: #3498db;
        color: #fff;
        cursor: pointer;
    }

    #login input[type="submit"]:hover {
        background-color: #2980b9;
    }

    #login .message {
        text-align: center;
        color: #c33;
        margin-top: 10px;
    }
    </style>
</head>
<body>

<div id="login">
    <div class="header">Login</div>

    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm"  autocomplete="off">
        <label for="username">Username:</label>
        <input type="text" name="${usernameParameter ?: 'username'}" id="username" required>

        <label for="password">Password:</label>
        <input  type="password" name="${passwordParameter ?: 'password'}" id="password" required>

        <label id="login_checkbox" for="remember_me">
            <input type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me">
            Remember me
        </label>

        <input type="submit" value="${message(code: 'springSecurity.login.button')}">
    </form>

    <div class="message">
        <g:if test='${flash.message}'>${flash.message}</g:if>
    </div>
</div>

<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>

</body>
</html>
