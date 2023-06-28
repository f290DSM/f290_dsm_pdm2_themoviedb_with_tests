class EventDataModel {
  EventDataModel({
    required this.title,
    required this.body,
    this.isExpanded = false,
  });

  String title;
  String body;
  bool isExpanded;
}
