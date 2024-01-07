class IpInfo {
  final String? countryName;
  final String? regionName;
  final String? cityName;
  final String? zipCode;
  final String? timezone;
  final String? internetServiceProvider;
  final String? query;

  IpInfo(
      {required this.cityName,
      required this.countryName,
      required this.internetServiceProvider,
      required this.query,
      required this.regionName,
      required this.timezone,
      required this.zipCode});

  factory IpInfo.fromJson(Map<String, dynamic> json) => IpInfo(
      cityName: json['city'] ?? '',
      countryName: json['country'] ?? '',
      internetServiceProvider: json['ips'] ?? 'Unknown',
      query: json['query'] ?? 'Not Available',
      regionName: json['regionName'] ?? '',
      timezone: json['timezone'] ?? 'Unknown',
      zipCode: json['zip'] ?? '');
}
