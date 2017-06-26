# BookCase

### Description ###

Ordering Books app [link](https://github.com/xebia-france/recruitment-tests/blob/master/ExerciceMobile.md)


### Dependecies ###
* Install pods using command `$ pod install`
* MBProgressHUD: displaying floating message
* SDWebImage: loading image from Url

### Architecture ###
* **Application**: Application entry point and interaction with the Operating System
* **ViewControllers**: Presentation layer handling screen display and user interaction
* **Managers**(Business Layer): Facade objects that process data for each screen or feature
* **Models**: Data objects mapped from API
* **DAL**(Data Access Layer): Network clients and Local storage managers
* **Utils**: Helpers and Class extensions

### Features ###

* Launch app
* View available books
* Add a book in your order

* View order price based on best offer
* Delete order's product using default swipe-delete action

* View order error view
* View books error view

### Developer ###
stephano.telolahy@gmail.com
