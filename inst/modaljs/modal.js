const modalally = function (modal, modalButton, modalOverlay, cancelButton) {
  let modal = document.querySelector(modal);
  let modalButton = docucument.querySelector(modalButton);
  let modalOverlay = docucument.querySelector(modalOverlay);
  let modalButton = docucument.querySelector(cancelButton);

  modalButton.addEventListener("click", open);
  cancelButton.addEventListener("click", close);

  function open() {
    let previouslyFocused = document.activeElement;

    let focusableElements = modal.querySelectorAll(
      'a[href], area[href], input:not([disabled]):not([type="hidden"]), select:not([disabled]), textarea:not([disabled]), button:not([disabled]), iframe, object, embed, [tabindex="0"], [contenteditable], audio[controls], video[controls], summary, [tabindex^="0"], [tabindex^="1"], [tabindex^="2"], [tabindex^="3"], [tabindex^="4"], [tabindex^="5"], [tabindex^="6"], [tabindex^="7"], [tabindex^="8"], [tabindex^="9"]'
    );

    focusableElements = Array.prototype.slice.call(focusableElements);

    let firstItem = focusableElements[0];
    let lastItem = focusableElements[focusableElements.length - 1];

    modal.addEventListener("keydown", trap);

    modal.style.display = "block";
    modalOverlay.style.display = "block";
  }

  function trap(event) {
    if (event.keyCode === 9) {
      if (event.shiftKey) {
        if (document.activeElement === firstItem) {
          event.preventDefault();
          lastItem.focus();
        }
      } else {
        if (document.activeElement === lastItem) {
          event.preventDefault();
          firstItem.focus();
        }
      }
    }
  }

  function close() {
    modal.style.display = 'none';
    modalOverlay.style.display = 'none';
  }
};
