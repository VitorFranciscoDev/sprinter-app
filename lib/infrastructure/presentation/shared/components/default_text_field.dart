import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    super.key,
    required this.label,
    required this.icon,
    this.isPassword = false,
  });

  final String label;
  final IconData icon;
  final bool isPassword;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      obscureText: widget.isPassword && _obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.7)),
        prefixIcon: Icon(widget.icon, color: colorScheme.primary),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() => _obscureText = !_obscureText);
                },
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
              )
            : null,
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.secondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.secondary.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}
