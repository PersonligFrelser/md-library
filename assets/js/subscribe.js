document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("email-input").onkeyup = function (event) {
        if (event.key === "Enter") {
            subscribeNewsletter();
        }
    };
});

function subscribeNewsletter() {
    if (document.getElementById("email-input").value == "") {
        M.toast({html: "Please enter an email address"});
    } else {
        if (window.XMLHttpRequest) {
            req = new XMLHttpRequest();
        }

        req.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                M.toast({html: req.responseText});
            }
        };

        let email = document.getElementById("email-input").value;
        var payload = "email=" + email;
        req.open("POST", "/requests/subscribe.php", true);
        req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        req.send(payload);
    }
}