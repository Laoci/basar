const deleteFromCart = (itemId) => {
  // parse localStorage
  const cart = JSON.parse(window.localStorage.cart);
  const itemIndex = cart.findIndex((el) => {
    return el.id === itemId
  })
  cart.splice(itemIndex, 1);
  // Remove the object with the right id
  // Write to localStorage
  window.localStorage.setItem('cart', JSON.stringify(cart))
}

const showCart = () => {
  // console.log('showing car!');
  const cartList = document.querySelector('.cart-list');
  if (cartList) {


    const cartObject = JSON.parse(window.localStorage.cart)
    deleteItem();
  }
}

const deleteItem = () => {
  const deleteButtons = document.querySelectorAll(".delete-item");
  deleteButtons.forEach((btn) => {
    btn.addEventListener('click', (e) => {
      e.currentTarget.parentElement.remove()
      // Use the id to remove the item from localStorage
      deleteFromCart(btn.dataset.itemId);
      // Delete the current item on the html
    })
  })
  // deleteButtons.addEventListener('click', (e) => {
  //   console.log(e)
  // })
}

export { showCart }
