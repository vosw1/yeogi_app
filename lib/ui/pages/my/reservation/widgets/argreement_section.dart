import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/privacy_polocy_dialog.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/third_party_providing_dialog.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/usage_rules_dialog.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/age_confirmation_dialog.dart';

class AgreementSection extends StatefulWidget {
  final void Function(bool) onAllChecked;
  final List<bool> subCheckboxValues;
  final void Function(int, bool) onSubCheckboxChanged;
  final List<String> subtitles;

  const AgreementSection({
    Key? key,
    required this.onAllChecked,
    required this.subCheckboxValues,
    required this.onSubCheckboxChanged,
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
    _isChecked = widget.subCheckboxValues.every((element) => element);
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
            int index = subtitle.indexOf(text);
            return GestureDetector(
              onTap: () {
                _showPopup(text); // 팝업을 표시하는 메소드를 호출
              },
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _subCheckboxValues[index],
                          onChanged: (bool? value) {
                            setState(() {
                              _subCheckboxValues[index] = value ?? false;
                              _isChecked = _subCheckboxValues.every((element) => element);
                              widget.onSubCheckboxChanged(index, value ?? false);
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

  void _showPopup(String text) {
    AlertDialog alertDialog;

    switch (text) {
      case '이용규칙 및 취소/환불 규정 동의(필수)':
        alertDialog = _buildUsageRulesDialog();
        break;
      case '개인정보 수집 및 이용 동의(필수)':
        alertDialog = _buildPrivacyPolicyDialog();
        break;
      case '개인정보 제3자 제공 동의(필수)':
        alertDialog = _buildThirdPartyProvidingDialog();
        break;
      case '만 14세 이상 확인(필수)':
        alertDialog = _buildAgeConfirmationDialog();
        break;
      default:
        alertDialog = _buildDefaultDialog();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  AlertDialog _buildDefaultDialog() {
    return AlertDialog(
      title: Text('Notice'),
      content: Text('일치하는 팝업이 없습니다.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('확인'),
        ),
      ],
    );
  }

  UsageRulesDialog _buildUsageRulesDialog() {
    return UsageRulesDialog();
  }

  PrivacyPolicyDialog _buildPrivacyPolicyDialog() {
    return PrivacyPolicyDialog();
  }

  ThirdPartyProvidingDialog _buildThirdPartyProvidingDialog() {
    return ThirdPartyProvidingDialog();
  }

  AgeConfirmationDialog _buildAgeConfirmationDialog() {
    return AgeConfirmationDialog();
  }
}
