import { csrfToken } from '@rails/ujs'

const initCart = () => {
  // whenever I click on add to cart
  const addToCartBtn = document.querySelector('#add-to-cart');
  if (addToCartBtn) {
    addToCartBtn.addEventListener('click', () => {
      const itemId = addToCartBtn.dataset.itemId;
      const itemName = addToCartBtn.dataset.itemName;
      const itemCount = document.querySelector('#item-count');
      addToLocalStorage(itemId, itemCount.value, itemName);
      alert(`${itemCount.value} ${itemName} added!`)
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

  const myCartNav = document.querySelector('.my-cart-link');

  myCartNav.addEventListener('click', (e) => {
    e.preventDefault();
    fetch('/my_cart', {
      method: "POST",
      headers: {
        "Content-Type": 'application/html',
         "X-CSRF-Token": csrfToken()
      },
      body:  JSON.stringify(window.localStorage.cart)
    }).then( res => res.text() )
      .then( html => document.body.innerHTML = html );
  })

}

export { initCart };
