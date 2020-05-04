

const expandOnClick = () => {
  const magnifier = document.querySelector(".icon");
  const input = document.querySelector(".search-input");
  const searchButton = document.querySelector(".search-button")
  magnifier.addEventListener('click', () => {
    input.classList.toggle("active");

  });
};







// const searchBtn = document.getElementById("search-btn");

// const expand = () => {
//   searchBtn.classList.toggle("close");
//   input.classList.toggle("square");
// };

// const expandOnClick = () => {
// searchBtn.addEventListener("click", expand)
// };

export { expandOnClick };
