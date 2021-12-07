class Data{
   String name;
   String value;
   String imgurl;
   bool accepting = false;

  Data({this.name, this.imgurl,this.value,
    this.accepting
  });

  Data.fromJson(Map<String , dynamic> json){
    name = json['name'];
    value = json['value'];
    imgurl = json['imgurl'];
    accepting = false;
  }

  Map<String , dynamic> toJson(){
    final Map<String , dynamic> data = new Map<String , dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['imgurl'] = this.imgurl;
    return data;
  }

}