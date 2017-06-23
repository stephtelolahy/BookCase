# BookCase

### Description ###

Ordering Books app [link](https://github.com/xebia-france/recruitment-tests/blob/master/ExerciceMobile.md)


### Dependecies ###
* Install pods using command `$ pod install`
* SDWebImage: loading image from Url
* MBProgressHUD: displaying floating message

### Architecture ###
* **Application**: Application entry point and interaction with the Operating System
* **ViewControllers**: Presentation layer handling screen display and user interaction
* **Managers**(Business Layer): Facade objects that process data for each screen or feature
* **Models**: Data objects mapped from API
* **DAL**(Data Access Layer): Network clients and Local storage managers
* **Utils**: Helpers and Class extensions
* **Resources**: Images, strings, other resources

### Features ###

* Launch app
* Base localization
* View available books
* Add a book to order
* View order details
* View order best offer
* Delete order's product
* View order empty view
* View products loading view
* View products error view

### Developer ###
stephano.telolahy@gmail.com