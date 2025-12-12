# State Management Rules
- Use BLoC for state management in all screens and features.
- Each feature must include:
  - page.dart
  - bloc.dart
  - event.dart
  - state.dart
- UI must only communicate with the Bloc using events and states.
- Do not use setState unless explicitly instructed.
- Business logic must only exist inside bloc.dart.

These rules MUST be followed exactly.

