class CartItem {
  final int? id;
  final int productId; // Unique identifier for the product
  final int categoryID;
  final String name;
  final String image;
  final String notes;
  late final String size;
  final int size_id;
  final String color;
  final int color_id;
  final List<String> sizes;
  final List<String> sizesIDs;
  final List<String> colorsNames;
  final List<String> colorsImages;
  int quantity;

  CartItem(
      {this.id,
      required this.productId,
      required this.size_id,
      required this.color_id,
      required this.categoryID,
      required this.name,
      required this.notes,
      required this.image,
      required this.size,
      required this.sizes,
      required this.sizesIDs,
      required this.colorsNames,
      required this.colorsImages,
      required this.color,
      this.quantity = 1});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'size_id': size_id,
      'notes': notes,
      'color_id': color_id,
      'categoryID': categoryID,
      'name': name,
      'image': image,
      'sizes': sizes.join(','),
      'sizesIDs': sizesIDs.join(','),
      'colorsNames': colorsNames.join(','),
      'colorsImages': colorsImages.join(','),
      'size': size,
      'color': color,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      color_id: json['color_id'],
      size_id: json['size_id'],
      notes: json['notes'],
      productId: json['productId'],
      categoryID: json['categoryID'],
      name: json['name'],
      image: json['image'],
      sizes: (json['sizes'] as String).split(','),
      sizesIDs: (json['sizesIDs'] as String).split(','),
      colorsImages: (json['colorsImages'] as String).split(','),
      colorsNames: (json['colorsNames'] as String).split(','),
      size: json['size'],
      color: json['color'],
      quantity: json['quantity'],
    );
  }

  CartItem copyWith({
    int? id,
    int? productId,
    int? size_id,
    int? color_id,
    int? categoryID,
    String? name,
    String? notes,
    String? image,
    List<String>? sizes,
    List<String>? sizesIDs,
    List<String>? colorsNames,
    List<String>? colorsImages,
    String? size,
    String? color,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      color_id: id ?? this.color_id,
      size_id: id ?? this.size_id,
      productId: productId ?? this.productId,
      notes: notes ?? this.notes,
      categoryID: categoryID ?? this.categoryID,
      sizes: sizes ?? this.sizes,
      sizesIDs: sizesIDs ?? this.sizesIDs,
      colorsImages: colorsImages ?? this.colorsImages,
      colorsNames: colorsNames ?? this.colorsNames,
      name: name ?? this.name,
      image: image ?? this.image,
      size: size ?? this.size,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
    );
  }
}
