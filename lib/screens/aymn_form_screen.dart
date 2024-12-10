import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/aymn_text_field.dart';
import '../utils/validation_utils.dart';

class AYMNFormScreen extends StatefulWidget {
  const AYMNFormScreen({Key? key}) : super(key: key);

  @override
  State<AYMNFormScreen> createState() => _AYMNFormScreenState();
}

class _AYMNFormScreenState extends State<AYMNFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _textController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _textController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال النموذج بنجاح!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نموذج أيمن'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AYMNTextField(
                  label: 'البريد الإلكتروني',
                  controller: _emailController,
                  validator: ValidationUtils.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'أدخل بريدك الإلكتروني',
                ),
                AYMNTextField(
                  label: 'رقم الهاتف',
                  controller: _phoneController,
                  validator: ValidationUtils.validatePhone,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9),
                  ],
                  hintText: '77XXXXXXX',
                ),
                AYMNTextField(
                  label: 'النص العربي',
                  controller: _textController,
                  validator: ValidationUtils.validateText,
                  hintText: 'أدخل نصاً باللغة العربية',
                ),
                AYMNTextField(
                  label: ' العمر',
                  controller: _numberController,
                  validator: ValidationUtils.validateNumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  hintText: 'أدخل أرقاماً فقط',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'إرسال',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
