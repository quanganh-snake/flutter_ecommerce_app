import 'package:flutter/material.dart';

class CategoryFormWidget extends StatefulWidget {
  final String? initialName;
  final String? initialImageUrl;

  final String? nameErrorText;
  final String? imageErrorText;

  final void Function(String) onNameChanged;
  final void Function(String) onImageChanged;
  final VoidCallback onSubmit;
  final bool submitting;

  const CategoryFormWidget({
    super.key,
    this.initialName,
    this.initialImageUrl,
    required this.onNameChanged,
    required this.onImageChanged,
    required this.onSubmit,
    required this.submitting,
    this.nameErrorText,
    this.imageErrorText,
  });

  @override
  State<CategoryFormWidget> createState() => _CategoryFormWidgetState();
}

class _CategoryFormWidgetState extends State<CategoryFormWidget> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _imgCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialName ?? '');
    _imgCtrl = TextEditingController(text: widget.initialImageUrl ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _imgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameCtrl,
            decoration: InputDecoration(
              labelText: 'Name',
              errorText: widget.nameErrorText,
            ),
            onChanged: widget.onNameChanged,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _imgCtrl,
            decoration: InputDecoration(
              labelText: 'Image URL',
              errorText: widget.imageErrorText,
            ),
            onChanged: widget.onImageChanged,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.submitting ? null : widget.onSubmit,
              child: widget.submitting
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
