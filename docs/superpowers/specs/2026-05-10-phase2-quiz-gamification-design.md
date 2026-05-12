# Phase 2: Quiz Experience + Full Gamification

**Date:** 2026-05-10
**Status:** Implemented

## Overview

Phase 2 focuses on improving the quiz experience with new question types, timer support, hints, and completing the gamification features with achievements screen and leaderboard.

## Changes Made

### 1. Quiz Experience Improvements (`lib/screens/quiz_screen.dart`)

#### New Question Types Added
| Type | Description |
|------|-------------|
| `dragDrop` | Drag-and-drop word ordering |
| `matching` | Match items from left to right columns |

#### Timer Support
- Optional timer per quiz via `timeLimitSeconds` parameter
- Visual countdown badge in header
- Auto-submit when timer runs out
- Warning animation when time is low (<30 seconds)

#### Hint System
- Optional hint per question via `hint` parameter
- Hint button with lightbulb icon
- Hint dialog on tap
- Tracks which questions had hints used

### 2. Quiz Model Updates (`lib/models/grammar_models.dart`)

```dart
class Quiz {
  final int? timeLimitSeconds; // Optional timer
}

class QuizQuestion {
  final String? hint;
  final List<String>? leftItems;    // For matching
  final List<String>? rightItems;  // For matching
  final List<int>? correctPairs;   // For matching
}
```

### 3. Achievements Screen (`lib/screens/achievements_screen.dart`)

New dedicated screen for viewing all achievements:
- Progress overview card with gradient background
- Grid of achievement badges (2 columns)
- Locked achievements show "???" instead of description
- Modal bottom sheet for achievement details
- Animated entrance with staggered list items

### 4. Leaderboard Screen (`lib/screens/leaderboard_screen.dart`)

Local leaderboard with simulated competitors:
- Podium section for top 3 with dynamic heights
- Rank badges (gold, silver, bronze colors)
- Leaderboard cards for ranks 4+
- User highlighted with different styling
- Animated entrance effects

### 5. Profile Screen Updates (`lib/screens/profile_screen.dart`)

Added navigation buttons:
- "View All Achievements" button → navigates to AchievementsScreen
- "Leaderboard" button → navigates to LeaderboardScreen

## Animation Specifications

### Timing
- Fade duration: 300-400ms
- Scale duration: 200-500ms
- Stagger delay: 50-100ms per item

### Curves
- Entry: `Curves.easeOutBack`
- Podium: `Curves.elasticOut`

## Testing Checklist

- [ ] Drag & drop question type works
- [ ] Matching question type works
- [ ] Timer countdown displays correctly
- [ ] Auto-submit when timer runs out
- [ ] Hint button shows hint dialog
- [ ] Achievements screen displays all badges
- [ ] Locked achievements show "???"
- [ ] Leaderboard shows podium correctly
- [ ] User entry highlighted in leaderboard
- [ ] Navigation buttons work

## Next Phase Considerations

Phase 3 will focus on:
- SRS/Flashcard improvement
- Content expansion
- Performance optimization
