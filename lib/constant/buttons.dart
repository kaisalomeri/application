import 'package:flutter/material.dart';

class PrivacyPolicyButton extends StatelessWidget {
  // final VoidCallback onPressed;

  const PrivacyPolicyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => Navigator.pushNamed(context, '/privacyPage'),
      icon: Icon(Icons.privacy_tip_outlined, color: Colors.black),
      label: Text(
        'الشروط وسياسة الخصوصية؟',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class InlineButtonSelector extends StatefulWidget {
  final int numberOfButtons; // Number of buttons to be displayed
  final List<String> buttonLabels; // List of button labels
  final Function(String)
      onButtonSelected; // Callback function for button selection

  InlineButtonSelector({
    required this.numberOfButtons,
    required this.buttonLabels,
    required this.onButtonSelected, // Initialize the callback function
  });

  @override
  _InlineButtonSelectorState createState() => _InlineButtonSelectorState();
}

class _InlineButtonSelectorState extends State<InlineButtonSelector> {
  int _selectedIndex = 1; // Tracks the selected button index

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.numberOfButtons, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade300, // Highlight selected button
                textStyle: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: _selectedIndex == index ? Colors.white : Colors.black,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = index; // Update the selected index
                });

                // Call the callback function with the selected button's text
                widget.onButtonSelected(widget.buttonLabels[index]);
              },
              child: Text(
                widget.buttonLabels[index],
                style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
