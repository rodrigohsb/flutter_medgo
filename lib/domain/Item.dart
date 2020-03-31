class ItemList {
  final List<Item> items;

  ItemList({
    this.items,
  });

  factory ItemList.fromJson(List<dynamic> parsedJson) {

    List<Item> items = new List<Item>();
    items = parsedJson.map((i) => Item.fromJson(i)).toList();
    return new ItemList(
        items: items
    );
  }
}

class Item {
  final String id;
  final String title;

  Item({
    this.id,
    this.title
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return new Item(
        id: json['id'].toString(),
        title: json['title']
    );
  }
}