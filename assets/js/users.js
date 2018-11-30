document.addEventListener("DOMContentLoaded", function() {
    getUsers();
    document.getElementById("search_input").onkeyup = function () {
        getUsers(this.value);
    }

});

function getUsers(query) {
    query = query || "";
    if (window.XMLHttpRequest) {
        var req = new XMLHttpRequest();
    }

    req.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            prepareUsers(JSON.parse(req.responseText));
        }
    };

    payload = "type=all";
    if (query != "") {
        payload = "type=partial&username=" + query;
    }
    req.open("POST", "http://localhost/admin/requests/users.php", true);
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(payload);
}

function prepareUsers(array) {
    body = "";
    array.forEach(function (e) {
       body += formatUsers(e);
    });
    document.getElementById("user-list").innerHTML = body;
    document.getElementById("total-users").innerHTML = array.length;
}

function formatUsers(user) {
    return "<tr>\n" +
        "                    <td>" + user['uid'] + "</td>\n" +
        "                    <td>" + user['firstname'] + " " + user['lastname'] + "</td>\n" +
        "                    <td>" + user['email'] + "</td>\n" +
        "                    <td>3</td>\n" +
        "                    <td>Harry Potter and the Chambers of Secret</td>\n" +
        "                </tr>"
}