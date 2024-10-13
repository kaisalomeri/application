


import 'package:application_aqars/constant/share/filters.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  int? _selectedIndex; // Tracks the index of the selected item

  @override
  Widget build(BuildContext context) {
    Widget? filterComponent;

    switch (_selectedIndex) {
      case 0:
        filterComponent = HomeFilter(
          onFilterApplied: (filteredArray) {
            // Handle the filtered array
            print('Filtered Array: $filteredArray');
          },
        );
        break;
      case 1:
        filterComponent = BuildingFilter(
          onFilterApplied: (filteredArray) {
            // Handle the filtered array
            print('Filtered Array: $filteredArray');
          },
        );
        break;
      case 2:
        filterComponent = SuiteFilter(
          onFilterApplied: (filteredArray) {
            // Handle the filtered array
            print('Filtered Array: $filteredArray');
          },
        );
        break;
      case 3:
        filterComponent = LandingFilter(
          onFilterApplied: (filteredArray) {
            // Handle the filtered array
            print('Filtered Array: $filteredArray');
          },
        );
        break;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(), // For smooth scrolling
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  // Define the icon and text for each item
                  IconData icon;
                  String text;
                  switch (index) {
                    case 0:
                      icon = Icons.home;
                      text = 'منازل';
                      break;
                    case 1:
                      icon = Icons.business;
                      text = 'مباني';
                      break;
                    case 2:
                      icon = Icons.apartment;
                      text = 'شقق';
                      break;
                    case 3:
                      icon = Icons.landscape;
                      text = 'أراضي';
                      break;
                    default:
                      icon = Icons.home;
                      text = 'منازل';
                  }

                  // Determine the background color based on the selected state
                  Color backgroundColor = _selectedIndex == index
                      ? Colors.blue.shade100
                      : Colors.white;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index; // Update the selected index
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icon,
                              size: 60.0,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              text,
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Text(
                'قم بتعديل اختيار البيانات حسب طلبك :',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              if (filterComponent != null)
                filterComponent, // Display the selected filter component
            ],
          ),
        ),
      ),
    );
  }
  
  Widget buildPostItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة المنشور
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(8.0), // تحديد قيمة التقريب المرغوبة
                child: Image.asset(
                  'assets/images/main_image.png',
                  width: 100,
                  height: 105,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
              // Container(
              //   width: 100,
              //   height: 105,
              //   decoration: BoxDecoration(
              //     color: Colors.grey[300],
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              // ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // السعر
                    Text(
                      '30,500,000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    // العنوان والتفاصيل الأخرى
                    Text(
                      'مبنى طابقين للبيع',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('المساحة: 4 لبن'),
                    Text('شارع المحافظة, أب'),
                  ],
                ),
              ),
              // زر القلب
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  // Handle favorite icon press
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          // تفاصيل المزود وأزرار الإجراءات
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Distribute space between elements
            children: [
              // معلومات المزود (صورة، تقييم، موقع)
              Flexible(
                // Allow this section to shrink if needed
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // صورة المزود وعلامة التوثيق (استبدل بالصورة الفعلية)
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          const AssetImage('assets/images/profile.png'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 18, 82, 135),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // التقييمات
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4.0),
                            Text('5'),
                          ],
                        ),
                        SizedBox(
                            height:
                                4.0), // Add some spacing between rating and location
                        // الموقع
                        Text(
                          'اليمن , اب', // <-- Display only the country on the next line
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // أزرار الإجراءات
              Row(
                children: [
                  // زر الانتقال للعرض
                  ConstrainedBox(
                    // Constrain button width
                    constraints:
                        const BoxConstraints(minWidth: 100, maxWidth: 150),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF354B9F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'الانتقال للعرض',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // زر المتابعة
                  ConstrainedBox(
                    // Constrain button width
                    constraints:
                        const BoxConstraints(minWidth: 80, maxWidth: 120),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF354B9F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'متابعة',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Color(0xFF354B9F),
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          // تاريخ النشر
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '3 مايو',
              style: TextStyle(color: Color(0xFF6A7380)),
            ),
          ),
        ],
      ),
    );
  }


 }




