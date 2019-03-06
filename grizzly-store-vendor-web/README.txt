Welcome to "grizzly-store", it has following functionalities:

1. It checks whether the username/password is valid or not

2. On 3 unsuccessful attempts, user account will get locked automatically

3. If the login is successful, it checks for the role whether it is admin-login/vendor-login and displays the user details accordingly on the left side of the page. 

4. According to the role, different webpages will appear :
   (a) On admin-login:
		> It can add new product.
                > It can remove an existing product.
                > We can view the complete list of products (product list, brand, category, and rating).
   (b) On vendor-login:
                > We can view the complete list of products (product list, id, brand, category) and inventory (product list, id, in stock, required value, buffer, price/item, pending, rating) using navigation bars.
                > It can remove an existing product.
                > It can update stock, and the required amount of product changes automatically.

5.It also checks whether the input is valid or not (e.g., we can't input integers in case of name,brand,description) and displays an error message at the bottom.

6. It has a logout button, which takes us back to login page.

Repeats the same....  