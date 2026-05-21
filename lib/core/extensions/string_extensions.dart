import 'package:flutter/material.dart';

extension StringTextExtension on String {
  /// Display Large
  Widget displayLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      this,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(
        context,
      ).textTheme.displayLarge?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }

  /// Headline Large
  Widget headlineLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      this,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(
        context,
      ).textTheme.headlineLarge?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }

  /// Title Large
  Widget titleLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      this,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(
            color: color,
            fontWeight:
                fontWeight ??
                FontWeight.w700,
          ),
    );
  }

  /// Title Medium
  Widget titleMedium(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      this,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }

  /// Body Large
  Widget bodyLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      this,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(
        context,
      ).textTheme.bodyLarge?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }

  /// Body Medium
  Widget bodyMedium(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      this,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }

  /// Label Large
  Widget labelLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      this,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(
        context,
      ).textTheme.labelLarge?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }
}