function showSlides(n, container) {
  const slides = container.querySelectorAll(".mySlides");
  const titles = container.querySelectorAll(".photo-title");
  if (slides.length === 0) return;

  let slideIndex = parseInt(container.getAttribute("data-slide-index")) || 0;
  slideIndex = (slideIndex + n + slides.length) % slides.length;

  slides.forEach((slide, i) => {
    slide.style.display = i === slideIndex ? "block" : "none";
  });

  titles.forEach((title, i) => {
    title.style.display = i === slideIndex ? "block" : "none";
  });

  container.setAttribute("data-slide-index", slideIndex);
}

function startAutoSlide(container) {
  if (container.autoSlideTimer) return;

  // Save initial image index if not already set
  if (!container.hasAttribute("data-initial-index")) {
    container.setAttribute("data-initial-index", container.getAttribute("data-slide-index") || 0);
  }

  container.autoSlideTimer = setInterval(() => {
    showSlides(1, container);
  }, 3000);

  const comments = container.querySelector(".photo-comments");
  if (comments) comments.style.display = "none";
}

function stopAutoSlide(container) {
  clearInterval(container.autoSlideTimer);
  container.autoSlideTimer = null;

  // Reset to the initial image
  const initialIndex = parseInt(container.getAttribute("data-initial-index")) || 0;
  container.setAttribute("data-slide-index", initialIndex);
  showSlides(0, container);

  const comments = container.querySelector(".photo-comments");
  if (comments) comments.style.display = "block";
}

function openCommentModal(photoId) {
  const modal = document.getElementById("comment-modal");
  const modalComments = document.getElementById("modal-comments");
  const photoIdField = document.getElementById("photo-id-field");

  photoIdField.value = photoId;

  // Clear and load comments via Ajax
  modalComments.innerHTML = "Loading comments...";
  fetch(`/photos/${photoId}/comments`, {
    method: "GET",
    headers: { "X-Requested-With": "XMLHttpRequest", "Content-Type": "application/json" },
  })
    .then(response => response.json())
    .then(comments => {
      modalComments.innerHTML = "";
      comments.forEach(comment => {
        const commentElement = document.createElement("p");
        commentElement.innerHTML = `<strong>${comment.user.email}:</strong> ${comment.text}`;
        modalComments.appendChild(commentElement);
      });
    });

  const slideshowContainer = document.querySelector(`[data-photo-id="${photoId}"]`);
  if (slideshowContainer) stopAutoSlide(slideshowContainer);

  modal.style.display = "block";
}

function closeCommentModal() {
  const modal = document.getElementById("comment-modal");
  modal.style.display = "none";

  const slideshowContainer = document.querySelector(".slideshow-container:hover");
  if (slideshowContainer) startAutoSlide(slideshowContainer);
}

document.addEventListener("DOMContentLoaded", () => {
  const slideshowContainers = document.querySelectorAll(".slideshow-container");

  slideshowContainers.forEach(container => {
    const initialIndex = parseInt(container.getAttribute("data-slide-index")) || 0;
    container.setAttribute("data-slide-index", initialIndex);
    container.setAttribute("data-initial-index", initialIndex); // Save the initial index
    showSlides(0, container);

    container.addEventListener("mouseenter", () => startAutoSlide(container));
    container.addEventListener("mouseleave", () => stopAutoSlide(container));
  });

  // Add click listener to images for opening the modal
  document.querySelectorAll(".photo-image").forEach(image => {
    image.addEventListener("click", (event) => {
      const photoId = event.currentTarget.dataset.photoId;
      openCommentModal(photoId);
    });
  });

  // Close modal button
  const closeBtn = document.querySelector(".close-btn");
  closeBtn.addEventListener("click", closeCommentModal);
});