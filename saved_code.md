

  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h8m-8 6h16" /></svg>

  <!-- Sample Black Buttons -->
  <div class="flex justify-center py-4">
    <button class="custom-btn px-2 py-0 mr-4">Button 1</button>
    <button class="custom-btn px-4 py-2">Button 2</button>
  </div>




<br>


<h1>Colors</h1>

<div id="colors">
  <% @colors.each do |color| %>
    <%= render color %>
    <p>
      <%= link_to "Show this color", color %>
    </p>
  <% end %>
</div>

<br>

<div>
  <%= link_to "Back to colors", colors_path %>
</div>