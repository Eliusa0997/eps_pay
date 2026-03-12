// import 'package:eps_pay/core/theming/colors.dart';
// import 'package:flutter/material.dart';

// class SettingsItem extends StatelessWidget {
//       IconData icon;
//     String label;
//     Color iconColor;
//       Color bgColor {
//     String trailing;
//   }
//   const SettingsItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           children: [
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
//               child: Icon(icon, size: 20, color: iconColor),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 label,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//             ),
//             if (trailing != null) ...[
//               Text(
//                 trailing,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: AppColors.textSecondary,
//                 ),
//               ),
//               const SizedBox(width: 8),
//             ],
//             const Icon(
//               Icons.chevron_right,
//               color: AppColors.textSecondary,
//               size: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
