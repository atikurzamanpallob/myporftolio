import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:myportfolioapp/features/contact/presentation/bloc/contact_event.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _submitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _submitting = true);

    // No backend is wired up yet — simulate a send and let the user know.
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      setState(() => _submitting = false);
      context.read<ContactBloc>().add(
        ContactEmailSendEvent(
          name: _nameController.text,
          email: _emailController.text,
          subject: _subjectController.text,
          message: _messageController.text,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Thanks! I'll get back to you within 24 hours."),
        ),
      );
      _formKey.currentState?.reset();
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Me a Message',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 18.h),
            _FormField(
              controller: _nameController,
              prefixIcon: Icons.person_outlined,
              hint: 'Your Name',
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Please enter your name'
                  : null,
            ),
            SizedBox(height: 14.h),
            _FormField(
              controller: _emailController,
              prefixIcon: Icons.email_outlined,
              hint: 'Your Email',
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                if (!emailRegex.hasMatch(v.trim())) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 14.h),
            _FormField(
              controller: _subjectController,
              prefixIcon: Icons.topic_outlined,
              hint: 'Subject',
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Please enter a subject'
                  : null,
            ),
            SizedBox(height: 14.h),
            _FormField(
              controller: _messageController,
              hint: 'Message',
              maxLines: 6,
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Please enter a message'
                  : null,
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitting ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  disabledBackgroundColor: AppColors.primaryBlue.withValues(
                    alpha: 0.6,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  elevation: 0,
                ),
                child: _submitting
                    ? SizedBox(
                        width: 20.r,
                        height: 20.r,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Send Message',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.controller,
    required this.hint,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(
        color: Colors.white,
        fontSize: 13.sp,
        fontFamily: AppFonts.inter,
      ),

      cursorColor: AppColors.primaryBlue,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        hintStyle: TextStyle(
          color: AppColors.textMuted,
          fontSize: 13.sp,
          fontFamily: AppFonts.inter,
        ),
        filled: true,
        fillColor: AppColors.cardBackground,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: maxLines > 1 ? 14.h : 16.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.primaryBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
