import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/my/pay/payment_page.dart';

class AgreementSection extends StatefulWidget {
  final void Function(bool) onAllChecked;
  final List<bool> subCheckboxValues;
  final List<String> subtitles;

  const AgreementSection({
    Key? key,
    required this.onAllChecked,
    required this.subCheckboxValues,
    required this.subtitles,
  }) : super(key: key);

  @override
  _AgreementSectionState createState() => _AgreementSectionState();
}

class _AgreementSectionState extends State<AgreementSection> {
  late bool _isChecked;
  late List<bool> _subCheckboxValues;

  @override
  void initState() {
    super.initState();
    _isChecked = false;
    _subCheckboxValues = List<bool>.from(widget.subCheckboxValues);
  }

  @override
  Widget build(BuildContext context) {
    return _buildExpandableCheckbox(
      context: context,
      title: '전체 동의',
      subtitle: widget.subtitles,
      onChecked: (bool value) {
        setState(() {
          _isChecked = value;
          _subCheckboxValues = List<bool>.filled(_subCheckboxValues.length, value);
        });
        widget.onAllChecked(value);
      },
    );
  }

  Widget _buildExpandableCheckbox({
    required BuildContext context,
    required String title,
    required List<String> subtitle,
    required void Function(bool) onChecked,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                onChecked(value ?? false);
              },
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ),
        SizedBox(height: gap_s),
        Column(
          children: subtitle.map((text) {
            return GestureDetector(
              onTap: () => _showPopups(context),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _subCheckboxValues[subtitle.indexOf(text)],
                          onChanged: (bool? value) {
                            setState(() {
                              _subCheckboxValues[subtitle.indexOf(text)] = value ?? false;
                            });
                          },
                        ),
                        Text(text),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _showPopups(BuildContext context) {
    List<String> messages = [];
    if (!_subCheckboxValues.every((element) => element)) {
      messages.add('모두 동의해주세요');
    }

    if (messages.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notice'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: messages.map((message) => Text(message)).toList(),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentPage()),
      );
    }
  }
}
