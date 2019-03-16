**SETUP**

- execute next commands to create database
  - ```rake db:create```
  - ```rake db:migrate```
  - ```rake db:seed```

  - Run server
    ```rails s```

  The system consists of two parts:
    - API
    - WEB APP

  **API**

  the API coast of 3 methods:

   *Login*

   Method: POST
   URL: localhost:3000/api/v1/sessions
   Params: email, password.
   Example:
            email = pablo.tobar711@gmail.comple
            password = pabloth
  Response:
            Ok: 200, Valid User
            Unauthorized: 401, Invalid User



   *Find all products*

    Method: GET
    URL: localhost:3000/api/v1/products
    Params: N/A
    Response:
            Ok: 200, Loaded products

    *Find all by name*

    Method: GET
    URL: localhost:3000/api/v1/products
    Params: search[nanme]
    Example:
            search[name] = Boston
            localhost:3000/api/v1/products?search[name]=Boston
    Response:
            Ok: 200, Loaded products

   *load a user profile*

   Method: GET
   URL: localhost:3000/api/v1/users
   Params: token (send by header)
   Example:
          token = eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTM5MjE0MTZ9.CwhEI_hB39BZK4m9WPLu4bdS4ld8tDAh6dpQwGiv2tI
   Response:
            OK: 200, User found
            Unauthorized: 401, Signature has expired
            Not Found: 404, User not found


**WEB APP**

user admin: pablo.tobar711@gmail.com
password: pabloth

user client: client1@gmail.com
password: 12346789

- Only admin can create, delete, edit products.
- Only user can show product, give Like to product, buy a product, add to Cart
- When the stock of a product reaches 3, notify the last user that liked it with an email
- Add images to products
