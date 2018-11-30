document.addEventListener("DOMContentLoaded", function() {
    getBooks();
    document.getElementById("search_input").onkeyup = function () {
        getBooks(this.value);
    }
    M.Modal.init(document.querySelectorAll(".modal"), {});
});

function promptUserDeletion(book) {
    console.log("test");
    document.getElementById("modal-delete-book").innerText = book['title'] + "!asdasdasd";
    document.getElementById("modal-action").innerHTML = '<a id="modal-action" onclick="deleteUser(' + book["isbn"] + ')" class="modal-close waves-effect waves-green btn-flat">Agree</a>';
}

function deleteUser(isbn) {
    console.log("test");
    if (window.XMLHttpRequest) {
        var req = new XMLHttpRequest();
    }

    req.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if (this.responseText == "deleted") {
                console.log("Success");
            } else {
                console.log("Failed");
            }
        }
    };

    payload = "type=delete&isbn=" + isbn;
    req.open("POST", "http://localhost/admin/requests/books.php", true);
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(payload);
}

function getBooks(query) {
    query = query || "";
    if (window.XMLHttpRequest) {
        var req = new XMLHttpRequest();
    }

    req.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            prepareBooks(JSON.parse(req.responseText));
        }
    };

    payload = "type=all";
    if (query != "") {
        payload = "type=partial&title=" + query;
    }
    req.open("POST", "http://localhost/admin/requests/books.php", true);
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(payload);
}

function prepareBooks(array) {
    body = "";
    array.forEach(function (e) {
        body += formatBooks(e);
    });
    document.getElementById("book-list").innerHTML = body;
    document.getElementById("total-books").innerHTML = array.length;
}

function formatBooks(books) {
    return "<tr>\n" +
        "                    <td>" + books['isbn'] + "</td>\n" +
        "                    <td>" + books['title'] + "</td>\n" +
        "                    <td>" + books['pages'] + "</td>\n" +
        "                    <td>" + books['pub_time'] + "</td>\n" +
        "                    <td>" + this.getButtons(books) + "</td>\n" +
        "                </tr>"
}

function getButtons(book) {
    params = 
    return  '<a class="btn-floating"><i class="material-icons green">face</i></a>' +
            '<a class="btn-floating"><i class="material-icons yellow">edit</i></a>' +
            '<a class="waves-effect waves-light btn modal-trigger" onclick="promptUserDeletion(&quot;' + book[isbn"] + '","' + book["title"] + '&quot;)" href="#modal-delete">Modal</a>';
}