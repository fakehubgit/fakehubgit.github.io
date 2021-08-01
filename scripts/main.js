$(document).ready(function(){
    let toggleButton = document.getElementById("toggle-button");
    let nav = document.getElementById("nav");
    let header = document.getElementById("header");
    let intro = document.getElementById("intro");

    window.onscroll = function() {
        fixedHeader();
    }

    toggleButton.addEventListener("click", function() {
        nav.classList.toggle("show");
        toggleButton.classList.toggle("active");
        document.body.classList.toggle("lock");
    })

    $('.portfolio__container').slick({
        arrows: true,
        infinite: true,
        dots: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        adaptiveHeight: true
    });

    function fixedHeader() {
        if (window.pageYOffset >= 100 && window.pageYOffset < 600) {
            header.classList.add("invisible")
        } else if (window.pageYOffset >= 700) {
            header.classList.add("sticky")
            header.classList.remove("invisible")
        } else {
            header.classList.remove("sticky");
            header.classList.remove("invisible")
        }
    }




});