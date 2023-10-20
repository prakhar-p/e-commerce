import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Product.dart';
import 'package:shop/Services/CategoryProductService.dart';
import 'package:shop/Services/CategoryService.dart';

import 'Provider/CategoryProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProvider>(context,listen: false).getAllCategory();
    });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Select Category'),
          centerTitle: true,
        ),
        body: Consumer<CategoryProvider>(
          builder: (context,value,child){
            return Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                      future: CategoryService().getCategory(),
                      builder: (context, Snapshot) {
                        return ListView.builder(
                            itemCount: value.category.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  CategoryProductService().getCategoryProduct(
                                    value.category[index].id!.toInt());
                                      //listCategory[index].id!.toInt());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Product()));
                                },
                                child: Card(
                                  margin: EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 5,
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(value.category[index]
                                                .image
                                                .toString()),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                            opacity: 80)),
                                    child: ListTile(
                                      title: Text(
                                        value.category[index].name.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
                )
              ],
            );
          },
        )
      ),
    );
  }
}
