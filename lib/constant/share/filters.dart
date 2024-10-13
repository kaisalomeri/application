
import 'package:application_aqars/constant/buttons.dart';
import 'package:flutter/material.dart';

class HomeFilter extends StatefulWidget {
  final Function(List<String> filteredArray) onFilterApplied;

  HomeFilter({required this.onFilterApplied});

  @override
  _HomeFilterState createState() => _HomeFilterState();
}

class _HomeFilterState extends State<HomeFilter> {
  List<String> selectedCategories = [];
  List<String> selectedPropertyTypes = [];
  List<String> selectedPropertyStatus = [];
  List<String> selectedCities = [];
  List<String> selectedRoomNumbers = [];
  List<String> selectedPriceRanges = [];
  String? address;

  void _applyFilters() {
    List<String> filteredArray = [
      ...selectedCategories,
      ...selectedPropertyTypes,
      ...selectedPropertyStatus,
      ...selectedCities,
      ...selectedRoomNumbers,
      ...selectedPriceRanges,
      if (address != null) address!,
    ];

    widget.onFilterApplied(filteredArray);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الفئات الأساسية
          Text(
            'الفئات:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['عوائل', 'عزاب'],
            onButtonSelected: (String x) {
              setState(() {
                selectedCategories = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // نوع العقار
          Text('نوع العقار:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['شراء', 'إيجار'],
            onButtonSelected: (String x) {
              setState(() {
                selectedPropertyTypes = [x];
              });
            },
          ),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['غير مفروش', 'مفروش'],
            onButtonSelected: (String x) {
              setState(() {
                selectedPropertyTypes.add(x);
              });
            },
          ),
          SizedBox(height: 10),

          // حالة العقار
          Text('حالة العقار:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: ['بيت مستعمل', 'بيت جديد', 'بيت قديم'],
            onButtonSelected: (String x) {
              setState(() {
                selectedPropertyStatus = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // المدينة
          Text('المدينة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 4,
            buttonLabels: ['ذمار', 'تعز', 'صنعاء', 'إب'],
            onButtonSelected: (String x) {
              setState(() {
                selectedCities = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // عدد الغرف
          Text('عدد الغرف:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: ['10 غرف وأكثر', '4-9 غرف', '1-3 غرف'],
            onButtonSelected: (String x) {
              setState(() {
                selectedRoomNumbers = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // نطاق الأسعار
          Text('نطاق الأسعار:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: [
              '100 ألف وأكثر',
              '50-90 ألف شهرياً',
              '20-40 ألف شهرياً'
            ],
            onButtonSelected: (String x) {
              setState(() {
                selectedPriceRanges = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // عنوان المنطقة
          Text('العنوان (الحي/ المنطقة):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // حواف دائرية
              ),
              hintText: 'أدخل العنوان (الحي/ المنطقة)',
            ),
            onChanged: (value) {
              address = value;
            },
          ),
          SizedBox(height: 20),

          // زر التأكيد بحواف دائرية
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12.0), // حواف دائرية للأزرار
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            onPressed: _applyFilters,
            child: Text(
              'تأكيد',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

/// suites filtering components
class SuiteFilter extends StatefulWidget {
  final Function(List<String> filteredArray) onFilterApplied;

  SuiteFilter({required this.onFilterApplied});

  @override
  _SuiteFilterState createState() => _SuiteFilterState();
}

class _SuiteFilterState extends State<SuiteFilter> {
  List<String> selectedCategories = [];
  List<String> selectedPropertyTypes = [];
  List<String> selectedCities = [];
  List<String> selectedPriceRanges = [];
  List<String> selectedRoomNumbers = [];
  String? address;

  void _applyFilters() {
    List<String> filteredArray = [
      ...selectedCategories,
      ...selectedPropertyTypes,
      ...selectedCities,
      ...selectedPriceRanges,
      ...selectedRoomNumbers,
      if (address != null) address!,
    ];

    widget.onFilterApplied(filteredArray);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // نوع العقار
          Text('نوع العقار:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['شراء', 'إيجار'],
            onButtonSelected: (String x) {
              setState(() {
                selectedPropertyTypes = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // المدينة
          Text('المدينة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 4,
            buttonLabels: ['ذمار', 'تعز', 'صنعاء', 'إب'],
            onButtonSelected: (String x) {
              setState(() {
                selectedCities = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // نطاق الأسعار
          Text('نطاق الأسعار:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: [
              '100 ألف وأكثر',
              '50-90 ألف شهرياً',
              '20-40 ألف شهرياً'
            ],
            onButtonSelected: (String x) {
              setState(() {
                selectedPriceRanges = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // عدد الغرف
          Text('عدد الغرف:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: ['10 غرف وأكثر', '4-9 غرف', '1-3 غرف'],
            onButtonSelected: (String x) {
              setState(() {
                selectedRoomNumbers = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // الفئات الأساسية
          Text('الفئات:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: ['الكل', 'عوائل', 'عزاب'],
            onButtonSelected: (String x) {
              setState(() {
                selectedCategories = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // حالة التأثيث
          Text('حالة التأثيث:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['غير مفروش', 'مفروش'],
            onButtonSelected: (String x) {
              setState(() {
                selectedCategories.add(x);
              });
            },
          ),
          SizedBox(height: 10),

          // عنوان المنطقة
          Text('العنوان (الحي/ المنطقة):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // حواف دائرية
              ),
              hintText: 'أدخل العنوان (الحي/ المنطقة)',
            ),
            onChanged: (value) {
              address = value;
            },
          ),
          SizedBox(height: 20),

          // زر البحث
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12.0), // حواف دائرية للأزرار
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            onPressed: _applyFilters,
            child: Text(
              'بحث',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

// building filtering

class BuildingFilter extends StatefulWidget {
  final Function(List<String> filteredArray) onFilterApplied;

  BuildingFilter({required this.onFilterApplied});

  @override
  _BuildingFilterState createState() => _BuildingFilterState();
}

class _BuildingFilterState extends State<BuildingFilter> {
  List<String> selectedTransactionTypes = [];
  List<String> selectedBuildingTypes = [];
  List<String> selectedBuildingConditions = [];
  List<String> selectedCities = [];
  List<String> selectedFloorCounts = [];
  List<String> selectedPriceRanges = [];
  String? address;

  void _applyFilters() {
    List<String> filteredArray = [
      ...selectedTransactionTypes,
      ...selectedBuildingTypes,
      ...selectedBuildingConditions,
      ...selectedCities,
      ...selectedFloorCounts,
      ...selectedPriceRanges,
      if (address != null) address!,
    ];

    widget.onFilterApplied(filteredArray);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // نوع المعاملة
          Text('نوع المعاملة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['شراء', 'إيجار'],
            onButtonSelected: (String x) {
              setState(() {
                selectedTransactionTypes = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // نوع المبنى
          Text('نوع المبنى:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['مباني تجارية', 'مباني سكنية'],
            onButtonSelected: (String x) {
              setState(() {
                selectedBuildingTypes = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // حالة المبنى
          Text('حالة المبنى:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['مبنى جديد', 'مبنى قديم'],
            onButtonSelected: (String x) {
              setState(() {
                selectedBuildingConditions = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // المدينة
          Text('المدينة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 4,
            buttonLabels: ['ذمار', 'تعز', 'صنعاء', 'إب'],
            onButtonSelected: (String x) {
              setState(() {
                selectedCities = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // عدد الطوابق
          Text('عدد الطوابق:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: ['أكثر', '4-9 طوابق', '1-3 طوابق'],
            onButtonSelected: (String x) {
              setState(() {
                selectedFloorCounts = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // نطاق الأسعار
          Text('نطاق الأسعار:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: [
              '100 ألف وأكثر',
              '50-90 ألف شهرياً',
              '20-40 ألف شهرياً'
            ],
            onButtonSelected: (String x) {
              setState(() {
                selectedPriceRanges = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // عنوان المنطقة
          Text('العنوان (الحي/ المنطقة):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // حواف دائرية
              ),
              hintText: 'أدخل العنوان (الحي/ المنطقة)',
            ),
            onChanged: (value) {
              address = value;
            },
          ),
          SizedBox(height: 20),

          // زر البحث
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12.0), // حواف دائرية للأزرار
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            onPressed: _applyFilters,
            child: Text(
              'بحث',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

// landing filtering

class LandingFilter extends StatefulWidget {
  final Function(List<String> filteredArray) onFilterApplied;

  LandingFilter({required this.onFilterApplied});

  @override
  _LandingFilterState createState() => _LandingFilterState();
}

class _LandingFilterState extends State<LandingFilter> {
  List<String> selectedOwnershipTypes = [];
  List<String> selectedTransactionTypes = [];
  List<String> selectedCities = [];
  List<String> selectedPriceRanges = [];
  List<String> selectedLandSizes = [];
  List<String> selectedLandTypes = [];
  String? address;

  void _applyFilters() {
    List<String> filteredArray = [
      ...selectedOwnershipTypes,
      ...selectedTransactionTypes,
      ...selectedCities,
      ...selectedPriceRanges,
      ...selectedLandSizes,
      ...selectedLandTypes,
      if (address != null) address!,
    ];

    widget.onFilterApplied(filteredArray);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // نوع الملكية
          Text('نوع الملكية:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['حر', 'وقف'],
            onButtonSelected: (String x) {
              setState(() {
                selectedOwnershipTypes = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // نوع المعاملة
          Text('نوع المعاملة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 2,
            buttonLabels: ['شراء', 'إيجار'],
            onButtonSelected: (String x) {
              setState(() {
                selectedTransactionTypes = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // المدينة
          Text('المدينة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 4,
            buttonLabels: ['ذمار', 'تعز', 'صنعاء', 'إب'],
            onButtonSelected: (String x) {
              setState(() {
                selectedCities = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // نطاق الأسعار
          Text('نطاق الأسعار:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: ['1 مليون وأكثر', '100-900 ألف', '99 ألف وأقل'],
            onButtonSelected: (String x) {
              setState(() {
                selectedPriceRanges = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // مساحة الأرض
          Text('مساحة الأرض:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: ['11 وأكثر', '6-10 قصبة', '1-5 قصبة'],
            onButtonSelected: (String x) {
              setState(() {
                selectedLandSizes = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // نوع الأرض
          Text('نوع الأرض:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InlineButtonSelector(
            numberOfButtons: 3,
            buttonLabels: ['أخرى', 'زراعية', 'سكنية'],
            onButtonSelected: (String x) {
              setState(() {
                selectedLandTypes = [x];
              });
            },
          ),
          SizedBox(height: 10),

          // عنوان المنطقة
          Text('العنوان (الحي/ المنطقة):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // حواف دائرية
              ),
              hintText: 'أدخل العنوان (الحي/ المنطقة)',
            ),
            onChanged: (value) {
              address = value;
            },
          ),
          SizedBox(height: 20),

          // زر البحث
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12.0), // حواف دائرية للأزرار
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            onPressed: _applyFilters,
            child: Text(
              'بحث',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
