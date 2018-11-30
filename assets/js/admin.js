var content;
document.addEventListener("DOMContentLoaded", function() {
    // Navbar will use the whole width given from parent element
    document.getElementsByClassName("container")[0].classList.remove("container");
    M.Collapsible.init(document.querySelectorAll('.collapsible'), null);
    content = document.getElementById("content");
});


function loadDashboard() {
    content.innerHTML = '<object type="text/html" data="/admin/tpl/dashboard.tpl" ></object>';
}