class Menu {
  String name;
  int type;
  List<Menu> childs;
  Menu(this.name, this.type, this.childs);
}

var menus = [
  new Menu('hot', 0, []),
  new Menu('theo dõi', 0, []),
  new Menu('lịch sử', 0, []),
  new Menu('thể loại', 1, [
    new Menu('tất cả', 1, [
      new Menu('Adult', 0, []),
      new Menu('Anime', 0, []),
      new Menu('Comedy', 0, [])
    ]),
    new Menu('đam mỹ', 1, [
      new Menu('Echi', 0, []),
      new Menu('Ochi', 0, []),
      new Menu('MoChi', 0, [])
    ])
  ]),
  new Menu('Xếp hạng', 1, [
    new Menu('top tháng', 0, []),
    new Menu('top tuần', 0, []),
    new Menu('top ngày', 0, [])
  ]),
  new Menu('con trai', 0, []),
  new Menu('con gái', 0, []),
];
