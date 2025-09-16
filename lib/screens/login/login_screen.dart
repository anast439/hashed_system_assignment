import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_assets.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/sizes.dart';
import 'package:hashed_system_assignment/widgets/custom_button.dart';
import 'package:hashed_system_assignment/widgets/label_text_field.dart';

import '../../services/auth_service.dart';
import '../bottom_bar/bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: "temp17706@gmail.com");
  final _passwordController = TextEditingController(text: "123456789");
  final _authService = AuthService();

  bool _loading = false;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please agree to terms and conditions")),
      );
      return;
    }

    setState(() => _loading = true);
    try {
      await _authService.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AppBottomBar()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login failed: ${e.toString()}")));
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: AppSizes.appBarHeight),
                      Image.asset(
                        AppAssets.logo,
                        width: width,
                        height: height * .2,
                      ),
                      const SizedBox(height: AppSizes.spaceBtwSections),

                      /// Email
                      LabeledTextField(
                        controller: _emailController,
                        label: 'Email',
                        hintText: 'Enter your email',
                      ),
                      const SizedBox(height: AppSizes.spaceBtwInputFields),

                      /// Password
                      LabeledTextField(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Enter your password',
                        obscure: true,
                      ),
                      const SizedBox(height: AppSizes.spaceBtwSections),

                      /// Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot password?',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.forgotPasswordColor),
                        ),
                      ),
                      const SizedBox(height: AppSizes.spaceBtwItems / 2),

                      /// Terms Checkbox
                      Row(
                        children: [
                          Checkbox(
                            activeColor: AppColors.primary,
                            side: BorderSide(color: AppColors.textPrimary),
                            value: _agreeToTerms,
                            onChanged: (value) {
                              setState(() => _agreeToTerms = value ?? false);
                            },
                          ),
                          Expanded(
                            child: Text(
                              'I agree with the terms and conditions',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.spaceBtwSections),

                      /// Signup RichText
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Login Button
              CustomButton(
                isGradiant: true,
                label: _loading ? "Logging in..." : "Login",
                onPressed: _loading ? null : _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
