import 'package:loop/src/imports/core_imports.dart';
import 'package:loop/src/imports/packages_imports.dart';
import 'package:loop/src/features/auth/providers/auth_provider.dart';
import 'package:loop/src/utils/body_params.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _userNameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _genderController = TextEditingController(text: 'Male');
  final _birthDateController = TextEditingController(text: '1995-05-10');

  @override
  void dispose() {
    _phoneController.dispose();
    _userNameController.dispose();
    _fullNameController.dispose();
    _genderController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerProvider);
    final isLoading = registerState.isLoading;

    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    Future<void> handleSignup() async {
      if (!(_formKey.currentState?.validate() ?? false)) return;
      final RegisterParams params =RegisterParams(
        phone: _phoneController.text,
        userName: _userNameController.text,
        fullName: _fullNameController.text,
        gender: _genderController.text,
        birthDate: _birthDateController.text,
      );
      ref.read(registerProvider.notifier).registerUser(context, params);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: AppSpacing.xl.h),
                Text(
                  'auth.sign_up'.tr(),
                  style: tt.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: AppSpacing.sm.h),
                Text(
                  'auth.sign_up_subtitle'.tr(),
                  textAlign: TextAlign.center,
                  style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
                SizedBox(height: AppSpacing.xxxl.h),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _phoneController,
                        enabled: !isLoading,
                        label: 'Phone (+966500000000)',
                        prefixIcon: const Icon(Icons.phone_outlined),
                          validator: (v)=>phoneValid(v)

                      ),
                      SizedBox(height: AppSpacing.md.h),
                      AppTextField(
                        controller: _userNameController,
                        enabled: !isLoading,
                        label: 'Username',
                        prefixIcon: const Icon(Icons.person_outline),
                        validator: requiredValidator
                      ),
                      SizedBox(height: AppSpacing.md.h),
                      AppTextField(
                        controller: _fullNameController,
                        enabled: !isLoading,
                        label: 'Full Name',
                        prefixIcon: const Icon(Icons.badge_outlined),
                          validator: requiredValidator

                      ),
                      SizedBox(height: AppSpacing.md.h),
                      AppTextField(
                        controller: _genderController,
                        enabled: !isLoading,
                        label: 'Gender',
                        prefixIcon: const Icon(Icons.wc_outlined),
                      ),
                      SizedBox(height: AppSpacing.md.h),
                      AppTextField(
                        controller: _birthDateController,
                        enabled: !isLoading,
                        label: 'Birth Date (YYYY-MM-DD)',
                        prefixIcon: const Icon(Icons.calendar_today_outlined),
                      ),
                      SizedBox(height: AppSpacing.lg.h),
                      AppButton(
                        label: 'Sign Up',
                        isLoading: isLoading,
                        onPressed: isLoading ? null : handleSignup,
                        width: ButtonSize.large,
                        isFullWidth: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.xxxl.h),
                InkWell(
                  onTap: () {
                    context.push(AppRoutes.login);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'auth.already_have_account'.tr(),
                      style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                      children: [
                        TextSpan(
                          text: 'auth.log_in'.tr(),
                          style: TextStyle(
                            color: cs.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSpacing.xl.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
