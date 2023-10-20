import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/ProductDetail.dart';
import 'Services/CategoryProductService.dart';

class Product extends StatefulWidget {

  Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Product'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(builder: (context,Snapshot){
              return GridView.builder(
                itemCount: listCategoryProduct.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 8.0 / 10.0,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      String t=listCategoryProduct[index].title.toString();
                      String p=listCategoryProduct[index].price.toString();
                      String d=listCategoryProduct[index].description.toString();
                      String img=listCategoryProduct[index].images![0].toString();
                      print(img);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>ProductDetail(title: t, price: p, description: d, images: img)
                          ));
                    },
                    child: Card(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          CircleAvatar(
                            backgroundImage: NetworkImage(listCategoryProduct[index].images![0].toString()), //NetworkImage
                            radius: 60,
                          ),
                          SizedBox(
                            height: 10,
                          ), //SizedBox
                          Text(
                            listCategoryProduct[index].title.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ), //Textstyle
                          ),
                          SizedBox(
                            height: 10,
                          ), //SizedBox
                          Text('Price: Rs. '+
                            listCategoryProduct[index].price.toString(),
                            style: TextStyle(
                              fontSize: 20,

                              fontWeight: FontWeight.w700,
                            ), //Textstyle
                          ),
                        ],
                      ),
                    ),
                  );
                },

              );
            }),
          )
        ],
      ),
    );
  }
}
