

const showCart = () => {

  const cartList = document.querySelector('.cart-list');
  if (cartList) {


    const cartObject = JSON.parse(window.localStorage.cart)

    cartObject.forEach((cartItem) => {
      cartList.innerHTML += `
        <div class="mb-3"> <p class="text-primary"> ${cartItem.itemId} <span class="text-muted"> ${cartItem.itemCount} </span>  </p>  </div>
      `
    })
  }
}

// const deleteItem = () => {
//   const deleteButtons = document.querySelectorAll(".delete-item");
//   debugger
//   console.log(deleteButtons)
// }

export { showCart }
