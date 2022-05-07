# T2A2 - Marketplace Application - Crumbl

## Identification of the problem you are trying to solve by building this particular marketplace app.

Traditional bakeries are expensive and complex to set up which means a high barrier to entry. Not only that, higher risks are associated with owning a physical store. For example - During the pandanmic, many small businesses still had to pay outgoing expenses such as rent in order to keep their business while sales were severely impacted, and as a result have been forced to shut down. These factors may deter home bakers from pursuing their passion and starting their own bakery. Crumbl provides a free platform for people to buy and sell their homemade baked goods online. 

## Why is it a problem that needs solving?

There are not many online marketplaces specifically for home baked goods, as such Crumbl can provide a free platform for home bakers to start their business. 

## A link (URL) to your deployed app (i.e. website)

<https://crumbl.herokuapp.com>

## A link to your GitHub repository (repo)

<https://github.com/jssnora/crumbl>

## Description of your marketplace app (website), including:
### Purpose
The purposes of this website is to provide a marketplace for people to buy homemade baked goods or sell their homemade baked goods.

### Functionality / features
#### User 
- Sign up: User can register for an account
- Sign in: User can sign in to an existing
- Sign out: User can sign out of current account
#### Listing
- View all listings: Signed in users can view all listings including available and sold items 
- View individual listing: Signed in users can view individual listings with more details such as listing description and availability
- Purchase a listing: Signed in users can purchase a listing
- Create listing: Signed in users can create a listing to sell
- Edit listing: Seller of the listing can edit details of the listing
- Delete listing: Seller of the listing can delete the listing
- Restock listing: After the item is sold, seller can restock the listing
#### Order
- View all orders: User can view all past purchased listings
- View individual order: User can view details of an individual order
- Check stock: User can check current stock of the item from previous order

#### Out of scope features
The following features were planned (as per wireframes) but out of scope for this version of the app due to time constraints. 

- Listings cards on home page
- Ability to edit account details

### Sitemap

![sitemap](/docs/sitemap.png)


### Screenshots

![home_page](/docs/home.png)

![sign_in](/docs/sign_in.png)

![sign_up](/docs/sign_up.png)

![all_listings](/docs/all_listings.png)

![view_listing](/docs/view_listing.png)

![purchase](/docs/purchase.png)

![my_orders](/docs/my_orders.png)

![view_order](/docs/view_order.png)

![create_listing](/docs/create_listing.png)

### Target audience

The target audience for this website is for all people who want to buy or sell homemade baked goods. 

### Tech stack (e.g. html, css, deployment platform, etc)

- Ruby
- Ruby on Rails
- PostgreSQL
- HTML
- CSS/SASS
- Bootstrap
- Devise
- Heroku
- AWS S3

## User stories for your app

### Buyer

- As a buyer, I want to register for a new account so that I can make and track purchases
- As a buyer, I want to sign in to my account so that I can view my past purchases
- As a buyer, I want to browse all listings so that I can see what baked goods are available
- As a buyer, I want to view a listing so that I can see more details about the listing
- As a buyer, I want to checkout a listing so that I can purchase it
- As a buyer, I want to see my orders so that I can view what I have purchased
- As a buyer, I want to check the stock of a listing so that I can buy it when it is available
- As a buyer, I want to know if a listing can accomodate my dietary requirement so that I can avoid getting an alergic reaction from it

### Seller

- As a seller, I want to do everything a buyer can so that I can buy baked goods that I'm interested in
- As a seller, I want to register for a new account so that I can create a listing to sell my homemade baked goods
- As a seller, I want to sign in to my account so that I can view my listings
- As a seller, I want to update the availability of my listing so that I can restock it when it is available
- As a seller, I want to be able to upload an image with each listing I create so that I can better promote my products
- As a seller, I want to be able to specify special dietary options for my listins so that customers are more informed
- As a seller, I want to edit my listing so that I can update the information if I need to
- As a seller, I want to delete a listing so that I can remove it when I no longer make that item

## Wireframes for your app

![home_page](/docs/Wireframes/Home_page.png)

![sign_up](/docs/Wireframes/Sign_Up.png)

![sign_in](/docs/Wireframes/Sign_In.png)

![my_account](/docs/Wireframes/My_Account.png)

![new_listing](/docs/Wireframes/New_Listing.png)

![view_listing](/docs/Wireframes/View_Listing.png)

![edit_listing](/docs/Wireframes/Edit_Listing.png)

![my_listing](/docs/Wireframes/My_Listings.png)

![my_orders](/docs/Wireframes/My_Orders.png)

## An ERD for your app

![erd](/docs/erd.png)

Due to time constraint, I did not implement a profile entity. However, as this entity does not impact the overall functionality of the website, I chose to implement other entities first to ensure the essential functionalities of the website are prioritiesed.

## Explain the different high-level components (abstractions) in your app 

Crumbl is built using the Ruby on Rails framework which uses the Model View Controller (MVC) architectural design pattern that separates the application into three main components: Model, View and Controller.

Model: The model handles the backend and is responsible for getting and manipulating the data. It interacts with the database (PostgreSQL) and takes care of complex queries. It simplifies the experience by allowing the user to use simple Ruby code to interact with the database rather than complex SQL queries.

View: The view handles the frontend graphical interface and contains all functionality that directly interacts with the user, such as text boxes, dropdowns, etc. The view usually consists of HTML and CSS along with dynamic values sent from the controller. Template engine is what allows dynamic data to output variables and use logic such as ‘if’ statements in the view. Ruby on Rails uses embedded Ruby (ERB) to pass through dynamic data.

Controller: The controller connects the model and the view and controls how data is displayed. The controller can request data through the model and load the view with the requested data to display it. Data can also be sent from the view to the controller and saved into the database through the model with the use of active record. The controller also process requests, for example, a user visiting a page which makes a GET request or submitting a form which makes a POST request. 

For example - when a seller is trying to create a new listing in Crumbl, the View will render a form for the seller to fill out details of the listing. When the user submits the form, this request is routed to the controller and the controller decides what action needs to be taken. In this case, the controller will tell the model to save the information into the database as a new listing.

The use of partials in Rails also simplifies the development process. Partials are used where the same segment of a page is used across multiple pages. For example, the navbar appears on every page, so instead of including the navbar code on every view page, we can put the navbar into a partial and refer to it in the application.html.erb file. The method of using partials can avoid duplicating the same code across multiple pages to make our code more 'DRY' and also make debugging easier as we can point to a single point of failure when that section produce errors.

## Detail any third party services that your app will use 

- Heroku for deployment: Pipeline setup with staging app and production app. Staging app is used to check features are implemented correctly before promoting the changes to the production app.
- Amazon S3 for image hosting: Images attached to a listing are uploaded to an AWS S3 bucket and integrated with ActiveRecord.
- Stripe for payment: User is redirected to Stripe to make payment for the listing. Webhook is set up in Stripe so that once payment is successfully completed, it will notify the app via a post request to change the status of the listing to 'sold'.
- Devise for user authentication: A user model along with user authentication views (such as sign in and sign up) are generated using Devise which comes with user authentication functionalities. 

## Describe your projects models in terms of the relationships (active record associations) they have with each other

Crumbl contains the following models:

- User
- Listing
- Order
- Category
- DietaryOption
- ListingsDietaryOption

**User 'has_many' listings, Listing 'belongs_to' user**

A user can have 0 to many listings as they can choose to sell many things or not sell anything at all, but a listing must have one and only one user as the seller.

**User 'has_many' sold_orders foreign key: seller_id, Order 'belongs_to' seller**

As an user can be a seller or buyer, I have distinguished them using different foreign keys. A seller can have 0 or many sold_orders depending on if they have sold any listings, but an order must have one and only one seller.

**User 'has_many' bought_orders foreign key: buyer_id, Order 'belongs_to' buyer**

As mentioned above, an user can be a seller or buyer, I have distinguished them using different foreign keys. A buyer can have 0 or many bought_orders depending on if they have bought anything, but an order must have one and only one buyer.

**Category 'has_many' listings, Listing 'belongs_to' Category**

Many listings can be in the same category or by chance, all listings may not belong to a particular category. Thus, a category can contain 0 to many listings but a listing can only fit into one and only category.

**Listing 'has_many' dietary_options through listings_dietary_options, DietaryOption 'has_many' listings through listings_dietary_options**

A listing can accomodate many dietary options (e.g. a loaf of bread can be both gluten free and dairy free) and a dietary option can have many listings that a fit it (e.g. a cheesecake and a cookie can both be gluten free). As these two entities have a many to many relationship, it requires the use of a join table to minimise duplications in the database.

## Discuss the database relations to be implemented in your application

- User to Listing: 0 to many
- Listing to User: One and only one
- Seller to order: 0 to many 
- order to seller: One and only one
- Buyer to order: 0 to many 
- order to Buyer: One and only one
- listing to order: 0 to 1 
- order to listing: One and only one
- listing to dietary_option: many to many
- dietary_option to listing: many to many

## Provide your database schema design

A User model created to keep track of user information for authentication and authorisation. The User model is associated with the Order model to keep track of purchased/sold listings and the Listings model to keep track of listings for sale.

The Order model keeps track of who the buyer and seller is for a particular transaction and also keeps a receipt of the transaction generated from Stripe.

The Listing model keeps track of the information related to the listings such as price, description and whether it has been sold.

The Category model keeps track of the different categories the listings fit into. For example, danish and croissant belong to the pastry category.

The DietaryOption model keeps track of which listings fit into which dietary options.

## Describe the way tasks are allocated and tracked in your project

I used a Trello board to manage the tasks and keep track of the progress of this project. I divided the board into 4 stages.

**Backlog:** All tasks are placed here initially
**To do:** Tasks to be worked next are prioritised into here
**Doing:** Tasks currently being worked on
**Done:** Completed tasks

I also added checklists to some tasks which are more complex to break them down into further steps. For example, with Stripe, I broke it down into the initial set up to have payment working and the webhook set up to have Stripe notify my app when a payment is successfully complete.

![trello](/docs/Trello/completed_trello.png)