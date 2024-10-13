class Setting {
  final int id;
  final String name;
  final String value;

  Setting({required this.id, required this.name, required this.value});

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      id: json['id'],
      name: json['name'],  // تأكد من استخدام 'name' بشكل صحيح بدون إضافات زائدة
      value: json['value'],
    );
  }
}
