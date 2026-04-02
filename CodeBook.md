# CodeBook.md

## Overview
This project processes the Human Activity Recognition Using Smartphones Dataset to produce a tidy dataset suitable for analysis. The output dataset contains the **average of each selected variable for each activity and each subject**.

---

## Data Source
- Dataset: UCI Human Activity Recognition Using Smartphones
- Original data collected from accelerometers and gyroscopes in a Samsung Galaxy S smartphone
- Subjects: 30 individuals
- Activities: 6 types

---

## Original Data Description

### Raw Components
- `X_train.txt`, `X_test.txt`: Sensor measurements
- `y_train.txt`, `y_test.txt`: Activity labels (numeric)
- `subject_train.txt`, `subject_test.txt`: Subject IDs
- `features.txt`: Variable names
- `activity_labels.txt`: Mapping of activity IDs to names

---

## Variables in Final Dataset

### Identifiers
- `subject`
  - Integer (1–30)
  - Represents participant ID

- `activity`
  - Factor with 6 levels:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

---

### Measurement Variables

All remaining variables are numeric and represent **averaged signals** grouped by subject and activity.

Only variables containing **mean()** or **std()** from the original dataset are included.

#### Naming Convention Transformations

Original → Cleaned:
- `t` → `time_` (time domain)
- `f` → `freq_` (frequency domain)
- `-` → `_`
- `()` removed

---

### Variable Categories

#### Time Domain Signals (`time_`)
- `time_body_acc_mean_X`
- `time_body_acc_mean_Y`
- `time_body_acc_mean_Z`
- `time_body_acc_std_X`
- `time_body_acc_std_Y`
- `time_body_acc_std_Z`

- `time_gravity_acc_mean_X`
- `time_gravity_acc_mean_Y`
- `time_gravity_acc_mean_Z`
- `time_gravity_acc_std_X`
- `time_gravity_acc_std_Y`
- `time_gravity_acc_std_Z`

- `time_body_acc_jerk_mean_X`
- `time_body_acc_jerk_mean_Y`
- `time_body_acc_jerk_mean_Z`
- `time_body_acc_jerk_std_X`
- `time_body_acc_jerk_std_Y`
- `time_body_acc_jerk_std_Z`

- `time_body_gyro_mean_X`
- `time_body_gyro_mean_Y`
- `time_body_gyro_mean_Z`
- `time_body_gyro_std_X`
- `time_body_gyro_std_Y`
- `time_body_gyro_std_Z`

- `time_body_gyro_jerk_mean_X`
- `time_body_gyro_jerk_mean_Y`
- `time_body_gyro_jerk_mean_Z`
- `time_body_gyro_jerk_std_X`
- `time_body_gyro_jerk_std_Y`
- `time_body_gyro_jerk_std_Z`

- `time_body_acc_mag_mean`
- `time_body_acc_mag_std`

- `time_gravity_acc_mag_mean`
- `time_gravity_acc_mag_std`

- `time_body_acc_jerk_mag_mean`
- `time_body_acc_jerk_mag_std`

- `time_body_gyro_mag_mean`
- `time_body_gyro_mag_std`

- `time_body_gyro_jerk_mag_mean`
- `time_body_gyro_jerk_mag_std`

---

#### Frequency Domain Signals (`freq_`)
- `freq_body_acc_mean_X`
- `freq_body_acc_mean_Y`
- `freq_body_acc_mean_Z`
- `freq_body_acc_std_X`
- `freq_body_acc_std_Y`
- `freq_body_acc_std_Z`

- `freq_body_acc_jerk_mean_X`
- `freq_body_acc_jerk_mean_Y`
- `freq_body_acc_jerk_mean_Z`
- `freq_body_acc_jerk_std_X`
- `freq_body_acc_jerk_std_Y`
- `freq_body_acc_jerk_std_Z`

- `freq_body_gyro_mean_X`
- `freq_body_gyro_mean_Y`
- `freq_body_gyro_mean_Z`
- `freq_body_gyro_std_X`
- `freq_body_gyro_std_Y`
- `freq_body_gyro_std_Z`

- `freq_body_acc_mag_mean`
- `freq_body_acc_mag_std`

- `freq_body_acc_jerk_mag_mean`
- `freq_body_acc_jerk_mag_std`

- `freq_body_gyro_mag_mean`
- `freq_body_gyro_mag_std`

- `freq_body_gyro_jerk_mag_mean`
- `freq_body_gyro_jerk_mag_std`

---

## Transformations Performed

1. **Merged datasets**
   - Combined training and test datasets into a single dataset

2. **Extracted relevant variables**
   - Selected only variables containing "mean()" or "std()"

3. **Applied descriptive activity names**
   - Replaced numeric activity codes with descriptive labels

4. **Renamed variables**
   - Removed symbols and expanded prefixes for clarity

5. **Created tidy dataset**
   - Grouped data by `subject` and `activity`
   - Computed mean of each variable

---

## Final Output

- File: `tidy_data.txt`
- Structure:
  - 180 rows (30 subjects × 6 activities)
  - Each row = one subject performing one activity
  - Each column = averaged measurement variable

---

## Key Properties of Tidy Data

- Each variable forms one column
- Each observation forms one row
- Each type of observational unit forms one table

---

## Notes

- No missing values were present in the processed dataset
- All variables are numeric except `subject` and `activity`