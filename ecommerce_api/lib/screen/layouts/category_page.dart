import 'package:ecommerce_api/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/selected_provider.dart';
import '../../widget/common_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  var selected = 0;
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CategoryProvider>(context, listen: false).getCategoryData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<CategoryProvider>(context).categoryList;
    // final selectedProvider = Provider.of<SelectedProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Category'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Expanded(
               flex: 2,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   "Products are sorted by category.",
                   style: TextStyle(
                       color: Colors.black87,
                       fontSize: 25,
                       fontWeight: FontWeight.bold),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Text(
                   "Hurry up and explore.",
                   style: TextStyle(
                       color: Colors.black87,
                       fontSize: 23,
                       fontWeight: FontWeight.bold),
                 ),
                 SizedBox(
                   height: 40,
                 ),
                 Text(
                   "Category",
                   style: TextStyle(
                       color: Colors.black87,
                       fontSize: 22,
                       fontWeight: FontWeight.bold),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 SingleChildScrollView(
                   child: Container(
                     color: Colors.grey.shade100,
                     width: double.infinity,
                     height: 40,
                     child: ListView.separated(
                         scrollDirection: Axis.horizontal,
                         itemBuilder: ((context, index) {
                           // final isSelected = selectedProvider.selected == index;
                           return InkWell(
                             onTap: (() {
                               // selectedProvider.setSelected(index);
                               setState(() {
                                 selected = index;
                               });
                             }),
                             child: Row(
                               children: [
                                 Container(
                                   decoration: BoxDecoration(
                                       border: Border.all(
                                           color: selected == index
                                               ? Colors.white
                                               : Colors.grey),
                                       borderRadius: BorderRadius.circular(10),
                                       color: selected == index
                                           ? Colors.blue
                                           : Colors.white),
                                   padding: EdgeInsets.symmetric(
                                       horizontal: 30, vertical: 10),
                                   child: selected == index
                                       ? Text(
                                     "${categoryList[index].name}",
                                     style: TextStyle(color: Colors.white),
                                   )
                                       : Text("${categoryList[index].name}",
                                       style: TextStyle(color: Colors.black)),
                                 ),
                               ],
                             ),
                           );
                         }),
                         separatorBuilder: (_, index) => SizedBox(
                           width: 10,
                         ),
                         itemCount: categoryList.length),
                   ),
                 ),
               ],
             )),
              Expanded(
                flex: 3,
                  child: GridView.builder(
                  itemCount: categoryList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          child: Image.network("${imageUrl}${categoryList[index].image}"),
                        );
                      }))

            ],
          ),
        ),
      ),
    );
  }
}
