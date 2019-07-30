class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        icon: json['icon'],
        title: json['title'],
        url: json['url'],
        statusBarColor: json['statusBarColor'],
        hideAppBar: json['hideAppBar']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.icon != null) {
      data['icon'] = this.icon;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.url != null) {
      data['url'] = this.url;
    }
    if (this.statusBarColor != null) {
      data['statusBarColor'] = this.statusBarColor;
    }
    if (this.hideAppBar != null) {
      data['hideAppBar'] = this.hideAppBar;
    }
    return data;
  }
}