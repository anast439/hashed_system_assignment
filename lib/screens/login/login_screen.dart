// lib/screens/login/login_screen.dart
import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_assets.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/sizes.dart';
import 'package:hashed_system_assignment/widgets/custom_button.dart';
import 'package:hashed_system_assignment/widgets/custom_text_field.dart';
import '../../services/auth_service.dart';
import '../dashboard/dashboard.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController =
  TextEditingController(text: "temp17706@gmail.com");
  final _passwordController =
  TextEditingController(text: "123456789");
  final _authService = AuthService();
  bool _loading = false;

  void _login() async {
    setState(() => _loading = true);
    try {
      final res = await _authService.login(
          _emailController.text, _passwordController.text);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Dashboard()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: $e")),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {

final width=MediaQuery.sizeOf(context).width;
final height=MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              
              SizedBox(height: USizes.appBarHeight),
                    Container(
                        child: Image.asset(AppAssets.logo,width:width,height: height * .2 )),
                    
                SizedBox(height: USizes.spaceBtwSections ),
                
                    TextFieldWithLabelText(emailController: _emailController, label: 'Email', hintText: 'Email',),
                    SizedBox(height: USizes.spaceBtwInputFields),
                    TextFieldWithLabelText(emailController: _passwordController, label: 'Password', hintText: 'Password',
                    obscure: true,
                    ),
                SizedBox(height: USizes.spaceBtwSections),
                
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot password?',
                
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.forgotPasswordColor),),
                    ),
                    SizedBox(height: USizes.spaceBtwItems /2),
                
                    Row(
                      children: [
                        Checkbox(
                            side: BorderSide(
                              color: AppColors.textPrimary
                            ),
                            value: false, onChanged: (value){}),
                        Text('I agree with the terms and condition',style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    ),
                SizedBox(height: USizes.spaceBtwSections,),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "Don't have an account? ",style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'SignUp',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.primary,fontWeight: FontWeight.bold))
                      ]
                    ))
                
                
              
                  ],
                ),
              ),
            ),
            CustomButton(
              isGradiant: true,
              label: _loading ? "Logging in..." : "Login",
              onPressed: _loading ? null : _login,
            ),
          ],
        ),
      ),
   
     
    );
  }
}

class TextFieldWithLabelText extends StatelessWidget {
  const TextFieldWithLabelText({
    super.key,
    required TextEditingController emailController, required this.hintText, required this.label,
this.obscure=false
  }) :  _emailController = emailController;

  final TextEditingController _emailController;
  final String label;
  final String hintText;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(
          height: USizes.spaceBtwItems,
        ),
        CustomTextField(
            obscure: obscure,
            controller: _emailController, hint: hintText),
      ],
    );
  }
}
