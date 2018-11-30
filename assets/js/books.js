document.addEventListener("DOMContentLoaded", function() {
    var url = new URL(window.location.href);
    if (url.searchParams.get("q") != null) {
        getBooks(url.searchParams.get("q"));
    } else {
        getBooks();
    }

    document.getElementById("search_input").onkeyup = function (evt) {
        getBooks(this.value);
    };
});

function getBooks(query) {
    query = query || "";
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
    }

    req.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            showBooks(JSON.parse(req.responseText));
        }
    };

    var payload = "q=" + query;
    req.open("POST", "http://localhost/requests/search.php", true);
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(payload);
}

function showBooks(array) {
    var body = "";
    array.forEach(function (el) {
        body += formatBook(el)
    });
    var totalBooks = array.length;
    document.getElementById("book-list").innerHTML = body;
    document.getElementById("total-books").innerText = totalBooks.toString() + " " + ((totalBooks == 1) ? 'Book Found' : "Books Found");

}

function formatBook(book) {
    return "<article class=\"col s4\">\n" +
        "            <div class=\"row align-el-under-input\">\n" +
        "                <div class=\"card\">\n" +
        "                    <div class=\"card-image waves-effect waves-block waves-light\">\n" +
        "                        <img class=\"activator\" src=\"" + book['img'] + "\">\n" +
        "                    </div>\n" +
        "                    <div class=\"card-content\">\n" +
        "                        <span class=\"card-title activator grey-text text-darken-4\" style=\"font-size: 18px;\">" + book['title'] + "\n" +
        "                            <i class=\"material-icons right\">more_vert</i></span>\n" +
        "                    </div>\n" +
        "                    <div class=\"card-reveal\">\n" +
        "                        <span class=\"card-title grey-text text-darken-4\" style=\"font-size: 18px;\">" + book['title'] + "<i class=\"material-icons right\">close</i></span>\n" +
        "                        <p>" + book['desc'] + "</p>\n" +
        "                    </div>\n" +
        "                </div>\n" +
        "            </div>\n" +
        "        </article> ";
}