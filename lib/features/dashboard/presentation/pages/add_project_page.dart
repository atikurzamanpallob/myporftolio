import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';

import '../widgets/section_widget.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final List<String> _technologies = [];
  int option = -1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 1000;

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, isNarrow),
                  const SizedBox(height: 24),
                  isNarrow ? _buildStackedLayout() : _buildTwoColumnLayout(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isNarrow) {
    final titleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add New Project',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Fill in the details below to showcase your work.',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
      ],
    );

    final actions = Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _ghostButton('Cancel', onTap: () {}),
        _primaryButton('Publish Project', Icons.send_outlined, onTap: () {}),
      ],
    );

    if (isNarrow) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleBlock, const SizedBox(height: 16), actions],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: titleBlock),
        actions,
      ],
    );
  }

  Widget _buildTwoColumnLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildLeftColumn()),
        const SizedBox(width: 24),
        Expanded(flex: 1, child: _buildRightColumn()),
      ],
    );
  }

  Widget _buildStackedLayout() {
    return Column(
      children: [
        _buildLeftColumn(),
        const SizedBox(height: 24),
        _buildRightColumn(),
      ],
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      children: [
        SectionCard(
          title: 'Basic Information',
          child: Column(
            children: [
              ResponsiveFieldRow(
                children: [
                  LabeledField(
                    label: 'Project Title',
                    required: true,
                    hint: 'e.g. Shoply – E-commerce Mobile App',
                  ),
                  LabeledDropdown(
                    label: 'Project Type',
                    onSelected: (option) {
                      setState(() {
                        this.option = option;
                      });
                    },
                    required: true,
                    hint: 'Select project type',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ResponsiveFieldRow(
                children: [
                  const LabeledField(
                    label: 'Project Link',
                    hint: 'https://yourproject.com',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const ResponsiveFieldRow(children: [_ShortDescriptionField()]),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        SectionCard(
          title: 'Technologies Used',
          child: ChipInputField(
            hint: 'Add technologies and press Enter...',
            items: _technologies,
            onRemove: (i) => setState(() => _technologies.removeAt(i)),
            onAdd: (v) => setState(() => _technologies.add(v)),
          ),
        ),
      ],
    );
  }

  Widget _buildRightColumn() {
    return Column(
      children: [
        SectionCard(
          title: 'Thumbnails',
          child: Column(
            children: [
              const ScreenshotDropZone(),
              const SizedBox(height: 16),
              const ScreenshotThumbnailGrid(),
              const SizedBox(height: 16),
              _outlinedIconButton(
                'Add Images',
                Icons.add,
                fullWidth: true,
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _ghostButton(String label, {required VoidCallback onTap}) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textSecondary,
        side: const BorderSide(color: AppColors.fieldBorder),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  Widget _outlinedIconButton(
    String label,
    IconData icon, {
    required VoidCallback onTap,
    bool fullWidth = false,
  }) {
    final button = OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16, color: AppColors.accentBlueLight),
      label: Text(
        label,
        style: const TextStyle(
          color: AppColors.accentBlueLight,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.accentBlueLight),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  Widget _primaryButton(
    String label,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentBlue,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    );
  }
}

class _ShortDescriptionField extends StatefulWidget {
  const _ShortDescriptionField();

  @override
  State<_ShortDescriptionField> createState() => _ShortDescriptionFieldState();
}

class _ShortDescriptionFieldState extends State<_ShortDescriptionField> {
  final _controller = TextEditingController();
  int _len = 0;
  static const _max = 400;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldLabel(label: 'Short Description', required: true),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          maxLength: _max,
          minLines: 1,
          maxLines: 4,
          onChanged: (v) => setState(() => _len = v.length),
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          decoration: buildInputDecoration(
            'A short summary of the project',
          ).copyWith(counterText: ''),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$_len/$_max',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
