import '../../imports/core_imports.dart';
import '../../imports/packages_imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    final appColors = context.appColors;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 390,
            child: Column(
              children: [
                // BODY
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
                          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w),
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

                        // PROFILE PHOTO
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius:50.r,
                              child: Center(
                                child: Text(
                                  'AA',
                                  style: tt.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: cs.onSurface,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: cs.primary,
                                shape: BoxShape.circle,
                                border: Border.all(color: cs.surface, width: 2),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 16,
                                color: cs.onPrimary,
                              ),
                            ),
                          ],
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
                          value: 'Ahmed Ali',
                          required: true,
                          trailing: Icon(Icons.check_circle, color: appColors.info),
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

                        _ProfileFieldRow(
                          labelKey: 'profile.mobile_number',
                          value: '+966 50 000 0000',
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.verified, color: appColors.info, size: 18),
                              const SizedBox(width: 4),
                              Text(
                                'profile.otp_verified',
                                style: tt.labelSmall?.copyWith(
                                  color: appColors.info,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: AppSpacing.sm.h),

                        _ProfileFieldRow(
                          labelKey: 'profile.dob',
                          value: '05/10/1995',
                          trailing: Text(
                            'profile.used_for_verification'.tr(),
                            style: tt.labelSmall?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                        ),

                        SizedBox(height: AppSpacing.lg.h),

                        // GENDER
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: cs.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: cs.outlineVariant),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person_outline, color: cs.onSurface),
                              const SizedBox(width: 12),
                              Text(
                                'profile.gender'.tr(),
                                style: tt.bodyLarge?.copyWith(
                                  color: cs.onSurface,
                                ),
                              ),
                              const Spacer(),
                              _GenderChoice(label: 'male'.tr(), selected: true),
                              const SizedBox(width: 10),
                              _GenderChoice(label: 'female'.tr()),
                              const SizedBox(width: 10),
                              _GenderChoice(label: 'other'.tr()),
                            ],
                          ),
                        ),

                        SizedBox(height: AppSpacing.lg.h),

                        AppButton(
                          label: 'complete_registration'.tr(),
                          isFullWidth: true,
                          onPressed: () {},
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
    required this.labelKey,   // مفتاح الترجمة وليس النص
    required this.value,
    this.required = false,
    this.trailing,
  });

  final String labelKey; // مثال: "profile.full_name"
  final String value;
  final bool required;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    final label = labelKey.tr();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            _fieldIcon(labelKey), // يعتمد على المفتاح وليس الترجمة
            size: 18,
            color: cs.onSurfaceVariant,
          ),

          const SizedBox(width: 10),

          /// LABEL
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    label,
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (required) ...[
                  const SizedBox(width: 4),
                  Text(
                    '*',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// VALUE
          Flexible(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: tt.bodyMedium?.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          if (trailing != null) ...[
            const SizedBox(width: 12),
            trailing!,
          ],
        ],
      ),
    );
  }

  /// يعتمد على المفتاح وليس النص المترجم
  IconData _fieldIcon(String key) {
    switch (key) {
      case 'profile.full_name':
        return Icons.person_outline;
      case 'profile.username':
        return Icons.alternate_email;
      case 'profile.mobile_number':
        return Icons.phone_iphone_outlined;
      case 'profile.dob':
        return Icons.calendar_today_outlined;
      default:
        return Icons.info_outline;
    }
  }
}

class _GenderChoice extends StatelessWidget {
  const _GenderChoice({
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    return Container(
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
    );
  }
}
