<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/assets/css/materialize.css">
        <link rel="stylesheet" href="../assets/css/main.css">

        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
        <!-- Banner -->
        <header class="main-banner darken-1">
            <!-- Navigation -->
            {NAV}
            <!-- Search bar -->
            <section class="section z-depth-2 search-bar center materialize-red">
                <div class="container white-text">
                    <h4>Search books</h4>
                    <h6>Search for books, articles, journals and more</h6>
                    <form class="input-field" action="{SEARCH_PATH}">
                        <input name="q" type="text" class="white grey-text search-bar-text" placeholder="{SEARCH_PLACEHOLDER}">
                    </form>
                </div>
            </section>
        </header>

        <main>
            <!-- Photo carousel UD
            <section class="container section">
                <div class="carousel carousel-slider">
                    <div class="carousel-fixed-item center">
                        <a class="carousel-item" href="#"><img src="https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/3/2016/05/10105129/discount-codes-reach-more-people-eventbrite.png"></a>
                        <a class="carousel-item" href="#"><img src="https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/3/2016/05/10105129/discount-codes-reach-more-people-eventbrite.png"></a>
                        <a class="carousel-item" href="#"><img src="/assets/img/events/fix-laptop.jpg"></a>
                    </div>
                </div>
            </section> -->
            <!-- Cards (?) -->
            <section class="container section section-icon center">
                <div class="row">
                    <div class="col s12 m4">
                        <div class="card-panel">
                            <i class="material-icons large materialize-red-text">send</i>
                            <h4>Card Title</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus congue non nisl quis eleifend. Aenean imperdiet pellentesque ornare.</p>
                        </div>
                    </div>
                    <div class="col s12 m4">
                        <div class="card-panel">
                            <i class="material-icons large materialize-red-text">send</i>
                            <h4>Card Title</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus congue non nisl quis eleifend. Aenean imperdiet pellentesque ornare.</p>
                        </div>
                    </div>
                    <div class="col s12 m4">
                        <div class="card-panel">
                            <i class="material-icons large materialize-red-text">send</i>
                            <h4>Card Title</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus congue non nisl quis eleifend. Aenean imperdiet pellentesque ornare.</p>
                        </div>
                    </div>

                </div>
            </section>

            <!-- Email collector -->
            <section class="section center grey darken-4">
                <div class="container">
                    <div class="row">
                        <div class="col s12" style="margin-bottom:15px !important;">
                            <h4 class="title white-text">Electronic Mail</h4>
                            <h6 class="left-align white-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus congue non nisl quis eleifend. Aenean imperdiet pellentesque ornare. Curabitur ac lorem tincidunt eros mollis venenatis.
                                Mauris dictum metus vel ex ornare volutpat. Ut finibus varius posuere. Etiam dictum ut ipsum faucibus congue. Phasellus porttitor tincidunt risus, vitae dapibus lacus. Pellentesque.</h6>
                        </div>
                        <section>
                            <div class="col s10 email-collector">
                                <input id="email-input" type="text" class="white grey-text search-bar-text input-field email-collector" placeholder="{EMAIL_COL_PLACEHOLDER}">
                            </div>
                            <div class="col s2">
                                <button class="btn waves-effect waves-light align-with-input materialize-red" onclick="subscribeNewsletter()" type="submit" name="action">Subscribe
                                    <i class="material-icons right">send</i>
                                </button>
                            </div>
                        </section>
                    </div>
                </div>
            </section>

            <!-- Events (?) -->
            <div class="container section">
                <div class="row">
                    <!-- <h3 class="title center-align materialize-red-text">Events</h3> -->
                    <!-- Left card image -->
                    <section class="col s4 left">
                        <div class="card">
                            <div class="card-image">
                                <img src="../assets/img/events/fix-laptop.jpg">
                                <span class="card-title">Drop-in Computer Help</span>
                                <div class="card-content">
                                    <p>Do you need quick help with a computer problem? Confused as to how to download e-books on your new smartphone or tablet?
                                        Stop into the Riverdale Branch Monday through Friday at 12 PM and someone will be available to help you. First come, first served.
                                        <br>*Smartphone and tablet users should know device password in order to download apps.
                                        <br>**Kindle users should know their Amazon account username (e-mail address associated with your account) and password.
                                    </p>
                                </div>
                                <div class="card-action">
                                    <a href="#">More Info</a>
                                    <div class="right">
                                        <a href="#" class="disabled right">Other Events</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Middle card image -->
                    <section class="col s4 left">
                        <div class="card">
                            <div class="card-image">
                                <img src="../assets/img/events/fix-laptop.jpg">
                                <span class="card-title">Drop-in Computer Help</span>
                                <div class="card-content">
                                    <p>Do you need quick help with a computer problem? Confused as to how to download e-books on your new smartphone or tablet?
                                        Stop into the Riverdale Branch Monday through Friday at 12 PM and someone will be available to help you. First come, first served.
                                        <br>*Smartphone and tablet users should know device password in order to download apps.
                                        <br>**Kindle users should know their Amazon account username (e-mail address associated with your account) and password.
                                    </p>
                                </div>
                                <div class="card-action">
                                    <a href="#">More Info</a>
                                    <div class="right">
                                        <a href="#" class="disabled right">Other Events</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Right card image -->
                    <section class="col s4 right">
                        <div class="card">
                            <div class="card-image">
                                <img src="../assets/img/events/fix-laptop.jpg">
                                <span class="card-title">Drop-in Computer Help</span>
                                <div class="card-content">
                                    <p>Do you need quick help with a computer problem? Confused as to how to download e-books on your new smartphone or tablet?
                                        Stop into the Riverdale Branch Monday through Friday at 12 PM and someone will be available to help you. First come, first served.
                                        <br>*Smartphone and tablet users should know device password in order to download apps.
                                        <br>**Kindle users should know their Amazon account username (e-mail address associated with your account) and password.
                                    </p>
                                </div>
                                <div class="card-action">
                                    <a href="#">More Info</a>
                                    <div class="right">
                                        <a href="#" class="disabled right">Other Events</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </main>

        <!-- Footer -->
        {FOOTER}

        <!-- JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../assets/js/subscribe.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                M.Carousel.init(document.querySelectorAll('.carousel'), {
                    fullWidth: true
                });
                M.Dropdown.init(document.querySelectorAll('.dropdown-trigger'), {
                    hover: true,
                    constrainWidth: false
                });
                var nav = document.getElementsByClassName("black")[0];
                nav.classList.remove("black");
                nav.classList.add("transparent");
            });
        </script>
    </body>
</html>