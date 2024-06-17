                    
                    <p class="text-gray-700">Colors: <%= product.colors.join(', ') %></p>
                    <p class="text-gray-700">Sizes: <%= product.sizes.join(', ') %></p>
                    

index.html

// index.js
document.addEventListener('turbo:load', setupToggleCartButton);

function setupToggleCartButton() {
  const cartFrame = document.querySelector('turbo-frame#cart');
  const toggleButton = document.querySelector('#toggle-cart-button');

  // Initially hide the cart
  cartFrame.style.display = 'none';

  // Remove any existing event listeners to avoid duplicates
  toggleButton.removeEventListener('click', toggleCart);

  // Add event listener to the toggle button
  toggleButton.addEventListener('click', toggleCart);
}

function toggleCart() {
  const cartFrame = document.querySelector('turbo-frame#cart');
  if (cartFrame.style.display === 'none') {
    cartFrame.style.display = 'block';
  } else {
    cartFrame.style.display = 'none';
  }
}
