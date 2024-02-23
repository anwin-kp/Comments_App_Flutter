import 'package:firebase_complete_demo_app/shared/constants/colors.dart';
import 'package:firebase_complete_demo_app/shared/helper/app_images.dart';
import 'package:firebase_complete_demo_app/viewmodels/custom_text_field_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../shared/constants/constants.dart';
import '../shared/helper/utility.dart';
import '../shared/widgets/common_edit_textfield.dart';
import '../shared/widgets/custom_divider_with_text.dart';
import '../shared/widgets/custom_text_types.dart';
import '../shared/widgets/login_page_widgets.dart';
import '../shared/widgets/secondary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context) {
    return Consumer<TextFieldProvider>(
      builder: (context, value, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBody: false,
          extendBodyBehindAppBar: false,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomTextFormField(
                              controller: _emailController,
                              textInputType: TextInputType.emailAddress,
                              isPassword: false,
                              labelText: Constants.emailText,
                              hintText: Constants.enterYourEmailText,
                              validator: (value) {
                                return _utility.validateEmail(value!);
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormField(
                              controller: _passwordController,
                              textInputType: TextInputType.visiblePassword,
                              isPassword: true,
                              labelText: Constants.passwordText,
                              hintText: Constants.enterPasswordText,
                              validator: (value) {
                                return _utility.validatePassword(value!);
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                PrimaryTextButton(
                                  onPressed: () {},
                                  title: 'Forgot Password?',
                                  textStyle: const TextStyle(),
                                )
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: AppColors.kLiteBlueColor,
                                minimumSize: Size(double.infinity, 35.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: TextMedium(
                                text: 'Login',
                                textColor: AppColors.kColorWhite,
                                fontSize: 18.sp,
                                isUnderLine: false,
                                wantOverFlowEllipsis: false,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Don’t have an account? ',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.kGrey600),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.kLiteBlueColor),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                              child: const TextWithDivider(
                                textToShow: Constants.orSignInWithText,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35.w),
                              child: SecondaryButton(
                                  height: 45.h,
                                  textColor: AppColors.kGrey600,
                                  width: 220.w,
                                  onTap: () {},
                                  borderRadius: 24,
                                  bgColor:
                                      AppColors.kBackground.withOpacity(0.3),
                                  text: 'Continue with Google',
                                  icons: AppImages.kGoogle),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: TermsAndPrivacyText(
                                title1: '  By signing up you agree to our',
                                title2: ' Terms ',
                                title3: '  and',
                                title4: ' Conditions of Use',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}