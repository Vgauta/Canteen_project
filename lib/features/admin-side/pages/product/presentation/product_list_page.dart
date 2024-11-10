import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/alert_dialog.dart';
import 'package:canteen/core/widget/app_bar_widget.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/small_text.dart';
import 'package:canteen/core/widget/snack_bar_helper.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/components/add-component/add_product_page.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/product_list_provider.dart';

class ProductList extends StatefulWidget {
  final String pageId;
  const ProductList({super.key, required this.pageId});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProductListProvider>(context, listen: false);
    provider.clearAll();
    provider.getHeader(widget.pageId);
    String id = widget.pageId == "categorys"
        ? provider.cate[0].categoryNameMain
        : widget.pageId == "prioritys"
            ? provider.prio[0].name
            : widget.pageId == "subCategorys"
                ? provider.subCate[0].subCategory
                : provider.menu[0].name;
    provider.setDataZerothIndex(widget.pageId, id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: AppBarWidget(title: "Product"),
      ),
      body: Column(
        children: [
          const SizedBox(height: Dimensions.defualtHeightForSpace),
          SizedBox(
            height: 30,
            width: double.infinity,
            child: Consumer<ProductListProvider>(
              builder: (context, value, child) {
                value.getHeader(widget.pageId);
                int count = widget.pageId == "categorys"
                    ? value.cate.length
                    : widget.pageId == "prioritys"
                        ? value.prio.length
                        : widget.pageId == "subCategorys"
                            ? value.subCate.length
                            : value.menu.length;
                return ListView.builder(
                  itemCount: count,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultPadding),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    String id = widget.pageId == "categorys"
                        ? value.cate[index].categoryNameMain
                        : widget.pageId == "prioritys"
                            ? value.prio[index].name
                            : widget.pageId == "subCategorys"
                                ? value.subCate[index].subCategory
                                : value.menu[index].name;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.defaultPadding),
                      child: InkWell(
                        onTap: () {
                          value.setData(index, widget.pageId, id);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: value.indexPage == index
                                ? const Border(
                                    bottom: BorderSide(
                                      color: AppColorPallete.primaryColor,
                                      width: 3,
                                    ),
                                  )
                                : null,
                          ),
                          child: widget.pageId == "categorys"
                              ? SmallText(
                                  text: value.cate[index].categoryNameMain,
                                )
                              : widget.pageId == "prioritys"
                                  ? SmallText(
                                      text: value.prio[index].name,
                                    )
                                  : widget.pageId == "subCategorys"
                                      ? SmallText(
                                          text:
                                              value.subCate[index].subCategory,
                                        )
                                      : SmallText(
                                          text: value.menu[index].name,
                                        ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Divider(),
          Expanded(
            child: Consumer<ProductListProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.products.length,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultPadding),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.defaultPadding - 5),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.defaultPadding),
                          child: Row(
                            children: [
                              BigText(text: value.products[index].productName),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddProductPage(
                                                    productId: value
                                                        .products[index]
                                                        .productId)));
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialogWidget(
                                          onTap: () {
                                            Provider.of<ProductProvider>(
                                                    context,
                                                    listen: false)
                                                .deleteProduct(value
                                                    .products[index].productId)
                                                .then(
                                                  (val) => {
                                                    if (val.status == true)
                                                      {
                                                        value.products
                                                            .removeAt(index),
                                                        value.setState(),
                                                        SnackBarHelper
                                                            .showSnackBar(
                                                                context,
                                                                val.message,
                                                                false),
                                                        Navigator.pop(context),
                                                      }
                                                    else
                                                      {
                                                        SnackBarHelper
                                                            .showSnackBar(
                                                                context,
                                                                val.message,
                                                                true),
                                                        Navigator.pop(context),
                                                      }
                                                  },
                                                );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.delete)),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
