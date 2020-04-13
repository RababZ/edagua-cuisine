const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-edaga');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-edaga-white');
      } else {
        navbar.classList.remove('navbar-edaga-white');
      }
    });
  }
}


export { initUpdateNavbarOnScroll };
