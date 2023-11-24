function animateService(element) {
    element.style.transform = "scale(1.05)";
    element.style.boxShadow = "0 8px 16px rgba(0, 0, 0, 0.2)";
}

function resetAnimation(element) {
    element.style.transform = "scale(1)";
    element.style.boxShadow = "0 4px 8px rgba(0, 0, 0, 0.1)";
}
