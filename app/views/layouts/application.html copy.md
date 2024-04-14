<!DOCTYPE html>
<html>
  <head>
    <title>Shirtmanr</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
    <%= javascript_importmap_tags %>
    <%# <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> %>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.0.4/dist/full.css" rel="stylesheet">
    <style>
      /* Additional styles for the black buttons */
      .custom-btn {
        background-color: transparent;
        color: black;
        border: 1px solid black;
        transition: background-color 0.3s, color 0.3s;
      }

      .custom-btn:hover {
        background-color: black;
        color: white;
      }
    </style>
  </head>

<body class="bg-black text-white">

<!-- Include the header -->
<%= render partial: "shared/header" %>
<!-- Include the xy -->
<div class="container mx-auto py-8">
    <div class="max-w-7xl mx-auto">
        <h2 class="text-3xl font-bold text-center mb-8">T-Shirt Collection</h2>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-6"> <!-- Change to 2 columns for medium and large screens -->
            <!-- Loop through each product and render the product card -->
            <% @products.each do |product| %>
                <%= render partial: "product", locals: { product: product } %>
            <% end %>
        </div>
    </div>
</div>
<!-- Include the xy -->
    <%= render partial: "cart/cart" if @render_cart %>
    <%= yield %>

      <!-- Scripts -->
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2/dist/alpine.min.js" defer></script>
  </body>
</html>
