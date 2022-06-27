# README #

For setup Please follow the instructions below

### What is this repository for? ###

* This is the app for fetching exchange rates of different curriencies from NBP api.
* This app Provides the end point to view echange rate variation between two dates or specifix echange rate for a particlar currency on a paticular date.

### How do You get set up? ###

#### Ruby: 3.0
#### Rails: 6.1.6

#### Clone the app locally.
#### install dependencies by running following commands

* Bundle install to install ruby depndencies
* Yarn install to install webpacker depndencies

#### Add database.yml into config/ folder create file and paste the below code into that file
* don't forget to add username and password of your local database.
	* `default: &default
		  adapter: postgresql
		  encoding: unicode
		  # For details on connection pooling, see rails configuration guide
		  # http://guides.rubyonrails.org/configuring.html#database-pooling
		  pool: 5
		  host: <%= ENV['DATABASE_HOST'] || 'localhost' %>
		  username: your_local_db_username
		  password: your_local_db_password
		development:
		  <<: *default
		  database: exchange_rates_development
		test:
		  <<: *default
		  database: exchange_rates_test`

* run `rails db:setup`
* run rails server with `rails s`
* run `sidekiq` for background services.

##### Master key (for encryption/decryption)
* create master.key file inside the config folder and paste the below key in it to use encryted credentials.
	* `e4150cab45cbe96efa3b889310808287`
#### How to Use it.
* For the first time database will be empty and you will be given the opportunity to fetch the records or if you dont want to then wait for 12 AM because a background job to fetch Exchange Rates will run at 12 AM.
* on the home page all the fetched currency rates will be displayed.
#### End Point to fetch/download the data based on specific Date Range or on a specific date
* `localhost:3000/api/v1/currencies(.:format)` this is the endpoint which accepts the different parameter which are following: 
	*	`currency` (currency unit e.g USD, AUD, HKD etc.). Also this parameter is required.
		* `localhost:3000/api/v1/currencies.csv?currency=USD` to downlaod csv.
		*	`localhost:3000/api/v1/currencies.json?currency=USD` to get json response.
	*	`date` (use this parameter to fetch currency rate at a specific day)
		* `localhost:3000/api/v1/currencies.csv?currency=USD&date=2022-06-24`
		*	`localhost:3000/api/v1/currencies.json?currency=USD&date=2022-06-24`
	* 	`start_date`, `end_date` (use these parameters to fetch currency rates within this range alonng with average.)
		* `localhost:3000/api/v1/currencies.csv?currency=USD&start_date=2022-06-22&end_date=2022-06-24`
		*	`localhost:3000/api/v1/currencies.json?currency=USD&start_date=2022-06-22&end_date=2022-06-24`
	*	Date format is `YYYY-MM-DD`
	*	Api's `default format` is `Json` but you can use `Csv` to download the results in a `.csv` file.


