# Folder Structure Rules (Feature-first + Reusable Widgets)

Every feature or screen must follow this structure:

feature_name/
  page.dart      → UI screen
  bloc.dart      → Business logic
  event.dart     → Bloc events
  state.dart     → Bloc states

Global reusable widgets must be placed under:
lib/common/widgets/

Reusable widget file structure:
lib/common/widgets/
  widget_name_widget.dart

Rules:
- All reusable widgets must be placed under lib/common/widgets.
- A reusable widget MUST NOT contain feature-specific logic.
- Reusable widgets must be stateless unless explicitly stateful.
- Reusable widgets must be customizable via parameters.

These rules MUST be followed exactly.

