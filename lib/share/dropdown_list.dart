import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:mobile_app/share/text_form.dart';

class AppTextField extends StatefulWidget {
  TextEditingController textEditingController = TextEditingController();
  final bool isCitySelected;
  final List<SelectedListItem>? cities;
  final String text;
  AppTextField({
    required this.textEditingController,
    required this.isCitySelected,
    this.cities,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController _searchTextEditingController = TextEditingController();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonText: 'Done',
        submitButtonColor: const Color.fromRGBO(70, 76, 222, 1),
        bottomSheetTitle: widget.text,
        searchBackgroundColor: Colors.black12,
        dataList: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {},
        selectedItem: (String selected) {
          widget.textEditingController.text = selected;
        },
        enableMultipleSelection: false,
        searchController: _searchTextEditingController,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextForm(widget.textEditingController, widget.text, (value) {},
        Icons.assignment_ind, false, () {
      FocusScope.of(context).unfocus();
      onTextFieldTap();
    }, TextInputType.text);
  }
}
