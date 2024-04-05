import $ from "jquery";

document.addEventListener("turbolinks:load", function() {
    $('.comments-toggle').click(function () {
        console.log("Botão de alternância de comentários clicado");
        $(this).closest(".card").next(".comments-list").toggle();
    });
});
