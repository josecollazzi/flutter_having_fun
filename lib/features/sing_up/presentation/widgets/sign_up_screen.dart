import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/features/core/presentation/having_fun_app_bar.dart';
import 'package:layout2/features/core/view_models/current_user_provider.dart';
import 'package:layout2/features/sing_up/presentation/view_models/sign_up_view_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _agreeToTerms = false;
  String? _termsError;

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();

    setState(() {
      _termsError = _agreeToTerms ? null : "You must agree with Terms & Conditions.";
    });

    if (!isValid || !_agreeToTerms) return;

    ref.read(signUpNotifierProvider.notifier).signUpUser(_emailController.text);

    _emailController.clear();
    setState(() {
      _agreeToTerms = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HavingFunAppBar(titleText: "Sign Up",),
      body: ref.watch(currentUserProvider).when(
          data: (user)=> user == null ? _displayForm(): _displaySaved(),
          error: (e,__) => Center(child: Text("error"),) ,
          loading: ()=> Center(child: CircularProgressIndicator(),)),
    );
  }

  Widget _displayForm() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email input
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                final emailRegex =
                RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                if (!emailRegex.hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Checkbox
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value!;
                          if (_agreeToTerms) _termsError = null; // clear error when checked
                        });
                      },
                    ),
                    const Expanded(
                      child: Text("I agree with Terms & Conditions"),
                    ),
                  ],
                ),

                if (_termsError != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      _termsError!,
                      style: TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 16),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveForm,
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displaySaved() {
    return Center(child: Text("Welcome to having fun app"),);
  }
}
