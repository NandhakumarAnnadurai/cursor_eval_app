# API Layer Rules (IMPORTANT)

- API calls MUST NOT be made inside:
  - UI widgets (page.dart)
  - Bloc files (bloc.dart)
  - State or Event files

- All API calls must be handled ONLY through:
  1. APIService (low-level API handler)
  2. Repository classes (middle layer)

- APIService → contains HTTP logic (Dio, headers, base URL, parsing)
- Repository → calls APIService methods and converts data into models/entities

Correct data flow:
UI → Bloc → Repository → APIService → API → back to Repository → Bloc → UI

Rules:
- Bloc MUST call only the repository, never APIService directly.
- APIService must not contain business logic.
- Repository must not contain UI logic.
- Models must be created only in the data layer.

These rules MUST be enforced exactly.

