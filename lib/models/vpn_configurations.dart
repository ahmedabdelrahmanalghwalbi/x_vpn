class VpnConfiguration {
  final String username;
  final String password;
  final String countryName;
  final String config;

  const VpnConfiguration(
      {required this.username,
      required this.password,
      required this.config,
      required this.countryName});
}
