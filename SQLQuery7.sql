-- =============================================
-- FitLifeHub - Sample Content Population Script
-- This adds realistic workout plans, exercises, and articles
-- =============================================

USE FitLifeHubDB;
GO

PRINT 'Populating FitLifeHub with sample content...';
PRINT '';

-- =============================================
-- 1. ADD SAMPLE EXERCISES
-- =============================================
PRINT '💪 Adding exercises...';

DECLARE @TrainerID INT = 2; -- Trainer user ID

-- Strength Exercises
INSERT INTO Exercises (ExerciseName, Description, Instructions, MuscleGroup, SecondaryMuscles, EquipmentRequired, DifficultyLevel, VideoURL, CaloriesPerRep, SafetyTips, TrainerID, IsActive)
VALUES 
('Push-ups', 'Classic upper body exercise targeting chest and triceps', 
'Start in plank position. Lower body until chest nearly touches floor. Push back up to starting position.', 
'Chest', 'Triceps, Shoulders', 'None', 'Beginner', 
'https://www.youtube.com/embed/IODxDxX7oi4', 0.5,
'Keep your core engaged. Don''t let hips sag. Breathe out when pushing up.',
@TrainerID, 1),

('Squats', 'Fundamental lower body exercise for legs and glutes',
'Stand with feet shoulder-width apart. Lower hips back and down as if sitting. Return to standing.',
'Quadriceps', 'Glutes, Hamstrings, Core', 'None', 'Beginner',
'https://www.youtube.com/embed/aclHkVaku9U', 0.4,
'Keep knees aligned with toes. Chest up, back straight. Don''t let knees cave inward.',
@TrainerID, 1),

('Plank', 'Core strengthening isometric hold',
'Hold a push-up position with forearms on ground. Keep body straight from head to heels.',
'Core', 'Shoulders, Glutes', 'None', 'Beginner',
'https://www.youtube.com/embed/pSHjTRCQxIw', 0.3,
'Don''t let hips sag or pike up. Engage your abs. Breathe normally.',
@TrainerID, 1),

('Lunges', 'Single-leg exercise for legs and balance',
'Step forward with one leg. Lower hips until both knees are at 90 degrees. Return to start. Alternate legs.',
'Quadriceps', 'Glutes, Hamstrings, Calves', 'None', 'Beginner',
'https://www.youtube.com/embed/QOVaHwm-Q6U', 0.6,
'Keep front knee aligned with ankle. Don''t let front knee go past toes. Maintain upright torso.',
@TrainerID, 1),

('Burpees', 'Full-body explosive cardio exercise',
'From standing, drop to squat, kick feet back to plank, do push-up, jump feet to hands, jump up.',
'Full Body', 'Chest, Legs, Shoulders, Core', 'None', 'Advanced',
'https://www.youtube.com/embed/JZQA08SlJnM', 1.2,
'Land softly. Keep core engaged throughout. Modify by stepping back instead of jumping.',
@TrainerID, 1),

('Mountain Climbers', 'Dynamic core and cardio exercise',
'Start in plank position. Bring one knee to chest, then quickly switch legs in running motion.',
'Core', 'Shoulders, Hip Flexors', 'None', 'Intermediate',
'https://www.youtube.com/embed/nmwgirgXLYM', 0.8,
'Keep hips level. Don''t bounce. Maintain plank position throughout.',
@TrainerID, 1),

('Jumping Jacks', 'Classic cardio warm-up exercise',
'From standing, jump feet wide while raising arms overhead. Return to start.',
'Full Body', 'Calves, Shoulders', 'None', 'Beginner',
'https://www.youtube.com/embed/c4DAnQ6DtF8', 0.3,
'Land softly on balls of feet. Maintain steady rhythm. Keep core engaged.',
@TrainerID, 1),

('Dumbbell Bicep Curls', 'Isolation exercise for biceps',
'Hold dumbbells at sides. Curl weights up to shoulders while keeping elbows stationary. Lower slowly.',
'Biceps', 'Forearms', 'Dumbbells', 'Beginner',
'https://www.youtube.com/embed/ykJmrZ5v0Oo', 0.4,
'Don''t swing the weights. Keep elbows close to body. Control the movement.',
@TrainerID, 1),

('Dumbbell Shoulder Press', 'Overhead pressing for shoulder strength',
'Hold dumbbells at shoulder height. Press weights overhead until arms are straight. Lower to start.',
'Shoulders', 'Triceps, Upper Chest', 'Dumbbells', 'Intermediate',
'https://www.youtube.com/embed/qEwKCR5JCog', 0.7,
'Don''t arch back excessively. Keep core tight. Press straight up, not forward.',
@TrainerID, 1),

('Russian Twists', 'Rotational core exercise',
'Sit with knees bent, lean back slightly. Rotate torso side to side, touching floor beside hips.',
'Core', 'Obliques', 'None', 'Intermediate',
'https://www.youtube.com/embed/wkD8rjkodUI', 0.5,
'Keep chest up. Move with control, not momentum. Can hold weight for added difficulty.',
@TrainerID, 1),

('Glute Bridges', 'Hip extension exercise for glutes',
'Lie on back, knees bent, feet flat. Lift hips until body forms straight line. Lower slowly.',
'Glutes', 'Hamstrings, Lower Back', 'None', 'Beginner',
'https://www.youtube.com/embed/OUgsJ8-Vi0E', 0.4,
'Squeeze glutes at top. Don''t hyperextend back. Push through heels.',
@TrainerID, 1),

('High Knees', 'Cardio exercise for leg power',
'Run in place, bringing knees up to hip level with each step. Pump arms.',
'Hip Flexors', 'Quadriceps, Calves, Core', 'None', 'Beginner',
'https://www.youtube.com/embed/8opcQdC-V-U', 0.9,
'Land on balls of feet. Keep upper body upright. Drive knees up explosively.',
@TrainerID, 1);

PRINT '✅ Added ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' exercises';
PRINT '';

-- =============================================
-- 2. CREATE SAMPLE WORKOUT PLANS
-- =============================================
PRINT '🏋️ Creating workout plans...';

DECLARE @WorkoutID INT;

-- Get category IDs
DECLARE @StrengthCat INT = (SELECT CategoryID FROM WorkoutCategories WHERE CategoryName = 'Strength Training');
DECLARE @CardioCat INT = (SELECT CategoryID FROM WorkoutCategories WHERE CategoryName = 'Cardio');
DECLARE @HIITCat INT = (SELECT CategoryID FROM WorkoutCategories WHERE CategoryName = 'HIIT');
DECLARE @CoreCat INT = (SELECT CategoryID FROM WorkoutCategories WHERE CategoryName = 'Core Training');

-- Workout 1: Beginner Full Body
INSERT INTO Workouts (WorkoutName, Description, CategoryID, DifficultyLevel, DurationMinutes, CaloriesBurned, EquipmentNeeded, TargetMuscleGroups, TrainerID, IsPublished, CreatedDate)
VALUES 
('Beginner Full Body Blast', 
'Perfect for fitness newcomers! This full-body workout builds foundational strength using just your bodyweight. Great for building confidence and establishing exercise habits.',
@StrengthCat, 'Beginner', 30, 250, 'None - Bodyweight Only', 
'Chest, Legs, Core, Arms', @TrainerID, 1, GETDATE());

SET @WorkoutID = SCOPE_IDENTITY();

-- Link exercises to workout
INSERT INTO WorkoutExercises (WorkoutID, ExerciseID, ExerciseOrder, Sets, Reps, DurationSeconds, RestSeconds, Notes)
VALUES 
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Jumping Jacks'), 1, 1, 30, 60, 30, 'Warm-up: Get blood flowing'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Push-ups'), 2, 3, 10, NULL, 45, 'Can do on knees if needed'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Squats'), 3, 3, 15, NULL, 45, 'Focus on form over speed'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Plank'), 4, 3, NULL, 30, 60, 'Hold steady position'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Lunges'), 5, 3, 10, NULL, 45, '10 reps each leg'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Glute Bridges'), 6, 3, 15, NULL, 45, 'Squeeze glutes at top');

-- Workout 2: HIIT Cardio Burn
INSERT INTO Workouts (WorkoutName, Description, CategoryID, DifficultyLevel, DurationMinutes, CaloriesBurned, EquipmentNeeded, TargetMuscleGroups, TrainerID, IsPublished, CreatedDate)
VALUES 
('HIIT Cardio Inferno', 
'Torch calories with this high-intensity interval workout! Short bursts of maximum effort followed by active recovery. Perfect for fat burning and cardiovascular fitness.',
@HIITCat, 'Intermediate', 20, 350, 'None - Bodyweight Only', 
'Full Body, Cardiovascular System', @TrainerID, 1, GETDATE());

SET @WorkoutID = SCOPE_IDENTITY();

INSERT INTO WorkoutExercises (WorkoutID, ExerciseID, ExerciseOrder, Sets, Reps, DurationSeconds, RestSeconds, Notes)
VALUES 
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Jumping Jacks'), 1, 1, NULL, 120, 30, 'Warm-up thoroughly'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Burpees'), 2, 4, NULL, 30, 30, 'All-out effort!'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'High Knees'), 3, 4, NULL, 30, 30, 'Fast pace'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Mountain Climbers'), 4, 4, NULL, 30, 30, 'Keep hips down'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Jumping Jacks'), 5, 1, NULL, 180, 0, 'Cool-down recovery');

-- Workout 3: Core Crusher
INSERT INTO Workouts (WorkoutName, Description, CategoryID, DifficultyLevel, DurationMinutes, CaloriesBurned, EquipmentNeeded, TargetMuscleGroups, TrainerID, IsPublished, CreatedDate)
VALUES 
('Core Crusher Circuit', 
'Sculpt your abs and strengthen your entire core! This workout targets all core muscles for improved stability, posture, and that coveted six-pack definition.',
@CoreCat, 'Intermediate', 25, 200, 'None - Bodyweight Only', 
'Abs, Obliques, Lower Back', @TrainerID, 1, GETDATE());

SET @WorkoutID = SCOPE_IDENTITY();

INSERT INTO WorkoutExercises (WorkoutID, ExerciseID, ExerciseOrder, Sets, Reps, DurationSeconds, RestSeconds, Notes)
VALUES 
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Plank'), 1, 3, NULL, 45, 30, 'Hold strong'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Russian Twists'), 2, 3, 20, NULL, 30, '10 each side'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Mountain Climbers'), 3, 3, 30, NULL, 45, 'Controlled movement'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Glute Bridges'), 4, 3, 20, NULL, 30, 'Engage core throughout');

-- Workout 4: Upper Body Strength
INSERT INTO Workouts (WorkoutName, Description, CategoryID, DifficultyLevel, DurationMinutes, CaloriesBurned, EquipmentNeeded, TargetMuscleGroups, TrainerID, IsPublished, CreatedDate)
VALUES 
('Upper Body Power Builder', 
'Build serious upper body strength! This dumbbell-based workout targets chest, shoulders, back, and arms for balanced muscle development and functional strength.',
@StrengthCat, 'Intermediate', 35, 280, 'Dumbbells (2 sets: Light & Medium)', 
'Chest, Shoulders, Back, Biceps, Triceps', @TrainerID, 1, GETDATE());

SET @WorkoutID = SCOPE_IDENTITY();

INSERT INTO WorkoutExercises (WorkoutID, ExerciseID, ExerciseOrder, Sets, Reps, DurationSeconds, RestSeconds, Notes)
VALUES 
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Push-ups'), 1, 3, 12, NULL, 60, 'Warm-up the chest'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Dumbbell Shoulder Press'), 2, 4, 10, NULL, 75, 'Use medium weight'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Dumbbell Bicep Curls'), 3, 3, 12, NULL, 60, 'Controlled reps'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Push-ups'), 4, 3, 15, NULL, 60, 'Burnout set');

-- Workout 5: Lower Body Strength
INSERT INTO Workouts (WorkoutName, Description, CategoryID, DifficultyLevel, DurationMinutes, CaloriesBurned, EquipmentNeeded, TargetMuscleGroups, TrainerID, IsPublished, CreatedDate)
VALUES 
('Leg Day Dominator', 
'Never skip leg day! This intense lower body workout builds powerful legs and glutes. Perfect for athletes and anyone wanting stronger, more defined legs.',
@StrengthCat, 'Advanced', 40, 400, 'None - Bodyweight Only', 
'Quadriceps, Hamstrings, Glutes, Calves', @TrainerID, 1, GETDATE());

SET @WorkoutID = SCOPE_IDENTITY();

INSERT INTO WorkoutExercises (WorkoutID, ExerciseID, ExerciseOrder, Sets, Reps, DurationSeconds, RestSeconds, Notes)
VALUES 
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Squats'), 1, 5, 20, NULL, 60, 'Deep squats'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Lunges'), 2, 4, 15, NULL, 60, '15 each leg'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Glute Bridges'), 3, 4, 20, NULL, 45, 'Single leg for advanced'),
(@WorkoutID, (SELECT ExerciseID FROM Exercises WHERE ExerciseName = 'Squats'), 4, 3, 30, NULL, 90, 'Burnout set - lighter pace');

PRINT '✅ Created 5 complete workout plans';
PRINT '';

-- =============================================
-- 3. ADD SAMPLE FITNESS ARTICLES
-- =============================================
PRINT '📚 Adding fitness articles...';

INSERT INTO FitnessArticles (Title, Slug, Summary, Content, CategoryTags, AuthorID, IsPublished, IsFeatured, PublishedDate, ViewCount)
VALUES 
('10 Beginner Mistakes to Avoid in the Gym',
'10-beginner-mistakes-avoid-gym',
'Starting your fitness journey? Learn the most common mistakes new gym-goers make and how to avoid them for faster results and injury prevention.',
'<h2>Introduction</h2><p>Every fitness expert was once a beginner. The key to success is learning from common mistakes before they become habits. Here are the 10 most common beginner mistakes and how to avoid them...</p><h3>1. Skipping the Warm-Up</h3><p>Many beginners jump straight into intense exercise. Always spend 5-10 minutes warming up to prevent injury and improve performance...</p><h3>2. Poor Form Over Heavy Weight</h3><p>Don''t sacrifice form for heavier weights. Perfect form with lighter weight builds better muscle and prevents injury...</p>',
'Beginner Tips, Training, Fitness Basics',
@TrainerID, 1, 1, GETDATE(), 234),

('The Science of Progressive Overload',
'science-progressive-overload',
'Understanding progressive overload is the key to continuous fitness gains. Learn how to systematically increase your training intensity for optimal results.',
'<h2>What is Progressive Overload?</h2><p>Progressive overload is the gradual increase of stress placed on the body during training. It''s the fundamental principle behind all strength and muscle gains...</p><h3>Methods of Progressive Overload</h3><ul><li>Increasing weight</li><li>Increasing reps</li><li>Increasing sets</li><li>Decreasing rest time</li><li>Increasing training frequency</li></ul>',
'Training Science, Strength Training, Muscle Building',
@TrainerID, 1, 0, GETDATE(), 567),

('Nutrition Basics: Eating for Fitness Goals',
'nutrition-basics-fitness-goals',
'Your diet is 80% of your results. Learn the fundamental nutrition principles to support your fitness goals, whether you''re building muscle or losing fat.',
'<h2>Calories: The Foundation</h2><p>Understanding calories in vs. calories out is crucial. To lose fat, eat in a caloric deficit. To build muscle, eat in a slight surplus...</p><h3>Macronutrients Explained</h3><p><strong>Protein:</strong> Essential for muscle repair and growth. Aim for 0.8-1g per pound of bodyweight...</p><p><strong>Carbohydrates:</strong> Your body''s primary energy source. Essential for intense workouts...</p>',
'Nutrition, Diet, Weight Loss, Muscle Building',
@TrainerID, 1, 1, GETDATE(), 892),

('Recovery: The Most Underrated Fitness Tool',
'recovery-most-underrated-fitness-tool',
'Training hard is important, but recovery is where the magic happens. Discover why rest days are crucial and how to optimize your recovery.',
'<h2>Why Recovery Matters</h2><p>Muscle growth doesn''t happen in the gym—it happens during recovery. When you work out, you create micro-tears in muscle fibers. Recovery is when your body repairs these tears, making muscles stronger...</p><h3>Recovery Strategies</h3><ul><li>Sleep 7-9 hours per night</li><li>Active recovery (walking, stretching)</li><li>Proper nutrition</li><li>Hydration</li><li>Foam rolling</li></ul>',
'Recovery, Rest Days, Sleep, Injury Prevention',
@TrainerID, 1, 0, GETDATE(), 445);

PRINT '✅ Added ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' articles';
PRINT '';

-- =============================================
-- SUMMARY
-- =============================================
PRINT '📊 DATABASE POPULATION COMPLETE!';
PRINT '';
PRINT '==============================================';
PRINT 'CONTENT SUMMARY:';
PRINT '==============================================';
SELECT 'Exercises' as ContentType, COUNT(*) as Count FROM Exercises
UNION ALL
SELECT 'Workouts', COUNT(*) FROM Workouts
UNION ALL
SELECT 'Workout-Exercise Links', COUNT(*) FROM WorkoutExercises
UNION ALL
SELECT 'Fitness Articles', COUNT(*) FROM FitnessArticles
UNION ALL
SELECT 'Users', COUNT(*) FROM Users
UNION ALL
SELECT 'Categories', COUNT(*) FROM WorkoutCategories;

PRINT '';
PRINT '✅ Your FitLifeHub database is now fully populated!';
PRINT '';
PRINT '🎯 Next Steps:';
PRINT '   1. Test your website - browse workouts';
PRINT '   2. Register a new user';
PRINT '   3. Try saving a workout';
PRINT '   4. Log a workout completion';
PRINT '';

GO
