import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class DiscountList extends StatefulWidget {
  const DiscountList({super.key, required this.list});
  final List<Banners> list;

  @override
  State<DiscountList> createState() => _DiscountListState();
}

class _DiscountListState extends State<DiscountList> {
  List<Banners> mList = <Banners>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList = widget.list;
    print('DiscountList: ${mList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mList.isNotEmpty,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 166,
              child: ListView.builder(
                itemCount: mList.length, // Number of items in your list
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var model = mList[index];

                  return DiscountBannerItem(
                    model: model,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class DiscountBannerItem extends StatelessWidget {
  const DiscountBannerItem({super.key, required this.model});

  final Banners model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.color_83D4D7,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8), topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)
      )),
      // elevation: 4,
      child: SizedBox(
        width: 124,
        child: Column(
          children: [
            Container(
              color: AppColor.color_83D4D7,
              child: Image.network(
                model.url ?? "no image",
                height: 110,
                width: 82
              ),
            ),

            Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              color: AppColor.color_2CA2A7,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)
              )),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(model.imgTitle??"", style: const TextStyle(color: AppColor.white, fontSize: 12, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 4,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(model.subTitle??"", style: const TextStyle(color: AppColor.white, fontSize: 10, fontWeight: FontWeight.normal),),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
