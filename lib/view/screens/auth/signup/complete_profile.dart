import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
// removed get package usage; using local setState instead
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_fonts.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
import 'package:zavolla/view/widget/custom_drop_down_widget.dart';
import 'package:zavolla/view/widget/custom_switch_tile_widget.dart';
// removed unused imports
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  int _currentStep = 0;
  final List<String> _labels = ['Business Info', 'Business Type', 'Secret PIN'];

  void _next() {
    if (_currentStep < _labels.length - 1) {
      setState(() => _currentStep += 1);
    } else
      Get.to(() => BottomNavBar());
  }

  void _prev() {
    if (_currentStep > 0) setState(() => _currentStep -= 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Add your Business',
        onLeadingTap: _prev,
        haveLeading: _currentStep > 0,
      ),
      body: LayoutLocker(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 32),
            _CustomStepper(labels: _labels, currentStep: _currentStep),
            SizedBox(height: 40),
            Expanded(
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child:
                          _currentStep == 0
                              ? _BusinessInfo()
                              : _currentStep == 1
                              ? _BusinessType()
                              : _SecretPin(),
                    ),
                    SizedBox(height: 30),
                    MyBorderButton(
                      buttonText: _currentStep == 2 ? 'Get Started' : 'Next',
                      onTap: _next,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _BusinessInfo extends StatelessWidget {
  _BusinessInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.ZERO,
      physics: BouncingScrollPhysics(),
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kFillColor,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  Image.asset(Assets.imagesAvatar, height: 42),
                  SizedBox(height: 14),
                  MyText(
                    text: 'Upload photo/ logo',
                    size: 12,
                    color: kBlueColor,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        MyTextField(
          labelText: 'Business Name',
          hintText: 'eg. BOb’s Coffee shop',
          marginBottom: 8,
        ),
        MyText(
          textAlign: TextAlign.end,
          text: 'We’ll ass this to your receipts and reports',
          paddingBottom: 20,
          size: 12,
          color: kQuaternaryColor,
          onTap: () {},
        ),
        CustomDropDown(
          labelText: 'Business Country',
          hintText: 'Select country',
          items: ['United Kingdom'],
          selectedValue: 'United Kingdom',
          onChanged: (value) {},
        ),
        MyTextField(
          labelText: 'Business Address',
          hintText: 'Start by typing the postcode',
          marginBottom: 0,
        ),
      ],
    );
  }
}

class _BusinessType extends StatefulWidget {
  _BusinessType({Key? key}) : super(key: key);

  @override
  State<_BusinessType> createState() => _BusinessTypeState();
}

class _BusinessTypeState extends State<_BusinessType> {
  int _selectedIndex = -1;
  TimeOfDay? _rolloverTime;
  bool _isVatRegistered = false;
  bool _offersTakeaway = false;
  final TextEditingController _rolloverController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> businessTypes = [
      {'title': 'Food Truck', 'image': Assets.imagesFoodTruck},
      {'title': 'Coffee Shop', 'image': Assets.imagesCoffeeShop},
      {'title': 'Cafe', 'image': Assets.imagesCafe},
      {'title': 'Pub/Bar', 'image': Assets.imagesPub},
      {'title': 'Restaurant', 'image': Assets.imagesRestaurant},
      {'title': 'Other', 'image': Assets.imagesRestaurant},
    ];
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.ZERO,
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          text: 'How would you describe your business?',
          size: 24,
          textAlign: TextAlign.center,
          weight: FontWeight.w600,
          paddingBottom: 10,
        ),
        MyText(
          text:
              'We’ll use this info to tailor the system settings to your need',
          size: 16,
          color: kQuaternaryColor,
          textAlign: TextAlign.center,
          paddingBottom: 30,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: businessTypes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 16,
            mainAxisExtent: 100,
          ),
          itemBuilder: (context, index) {
            final item = businessTypes[index];
            final selected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: Column(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: selected ? kSecondaryColor : Colors.transparent,
                        border: Border.all(
                          color: selected ? kSecondaryColor : kBorderColor,
                          width: selected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          item['image'],
                          height: 32,
                          color: selected ? kPrimaryColor : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  MyText(
                    text: item['title'],
                    size: 16,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),

        MyText(
          paddingTop: 25,
          text: 'Rollover Time',
          size: 16,
          weight: FontWeight.w600,
          paddingBottom: 10,
        ),
        MyText(
          text:
              'Rollover time is the specific hour you set to indicate the end of your business day, which may extend into the next calendar day (e.g. a pub may trade until 1:00 AM).',
          size: 14,
          color: kQuaternaryColor,
          paddingBottom: 16,
        ),
        // Use a tappable field that opens the native time picker.
        GestureDetector(
          onTap: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: _rolloverTime ?? TimeOfDay(hour: 0, minute: 0),
            );
            if (picked != null) {
              setState(() {
                _rolloverTime = picked;
                _rolloverController.text = picked.format(context);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Rollover time set to ${picked.format(context)}',
                  ),
                ),
              );
            }
          },
          child: AbsorbPointer(
            child: MyTextField(
              controller: _rolloverController,
              hintText: '00:00(Midnight)',
              isReadOnly: true,
            ),
          ),
        ),
        SizedBox(height: 12),
        CustomSwitchTile(
          title: 'Is your business VAT registered?',
          value: _isVatRegistered,
          onChanged: (value) => setState(() => _isVatRegistered = value),
        ),
        // Take Away Switch
        SizedBox(height: 16),
        CustomSwitchTile(
          title: 'Do you offer take away?',
          value: _offersTakeaway,
          onChanged: (value) => setState(() => _offersTakeaway = value),
        ),
      ],
    );
  }
}

class _SecretPin extends StatefulWidget {
  const _SecretPin();

  @override
  State<_SecretPin> createState() => _SecretPinState();
}

class _SecretPinState extends State<_SecretPin> {
  @override
  Widget build(BuildContext context) {
    final DEFAULT_THEME = PinTheme(
      width: 52,
      height: 52,
      margin: EdgeInsets.zero,
      textStyle: TextStyle(
        fontSize: 24,
        height: 0.0,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.CABIN,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kFillColor,
        border: Border.all(width: 1.0, color: kBorderColor),
      ),
    );
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.ZERO,
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          text: 'Enter a memorable pin',
          size: 24,
          textAlign: TextAlign.center,
          weight: FontWeight.w600,
          paddingBottom: 10,
        ),
        MyText(
          text: 'You will need to use this pin to log in to the POS App',
          size: 16,
          color: kQuaternaryColor,
          textAlign: TextAlign.center,
          paddingBottom: 30,
        ),

        Pinput(
          length: 4,
          separatorBuilder: (index) {
            return SizedBox(width: 10);
          },
          onChanged: (value) {},
          pinContentAlignment: Alignment.center,
          defaultPinTheme: DEFAULT_THEME,
          focusedPinTheme: DEFAULT_THEME.copyWith(
            decoration: BoxDecoration(
              color: kSecondaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.0),
            ),
          ),
          submittedPinTheme: DEFAULT_THEME.copyWith(
            decoration: BoxDecoration(
              color: kSecondaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.0),
            ),
          ),
          mainAxisAlignment: MainAxisAlignment.center,
          onCompleted: (pin) => print(pin),
        ),
        SizedBox(height: 40),
        MyTextField(
          labelText: 'What should we call you?',
          hintText: 'eg. Bop',
          marginBottom: 0,
        ),
      ],
    );
  }
}

class _CustomStepper extends StatelessWidget {
  const _CustomStepper({required this.labels, required this.currentStep});
  final List<String> labels;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Row(
                children: List.generate(labels.length - 1, (index) {
                  return Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: currentStep > index ? kOrangeColor : kGreyColor,
                      ),
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(labels.length, (index) {
                  return Image.asset(
                    Assets.imagesStep,
                    height: 20,
                    color: currentStep >= index ? kOrangeColor : kGreyColor,
                  );
                }),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: List.generate(labels.length, (index) {
              return Expanded(
                child: MyText(
                  text: labels[index],
                  size: 12,
                  textAlign:
                      index == 0
                          ? TextAlign.start
                          : index == 2
                          ? TextAlign.end
                          : TextAlign.center,
                  fontFamily: AppFonts.CABIN,
                  color: currentStep >= index ? kOrangeColor : kGreyColor,
                  weight: FontWeight.w500,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
