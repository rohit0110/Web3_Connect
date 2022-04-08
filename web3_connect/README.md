<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## Features

Connect to all wallets available on WalletConnect and get back necessary variable to interact with smart contracts.

## Usage

```dart
Web3Connect w3c = Web3Connection();
w3c.connect() //to establish connection and get a pop up to choose wallet
w3c.disconnect() //to kill the session
w3c.enterRpcUrl("http://localhost:7545") //to enter a rpcUrl of your choice 
w3c.account //String containing account number with which connection was made
w3c.credentials //WalletConnectEthereumCredentials required to interact with smart contracts

```



https://user-images.githubusercontent.com/54764168/162468716-9bb27ca1-37e1-4171-ba45-0736101c245c.mp4



## Additional information

Created as a starting point for a better wallet integration experience. Feel free to create issues on the repository to make the package better.
