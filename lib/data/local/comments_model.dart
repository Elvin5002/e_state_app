
class CommentsModel {

  const CommentsModel(this.image, this.fullName, this.comment, this.work);

  final String image;
  final String fullName;
  final String comment;
  final String work;
  

  static const List<CommentsModel> comments = [
    CommentsModel('assets/png/pp.png', 'James Butler', 'At the end of the day, we want a home that matches our lifestyle. RE/MAX knows that and promises clients their agents are ready and waiting to help find the perfect fit.','Broker')
  ];
}