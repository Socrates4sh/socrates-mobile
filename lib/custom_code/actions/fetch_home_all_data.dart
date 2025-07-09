// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<HomeAllDataStruct>> fetchHomeAllData(
  List<WebsiteStructureRecord> websiteStructureDoc,
  List<HomepageLanguageSequenceRecord> firstLanguage,
) async {
  List<HomeAllDataStruct> allDataList = [];

  for (final item in websiteStructureDoc) {
    // Create initial HomeAllDataStruct for this item

    // Check if we need to fetch sub-categories

    final subCategories = await querySubCategoriesRecordOnce(
        parent: item.reference,
        queryBuilder: (subCategoriesRecord) => subCategoriesRecord
            .where(
              'is_display',
              isEqualTo: true,
            )
            .orderBy('exam_sequence'));

    for (final data in subCategories) {
      allDataList.add(HomeAllDataStruct(
          subCategory: data.exam,
          language: data.language,
          referenceWebStructure: item.reference));
    }
  }
  List<String> firstLanguageRecords =
      firstLanguage.map((e) => e.language).toList();

  final languagePriority = {
    for (int i = 0; i < firstLanguageRecords.length; i++)
      firstLanguageRecords[i]: i,
  };

  // Sort based on language priority
  allDataList.sort((a, b) {
    final aPriority = languagePriority[a.language] ?? firstLanguage.length;
    final bPriority = languagePriority[b.language] ?? firstLanguage.length;
    return aPriority.compareTo(bPriority);
  });

  return allDataList;
}
