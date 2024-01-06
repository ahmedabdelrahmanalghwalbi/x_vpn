class VpnInfo {
  final String? hostname;
  final String? ip;
  final String? ping;
  final String? speed;
  final String? countryLongName;
  final String? countryShortName;
  final int? vpnSessionsNum;
  final String? base64OpenVPNConfigurationData;

  // constant [default] constructor
  const VpnInfo(
      {required this.base64OpenVPNConfigurationData,
      required this.countryLongName,
      required this.countryShortName,
      required this.hostname,
      required this.ip,
      required this.ping,
      required this.speed,
      required this.vpnSessionsNum});

//named Constructor
  VpnInfo.fromJson(Map<String, dynamic>? json)
      : base64OpenVPNConfigurationData =
            json?['OpenVPN_ConfigData_Base64'] ?? "",
        countryLongName = json?['CountryLong'] ?? "",
        countryShortName = json?['CountryShort'] ?? "",
        hostname = json?['HostName'] ?? "",
        ip = json?['IP'] ?? "",
        ping = json?['Ping']?.toString() ?? "",
        speed = json?['Speed'] ?? "0",
        vpnSessionsNum = json?['NumVpnSessions'];

//to json() method that convert from object data type to Map<String,dynamic> data type
  Map<String, dynamic> toJson() => {
        'OpenVPN_ConfigData_Base64': base64OpenVPNConfigurationData,
        'CountryLong': countryLongName,
        'CountryShort': countryShortName,
        'HostName': hostname,
        'IP': ip,
        'Ping': ping,
        'Speed': speed,
        'NumVpnSessions': vpnSessionsNum
      };
}
