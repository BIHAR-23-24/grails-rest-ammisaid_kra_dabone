<!DOCTYPE html>
<html lang="en">

<head>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <title>Sign in</title>
</head>

<style>
body {
     background-color: #87CEEB; /* Remplacer par le bleu ciel */
     font-family: 'Ubuntu', sans-serif;
 }
.background-img {
    position: fixed; /* Fixed position to cover the entire viewport */
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -1;
}
.main {
    background-color: #FFFFFF;
    width: 400px;
    height: 400px;
    margin: 7em auto;
    border-radius: 1.5em;
    box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
}

.sign {
    padding-top: 40px;
    color: #87CEEB; /* Remplacer par le bleu ciel */
    font-family: 'Ubuntu', sans-serif;
    font-weight: bold;
    font-size: 23px;
}

.un {
    width: 76%;
    color: #4A90E2; /* Remplacer par une nuance de bleu ciel */
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
}

.pass {
    width: 76%;
    color: #4A90E2; /* Remplacer par une nuance de bleu ciel */
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
}

.un:focus,
.pass:focus {
    border: 2px solid rgba(0, 0, 0, 0.18) !important;
}

.submit {
    cursor: pointer;
    border-radius: 5em;
    color: #fff;
    background: linear-gradient(to right, #87CEEB, #4682B4); /* Dégradé de bleu ciel */
    border: 0;
    padding-left: 40px;
    padding-right: 40px;
    padding-bottom: 10px;
    padding-top: 10px;
    font-family: 'Ubuntu', sans-serif;
    margin-left: 35%;
    font-size: 13px;
    box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
}

.forgot {
    text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
    color: #bec0e7;
    padding-top: 15px;
}

a {
    text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
    color: #bec7e7;
    text-decoration: none
}

@media (max-width: 600px) {
    .main {
        border-radius: 0px;
    }
}
</style>

<body>
<img class="background-img" src="${resource(dir: 'images', file: 'medical-4510408_1920.png')}" alt="Background Image">

<div class="main">
    <p class="sign" align="center">Sign in</p>
    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm"  autocomplete="off" class="form1">
        <input class="un" type="text" align="center" name="${usernameParameter ?: 'username'}" id="username" placeholder="Username" required>
        <input class="pass" type="password" align="center" name="${passwordParameter ?: 'password'}" id="password" required placeholder="Password">

        <input class="submit" type="submit" align="center" value="${message(code: 'springSecurity.login.button')}">
        <p class="forgot" align="center">
            <a href="#"/>
            Forgot Password?
        </p>
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

