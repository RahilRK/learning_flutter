import 'package:flutter/material.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';

class DiscountFreeList extends StatefulWidget {
  const DiscountFreeList({super.key, required this.list});
  final List<Banners> list;

  @override
  State<DiscountFreeList> createState() => _DiscountFreeListState();
}

class _DiscountFreeListState extends State<DiscountFreeList> {
  List<Banners> mList = <Banners>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList = widget.list;
    print('DiscountFreeList: ${mList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mList.isNotEmpty,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: mList.length, // Number of items in your list
              itemBuilder: (BuildContext context, int index) {
                var model = mList[index];

                return DiscountBannerItem(
                  model: model,
                );
              },
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(model.url ?? "no image",
          height: 112, width: double.infinity, fit: BoxFit.cover,),
    );
  }
}
