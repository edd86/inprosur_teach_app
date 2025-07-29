import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/core/constants/app_routes.dart';
import 'package:inprosur_teach_app/core/constants/some_styles.dart';
import 'package:inprosur_teach_app/data/repositories/student_repository_impl.dart';
import 'package:inprosur_teach_app/domain/entities/student_entity.dart';
import 'package:inprosur_teach_app/presentation/providers/manual_loading_provider.dart';
import 'package:inprosur_teach_app/presentation/widgets/custom_input_label.dart';
import 'package:sizer/sizer.dart';

class StudentDataPage extends ConsumerStatefulWidget {
  final int userId;
  const StudentDataPage({required this.userId, super.key});

  @override
  ConsumerState<StudentDataPage> createState() => _StudentDataPageState();
}

class _StudentDataPageState extends ConsumerState<StudentDataPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Complete su registro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 5.h, horizontal: 15.w),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  style: SomeStyles.textFormField,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    label: CustomInputLabel(
                      icon: Icons.person,
                      label: 'Nombre completo',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Llene este campo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.5.h),
                TextFormField(
                  controller: _phoneController,
                  style: SomeStyles.textFormField,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    label: CustomInputLabel(
                      icon: Icons.phone_android,
                      label: 'Teléfono',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Llene este campo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.5.h),
                TextFormField(
                  controller: _addressController,
                  style: SomeStyles.textFormField,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    label: CustomInputLabel(
                      icon: Icons.house_rounded,
                      label: 'Dirección',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Llene este campo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 3.5.h),
                ElevatedButton(
                  child: SizedBox(
                    width: 90.w,
                    child: Center(child: Text('Registrar')),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String name = _nameController.text;
                      String phone = _phoneController.text;
                      String address = _addressController.text;
                      ref.read(manualLoadingProvider.notifier).state = true;
                      try {
                        final newStudent = await StudentRepositoryImpl()
                            .registerStudent(
                              StudentEntity(
                                name: name,
                                phone: phone,
                                address: address,
                                userId: widget.userId,
                              ),
                            );
                        if (newStudent != null) {
                          _showScaffoldMessage('Usuario Registrado');
                          _backToHome();
                        }
                      } catch (e) {
                        _showScaffoldMessage(e.toString());
                      } finally {
                        ref.read(manualLoadingProvider.notifier).state = false;
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showScaffoldMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _backToHome() {
    Navigator.popAndPushNamed(context, AppRoutes.homePage);
  }
}
