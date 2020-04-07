const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-edagua');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-edagua-white');
      } else {
        navbar.classList.remove('navbar-edagua-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
