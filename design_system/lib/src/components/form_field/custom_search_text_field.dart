import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    super.key,
    required this.onSearch,
    this.onClear,
    required this.label,
    this.enabled = true,
    required this.searchTooltip,
    required this.clearTooltip,
  });

  final void Function(String filter) onSearch;
  final VoidCallback? onClear;
  final String label;
  final String searchTooltip;
  final String clearTooltip;
  final bool enabled;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late final TextEditingController _internalController;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _internalController = TextEditingController();
    _hasText = _internalController.text.isNotEmpty;

    _internalController.addListener(() {
      if (mounted) {
        setState(() {
          _hasText = _internalController.text.isNotEmpty;
        });
      }
    });
  }

  void _handleClear() {
    _internalController.clear();
    widget.onClear?.call();
  }

  void _handleSearch() {
    widget.onSearch(_internalController.text);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: _internalController,
      label: widget.label,
      enabled: widget.enabled,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusSize.large),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_hasText)
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: _handleClear,
                tooltip: widget.clearTooltip,
              ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: _handleSearch,
              tooltip: widget.searchTooltip,
            ),
          ],
        ),
      ),
    );
  }
}
