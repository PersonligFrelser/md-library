<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/assets/css/md-nouislider.css">
        <link rel="stylesheet" href="/assets/css/materialize.css">
        <link rel="stylesheet" href="assets/css/main.css">

        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <header>
            {NAV}
        </header>

        <main class="container">
            <div class="row">
                <!-- Left spec section -->
                <section class="col s3">
                    <div class="card-panel center">
                        <span style="font-size: 20px">{TOTAL_BOOKS_FOUND}</span>
                    </div>
                    <!-- Language checkboxes -->
                    <ul class="collection with-header">
                        <li class="collection-header"><h6>Language</h6></li>
                        <li class="collection-item">
                            <form action="#">
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>English (Intl)</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>English</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>Norwegian</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>French</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>Spanish</span>
                                    </label>
                                </p>
                            </form>
                        </li>
                    </ul>

                    <!-- Release year slider -->
                    <ul class="collection with-header">
                        <li class="collection-header"><h6>Release Year (1997 - 2009)</h6></li>
                        <li class="collection-item">
                            <div class="section">
                                <div id="rel-year-range"></div>
                            </div>
                        </li>
                    </ul>

                    <!-- Release year checkboxes -->
                    <ul class="collection with-header">
                        <li class="collection-header"><h6>Library</h6></li>
                        <li class="collection-item">
                            <form action="#">
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>Library of Science</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>Library of History</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>Library of Literature</span>
                                    </label>
                                </p>
                            </form>
                        </li>
                    </ul>

                    <!-- Release year checkboxes -->
                    <ul class="collection with-header">
                        <li class="collection-header"><h6>Cover</h6></li>
                        <li class="collection-item">
                            <form action="#">
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>Hardback</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input type="checkbox" class="filled-in">
                                        <span>Paperback</span>
                                    </label>
                                </p>
                            </form>
                        </li>
                    </ul>

                    <!-- Page range slider -->
                    <ul class="collection with-header">
                        <li class="collection-header"><h6>Pages (30 - 400)</h6></li>
                        <li class="collection-item">
                            <div class="section">
                                <div id="page-range"></div>
                            </div>
                        </li>
                    </ul>
                </section>
                <!-- Search bar -->
                <div class="col s9">
                    <div class="input-field">
                        <i class="material-icons prefix icon-left-in-input">search</i>
                        <input id="search_input" type="text" name="q" class="grey-text icon-prefix icon-left-in-input" style="padding-left:40px" placeholder="john-doe@example.com">
                    </div>

                    <section id="book-list">
                        {BOOKS}
                    </section>

                </div>
            </div>
        </main>

        <script src="/assets/js/wNumb.js" defer></script>
        <script src="/assets/js/ext/md-nouislider.js" defer></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.minjs" defer></script>
        <script src="/assets/js/main.js" defer></script>
        <script src="/assets/js/books.js" defer></script>
    </body>
</html>