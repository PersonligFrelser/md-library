<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/assets/css/materialize.css">
        <link rel="stylesheet" href="./assets/css/main.css">
        <link rel="stylesheet" href="./assets/css/login.css">

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>

    <main class="section">
        <div class="container">
            <div class="row">
                <div class="col offset-s4 s4 card login-box z-depth-3">
                    <div class="card-content center center-align">
                        <div class="row">
                            <div class="brand-logo col s12">
                                <a class="brand-logo">Library</a>
                            </div>
                        </div>
                        <div class="divider" style="padding: 0 !important;"></div>
                        <form action="./login.php" method="POST">
                            <div class="section">
                                <div class="row" style="margin-bottom: 0">
                                    <div class="col s12 input-field">
                                        <i class="material-icons prefix">account_circle</i>
                                        <input name="username" id="user_input" type="text" class="validate">
                                        <label for="user_input">Username</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col s12 input-field">
                                        <i class="material-icons prefix">lock</i>
                                        <input name="password" id="pw_input" type="password" class="validate">
                                        <label for="pw_input">Password</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s12">
                                    <a href="/" class="materialize-red-text right-align"><p>Forgotten password?</p></a>
                                </div>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col s12">
                                <button name="submit" type="submit" onclick="login()" class="waves-effect waves-light btn materialize-red login-button">
                                    <i class="material-icons right">exit_to_app</i>
                                    <p>Login</p>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card-action center-align register-section">
                        <p>Not registered? <a href="/" class="materialize-red-text register-section">Create an account!</a></p>
                    </div>
                </div>

            </div>
        </div>
    </main>

    <!-- JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            M.Carousel.init(document.querySelectorAll('.carousel'), {
                fullWidth: true
            });
        });
    </script>
    <script defer>
        {LOGIN_SCRIPT}
    </script>
    </body>
</html>