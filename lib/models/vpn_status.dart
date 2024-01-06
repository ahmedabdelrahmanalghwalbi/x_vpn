class VpnStatus {
  final String? byteIn;
  final String? byteOut;
  final String? durationTime;
  final String? lastPacketReceive;

  const VpnStatus(
      {this.byteIn, this.byteOut, this.durationTime, this.lastPacketReceive});

  factory VpnStatus.fromJson(Map<String, dynamic> json) => VpnStatus(
      byteIn: json['byte_in'],
      byteOut: json['byte_out'],
      durationTime: json['duration'],
      lastPacketReceive: json['last_packet_receive']);

  Map<String, dynamic> toJson() => {
        'byte_in': byteIn,
        'byte_out': byteOut,
        'duration': durationTime,
        'last_packet_receive': lastPacketReceive
      };
}
