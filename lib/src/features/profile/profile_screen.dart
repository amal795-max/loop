import '../../imports/core_imports.dart';
import '../../imports/packages_imports.dart';
import 'provider/profile_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);
    final notifier = ref.read(profileNotifierProvider.notifier);

    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    final appColors = context.appColors;

    ref.listen(profileNotifierProvider, (previous, next) {
      if (next.errorMessage != null && next.errorMessage!.isNotEmpty) {
        showGlobalToast(message: next.errorMessage!, status: 'error');
      }
      if (next.isSuccess) {
        showGlobalToast(
          message: 'profile.updated_successfully'.tr(),
          status: 'success',
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 390,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg.w,
                      vertical: AppSpacing.md.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: AppSpacing.sm.h),
                        Text(
                          'profile.complete_profile'.tr(),
                          style: tt.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: cs.onSurface,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xs.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppSpacing
                              .md.w),
                          child: Text(
                            'profile.complete_profile_desc'.tr(),
                            textAlign: TextAlign.center,
                            style: tt.bodyMedium?.copyWith(
                              color: cs.onSurfaceVariant,
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSpacing.xl.h),

                        // PROFILE PHOTO WITH PICKER
                        GestureDetector(
                          onTap: () => notifier.pickImage(ImageSource.gallery),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                  width: 100.r,
                                  height: 100.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        appColors.info,
                                        appColors.success,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: cs.surface,
                                      backgroundImage: state.selectedImage !=
                                          null
                                          ? FileImage(state.selectedImage!)
                                          : (state.userInfo?.image !=
                                          null
                                          ? NetworkImage(
                                          state.userInfo!.image!)
                                          : null),
                                      child: (state.selectedImage == null &&
                                          state.userInfo?.image ==
                                              null)
                                          ? Text(
                                        state.fullName.substring(0, 1),
                                        style: tt.headlineSmall?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: cs.onSurface,
                                        ),
                                      )
                                          : null,
                                    ),
                                  )
                              ),
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: appColors.info,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: cs.surface, width: 2),
                                ),
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 16,
                                  color: appColors.onSuccess,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSpacing.md.h),
                        Text(
                          'profile.upload_photo_optional'.tr(),
                          style: tt.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: AppSpacing.lg.h),

                        _ProfileFieldRow(
                          labelKey: 'profile.full_name',
                          value: state.fullName,
                          required: true,
                          trailing: Icon(Icons.check_circle,
                              color: appColors.info),
                        ),
                        SizedBox(height: AppSpacing.sm.h),

                        _ProfileFieldRow(
                          labelKey: 'profile.username',
                          value: 'ahmed_0000',
                          trailing: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              'available'.tr(),
                              style: tt.labelSmall?.copyWith(
                                color: appColors.success,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm.h),

                        const _ProfileFieldRow(
                          labelKey: 'profile.mobile_number',
                          value: '+966 50 000 0000',
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            // children: [
                            //   Icon(Icons.verified, color: appColors.info, size: 18),
                            //   const SizedBox(width: 4),
                            //   Text(
                            //     'profile.otp_verified',
                            //     style: tt.labelSmall?.copyWith(
                            //       color: appColors.info,
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //   ),
                            // ],
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm.h),

                        // GENDER SELECTOR
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 12,
                              vertical: 8),
                          decoration: BoxDecoration(
                            color: cs.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: cs.outlineVariant),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person_outline, color: appColors.info),
                              const SizedBox(width: 12),
                              Text(
                                'profile.gender'.tr(),
                                style: tt.bodyLarge?.copyWith(
                                  color: cs.onSurface,
                                ),
                              ),
                              const Spacer(),
                              _GenderChoice(
                                label: 'Male',
                                selected: state.gender.toLowerCase() == 'male',
                                onTap: () => notifier.setGender('Male'),
                              ),
                              const SizedBox(width: 10),
                              _GenderChoice(
                                label: 'Female',
                                selected: state.gender.toLowerCase() ==
                                    'female',
                                onTap: () => notifier.setGender('Female'),
                              ),
                              const SizedBox(width: 10),
                              _GenderChoice(
                                label: 'Other',
                                selected: state.gender.toLowerCase() == 'other',
                                onTap: () => notifier.setGender('Other'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSpacing.lg.h),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 12,
                              vertical: 12),
                          decoration: BoxDecoration(
                            color: cs.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: cs.outlineVariant),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.edit_note, color: appColors.info),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Bio',
                                    style: tt.bodyLarge?.copyWith(
                                        color: cs.onSurface),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              AppTextField(
                                  onChanged: notifier.setBio,
                                validator: notRequiredValidator,


                              )
                            ],
                          ),
                        ),
                        SizedBox(height: AppSpacing.lg.h),

                        AppButton(
                          label: 'complete_registration'.tr(),
                          isFullWidth: true,
                          isLoading: state.isLoading,
                          onPressed: state.isLoading
                              ? null
                              : () => notifier.submitProfileUpdate(),
                          height: ButtonSize.medium,
                        ),
                        SizedBox(height: AppSpacing.xl.h),
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
  }
}

class _ProfileFieldRow extends StatelessWidget {
  const _ProfileFieldRow({
    required this.labelKey,
    required this.value,
    this.required = false,
    this.trailing,
  });

  final String labelKey;
  final String value;
  final bool required;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    final label = labelKey.tr();

    return AppCard(
      color: cs.surface,
      padding: EdgeInsets.zero,
      leading: Icon(
        _fieldIcon(labelKey),
        size: 18,
        color: context.appColors.info,
      ),
      title: label,
      subtitle: value,
      child: const SizedBox(),


    );
  }

  IconData _fieldIcon(String key) {
    switch (key) {
      case 'profile.full_name':
        return Icons.person_outline;
      case 'profile.username':
        return Icons.alternate_email;
      case 'profile.mobile_number':
        return Icons.phone_iphone_outlined;
      default:
        return Icons.info_outline;
    }
  }
}

class _GenderChoice extends StatelessWidget {
  const _GenderChoice({
    required this.label,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? cs.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: tt.labelSmall?.copyWith(
            color: selected ? cs.onPrimary : cs.onSurfaceVariant,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}