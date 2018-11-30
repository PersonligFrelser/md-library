<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/materialize.css">
    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/admin.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
<header>
    {NAV}
</header>

<main>
    <nav class="sidenav sidenav-fixed" style="top: 64px !important;">
        <ul class="collection">
            <li class="collection-item user-panel" style="color: white !important;">
                <div class="container">
                    <div class="row">
                        <div class="col s4" style="margin-top: 5px !important;">
                            <img class="avatar circle" src="{USER_AVATAR}">
                        </div>
                        <div class="col offset-s1 s4">
                            <div class="container">
                                <div class="row username-row">
                                    <h6>{USER_NAME}</h6>
                                </div>
                                <div class="row">
                                    <p>{USER_ROLE}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <ul class="collapsible">
            <li>
                <a href="/admin/">
                    <div class="collapsible-header">
                        <i class="material-icons right">dashboard</i>
                        <span>Dashboard</span>
                    </div>
                </a>
            </li>
            <li>
                <a href="/admin/books.php">
                    <div class="collapsible-header">
                        <i class="material-icons right">book</i>
                        <span>Books</span>
                    </div>
                </a>
            </li>
            <li>
                <div class="collapsible-header">
                    <i class="material-icons right">account_circle</i>
                    <span>Users</span>
                </div>
                <div class="collapsible-body">
                    <ul>
                        <li><a href="#">Add User</a></li>
                    </ul>
                    <ul>
                        <li><a href="/admin/users.php">Change User</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">
                    <div class="collapsible-header">
                        <i class="material-icons right">supervised_user_circle</i>
                        <span>Salves</span>
                    </div>
                </a>
            </li>
            <li>
                <div class="collapsible-header">
                    <i class="material-icons right">local_library</i>
                    <span>Library</span>
                </div>
                <div class="collapsible-body">
                    <ul>
                        <li><a href="#">El 1</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </nav>
    {CONTENT}
</main>

<script src="/assets/js/wNumb.js" defer></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js" defer></script>
<script src="/assets/js/main.js" defer></script>
<script src="/assets/js/admin.js" defer></script>
{SCRIPT}
</body>
</html>