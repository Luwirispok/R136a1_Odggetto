import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/custom_appbar.dart';
import 'package:oggetto_r136a1/presentation/widgets/safe_area_with_background.dart';
import 'package:oggetto_r136a1/repository/entities/check_item.dart';

class CheckList extends StatefulWidget {
  const CheckList({Key? key, required this.listCheckItem}) : super(key: key);

  final List<CheckItem> listCheckItem;

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWithBackground(
        child: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: 'Чек-лист',
          isBack: true,
        ),
        18.emptyHeight,
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => checkListTile(widget.listCheckItem[index]),
            separatorBuilder: (_,__) => 10.emptyHeight,
            itemCount: widget.listCheckItem.length,
          ),
        ),
      ],
    );
  }

  Widget checkListTile(CheckItem checkItem) {
    return GestureDetector(
      onTap: () {
            setState((){
          checkItem.completed = !checkItem.completed!;
        });
      },
      child: SizedBox(
        height: 64,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            16.emptyWidth,
            Expanded(child: Text(checkItem.title ?? '', style: TextStyle(color: Colors.white),)),
            Container(
              alignment: Alignment.center,
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.onTertiary2,
              ),
              child: checkItem.completed != null && checkItem.completed! ? const Icon(Icons.check, size: 18) : null,
            ),
            23.emptyWidth
          ],
        ),
      ),
    );
  }
}
