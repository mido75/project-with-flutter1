import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/home_view_model.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/modules/product_screen/product_screen.dart';
import 'package:untitled/shared/styles/color.dart';



class SearchScreen extends StatefulWidget {
  final String? searchValue;

  SearchScreen(this.searchValue);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchScreen> {
  String? _searchValue;

  @override
  void initState() {
    _searchValue = widget.searchValue!.toLowerCase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchProducts = _searchValue == ''
        ? []
        : Get.find<HomeViewModel>().productModel!.where((element) => element.name!.toLowerCase().contains(_searchValue!)).toList();
    //where((product) => product.name.toLowerCase().contains(_searchValue!)).toList();

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Search',
                      style: TextStyle(fontSize: 20,),
                    ),
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 49,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(45),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                initialValue: _searchValue,
                onFieldSubmitted: (value) {
                  setState(() {
                    _searchValue = value.toLowerCase();
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 24),
              child: GetBuilder<HomeViewModel>(
                init: Get.find<HomeViewModel>(),
                builder: (controller) => GridView.builder(
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 320,
                  ),
                  itemCount: _searchProducts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(ProductScreen(model:_searchProducts[index]));
                      },
                      child: Container(
                        width: 164,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                              height: 240,
                              width: 164,
                              child: Image.network(
                                '${_searchProducts[index].image}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              child: Text(
                                '${_searchProducts[index].name}',
                                style: TextStyle(fontSize: 16,),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${_searchProducts[index].description}',
                                style: TextStyle(fontSize: 12,color:Colors.grey, ),
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              child: Text(
                                '${_searchProducts[index].price}\$',
                                style: TextStyle(fontSize: 16,color: defualtColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*
class SearchScreen extends StatelessWidget {

  final String? text;
  SearchScreen({required this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: defualtColor,
        title: Text('${text}',style: TextStyle(color: Colors.black38),),
      ),
    );
  }
}

 */
