-- =============================================
-- 1. USERS TABLE
-- =============================================
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    FullName NVARCHAR(100),
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    PhoneNumber NVARCHAR(20),
    ProfilePicture NVARCHAR(255),
    FitnessLevel NVARCHAR(20),  -- Beginner, Intermediate, Advanced
    FitnessGoal NVARCHAR(50),   -- Weight Loss, Muscle Gain, Endurance, etc.
    Height DECIMAL(5,2),         -- in cm
    Weight DECIMAL(5,2),         -- in kg
    UserRole NVARCHAR(20) NOT NULL DEFAULT 'User',  -- User, Trainer, Admin
    IsActive BIT DEFAULT 1,
    CreatedDate DATETIME DEFAULT GETDATE(),
    LastLoginDate DATETIME,
    ResetToken NVARCHAR(255),
    TokenExpiry DATETIME
);
GO

-- =============================================
-- 2. WORKOUT CATEGORIES TABLE
-- =============================================
CREATE TABLE WorkoutCategories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL UNIQUE,
    Description NVARCHAR(500),
    IconImage NVARCHAR(255),
    DisplayOrder INT,
    IsActive BIT DEFAULT 1
);
GO

-- =============================================
-- 3. WORKOUTS TABLE
-- =============================================
CREATE TABLE Workouts (
    WorkoutID INT PRIMARY KEY IDENTITY(1,1),
    WorkoutName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    CategoryID INT FOREIGN KEY REFERENCES WorkoutCategories(CategoryID),
    DifficultyLevel NVARCHAR(20),  -- Beginner, Intermediate, Advanced
    DurationMinutes INT,
    CaloriesBurned INT,
    EquipmentNeeded NVARCHAR(255),
    TargetMuscleGroups NVARCHAR(255),
    ThumbnailImage NVARCHAR(255),
    VideoURL NVARCHAR(500),
    TrainerID INT FOREIGN KEY REFERENCES Users(UserID),
    ViewCount INT DEFAULT 0,
    SaveCount INT DEFAULT 0,
    IsPublished BIT DEFAULT 1,
    CreatedDate DATETIME DEFAULT GETDATE(),
    LastModifiedDate DATETIME
);
GO

-- =============================================
-- 4. EXERCISES TABLE
-- =============================================
CREATE TABLE Exercises (
    ExerciseID INT PRIMARY KEY IDENTITY(1,1),
    ExerciseName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    Instructions NVARCHAR(MAX),
    MuscleGroup NVARCHAR(100),
    SecondaryMuscles NVARCHAR(255),
    EquipmentRequired NVARCHAR(255),
    DifficultyLevel NVARCHAR(20),
    ImageURL NVARCHAR(255),
    VideoURL NVARCHAR(500),
    CaloriesPerRep DECIMAL(5,2),
    SafetyTips NVARCHAR(MAX),
    CommonMistakes NVARCHAR(MAX),
    TrainerID INT FOREIGN KEY REFERENCES Users(UserID),
    CreatedDate DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1
);
GO

-- =============================================
-- 5. WORKOUT EXERCISES (Junction Table)
-- =============================================
CREATE TABLE WorkoutExercises (
    WorkoutExerciseID INT PRIMARY KEY IDENTITY(1,1),
    WorkoutID INT FOREIGN KEY REFERENCES Workouts(WorkoutID),
    ExerciseID INT FOREIGN KEY REFERENCES Exercises(ExerciseID),
    ExerciseOrder INT,
    Sets INT,
    Reps INT,
    DurationSeconds INT,
    RestSeconds INT,
    Notes NVARCHAR(500),
    CONSTRAINT UQ_WorkoutOrder UNIQUE(WorkoutID, ExerciseOrder)
);
GO

-- =============================================
-- 6. USER SAVED WORKOUTS TABLE
-- =============================================
CREATE TABLE UserSavedWorkouts (
    SavedWorkoutID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    WorkoutID INT FOREIGN KEY REFERENCES Workouts(WorkoutID),
    SavedDate DATETIME DEFAULT GETDATE(),
    Notes NVARCHAR(500),
    IsFavorite BIT DEFAULT 0,
    CONSTRAINT UQ_UserWorkout UNIQUE(UserID, WorkoutID)
);
GO

-- =============================================
-- 7. WORKOUT PROGRESS TABLE
-- =============================================
CREATE TABLE WorkoutProgress (
    ProgressID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    WorkoutID INT FOREIGN KEY REFERENCES Workouts(WorkoutID),
    CompletedDate DATETIME DEFAULT GETDATE(),
    DurationMinutes INT,
    CaloriesBurned INT,
    DifficultyRating INT CHECK (DifficultyRating BETWEEN 1 AND 5),
    Notes NVARCHAR(MAX),
    WeightUsed DECIMAL(5,2)
);
GO

-- =============================================
-- 8. EXERCISE PROGRESS TABLE
-- =============================================
CREATE TABLE ExerciseProgress (
    ExerciseProgressID INT PRIMARY KEY IDENTITY(1,1),
    ProgressID INT FOREIGN KEY REFERENCES WorkoutProgress(ProgressID),
    ExerciseID INT FOREIGN KEY REFERENCES Exercises(ExerciseID),
    SetsCompleted INT,
    RepsCompleted INT,
    WeightUsed DECIMAL(5,2),
    TimeSeconds INT,
    Notes NVARCHAR(500),
    CompletedDate DATETIME DEFAULT GETDATE()
);
GO

-- =============================================
-- 9. FITNESS ARTICLES TABLE
-- =============================================
CREATE TABLE FitnessArticles (
    ArticleID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    Slug NVARCHAR(200) UNIQUE,
    Summary NVARCHAR(500),
    Content NVARCHAR(MAX) NOT NULL,
    FeaturedImage NVARCHAR(255),
    CategoryTags NVARCHAR(255),
    AuthorID INT FOREIGN KEY REFERENCES Users(UserID),
    ViewCount INT DEFAULT 0,
    PublishedDate DATETIME,
    LastModifiedDate DATETIME,
    IsPublished BIT DEFAULT 0,
    IsFeatured BIT DEFAULT 0,
    MetaDescription NVARCHAR(160),
    MetaKeywords NVARCHAR(255)
);
GO

-- =============================================
-- 10. USER INQUIRIES TABLE
-- =============================================
CREATE TABLE UserInquiries (
    InquiryID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Subject NVARCHAR(200),
    Question NVARCHAR(MAX),
    CategoryType NVARCHAR(50),
    SubmittedDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(20) DEFAULT 'Pending',
    TrainerID INT FOREIGN KEY REFERENCES Users(UserID),
    Response NVARCHAR(MAX),
    ResponseDate DATETIME,
    Priority INT DEFAULT 2
);
GO

-- =============================================
-- 11. USER MEASUREMENTS TABLE
-- =============================================
CREATE TABLE UserMeasurements (
    MeasurementID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    MeasurementDate DATE DEFAULT GETDATE(),
    Weight DECIMAL(5,2),
    BodyFatPercentage DECIMAL(5,2),
    MuscleMass DECIMAL(5,2),
    Chest DECIMAL(5,2),
    Waist DECIMAL(5,2),
    Hips DECIMAL(5,2),
    Biceps DECIMAL(5,2),
    Thighs DECIMAL(5,2),
    BMI DECIMAL(5,2),
    Notes NVARCHAR(500),
    PhotoFront NVARCHAR(255),
    PhotoSide NVARCHAR(255),
    PhotoBack NVARCHAR(255)
);
GO

-- =============================================
-- 12. NOTIFICATIONS TABLE
-- =============================================
CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Title NVARCHAR(100),
    Message NVARCHAR(500),
    NotificationType NVARCHAR(50),
    IsRead BIT DEFAULT 0,
    CreatedDate DATETIME DEFAULT GETDATE(),
    ExpiryDate DATETIME,
    ActionURL NVARCHAR(255)
);
GO

-- =============================================
-- 13. ACHIEVEMENTS TABLE
-- =============================================
CREATE TABLE Achievements (
    AchievementID INT PRIMARY KEY IDENTITY(1,1),
    AchievementName NVARCHAR(100),
    Description NVARCHAR(500),
    BadgeIcon NVARCHAR(255),
    RequirementType NVARCHAR(50),
    RequirementValue INT,
    PointsAwarded INT,
    IsActive BIT DEFAULT 1
);
GO

-- =============================================
-- 14. USER ACHIEVEMENTS TABLE
-- =============================================
CREATE TABLE UserAchievements (
    UserAchievementID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    AchievementID INT FOREIGN KEY REFERENCES Achievements(AchievementID),
    UnlockedDate DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_UserAchievement UNIQUE(UserID, AchievementID)
);
GO

-- =============================================
-- 15. SYSTEM SETTINGS TABLE
-- =============================================
CREATE TABLE SystemSettings (
    SettingID INT PRIMARY KEY IDENTITY(1,1),
    SettingKey NVARCHAR(100) UNIQUE,
    SettingValue NVARCHAR(MAX),
    Description NVARCHAR(500),
    LastModifiedDate DATETIME,
    ModifiedBy INT FOREIGN KEY REFERENCES Users(UserID)
);
GO

-- =============================================
-- CREATE INDEXES FOR PERFORMANCE
-- =============================================
CREATE INDEX IX_Users_Email ON Users(Email);
CREATE INDEX IX_Users_Role ON Users(UserRole);
CREATE INDEX IX_Workouts_Category ON Workouts(CategoryID);
CREATE INDEX IX_WorkoutProgress_User ON WorkoutProgress(UserID);
CREATE INDEX IX_UserSavedWorkouts_User ON UserSavedWorkouts(UserID);
CREATE INDEX IX_FitnessArticles_Author ON FitnessArticles(AuthorID);
CREATE INDEX IX_Notifications_User ON Notifications(UserID);
GO

-- =============================================
-- INSERT SAMPLE DATA
-- =============================================

-- Insert Admin User (Password: Admin@123 - hashed)
INSERT INTO Users (Username, Email, PasswordHash, FullName, UserRole, IsActive, CreatedDate)
VALUES 
('admin', 'admin@fitlifehub.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'System Administrator', 'Admin', 1, GETDATE());

-- Insert Sample Trainer
INSERT INTO Users (Username, Email, PasswordHash, FullName, UserRole, IsActive, CreatedDate)
VALUES 
('trainer1', 'trainer@fitlifehub.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'John Fitness', 'Trainer', 1, GETDATE());

-- Insert Workout Categories
INSERT INTO WorkoutCategories (CategoryName, Description, DisplayOrder, IsActive)
VALUES 
('Strength Training', 'Build muscle and increase power', 1, 1),
('Cardio', 'Improve cardiovascular endurance', 2, 1),
('Flexibility', 'Enhance mobility and flexibility', 3, 1),
('HIIT', 'High-Intensity Interval Training', 4, 1),
('Yoga', 'Mind-body practice for wellness', 5, 1),
('Core', 'Strengthen your core muscles', 6, 1);
GO

-- Insert Sample Achievements
INSERT INTO Achievements (AchievementName, Description, RequirementType, RequirementValue, PointsAwarded, IsActive)
VALUES 
('First Workout', 'Complete your first workout', 'WorkoutCount', 1, 10, 1),
('Week Warrior', 'Complete 7 workouts in 7 days', 'ConsecutiveDays', 7, 50, 1),
('Century Club', 'Complete 100 workouts', 'WorkoutCount', 100, 100, 1),
('Strength Master', 'Complete 50 strength workouts', 'CategoryWorkouts', 50, 75, 1);
GO

PRINT 'Database FitLifeHubDB created successfully with all tables!';
PRINT 'Default Admin Login: admin@fitlifehub.com / Admin@123';
PRINT 'Default Trainer Login: trainer@fitlifehub.com / Admin@123';
GO