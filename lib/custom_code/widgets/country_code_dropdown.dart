// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:country_code_picker/country_code_picker.dart';

class CountryCodeDropdown extends StatefulWidget {
  const CountryCodeDropdown({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CountryCodeDropdown> createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  // Variable to store selected country code

  @override
  Widget build(BuildContext context) {
    return CountryPicker(
        flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
        padding: EdgeInsets.zero,
        alignLeft: false,
        dialogSize: const Size.square(550),
        dialogTextStyle:
            const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        showDropDownButton: true,
        initialSelection: "IN",
        onChanged: (value) {
          FFAppState().selectedCode = value.dialCode ?? "null";
          setState(() {});
        },
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12));
  }
}

class CountryPicker extends StatefulWidget {
  final ValueChanged<CountryCode>? onChanged;
  final ValueChanged<CountryCode?>? onInit;
  final String? initialSelection;
  final List<String> favorite;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final bool showCountryOnly;
  final InputDecoration? searchDecoration;
  final TextStyle? searchStyle;
  final TextStyle? dialogTextStyle;
  final WidgetBuilder? emptySearchBuilder;
  final Function(CountryCode?)? builder;
  final bool enabled;
  final TextOverflow textOverflow;
  final Icon closeIcon;

  final Color? barrierColor;

  final Color? backgroundColor;

  final BoxDecoration? boxDecoration;

  final Size? dialogSize;

  final Color? dialogBackgroundColor;

  final List<String>? countryFilter;

  final bool showOnlyCountryWhenClosed;
  final bool alignLeft;

  final bool showFlag;

  final bool hideMainText;

  final bool? showFlagMain;

  final bool? showFlagDialog;

  final double flagWidth;

  final Comparator<CountryCode>? comparator;

  final bool hideSearch;

  final bool showDropDownButton;

  final Decoration? flagDecoration;

  final List<Map<String, String>> countryList;

  const CountryPicker({
    this.onChanged,
    this.onInit,
    this.initialSelection,
    this.favorite = const [],
    this.textStyle,
    this.padding = const EdgeInsets.all(8.0),
    this.showCountryOnly = false,
    this.searchDecoration,
    this.searchStyle,
    this.dialogTextStyle,
    this.emptySearchBuilder,
    this.showOnlyCountryWhenClosed = false,
    this.alignLeft = false,
    this.showFlag = true,
    this.showFlagDialog,
    this.hideMainText = false,
    this.showFlagMain,
    this.flagDecoration,
    this.builder,
    this.flagWidth = 32.0,
    this.enabled = true,
    this.textOverflow = TextOverflow.ellipsis,
    this.barrierColor,
    this.backgroundColor,
    this.boxDecoration,
    this.comparator,
    this.countryFilter,
    this.hideSearch = false,
    this.showDropDownButton = false,
    this.dialogSize,
    this.dialogBackgroundColor,
    this.closeIcon = const Icon(Icons.close),
    this.countryList = codes,
    super.key,
  });

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    List<Map<String, String>> jsonList = countryList;

    List<CountryCode> elements =
        jsonList.map((json) => CountryCode.fromJson(json)).toList();

    if (comparator != null) {
      elements.sort(comparator);
    }

    if (countryFilter != null && countryFilter!.isNotEmpty) {
      final uppercaseCustomList =
          countryFilter!.map((criteria) => criteria.toUpperCase()).toList();
      elements = elements
          .where(
            (criteria) =>
                uppercaseCustomList.contains(criteria.code) ||
                uppercaseCustomList.contains(criteria.name) ||
                uppercaseCustomList.contains(criteria.dialCode),
          )
          .toList();
    }

    return CountryPickerState(elements);
  }
}

class CountryPickerState extends State<CountryPicker> {
  CountryCode? selectedItem;
  List<CountryCode> elements = [];
  List<CountryCode> favoriteElements = [];

  CountryPickerState(this.elements);

  @override
  Widget build(BuildContext context) {
    Widget internalWidget;
    var size = MediaQuery.of(context).size;
    if (widget.builder != null) {
      internalWidget = InkWell(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        onTap: showCountryCodePickerDialog,
        child: widget.builder!(selectedItem),
      );
    } else {
      internalWidget = TextButton(
        onPressed: widget.enabled ? showCountryCodePickerDialog : null,
        child: Padding(
          padding: widget.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (widget.showFlagMain != null
                  ? widget.showFlagMain!
                  : widget.showFlag)
                // Container(
                //   width: size.width * 0.05,
                //   clipBehavior:
                //       widget.flagDecoration == null ? Clip.none : Clip.hardEdge,
                //   margin: const EdgeInsets.all(8),
                //   decoration: widget.flagDecoration,
                //   child: Image.asset(
                //     selectedItem!.flagUri!,
                //     package: 'country_code_picker',
                //     width: size.width * 0.05,
                //   ),
                // ),
                if (!widget.hideMainText)
                  Text(
                    widget.showOnlyCountryWhenClosed
                        ? selectedItem!.toCountryStringOnly()
                        : selectedItem.toString(),
                    style: TextStyle(color: Colors.black),
                    overflow: widget.textOverflow,
                  ),
              if (widget.showDropDownButton)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return internalWidget;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    elements = elements.map((element) => element.localize(context)).toList();
    _onInit(selectedItem);
  }

  @override
  void didUpdateWidget(CountryPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialSelection != widget.initialSelection) {
      if (widget.initialSelection != null) {
        selectedItem = elements.firstWhere(
          (criteria) =>
              (criteria.code!.toUpperCase() ==
                  widget.initialSelection!.toUpperCase()) ||
              (criteria.dialCode == widget.initialSelection) ||
              (criteria.name!.toUpperCase() ==
                  widget.initialSelection!.toUpperCase()),
          orElse: () => elements[0],
        );
      } else {
        selectedItem = elements[0];
      }
      _onInit(selectedItem);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
        (item) =>
            (item.code!.toUpperCase() ==
                widget.initialSelection!.toUpperCase()) ||
            (item.dialCode == widget.initialSelection) ||
            (item.name!.toUpperCase() ==
                widget.initialSelection!.toUpperCase()),
        orElse: () => elements[0],
      );
    } else {
      selectedItem = elements[0];
    }

    // favoriteElements = elements
    //     .where((item) =>
    //         widget.favorite.firstWhereOrNull((criteria) =>
    //             item.code!.toUpperCase() == criteria.toUpperCase() ||
    //             item.dialCode == criteria ||
    //             item.name!.toUpperCase() == criteria.toUpperCase()) !=
    //         null)
    //     .toList();
  }

  void showCountryCodePickerDialog() async {
    final item = await showDialog(
      barrierColor: widget.barrierColor,
      context: context,
      builder: (context) => Center(
        child: Dialog(
          child: SelectionDialog(
            elements,
            favoriteElements,
            showCountryOnly: widget.showCountryOnly,
            emptySearchBuilder: widget.emptySearchBuilder,
            searchDecoration: widget.searchDecoration ??
                InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
            searchStyle: widget.searchStyle,
            textStyle: widget.dialogTextStyle,
            boxDecoration: widget.boxDecoration,
            showFlag: widget.showFlagDialog ?? widget.showFlag,
            flagWidth: widget.flagWidth,
            size: widget.dialogSize,
            backgroundColor: widget.dialogBackgroundColor ?? Colors.white,
            barrierColor: widget.barrierColor ?? Colors.black.withOpacity(0.1),
            hideSearch: widget.hideSearch,
            closeIcon: widget.closeIcon,
            flagDecoration: widget.flagDecoration,
            hideHeaderText: true,
            headerAlignment: MainAxisAlignment.start,
            headerTextStyle: const TextStyle(),
            topBarPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );

    if (item != null) {
      setState(() {
        selectedItem = item;
      });

      _publishSelection(item);
    }
  }

  void _publishSelection(CountryCode countryCode) {
    if (widget.onChanged != null) {
      widget.onChanged!(countryCode);
    }
  }

  void _onInit(CountryCode? countryCode) {
    if (widget.onInit != null) {
      widget.onInit!(countryCode);
    }
  }
}
