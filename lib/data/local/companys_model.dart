class CompanysModel {
  const CompanysModel(this.name, this.work, this.image);

  final String name;
  final String work;
  final String image;

  static const List<CompanysModel> companys = [
    CompanysModel('Lark Homes','Broker','assets/vectors/c1.svg'),
    CompanysModel('Axis Group ','Broker','assets/vectors/c2.svg'),
    CompanysModel('Driggs','Broker','assets/vectors/c3.svg'),
  ];
}
