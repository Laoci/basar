

const initCart = () => {
  // whenever I click on add to cart
  const addToCartBtn = document.querySelector('#add-to-cart');
  addToCartBtn.addEventListener('click', () => {
    const itemId = addToCartBtn.dataset.itemId;
    const itemCount = document.querySelector('#item-count');
    addToLocalStorage(itemId, itemCount.value);
  })
  // collect the number from the input
  // add the right item to localstorage
}

const addToLocalStorage = (itemId, itemCount) => {
  // What to do when:

  // localStorage is not empty - Cart started
  if (window.localStorage.cart) {
    const cartObject = JSON.parse(window.localStorage.cart)
    const cartItem = cartObject.find((cartItem) => {
      return cartItem.itemId === itemId;
    })

    if (cartItem) {
      cartItem.itemCount = itemCount;
    } else {
      cartObject.push({itemId: itemId, itemCount: itemCount })
    }

    window.localStorage.setItem('cart', JSON.stringify(cartObject))
    // The item is in localStorage
     // Update the value
    // the item is not in localStorage
      // Add a new element to the array
  } else {
    // localStorage is empty - No Cart
    window.localStorage.setItem('cart', JSON.stringify([{itemId: itemId, itemCount: itemCount}]))
  }

}

export { initCart };