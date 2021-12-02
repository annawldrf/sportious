import "jquery-bar-rating";
import $ from 'jquery';

const clearStarRatings = () => {
  document.querySelectorAll(".br-widget").forEach((element) => {
    element.remove()
  });
};

const initStarRating = () => {
  clearStarRatings()
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
  const ratingElements = document.querySelectorAll(".star-rating");
  ratingElements.forEach((element) => {
    const rating = element.dataset.ratingValue;
    $(element).barrating({
      theme: 'css-stars',
      initialRating: rating,
      readonly: true,
      hoverState: false
    });
  });
};

export { initStarRating };
