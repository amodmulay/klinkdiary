class FileDescriptor {
  final String name;

  const FileDescriptor({required this.name});
}

class FileDescriptors {
  static const FileDescriptor bodyTemperature = FileDescriptor(name: 'body_temperature.json');
  static const FileDescriptor bloodPressure = FileDescriptor(name: 'blood_pressure.json');
}