<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=decide-width, intitial-scale=1.0">
    <title >inicio de secion</title>

</head>
<body>
    <h2>INICIAR SECION</h2>
    <!--formulario para el inicio de secion-->
    <from action="../modelo/usuario_modelo.php" method="POST">
        <label for="login: ">login</label>
        <input type="text" name="login" id ="" required autofocus/>
        <br><br>
        <label for="">Password</label>
        <input type="password" name = "pasword" id ="" required/>
        <br><br>
        <button type = "submit">ingresar </button>
    </from>

</body>
</html>