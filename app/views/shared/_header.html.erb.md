<!-- app/views/shared/_header.html.erb -->
<header class="bg-blue-500 text-black py-1">
    <div class="container mx-auto flex justify-between items-center">
      <div>
        <span class="text-lg font-bold"><img src="C:\dev\leetcode\_img\ur-logo-01.webp" width=84  height=84 alt="Urban Royalty"></span>
      </div>
      <div class="flex space-x-4">
        <a href="#" class="hover:text-gray-500">Home</a>
        <a href="#" class="hover:text-gray-500">Code</a>
        <a href="#" class="hover:text-gray-500">Login</a>
      </div>
  
  
        <form class="flex items-center" action="/posts" accept-charset="UTF-8" method="get">
          <input type="text" name="search" id="search" placeholder="Search posts" class="rounded bg-gray-800 text-white px-4 py-2    focus:outline-none focus:shadow-outline" />
          <input type="submit" name="commit" value="Search" class="ml-2 bg-black text-white px-4 py-2 rounded hover:bg-white hover:text-black focus:outline-none focus:shadow-outline" data-disable-with="Search" />
  </form>
  
    </div>
  </header>