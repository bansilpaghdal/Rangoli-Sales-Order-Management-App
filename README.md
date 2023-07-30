# Rangoli Sales Order Management App

A Flutter project to receive sales order from the customers for an authorized distributor of a sales agency.

## Welcome Screen 
This is the Welcome Screen where a user can either login or register.
 <p align="center"> <img src="/GIFs/welcome%20screen.gif" width="300" height="550"/></p>



## Home Screen And Registration
 The user will be presented with the authentication screen from which the user can login, register.
 * **Registration Screen:**
   * User has to insert a 10 digit phone number to register on which he will receive an OTP.
   * Phone Authentication is implemented using firebase.
   * A data connection checker is used to check whether the device is connected to the internet before procedding to send the OTP.
     

 <p align="center"><img src="/GIFs/registration.gif" width="300" height="550"/></p>

## Order Creation
User can create order with their own requirements using this page.
- **Create Order Page:**
  - Itemlist is shown along with their price, user can select the number of Box or Patti to be ordered.
  - Total number of boxes and patti entered is soen on the top with the total amount of order.
  - Multiple Pageviews are used to navigate between different segment of items.
  - WillPopScope is used to avoid accidental page poppong due to back button.
- **Review Order Page:**
   - User can review the summary of the order placed.
 
<p align="center"><img src="/GIFs/createorder.gif" width="300" height="550"/></p>
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
