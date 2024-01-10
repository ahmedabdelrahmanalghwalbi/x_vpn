# X_VPN

X_VPN is a free VPN app implemented in Flutter, with native Java integration, to demonstrate the seamless integration of native code with Flutter.

The main purpose of this project is to showcase the ability to leverage the power of native Java code within a Flutter app. By integrating native Java code using the method channel, we can access platform-specific features and APIs that are not directly available in Flutter.

In addition to the native Java integration, the project utilizes the following dependencies:

- hive: ^2.2.3
- hive_flutter: ^1.1.0
- get: ^4.6.6
- http: ^1.1.2
- csv: ^5.1.1

## Features

- Secure and private VPN connection
- Access to multiple VPN servers
- Automatic server selection
- Username and password authentication

## Implementation

The app uses native Java code via the method channel to handle VPN connections and integrate with the device's VPN service. This allows us to take advantage of the performance and capabilities of native code while building the app's core functionality. Hive is used for local data storage, allowing the app to save VPN server configurations. The Get package is used for state management and navigation. HTTP is used for making API requests to retrieve VPN server information, and CSV is used to parse the CSV response from the VPN server API.

## Usage

To use the X_VPN app, follow these steps:

1. Clone the repository: `git clone https://github.com/ahmedabdelrahmanalghwalbi/x_vpn`
2. Install dependencies: `flutter pub get`
3. Run the app: `flutter run`Please refer to the project's documentation for more detailed instructions on building, running, and customizing the app.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.
