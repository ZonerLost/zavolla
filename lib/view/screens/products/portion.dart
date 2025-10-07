import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class Portion extends StatefulWidget {
  const Portion({super.key});

  @override
  State<Portion> createState() => _PortionState();
}

class _PortionState extends State<Portion> {
  bool _showAdd = false;

  @override
  Widget build(BuildContext context) {
    return _showAdd
        ? _AddPortion(onSave: () => setState(() => _showAdd = false))
        : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            MyTextField(
              marginBottom: 25,
              prefix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesSearch, height: 20)],
              ),
              hintText: 'Search',
            ),
            Row(
              children: [
                Expanded(
                  child: MyText(
                    text: 'Portion',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: MyBorderButton(
                    radius: 50,
                    textSize: 13,
                    buttonText: 'Add new portion',
                    onTap: () => setState(() => _showAdd = true),
                    height: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            // Custom table using Container, Row, and Column
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Table header
                  Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: kBorderColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              'Group Name',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: kBorderColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              'Number of portion',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Action',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Table rows
                  ...List.generate(
                    5,
                    (index) => Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 48,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: kBorderColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Abc',
                                textAlign: TextAlign.start,
                                style: TextStyle(color: kQuaternaryColor),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 48,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: kBorderColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text(
                                '1233',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kQuaternaryColor),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => setState(() => _showAdd = true),
                                child: Image.asset(
                                  Assets.imagesEditAction,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
  }
}

class _AddPortion extends StatelessWidget {
  const _AddPortion({Key? key, this.onSave}) : super(key: key);

  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 16),
        MyTextField(labelText: 'Group Name', hintText: 'group name'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 10,
          children: [
            Expanded(
              child: MyTextField(
                marginBottom: 0,
                labelText: 'Portion Name',
                hintText: '0',
              ),
            ),
            Image.asset(Assets.imagesRemove, height: 48),
          ],
        ),
        MyText(
          paddingTop: 35,
          text: 'Remember to add the default portion, e.g Regular',
          size: 16,
          textAlign: TextAlign.center,
          color: kQuaternaryColor,
        ),
        SizedBox(height: 35),
        MyBorderButton(
          buttonText: 'Save',
          onTap: () {
            if (onSave != null) onSave!();
          },
        ),
      ],
    );
  }
}
