var sidebar = document.getElementById("sidebar");
var sidebtn = document.getElementById("sidebtn");
var shade = document.getElementById("shade");
var x = window.matchMedia("(max-width: 768px)");
 
sidebtn.addEventListener("click", openSidebar);
shade.addEventListener("click", closeSidebar);

prevent(x);
x.addListener(prevent);

function openSidebar() {
    sidebar.classList.add("active");
    sidebar.style.maxWidth = "300px";
    shade.style.display = "block";
}
    
function closeSidebar() {
    sidebar.classList.remove("active");
    sidebar.style.maxWidth = "0px";
    shade.style.display = "none";
}

function prevent(x) {
    if (x.matches) {
        sidebar.style.minWidth = "0px";
        sidebar.style.maxWidth = "0px";
        shade.style.display = "none";
    } else {
        sidebar.style.minWidth = "256px"
        sidebar.style.maxWidth = "300px";
        shade.style.display = "none";
    }
}
