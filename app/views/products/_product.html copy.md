<div id="<%= dom_id product %>">
    <p>
      <strong>Name:</strong>
      <%= product.name %>
    </p>

    <p>
      <strong>Category:</strong>
      <%= product.category %>
    </p>

    <p>
      <strong>Price:</strong>
      <%= usd(product.price) %>
    </p>

    <p>
      <strong>Description:</strong>
      <%= product.description %>
    </p>

    <p>
      <strong>Image:</strong>
      <%= product.image %>
    </p>

    <%# CART  %>
    <%= form_with(url: cart_add_path) do |f| %>
        <%= f.hidden_field :id, value: product.id %>
        <%= f.number_field :quantity, value: 1, min: 1 %>
        <%= f.submit "Add To Cart" %>
    <% end %>




</div>
